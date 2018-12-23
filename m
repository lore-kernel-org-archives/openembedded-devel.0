Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 20F8F71A74
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z23so4879065plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/8/pR1q8MaRmrG2z8YWbZVMPq0fP4IV1OkPrnb7R2Mo=;
	b=qGN2p2fUDrZYbWCdtF4yO41d9wWbJnn+Nm2H9wnTECcRUASm6I/lnjF1iQv8DYc1FX
	HkFLexeVCXA9ezG5nyNM2EI+Dm1Z4y6sVV9TU/2ckmNAV8PWE2w7aw2K6nyCESY8miTe
	b4kq8JdU09SwQB8lLYOMzFZtwoa+NSZ+J2Kveiy71xi3bZFY3QKYICZg85akzoArlW+q
	U1z2IyrQ0JzhW2X+WPpTU+LcKfHXiottd+M75gasWtbx2ngtVpGMuMdCWWYSCMyy/nDC
	cYSduUrYTjNyfvbP3fNUH2oJah7KpDsX2JEnQ0BFZbo68ELTe4/oyk7TjY0Y4ZbGiRd7
	ibug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/8/pR1q8MaRmrG2z8YWbZVMPq0fP4IV1OkPrnb7R2Mo=;
	b=QZKcAUB+5bZjtmH7j4FBWNXMzb8evCmZQxWjwPC1aTtwhoALciTzmTSj8zDg+8VI3e
	+5W8ANesBUm6VISs8mCU1F0FJc8qi/ZzvO1aKoxSQpfFuSESG/RgyWncHVVpUwAib5U8
	qqWH+3JUo8yuHepSUgjuA/r25Sowkez8MlqmfMVTQoC2FX7lGFObs3VxBYxyn5uq2iGo
	9gJQ6hMQVKXfG4gGeQTpBuof8nxPNClZus/5P78QkQjP1VGaoOVskPeYU8WInsr0QFfU
	Rx2ndMylg7eSdBy6cWaCDE9m//OWD0iYcFX/rIYI+a/dcRaOKLQTy9blD7GLLPapNoRI
	xyBg==
X-Gm-Message-State: AJcUukd8ESsZ49R4liw6db0zUQ2xfM3lBqTbbnb+g+tix/iZYXopOmKw
	YXbdZQwD7gBbnFvkxT8upvwwSCC5uGw=
X-Google-Smtp-Source: ALg8bN5gnKkGsYYB/BdqIG3iJtZA0NPrC4jdgDsT23NGMSRL8UglPX4JgtMWe8XSPlqGMfN9bjmdEA==
X-Received: by 2002:a17:902:b090:: with SMTP id
	p16mr10844787plr.190.1545600979866; 
	Sun, 23 Dec 2018 13:36:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:50 -0800
Message-Id: <20181223213557.7834-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/18] open-vm-tools: Upgrade to 10.3.5
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:19 -0000
Content-Transfer-Encoding: 8bit

Add a patch to fix build with gcc9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Do-not-print-NULL-string-into-logs.patch | 31 ++++++++++++++++
 ...ools_10.3.0.bb => open-vm-tools_10.3.5.bb} | 36 ++++++++++---------
 2 files changed, 50 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch
 rename meta-oe/recipes-support/open-vm-tools/{open-vm-tools_10.3.0.bb => open-vm-tools_10.3.5.bb} (76%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch
new file mode 100644
index 0000000000..7af265a999
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch
@@ -0,0 +1,31 @@
+From e25d00d8297cba044c3a4d2e38749e54adac66c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Dec 2018 19:59:02 -0800
+Subject: [PATCH] misc: Do not print NULL string into logs
+
+string format %s is getting a NULL pointer for 'expand'
+parameter always since the check for chunks[i] == NULL will ensure that
+its always null when the Log() API is called
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/312]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/misc/util_misc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git open-vm-tools/lib/misc/util_misc.c b/open-vm-tools/lib/misc/util_misc.c
+index 198c23d2..0ac0a335 100644
+--- open-vm-tools/lib/misc/util_misc.c
++++ open-vm-tools/lib/misc/util_misc.c
+@@ -719,8 +719,8 @@ Util_ExpandString(const char *fileName) // IN  file path to expand
+       ASSERT(!freeChunk[i]);
+       chunks[i] = expand;
+       if (chunks[i] == NULL) {
+-	 Log("%s: Cannot allocate memory to expand \"%s\" in \"%s\".\n",
+-             __FUNCTION__, expand, fileName);
++	 Log("%s: Cannot allocate memory to expand in \"%s\".\n",
++             __FUNCTION__, fileName);
+ 	 goto out;
+       }
+       chunkSize[i] = strlen(expand);
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
similarity index 76%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
index 2d7486da34..7ed6593727 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
@@ -22,23 +22,25 @@ LICENSE_modules/linux = "GPL-2.0"
 LICENSE_modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
-    file://tools.conf \
-    file://vmtoolsd.service \
-    file://vmtoolsd.init \
-    file://0001-configure.ac-don-t-use-dnet-config.patch \
-    file://0002-add-include-sys-sysmacros.h.patch \
-    file://0005-Use-configure-test-for-struct-timespec.patch \
-    file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
-    file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
-    file://0011-Use-configure-test-for-sys-stat.h-include.patch \
-    file://fix-subdir-objects-configure-error.patch \
-    file://0001-include-poll.h-instead-of-sys-poll.h.patch \
-    file://0002-Rename-poll.h-to-vm_poll.h.patch \
-    file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
-    file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
-    file://0001-Use-off64_t-instead-of-__off64_t.patch \
-"
-SRCREV = "2147df6aabe639fc5ff423ed791a8e7f02bf8d0a"
+           file://tools.conf \
+           file://vmtoolsd.service \
+           file://vmtoolsd.init \
+           file://0001-configure.ac-don-t-use-dnet-config.patch \
+           file://0002-add-include-sys-sysmacros.h.patch \
+           file://0005-Use-configure-test-for-struct-timespec.patch \
+           file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
+           file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
+           file://0011-Use-configure-test-for-sys-stat.h-include.patch \
+           file://fix-subdir-objects-configure-error.patch \
+           file://0001-include-poll.h-instead-of-sys-poll.h.patch \
+           file://0002-Rename-poll.h-to-vm_poll.h.patch \
+           file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
+           file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
+           file://0001-Use-off64_t-instead-of-__off64_t.patch \
+           file://0001-misc-Do-not-print-NULL-string-into-logs.patch \
+           "
+# stable-10.3.5
+SRCREV = "f2ff192717375b95a6b7e278fb47dbb3d3bc56d1"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.20.1


