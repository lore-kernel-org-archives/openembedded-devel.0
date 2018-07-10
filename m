Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18CB17600A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 15:25:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a3-v6so5832457wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=B/xzeg/1+HyE4+5x8ln72x7jA/6rSu+7DV768qcdLl4=;
	b=bMMX92l+Ku5xskPkXdiqQ6SdJ5YSSm7zOcroyHcBqJkJucqvKhwIg1L6wEgeFUwJyD
	E5fhcH0iA8o+E1EbNSznxvpjkSZD9VfrmKqjoTusSPUX9XcySF2vEjBbQw3zrpKlGlJN
	58HKTw2YNf2/BAxs9bD/THE5liZEmnjOZSjU4uq7WFVZpEMYphX3sdSRo787kEj8Q7Pq
	u1JBNC82hBmWLk1/awRcANs7MJQ8ApzbDn+viEMWOs8FrbTgjPNzZPqbjS2E1nMFOgUq
	cHmkL/e54rtwyvn5LRQzhw+rJd4PbhIyFfcbNHN0cG53H+LnANDm+5t4sIpi4JeBzne3
	2vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B/xzeg/1+HyE4+5x8ln72x7jA/6rSu+7DV768qcdLl4=;
	b=aIZF5pGz8pJsUw0EORz0JbI9F8qDbcM+/ceyskHT02nRK9RgYbE7osQULnV2vanXME
	7AcmErucXJSnFHeetctdNVZ5P5vnaiPiNcR7EPxLfyDcveOiENI2a+PX1DvbfBLWbtAB
	2uSnN4iA8aStvf5jpNj3w5qFi3S61W8HHV7EFogCUPOpXhrGzLE64CPwg7AYw3hc6G8+
	r4C30XSc5ncgDiK4ULOXVmCjI/C/CQkdgQATX0caCldtnSYuHx7fwY0OWrXq4HLyzUw4
	L+OkgTezdXFVeF+yKLLCZRUJT232ajBqQxXk5qXl+IHJrCYgzLG3w19cdmOpjxrQGwqm
	SN+A==
X-Gm-Message-State: AOUpUlF2UMZqJ4OTHTyeVAgJ80mFlMuvI7o4k3sfPpgFRv2z5CnkrH7a
	ZOhprcWAH91G9s5OQmOz8YzMCWGq
X-Google-Smtp-Source: AAOMgpfsg56rmKUEnHvNPD4J7q9DWilVKr0U1vY+sMkc2D09fVeFVNY+/N7O38RB3I1XvmNOuLxIWQ==
X-Received: by 2002:adf:f091:: with SMTP id
	n17-v6mr6885068wro.49.1531236344629; 
	Tue, 10 Jul 2018 08:25:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v5-v6sm5296111wru.60.2018.07.10.08.25.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 08:25:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:25:42 +0100
Message-Id: <20180710152542.10701-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] php: actually enable openssl
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
X-List-Received-Date: Tue, 10 Jul 2018 15:25:44 -0000

The PHP recipe depends on OpenSSL but support is disabled unless you pass
--with-openssl.  Add a PACKAGECONFIG for openssl and enable it by default.

Also for clarity pass --enable-opcache when the opcache is enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index f262d60d15..9ac1dc46f0 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -5,8 +5,7 @@ SECTION = "console/network"
 LICENSE = "PHP-3.0"
 
 BBCLASSEXTEND = "native"
-DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
-           openssl"
+DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
 DEPENDS_class-native = "zlib-native libxml2-native"
 
 PHP_MAJOR_VERSION = "${@d.getVar('PV', True).split('.')[0]}"
@@ -68,7 +67,7 @@ EXTRA_OECONF_class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
+PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG_class-native = ""
@@ -92,7 +91,8 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
                        ,--without-imap --without-imap-ssl \
                        ,uw-imap"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[opcache] = ",--disable-opcache"
+PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-- 
2.11.0


