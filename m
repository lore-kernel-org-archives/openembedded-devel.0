Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C923780A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:18:02 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j186so7250471pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RR36F5MIZj4Oo1eNBOL4GEkTJFUqG9UZYt08B6XHxik=;
	b=Vy0zuvjlorqh4njsas+fjbL8Zwyf7nFl2kpImN3mr0llzY/t63zuGyEVPILT4Vm3+6
	tC0qeFJdIGIZUBY8QpTA8XjMRXSbrG9B6ARx906ehYXyAlx0pub0c+S8em0SY9iZVhCW
	mWf5zLcrhcto4HWGWAmYlvGaXVv0xgvxLvrh2QOZ7QpuZrbrHio4y0HxPlZY8UEZsAyi
	Vc6hzfiyqFxJJsOPvNr1tcNVZF8iuG1lw0xFxESSUGPfA+mVr7PyMR7V2X/LCBWFXHgz
	m5w3x6Qht2d1+BdPP20ZJvZWDyJ6uA34Znuy/RUNDP++hyQql/yn22XGBBYEPzXRRLim
	Y3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RR36F5MIZj4Oo1eNBOL4GEkTJFUqG9UZYt08B6XHxik=;
	b=fBPJOh+uZIJdglAqUg5q1bhM32ZgdfntpAq0jQ2jQtwRTa2LqZzJMq8rl2nTH6a18O
	ndDLRpLDySVdKtrz8xtLBW5H3GarEvw7ciX2NIpkHGCveq2OfIBq6SAQa5RJayYBm2Bv
	vjXHxcxr5WzIfMLpk7C//fIGWUVC15Q8wvPbROrlJtgkaWJtlsMuGillDiX6EBYDNDj3
	9ZmbsAhw9DpIhrJtf4OCfiJgbCaevCEq4ERKOkKBY5QIQML5kKj0qGI2PP57mI6B4q+e
	b5SFMaMlCcpQiOfQnavG0tGPtiiqNllXdvOLsSPzQzYGsavwUorlBLNA+h0SZcyop9Xb
	3XLg==
X-Gm-Message-State: AIVw111nWSG0FyLLxYEF7576vXEUxgI6cdbCkvkZVBYXhtkJwvCiGATT
	CRjhphHMZtHIUS4M
X-Received: by 10.84.130.46 with SMTP id 43mr8711636plc.128.1499519884266;
	Sat, 08 Jul 2017 06:18:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	o73sm13277185pfi.2.2017.07.08.06.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:18:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:17:43 -0700
Message-Id: <20170708131744.33927-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170708131744.33927-1-raj.khem@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] ltrace: Fix build on musl
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
X-List-Received-Date: Sat, 08 Jul 2017 13:18:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nfigure-Recognise-linux-musl-as-a-host-OS.patch | 25 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
new file mode 100644
index 000000000..52264a17e
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
@@ -0,0 +1,25 @@
+From c1d3aaf5ec810c2594938438c7b4ccd20943f255 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 10:20:52 -0700
+Subject: [PATCH] configure: Recognise linux-musl as a host OS
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3e8667f..95d6642 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,6 +35,7 @@ AC_CANONICAL_HOST
+ case "${host_os}" in
+     linux-gnu*) HOST_OS="linux-gnu" ;;
+     linux-uclibc*) HOST_OS="linux-gnu" ;;
++    linux-musl*) HOST_OS="linux-gnu" ;;
+     *)		AC_MSG_ERROR([unkown host-os ${host_os}]) ;;
+ esac
+ AC_SUBST(HOST_OS)
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index b613bc3af..01b3bbe1b 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://0001-ARM-code-has-unreachable-code-after-switch-statement.patch \
            file://0001-Fix-tautological-compare-warning.patch \
            file://0001-Add-support-for-mips64-n32-n64.patch \
+           file://0001-configure-Recognise-linux-musl-as-a-host-OS.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.13.2


