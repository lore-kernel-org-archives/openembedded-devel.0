Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 914426FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 21:16:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d9so10054677qtd.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w7uyJEYmwk0bxEpvvjZOs8pYNkVsQ+c9PimUvkpafhg=;
	b=SzLp+BGlxodyGH3ojn+V3AON4zpari9200a1KmKa/2PeeOBCw4wR9QudRgTdETG+an
	omn+jreeXBonhZX0QBLRSGLGdkL2GZjqE9WdJZocx8Rk1JA43xKJOePoWQy8IBTZeaYd
	1bShG35ZsxaQ2xiZ1irE6ewu8epxIPehhPlmGCYnI3/RLzTr4xYgc1a6QdO1udTwKuIQ
	8erRm5/2vYEW2DejB0lQwjj3x7FMRt1Zn1+Bpnhm1d7DbB8lNny+14eTvzmRDTxquhDW
	0NzQerCAkK5EosZ1zMtT471xHthgQtTrJwrUBKJQ/OQ46DO/NcChqyoUNLpx9or29lGl
	PHiQ==
X-Gm-Message-State: AMCzsaWOgWyeW7ygfalPMFv9dWfslFJdvYKOTGxHazFavo3iEQ2N4Rls
	Krl3q8TGbm0fQVYx96f9gENXWBmb
X-Google-Smtp-Source: ABhQp+RSnGtQOQLUbPeTsahQ2RgqUEi6IYIlrO5NQbpzaODFf7TQomJPIAYccCMTDgQl+hmtv02x4Q==
X-Received: by 10.200.3.159 with SMTP id t31mr3002100qtg.102.1509138974025;
	Fri, 27 Oct 2017 14:16:14 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	t34sm5894112qtb.79.2017.10.27.14.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 14:16:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Oct 2017 17:16:06 -0400
Message-Id: <1509138966-20384-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache2: update to version 2.4.29
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
X-List-Received-Date: Fri, 27 Oct 2017 21:16:13 -0000

Updated license checksum due to whitespace modifications

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../apache2/{apache2-native_2.4.27.bb => apache2-native_2.4.29.bb}  | 6 +++---
 .../recipes-httpd/apache2/{apache2_2.4.27.bb => apache2_2.4.29.bb}  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.27.bb => apache2-native_2.4.29.bb} (86%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.27.bb => apache2_2.4.29.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
similarity index 86%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
index 4e893db..36f073c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
@@ -14,9 +14,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/httpd-${PV}"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "97b6bbfa83c866dbe20ef317e3afd108"
-SRC_URI[sha256sum] = "71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a62b0c7623826ff99766ff13fb9007f8"
+SRC_URI[md5sum] = "0c599404ef6b69eee95bcd9fcd094407"
+SRC_URI[sha256sum] = "777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
index 1880867..f0298b9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
@@ -23,9 +23,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://volatiles.04_apache2 \
           "
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "97b6bbfa83c866dbe20ef317e3afd108"
-SRC_URI[sha256sum] = "71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a62b0c7623826ff99766ff13fb9007f8"
+SRC_URI[md5sum] = "0c599404ef6b69eee95bcd9fcd094407"
+SRC_URI[sha256sum] = "777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


