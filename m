Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1E477E7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:11:45 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o3so1334711qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=35cva3/JAvnbJYIAB3SlxVP8t/psdlXMLcflK4+JB90=;
	b=I2o5fWijKVLRoCpSfGyfMkm2Mm+Od6wi8Xo05M+HqADZEKovu//umHpOb/MAS+BZId
	0ZtIPO3lLaRrv3QH3uRNEQBpXS3rBT5tzCp0c/uTgYsqU7vvPpGdQDCKAe0pFL1yAUtk
	Lp6D7FaypK4hz8sHT7SAS/671WJ6GPfMURDOYeu11a4+Ff0e6VGLkDfau2VKyS32QBbn
	Y60Ozv183KHsz9TgukF/a9f8eLuhUu2NozCsjt2WpCiDl4529WliqCCZVPiIMCJk+TMo
	+IJ/yU49+fdEZQ0BYY4dxKUCZNMnV3YSMkBAQ+NjlNdE3n4+fhd1Jx9QGye+EGiDTaQa
	VUcg==
X-Gm-Message-State: AHPjjUhNMRqVC5dnAElnlqd76UecnggKgWX28HmZSXyHZRjeLh86fQV7
	Rk/h1gB5NWknJ7ltWHt/GSxL4HYD
X-Google-Smtp-Source: AOwi7QCeLoBEMBBdWyPIe0H8sWxYyysnXnkiKLkbFCbH2f/nqye+DU4VPMlA7v+Aw/vxmmPfA9Tckg==
X-Received: by 10.200.50.125 with SMTP id y58mr7542877qta.266.1505920306756;
	Wed, 20 Sep 2017 08:11:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	e64sm1436547qkc.15.2017.09.20.08.11.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 08:11:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 11:11:31 -0400
Message-Id: <1505920293-28115-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/3] php: update version to 7.1.9
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
X-List-Received-Date: Wed, 20 Sep 2017 15:11:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../php/{php-7.1.8 => php-7.1.9}/0001-Specify-tag-with-libtool.patch  | 0
 .../{php-7.1.8 => php-7.1.9}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch   | 0
 meta-oe/recipes-devtools/php/{php_7.1.8.bb => php_7.1.9.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-7.1.8 => php-7.1.9}/0001-Specify-tag-with-libtool.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.8 => php-7.1.9}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_7.1.8.bb => php_7.1.9.bb} (79%)

diff --git a/meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch b/meta-oe/recipes-devtools/php/php-7.1.9/0001-Specify-tag-with-libtool.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch
rename to meta-oe/recipes-devtools/php/php-7.1.9/0001-Specify-tag-with-libtool.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.9/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-7.1.9/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_7.1.8.bb b/meta-oe/recipes-devtools/php/php_7.1.9.bb
similarity index 79%
rename from meta-oe/recipes-devtools/php/php_7.1.8.bb
rename to meta-oe/recipes-devtools/php/php_7.1.9.bb
index a66bcf8..157369e 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.8.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.9.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-Specify-tag-with-libtool.patch \
            "
-SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
-SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
+SRC_URI[md5sum] = "2397be54f3281cdf30c7ef076b28f7d0"
+SRC_URI[sha256sum] = "314dcc10dfdd7c4443edb4fe1e133a44f2b2a8351be8c9eb6ab9222d45fd9bae"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4


