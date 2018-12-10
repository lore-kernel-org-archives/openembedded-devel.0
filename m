Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 647DE6B5C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2018 22:08:22 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u18so5882697plq.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2018 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YAchXs6t+eycM6D8FeHBN01OoboZLwpldsfbtU2MMXU=;
	b=KP5V7J3jj5q++sGvpZ98fVLTZL9xBhHumTgGSwHzcevrPYifhsNC9BxUNPdh1A+/qp
	t3e0D7jLqrhyBtPtwGq7LUhM9lFT1aFxPBfUwI4gK8pUrTHrMPea7sXYNAr8uQunFig+
	6Zaz93Qu7C+oDYTKwm8BDlBr7SLXwfgkYRPzxkEuxhFuItjw94izLUh8QOVqNLr5EHfA
	WrH5S1lt8y5JcsK3dCkp8t810ORHSnLZCvylhEubH2jA3sUCJPIkj3lWBiNaz9L00l/s
	6J8qAGcbMXM8nlwpcnSDIHJjezN7/O917dU6nvpJKEYPlHxwxnPoBvU2lIGuJhResP4R
	W+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YAchXs6t+eycM6D8FeHBN01OoboZLwpldsfbtU2MMXU=;
	b=jrYmA4xfHamQtoSGK2u+CDdD116RCjTdJxk5LPxUB4SuvloFw25WIlu8MYUFJF5e7K
	94NKUsfs5rzYqo1pX+qwpKT/15K30EBksFu3K99zuuuUD7O3QM8ebyC7A7uXuraFLnXE
	Eexj+dmmqtOPdFjw3sBVQUEXi22y6neXBcXUE+8JDKedHYi5Lx/IqoKEmQ+3lLg4jtRo
	3eMrwMNUuoK5GKROjF7yb19R7VhgDq3StW63r+fYr2U2OD+3UaRaBsXluvh//LpHgUDt
	9GzABVHE47AXhOo9wrcC77gqY11PvusXf0Qnkq0SfXnN4DzlZCkDzWy0i0Pxc0KU9Gik
	3ODg==
X-Gm-Message-State: AA+aEWZxnAgpzStMlnSItFUPfiQCK6+KvhMsyBGhkMmej3HHc7Hmey7W
	t/2EEgZNS3zDSdy5jO08HAGFnjBDi7M=
X-Google-Smtp-Source: AFSGD/XbzNuXjfbMCjHYVL3TNxX1+uw4dcaYOawsZI59osiDvJLwWViR7RKrg1XIX5DP5E5NrrU08A==
X-Received: by 2002:a17:902:2b84:: with SMTP id
	l4mr13756617plb.191.1544479702790; 
	Mon, 10 Dec 2018 14:08:22 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	t67sm23158668pfd.90.2018.12.10.14.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 14:08:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Dec 2018 14:08:13 -0800
Message-Id: <20181210220813.34072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] klibc: Fix build with clang
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
X-List-Received-Date: Mon, 10 Dec 2018 22:08:22 -0000
Content-Transfer-Encoding: 8bit

Newer versions of clang optimize the calls to use unlocked variants of
these functions

Fixes
| capabilities.c:(.text+0xb4): undefined reference to `fread_unlocked'
| arm-yoe-linux-gnueabi-ld.bfd: capabilities.c:(.text+0x11a): undefined
reference to `fwrite_unlocked'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...-ulocked_-fgets-fread-fwrite-aliases.patch | 49 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
new file mode 100644
index 0000000000..eee144dc4a
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
@@ -0,0 +1,49 @@
+From 241f423a015279cb29b7ad1a34386ef1c32007fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Dec 2018 16:47:16 -0800
+Subject: [PATCH] Define ulocked_{fgets|fread|fwrite} aliases
+
+latest clang converts the normal calls to the unlocked variant
+equivalents
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Andrea Adami <andrea.adami@gmail.com>
+---
+ usr/klibc/fgets.c   | 2 ++
+ usr/klibc/fread2.c  | 2 ++
+ usr/klibc/fwrite2.c | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/usr/klibc/fgets.c b/usr/klibc/fgets.c
+index dbf742c6..2e9fcb65 100644
+--- a/usr/klibc/fgets.c
++++ b/usr/klibc/fgets.c
+@@ -25,3 +25,5 @@ char *fgets(char *s, int n, FILE *f)
+ 
+ 	return s;
+ }
++char *fgets_unlocked(char *s, int n, FILE *f)
++  __alias("fgets");
+diff --git a/usr/klibc/fread2.c b/usr/klibc/fread2.c
+index 7dca56b1..5c234766 100644
+--- a/usr/klibc/fread2.c
++++ b/usr/klibc/fread2.c
+@@ -11,3 +11,5 @@ size_t fread(void *ptr, size_t size, size_t nmemb, FILE * f)
+ {
+ 	return _fread(ptr, size * nmemb, f) / size;
+ }
++size_t fread_unlocked(void *ptr, size_t size, size_t nmemb, FILE *f)
++  __alias("fread");
+diff --git a/usr/klibc/fwrite2.c b/usr/klibc/fwrite2.c
+index cebc017c..3e0bb57d 100644
+--- a/usr/klibc/fwrite2.c
++++ b/usr/klibc/fwrite2.c
+@@ -11,3 +11,5 @@ size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE * f)
+ {
+ 	return _fwrite(ptr, size * nmemb, f) / size;
+ }
++size_t fwrite_unlocked(void *ptr, size_t size, size_t nmemb, FILE *f)
++  __alias("fwrite");
+-- 
+2.19.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 398dfd1cfa..ec52e9734f 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -24,6 +24,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
            file://0001-klibc-add-getrandom-syscall.patch \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
+           file://0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch \
            "
 
 ARMPATCHES ?= ""
-- 
2.20.0


