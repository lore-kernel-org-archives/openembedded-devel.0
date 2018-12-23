Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE2446D9AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n2so4874231pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=izZrlfeVHdskJUvvjHRY/gSQnbVISMrahINSkrLdV2s=;
	b=ETg/M2kKFgkBcF9XmS+6XgfYVIHkVpJZR+r64Hg5ss4ws5zR1BlgAh+qiB+veEKPet
	7sf7OBjKfZngTJmUWSdmLBxaPSlduQyhgmmiMz6TrWDK7sQfQwhoIEITTMtnzIJmxG2O
	0hOiip5SC39FLhqPXuI0lJRCU+dVnrJNZd0GdBoMGV178Vp9/pcut/FLu/iSMrZHZEjl
	lcFWApdk1Qo5M0umoRJTT1E5bO5KpQ8tg/VGq2jXsew6KAkGPX+rV+XNjCH3/6PCf5fk
	fzJaLIZartp7qMxvOSBnQPSpJU5tuppJ2sKCMQNXJRx1b3DoxcI0brWAOFbmXtj1abvJ
	6IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=izZrlfeVHdskJUvvjHRY/gSQnbVISMrahINSkrLdV2s=;
	b=ZvqXytVCQ1Ljo/b0V6ay9V7O84pm6jCz6E9Q1O43kB11ywwyLmEvTpH2GbCXRtFFK0
	0afMWE2OWI1XbuEdbxKOYdMGTsTKxEcz82dTAPFOFVwM95SogorHu/A5KlmcXrlyWnuy
	BNt9jzWxeIrV9KrgobfbLSfxJV4vg/Vj9SJPZMWqdef9crcBjWK6p4T2JQdge8aVJ8bs
	wY5aBfyZmeXtdP3ALGsMkVkvnuHh75B0RWHqMCqZufY/Ti866St/wNJ2EDDULu1+ElGe
	e5EdAWZ5Sy6wz3I6cUwpiQ1uLQB1gh6ZmwAtwUhs47mhMo4jmzejF+1kKKl4tx+PdDNj
	Qcjw==
X-Gm-Message-State: AJcUukdf1+mSMftymEqZUPEgTtagRaoy+K++/3P2+91haMwW24YgLpej
	jxiYkQ+6YlfEUFagQ+u84RLxE4QEC6o=
X-Google-Smtp-Source: ALg8bN73fHashS4PEc8zzo7P6T0IaI0Jle5W63r37kEzkJuBq12jF0I0DfFtTHa4X4OO0YfTXOdLyw==
X-Received: by 2002:a63:ed15:: with SMTP id d21mr10245179pgi.305.1545600977612;
	Sun, 23 Dec 2018 13:36:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:48 -0800
Message-Id: <20181223213557.7834-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/18] breakpad: Fix build with gcc9 on x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2018 21:36:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/breakpad/dont-clobber-rsp.patch  | 30 +++++++++++++++++++
 .../recipes-devtools/breakpad/breakpad_git.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch b/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
new file mode 100644
index 0000000000..b1c37fc8e9
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
@@ -0,0 +1,30 @@
+Do not add stack pointer to clobber list
+
+it was being ignored until gcc 9.0 became capable
+of flagging this silent ignoring via [1]
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813<Paste>
+
+Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/linux-syscall-support/+/1390160]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/third_party/lss/linux_syscall_support.h
++++ b/src/third_party/lss/linux_syscall_support.h
+@@ -1966,7 +1966,7 @@ struct kernel_statfs {
+         __asm__ volatile(LSS_ENTRYPOINT                                       \
+                          : "=a" (__res)                                       \
+                          : "0" (__NR_##name)                                  \
+-                         : "esp", "memory");                                  \
++                         : "memory");                                         \
+         LSS_RETURN(type,__res);                                               \
+       }
+     #undef  _syscall1
+@@ -2407,7 +2407,7 @@ struct kernel_statfs {
+                                "d"(LSS_SYSCALL_ARG(parent_tidptr)),
+                                "r"(LSS_SYSCALL_ARG(newtls)),
+                                "r"(LSS_SYSCALL_ARG(child_tidptr))
+-                             : "rsp", "memory", "r8", "r10", "r11", "rcx");
++                             : "memory", "r8", "r10", "r11", "rcx");
+       }
+       LSS_RETURN(int, __res);
+     }
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 2bc0aacb0f..528c237564 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0001-disable-calls-to-getcontext-with-musl.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
+           file://dont-clobber-rsp.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.20.1


