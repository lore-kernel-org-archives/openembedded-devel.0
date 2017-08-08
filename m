Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 704EE719AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:40:51 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q66so3682084qki.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xTKsV5hvXDIcT0bQ2sFDtI3sKXABlFP3adY4yVkMUBQ=;
	b=gwQdHguQBG2Irq1fbcMnlSldICeuzFCuzEq6L/jiK6/zFo/XYHAS/WwkP9utGIfaam
	Z3M3a2mugh90e9qGmTEgUXhcSTp3crWexfEgdelgyncua70NnPNIKq8ZazPHQ/Mo0Zs7
	ghlNXIHhHIQfUjysCMSuSNVMJg7QhxGAxLg6EggT8DKMbuc602615o9XeKb0XO8a/2+a
	0NtBP4sNd9GuUEMwckc2vjLBNCBZ1VaSY2Odnvh0SxEgfFKfX6pjlr/aHaHJmoLTxee1
	U5gavG5R1xGnT1/hYC9JcpntgvPhnZaJHM97EhiFC9FVmTM3dX1rtKk9/gyvC0nPpiMz
	S3wg==
X-Gm-Message-State: AHYfb5ht9NN08+dtOKVnOSM699AbE1hnNb0e14NYSOIcEkaELo6BLD8H
	S72Z/hGLvMukM+I61lk=
X-Received: by 10.237.38.132 with SMTP id q4mr6499030qtd.321.1502214052983;
	Tue, 08 Aug 2017 10:40:52 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id y36sm935121qtc.38.2017.08.08.10.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 10:40:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 13:40:45 -0400
Message-Id: <1502214045-10239-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache2: update to version 2.4.27
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
X-List-Received-Date: Tue, 08 Aug 2017 17:40:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../apache2/{apache2-native_2.4.25.bb => apache2-native_2.4.27.bb}    | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.25.bb => apache2_2.4.27.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.25.bb => apache2-native_2.4.27.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.25.bb => apache2_2.4.27.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
index 99717d2..4e893db 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
@@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
-SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
+SRC_URI[md5sum] = "97b6bbfa83c866dbe20ef317e3afd108"
+SRC_URI[sha256sum] = "71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
index 0ba7d3c..f053e37 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
@@ -23,8 +23,8 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
-SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
+SRC_URI[md5sum] = "97b6bbfa83c866dbe20ef317e3afd108"
+SRC_URI[sha256sum] = "71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


