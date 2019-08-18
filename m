Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 138CE7F2DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46BL5c5jBTz3y
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 17:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566140868;
	bh=EL8t8J2fZRqaYJD8zQhughjav9ZQrNT7Ac5WOvjcHCA=;
	h=From:To:Subject:Date:From;
	b=tzRXsh+iGF2YqBfE2F69NJ41e5MddUKh6mwEDhE1E/Ln+1aSv38iRoeI6XTgnVGUU
	kFYnw+mAmRaOTnChgAFxt4yjihkmH1aw6tU8j2cSEXxq79uzYzW3B/E/FEW6QO1l5j
	71SBboJD4sut+wD7PJSiKoYXmMJ5V17mWvA3ALgZmFGolO06ZeH+RZD14UAlhf+c/x
	TQV0AjtYpwZ4EbHeVzi6ZT7ITYDxksSyg0fA0MWYC4BtAl2TcPOl1YCYaooGiHZ02t
	LNSg3kOwA8PPLylkvHFDv3FAwGZe0na8aEwnzB9FUmEKy9A6f7SRY+i/yWD7AiBZoH
	bfwq9IU+3QS83HBFOe/WBGqVX4z6edgEnEAYc5FZBPIhJMZ4m0lzp0LcLnQB4mGQyN
	WUyxl1Q+jXSvVuPQC4i2Q/WgYZF/85PwxOfiD9PAVE0WN6xcYMpAiKoRkjR4z82Wbe
	PIW2JLCshEABRdamRWVe1Y3kACPSc+rkUoBp/NPQmbLsedom06uryD3pRkSn67hgfz
	FSOQEf8lr8OztsFO2JFM24sqaf12mieah7WyeKaUMe+c4kE4PfazwRrbv0HgIXbzjY
	OdrJs8TdnJY4uXVFPpcX7LhtFzl/Mc6TfF1QS0s3coTc9TJ/aX5e2kJc2vMcKkU1rw
	KNTYLICjMCUTB0ZlCDgtw/HQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 18:07:48 +0300
Message-Id: <20190818150748.10314-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] libuser: musl now supports secure_getenv
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
X-List-Received-Date: Sun, 18 Aug 2019 15:07:48 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libuser/0001-Check-for-issetugid.patch    | 62 -------------------
 .../recipes-support/libuser/libuser_0.62.bb   |  1 -
 2 files changed, 63 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch

diff --git a/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch b/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch
deleted file mode 100644
index 79756b9a0..000000000
--- a/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d0537cb7f2dc5877700ad78dfd191515379d4edc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 02:22:51 +0000
-Subject: [PATCH 1/2] Check for issetugid()
-
-If secure version of getenv is not there then we can use
-issetugid() as aid to call getenv()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac |  1 +
- lib/config.c | 12 +++++++++++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1ded1a2..ee19e1f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -125,6 +125,7 @@ AC_TYPE_OFF_T
- AC_TYPE_SIZE_T
- 
- AC_CHECK_FUNCS([__secure_getenv secure_getenv])
-+AC_CHECK_FUNCS([issetugid])
- 
- # Modify CFLAGS after all tests are run (some of them could fail because
- # of the -Werror).
-diff --git a/lib/config.c b/lib/config.c
-index 29e7120..30f9daf 100644
---- a/lib/config.c
-+++ b/lib/config.c
-@@ -44,8 +44,10 @@
- #  define safe_getenv(string) secure_getenv(string)
- #elif defined(HAVE___SECURE_GETENV)
- #  define safe_getenv(string) __secure_getenv(string)
-+#elif defined(HAVE_ISSETUGID)
-+#  define safe_getenv(string) safe_getenv_issetugid(string)
- #else
--#  error Neither secure_getenv not __secure_getenv are available
-+#  error None of secure_getenv, __secure_getenv, or issetugid is available
- #endif
- 
- struct config_config {
-@@ -59,6 +61,14 @@ struct config_key {
- 	GList *values;
- };
- 
-+static const char*
-+safe_getenv_issetugid(const char* name)
-+{
-+	if (issetugid ())
-+		return 0;
-+	return getenv (name);
-+}
-+
- /* Compare two section names */
- static int
- compare_section_names(gconstpointer a, gconstpointer b)
--- 
-2.7.0
-
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.62.bb b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
index 7ec54eb16..74053e451 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.62.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 SECTION = "base"
 
 SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.xz \
-           file://0001-Check-for-issetugid.patch \
            file://0002-remove-unused-execinfo.h.patch \
            file://0001-modules-files.c-parse_field-fix-string-formating-in-.patch \
            "
-- 
2.17.1


