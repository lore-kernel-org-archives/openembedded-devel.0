Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8696AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:47:08 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 82so2910268qko.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 05:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EayT7pL2EDLZViP78rMdy7z28Q16uEzJXPAGRmduALo=;
	b=lUFXe+yF6ccYd6uhAIe1py7kYnm0i/DBWnhdgxIE9hmBl8mjLHb2A7jmyKK706nuNo
	+wbgVd48JNFpfazLl5Nq1RSA+w9Z8dHKEfJSD8IxBrNSMtP3c+6Auq9RIbpcYvKT2yoL
	oYvD6ilN5haa0/rNU1Lkt7VG17RXoEv8Ka0l6ZaZ2l34/1Q1LFtk+yvnesCjTOQDiPlA
	yNQEHRErT+T0V9DRiSDsdfIkWGHR/v2ndSfGUPABaJHf42caMQ9NW8cUFI/7xu+abM7A
	bGtlKnhtFLA9xNUxpBQ8Wu0hBtbnsigr5pEWA68ETGMrGBSZWtO6T0+SUhHOWdM9Vkkl
	uZWQ==
X-Gm-Message-State: ALyK8tJjsxNJUlPiA6A8XjIeTfg4B3mEkSGynxa68ILksKo7UQSeMYhkMV2e8gCHQRYXLQ==
X-Received: by 10.55.96.66 with SMTP id u63mr9749362qkb.88.1468414028305;
	Wed, 13 Jul 2016 05:47:08 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id s52sm2512139qtc.4.2016.07.13.05.47.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jul 2016 05:47:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2016 08:46:59 -0400
Message-Id: <1468414019-951-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] apache2: update to version 2.4.23
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
X-List-Received-Date: Wed, 13 Jul 2016 12:47:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../apache2/{apache2-native_2.4.20.bb => apache2-native_2.4.23.bb}    | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.20.bb => apache2_2.4.23.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.20.bb => apache2-native_2.4.23.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.20.bb => apache2_2.4.23.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
index 9932d12..b227f19 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "3ff4f00ee051cf5d5304b47b1bc418b8"
-SRC_URI[sha256sum] = "0e76a375ed3dbac636f50ac39de966ece443751fe4d62392f9a360a19d94d0da"
+SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
+SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index ae2ec86..5bea876 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "3ff4f00ee051cf5d5304b47b1bc418b8"
-SRC_URI[sha256sum] = "0e76a375ed3dbac636f50ac39de966ece443751fe4d62392f9a360a19d94d0da"
+SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
+SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.9.1


