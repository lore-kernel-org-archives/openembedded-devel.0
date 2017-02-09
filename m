Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 55BF271D87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 00:35:25 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s140so141411128qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 16:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G5sgob7iafAbfK8roZvsCdbv+Ly+Rwks5uGlTh9O2OQ=;
	b=ou7lWc2TVM6HDfKZln2N+4WcawGjA0ayZ4APE3/YPfmhvDe05oDauRbk31HYUodukt
	jcqHXluvKHyiUALWBZrATQYECkfdsc+6D7g5nMHlV0tBcPfK6fc1CX/tw/yZZNPdqd1S
	M8ELulbzc3zOg6Lx/suqoBVZ1cizNRu6hwMKgprZwBlhrTDi1UyMsbDRYpnIX2rMFwsX
	/pXcmM5hc4FBAq53McnBYKXw6zgmPsw8FMk10p4NwrtcphpLAOswjP7ss/w95nAMsU4n
	c+qiwUGbATb0qIhQ17I0rkWwarYBpEPplPxEXH4iYKnZG1x1ZOUOXcqAF1N/CQUHIZUg
	iHbA==
X-Gm-Message-State: AMke39mGJpBUp1P/8CvDWzEmchkBn9KOKm+Gxo1N4QGYFtpSxjrOe3AWbeozM5q1Zlig+A==
X-Received: by 10.55.81.136 with SMTP id f130mr315909qkb.75.1486600525932;
	Wed, 08 Feb 2017 16:35:25 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	n75sm7639207qkl.26.2017.02.08.16.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 16:35:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 19:35:11 -0500
Message-Id: <1486600511-30582-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache: use the APACHE_MIRROR variable in the SRC_URI
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
X-List-Received-Date: Thu, 09 Feb 2017 00:35:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
index 7a2b236..fc84872 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
index 9446082..b3a2dfd 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
-- 
2.7.4


