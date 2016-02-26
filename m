Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id F1292771B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:55:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q63so450907pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E/xPt0TZYc9dgDbXTiRnSA5q8RMubqDQU1KVnFO2mkk=;
	b=OyFCOrzLzp74QYz9VIB7Qqd88iW1DFwwnw+s1wJ1Dh7w0NblpOdmng/mZ/5naLCzuF
	unmrTh9V4mi/u4F+wgCZJedXOIG3i+WtznSKDAqQQ5u/ux5YosNvL84dXAoydjApavOd
	Zi104LwVbmoOKEz8aHEiVtAhYp9MWBubrU+1Bdboh6kT9z7Cf4VbJoMzoub850iDieua
	JxJHNFvuJht9pdlrEWoiNBPNnaPUxFNZvv5HxB9Db5tfLnqP2JmpXjnRYw1+Hf1IF7+A
	cO6ji4y9uoL+7UbgDK6fpFeObearNUnRkOkOhnFT1rxlH2Y1l+U/kmSTm9xYqngbfBxK
	IY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E/xPt0TZYc9dgDbXTiRnSA5q8RMubqDQU1KVnFO2mkk=;
	b=eoPwrcjGkwc+Az+lcge0kBhRM3Xbg4JJ3Wy4HLfj2PB4OCQAjyvp9Emkav3Py5zh7z
	vHX1UjaaIlf4MMY7IpET/xchqKEM9dPvxC+ylCM0hORLY/5Iza5wNFXE6soef7lMoMzZ
	2z+MGZVGvhEvUekAsp2P+4rpNNUdUAeozM1rM6nw9kkXhvjVB4J1rADE5XKcQABpcvhC
	Dot1q8dRoDPKwsKocQ0bsqrB1VMt0KUFyx7Crin5yOFjZJgFvJDLN6kYgIoZ/+epZ66G
	Yg/8IG/OlJyFYWDUKlD5qaHZx/Iaclb4exU+j3AhWz9yw2ev9JAIM0yMHn33OoErIuCA
	AjDA==
X-Gm-Message-State: AG10YOTMWupOuU7FFD6HseWo9bq6o8mfqxLa+X+7QU/4mTeFpj03Raeim+C9F3uFqMHzAw==
X-Received: by 10.98.75.10 with SMTP id y10mr67464846pfa.32.1456448114403;
	Thu, 25 Feb 2016 16:55:14 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	ko9sm14769286pab.37.2016.02.25.16.55.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 16:55:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:55:08 -0800
Message-Id: <1456448109-11375-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1456448109-11375-1-git-send-email-akuster808@gmail.com>
References: <1456448109-11375-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/3] php: update to 5.6.18 and 6.6.32
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
X-List-Received-Date: Fri, 26 Feb 2016 00:55:14 -0000

Moved LIC_FILES_CHKSUM from .inc to .bb

5.6.18 changed do to yr update.

Includes: CVE-2016-2554

and

PCRE:
    Upgraded bundled PCRE library to 8.38. (CVE-2015-8383, CVE-2015-8386, CVE-2015-8387, CVE-2015-8389, CVE-2015-8390, CVE-2015-8391, CVE-2015-8393, CVE-2015-8394)

see http://php.net/ChangeLog-5.php#5.6.18 for more info.
http://php.net/ChangeLog-5.php#5.5.32

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch                         | 0
 meta-oe/recipes-devtools/php/php.inc                               | 1 -
 meta-oe/recipes-devtools/php/php_5.5.31.bb                         | 4 ----
 meta-oe/recipes-devtools/php/php_5.5.32.bb                         | 6 ++++++
 meta-oe/recipes-devtools/php/php_5.6.17.bb                         | 5 -----
 meta-oe/recipes-devtools/php/php_5.6.18.bb                         | 7 +++++++
 6 files changed, 13 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.17 => php-5.6.18}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.31.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.32.bb
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.6.17.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.18.bb

diff --git a/meta-oe/recipes-devtools/php/php-5.6.17/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.18/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.17/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.18/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 793ffe8..ee7a143 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
diff --git a/meta-oe/recipes-devtools/php/php_5.5.31.bb b/meta-oe/recipes-devtools/php/php_5.5.31.bb
deleted file mode 100644
index cdd89b4..0000000
--- a/meta-oe/recipes-devtools/php/php_5.5.31.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require php.inc
-
-SRC_URI[md5sum] = "ebb66ad8e2bcf1a966b10d86e81a0119"
-SRC_URI[sha256sum] = "fb4a382b9a9dceb749b7ef047d8251320bc8d371c843714e5b4f4b70d61ba277"
diff --git a/meta-oe/recipes-devtools/php/php_5.5.32.bb b/meta-oe/recipes-devtools/php/php_5.5.32.bb
new file mode 100644
index 0000000..4ee3c38
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.5.32.bb
@@ -0,0 +1,6 @@
+require php.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
+
+SRC_URI[md5sum] = "47443f39152d671d24bc839e6a49049d"
+SRC_URI[sha256sum] = "b0f2c108db8e05db9f6366aaba9a754fd0ee31f3f86ee889561b608dfd6e92ee"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.17.bb b/meta-oe/recipes-devtools/php/php_5.6.17.bb
deleted file mode 100644
index d92d92b..0000000
--- a/meta-oe/recipes-devtools/php/php_5.6.17.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require php.inc
-
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "23e2183852b172a8e2b2c739b7dde4ca"
-SRC_URI[sha256sum] = "77b45f56a1e63e75bb22b42cfb8b438ec4083c59ce774b4d7c1685544b7add3b"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.18.bb b/meta-oe/recipes-devtools/php/php_5.6.18.bb
new file mode 100644
index 0000000..2ce012f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.6.18.bb
@@ -0,0 +1,7 @@
+require php.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
+SRC_URI[md5sum] = "7340353bedd998286ba2c4d87d7864f8"
+SRC_URI[sha256sum] = "c3cd4a29a9562309d36e2b128407d6eaa5c7dde590d2b1a464457383e517f4ed"
-- 
2.3.5


