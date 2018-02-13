Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6976003C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 22:57:28 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y8so959958pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/gJvcperxiF+Ee+DYXNcCFXmayZqCoYCwe9TJmT9uMQ=;
	b=KmeVHOCoPDOnXbUgUYqal77g+KOL61PZX5q9gVsmiLHIuAsPgYVoaXDYgteBsUMhCX
	RqtIurC1esJgWdHqUafRkwhcGOLwQ3HpSDDN98rRoutE0Se/cArqf5o59iJxpmYQ2oAi
	B0iKPn9JbQGiP2CxTzSYhxLXt9zXxS7N0fhyOZBDQEwkdIL8y3KvttzqHUcMiBYzy3lh
	ODEnq8KRZmY6B9dmTlw0CUK0mhtVpQm3043ZotOUy506o+XLSAy8vWojhlR3ZmpRubjf
	8c9firaUSFOSfdEpcgDUP3WjavTkEjF5i9UiYL+qZvRlh8Rl8PQCbmCHjsqlqMWDgPmK
	0bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/gJvcperxiF+Ee+DYXNcCFXmayZqCoYCwe9TJmT9uMQ=;
	b=sfpiZ2WJTIS4FIH1rjVKWErpbQ13vaeHgZtoJUNdhQAE13YgJhEA7Q/2b1QaOUDxXl
	qfhfhRquVxlBSNwIZ2Q06I0RWvdSFNrv8r+IoYqV5met5enMuCgBPd56vaguniAAqTEC
	EGu4AF39HdETtsh/jGnrDtWCfESNw9LKootabPZNJ2Xdj9c7mRRzYqXBS24EucAbDJQ7
	YveS9+3q9qioNnZL6spyWPLQy5xkztXAqQWDU/kYfcyc/ivhb2G46kWmEenIdAhTQIWl
	moNcIRJKMxdKQQzGQGmLuNtSL73GcPr+2mXEyoDjLF/mAfkG5QEaKbKrxQRKB6hOHYqd
	kZ2Q==
X-Gm-Message-State: APf1xPDTdmBsPmRG/Mf7Ie+9SSxHMvYlks5bXtsHWcjjSRMv51LGF6RS
	jHfRxviIxmmOVWJGQ2fRpM3dhg==
X-Google-Smtp-Source: AH8x2272Oydb/qb5FYNt9yqd5hj70WIKNRlexyfGZYa4CW3DKOD+YObLjKsXZPbQpj+xVIdnmWGUaw==
X-Received: by 10.99.131.198 with SMTP id h189mr2210110pge.25.1518562650157;
	Tue, 13 Feb 2018 14:57:30 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	206sm39132614pfy.140.2018.02.13.14.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Feb 2018 14:57:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Feb 2018 14:57:22 -0800
Message-Id: <1518562642-28282-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] php: update stable version 5.6.31 -> 5.6.33
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
X-List-Received-Date: Tue, 13 Feb 2018 22:57:29 -0000

 04 Jan 2017, PHP 5.6.33

 - GD:
   . Fixed bug #75571 (Potential infinite loop in gdImageCreateFromGifCtx). (cmb)

 - Phar:
   . Fixed bug #74782 (Reflected XSS in .phar 404 page). (Stas)

 26 Sep 2017, PHP 5.6.32

 - Date:
   . Fixed bug #75055 (Out-Of-Bounds Read in timelib_meridian()). (Derick)

 - mcrypt:
   . Fixed bug #72535 (arcfour encryption stream filter crashes php). (Leigh)

 - PCRE:
   . Fixed bug #75207 (applied upstream patch for CVE-2016-1283). (Anatol)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../php/{php-5.6.31 => php-5.6.33}/0001-Add-lpthread-to-link.patch    | 0
 .../{php-5.6.31 => php-5.6.33}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_5.6.31.bb => php_5.6.33.bb}         | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.31 => php-5.6.33}/0001-Add-lpthread-to-link.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-5.6.31 => php-5.6.33}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_5.6.31.bb => php_5.6.33.bb} (65%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.31/0001-Add-lpthread-to-link.patch b/meta-oe/recipes-devtools/php/php-5.6.33/0001-Add-lpthread-to-link.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.31/0001-Add-lpthread-to-link.patch
rename to meta-oe/recipes-devtools/php/php-5.6.33/0001-Add-lpthread-to-link.patch
diff --git a/meta-oe/recipes-devtools/php/php-5.6.31/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.31/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.6.31.bb b/meta-oe/recipes-devtools/php/php_5.6.33.bb
similarity index 65%
rename from meta-oe/recipes-devtools/php/php_5.6.31.bb
rename to meta-oe/recipes-devtools/php/php_5.6.33.bb
index dd8047b..cf31238 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.31.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.33.bb
@@ -6,5 +6,5 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://pthread-check-threads-m4.patch \
             file://0001-Add-lpthread-to-link.patch \
            "
-SRC_URI[md5sum] = "620abe25e0d6cd5f041a360a30ce5783"
-SRC_URI[sha256sum] = "8f397169cb65f0539f3bcb04060f97770d73e19074a37bd2c58b98ebf6ecb10f"
+SRC_URI[md5sum] = "1ba84d9881521065f6398e665786f9e2"
+SRC_URI[sha256sum] = "07f696a9761dcd839e2045c95c3a4d2ffb52c54417477cca9d30a14975b831cc"
-- 
1.9.1


