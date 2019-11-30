Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 45D6F7F7BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id z124so318285pgb.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b2uoBHs128QJAT2wWckfP+Feb9XhAl2atkf9geazas8=;
	b=GAJg3HwQJYLOm2YvXqbqXuCjZ7YdtuBcMpgpPFZM1pLgiGLUS/UuwvU/9SJd5FU83h
	QFQb7ekFB4/PCFk9xAPTfryy29SRyPdFwYWjagl1u3PijaLiN6R+7sUHdspdWhqyA0Jz
	YPV0mnrIoqeF+YVHrCRsOKhD6Y1+kmUKKvFA4DGV8aK1AGHftPxVBVy4QlQ7zHMlVeZI
	zRTLMUiJEugCqFinWCObpoJ4Hswh3R2FUlp4t5VSAsJXDgVTj+B517Ocro2i5wga1lfu
	MNC6gF7M0sucN7oRw67gLucDilRx9gDVWDiBAtyOQCJpRNSJeVbzn1d1/LVjB6gWOS73
	kjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b2uoBHs128QJAT2wWckfP+Feb9XhAl2atkf9geazas8=;
	b=NOJKIalB0uinfvFCi3xBw0xaetZjxHJXfondJLia89Nq+a2X7e6lV+shKeMapjA2YM
	Aj/bgZfNsz1mZX8tIjgHUWWH+FgBfl11ZKbPYLpCHKZ04rV9gTk8lY7vFwLcdWz5yEaB
	pdbdhZAN2E556WMHbfaC3n3xN1liKGi/gk9Pu3TOl28OIjQ9AJiDTzyBIxnfK5njRRTj
	hJGS20i3G5UqpnGgXbsNYjb0QV7ZteRbai1MxVMVo918wQm3HiBSQUD2cUSiRY3p1rv7
	g5Uugr2Ze3npjbhlvVlkdRf5JJTqxI9elCssuRpVZf9kskEA9gb4Fh/o7QPTzslB+kXi
	HeMQ==
X-Gm-Message-State: APjAAAWp+rCGnq70/PHI7IV7v+Or4CUuI3vPcPbI+7GhP1XEGiTS5cmX
	FGk2cm7zUNgwFwdIie4p2f9asWEj
X-Google-Smtp-Source: APXvYqzZ+/aOLUMSVHLJeHf+tprHk3kiyYX6sZC6Fe8e8Dtgfa4hAoMcy8ZXl2Btft5wHdYdL4h2HA==
X-Received: by 2002:a63:d901:: with SMTP id r1mr23176435pgg.328.1575137450071; 
	Sat, 30 Nov 2019 10:10:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:31 -0800
Message-Id: <635b211e0f93b9830bd450b0c089d512aa9bba8f.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 01/15] php: fix CVE-2019-11043
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:49 -0000

From: "Slater, Joseph" <joe.slater@windriver.com>

Backport unmodified patch from git.php.net.  Fixed in php 7.3.11.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/php/php/CVE-2019-11043.patch  | 38 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
new file mode 100644
index 0000000..7e20063
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
@@ -0,0 +1,38 @@
+From ab061f95ca966731b1c84cf5b7b20155c0a1c06a Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sat, 12 Oct 2019 15:56:16 +0100
+Subject: [PATCH] Fix bug #78599 (env_path_info underflow can lead to RCE)
+
+CVE: CVE-2019-11043
+
+Fixed in php version 7.3.11.
+
+Upstream-Status: Backport [https://git.php.net/repository/php-src.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ NEWS                                          |  4 +-
+ sapi/fpm/fpm/fpm_main.c                       |  4 +-
+ .../tests/bug78599-path-info-underflow.phpt   | 61 +++++++++++++++++++
+ sapi/fpm/tests/tester.inc                     | 11 +++-
+ 4 files changed, 75 insertions(+), 5 deletions(-)
+ create mode 100644 sapi/fpm/tests/bug78599-path-info-underflow.phpt
+
+diff --git a/sapi/fpm/fpm/fpm_main.c b/sapi/fpm/fpm/fpm_main.c
+index 24a7e5d56a..50f92981f1 100644
+--- a/sapi/fpm/fpm/fpm_main.c
++++ b/sapi/fpm/fpm/fpm_main.c
+@@ -1209,8 +1209,8 @@ static void init_request_info(void)
+ 								path_info = script_path_translated + ptlen;
+ 								tflag = (slen != 0 && (!orig_path_info || strcmp(orig_path_info, path_info) != 0));
+ 							} else {
+-								path_info = env_path_info ? env_path_info + pilen - slen : NULL;
+-								tflag = (orig_path_info != path_info);
++								path_info = (env_path_info && pilen > slen) ? env_path_info + pilen - slen : NULL;
++								tflag = path_info && (orig_path_info != path_info);
+ 							}
+ 
+ 							if (tflag) {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
index a5c7b9b..e886cb1 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://0001-Use-pkg-config-for-libxml2-detection.patch \
             file://debian-php-fixheader.patch \
             file://CVE-2019-6978.patch \
+            file://CVE-2019-11043.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.7.4


