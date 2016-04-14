Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id C4EE760107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 22:06:39 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id c6so71820607qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 15:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l9Twj2o8KpaMjqBkHLuZruv517dD9LY3ieptZeXdrq0=;
	b=AH/sFxXXvM6es6gQoxPVbQ92Ag2y1iLgcejOmABo+IVeuq8KXy+XGEd5kKd1dsBovo
	JAUUBGZu0requlr1DPvE4yCvPUXocGTfnyMjMJjjjFRkRMgfqCTzpAzd0p5L+cYvFGkn
	9NdM0RU/nzOrrpZuUlBHwjT3OufRLmMBfBDoAZW/6gdIvDcW+QvJbI9kQeQ1xzaH5Xi8
	0eVeCLHxhLsK4SeHpll1indDzACtmnkPEl8rHX47IctZCZuQ+GFiluCTcWl0CXVFVGVd
	tx67HoNGEQW6vkT4I5OhY+KI6x3VeHtKABCXv3z2SsHm8A300b3YJlht4O1WEiFRRG5u
	L/MQ==
X-Gm-Message-State: AOPr4FXjnMjvCBOSDDcQ2x2brmwdHJB91EtdYiPhbNE8o3fWvKEnFn7CGchPN3v4kLtk/w==
X-Received: by 10.140.82.69 with SMTP id g63mr20999330qgd.106.1460671599777;
	Thu, 14 Apr 2016 15:06:39 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	201sm3152958qhu.34.2016.04.14.15.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 15:06:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 18:06:30 -0400
Message-Id: <1460671590-18671-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] apache2: update to 2.4.20
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
X-List-Received-Date: Thu, 14 Apr 2016 22:06:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../apache2/{apache2-native_2.4.18.bb => apache2-native_2.4.20.bb}    | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.18.bb => apache2_2.4.20.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.18.bb => apache2-native_2.4.20.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.18.bb => apache2_2.4.20.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.18.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb
index 201efa6..9932d12 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.18.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.20.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "3690b3cc991b7dfd22aea9e1264a11b9"
-SRC_URI[sha256sum] = "0644b050de41f5c9f67c825285049b144690421acb709b06fe53eddfa8a9fd4c"
+SRC_URI[md5sum] = "3ff4f00ee051cf5d5304b47b1bc418b8"
+SRC_URI[sha256sum] = "0e76a375ed3dbac636f50ac39de966ece443751fe4d62392f9a360a19d94d0da"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
index 53d0564..df25034 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "3690b3cc991b7dfd22aea9e1264a11b9"
-SRC_URI[sha256sum] = "0644b050de41f5c9f67c825285049b144690421acb709b06fe53eddfa8a9fd4c"
+SRC_URI[md5sum] = "3ff4f00ee051cf5d5304b47b1bc418b8"
+SRC_URI[sha256sum] = "0e76a375ed3dbac636f50ac39de966ece443751fe4d62392f9a360a19d94d0da"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.9.1


