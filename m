Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 12468609BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 08:02:37 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id f8so1284117wiw.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 01:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DXro/Mux0RXNV8ZB2N0s0P/WwEMerbmpf8UyC711PjY=;
	b=f9QGgL+3twd6c0cXL81r8+FA6vSVFnvKLYxdIugPN2y4v8VgBdh8TQfjzAYiIJcY0L
	q1qDpKiD5yo9TNVcfaIoqyr3p+xsjDVDcGM44rQZItCy0xHHlYcS9ix1abLu6TOoyhHY
	Kx39NfqMFZWTUYBYky7EQUu2IQ4jTuqVrC2fE8bwuM5+Hpuk/AswU2fjtUs67Ti3kSZy
	iRMScZek4MXrNt3EHrITuZ2YH51Q430O+n7mzYBoP6bZ4+V2PTXFNbDR+PNK53OB0FK8
	skE/DjKkB6Wxd1weJKiqL7d3r1h1uBNhur1UePIStQR09iEgeJ+YoA7hZlhNKE3Utf3s
	oiOg==
X-Gm-Message-State: ALoCoQlIP5fXeEJ/pAVelHVB9qBLUvs2N/bloM6owa6N20xopIQkpHW1/zf76sg72OfbDMp+aHeM
X-Received: by 10.194.203.170 with SMTP id kr10mr26390950wjc.19.1399276958057; 
	Mon, 05 May 2014 01:02:38 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id l4sm16125344wiy.0.2014.05.05.01.02.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 01:02:37 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 May 2014 10:02:24 +0200
Message-Id: <1399276944-918-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] php: fix do_installing when S!=B
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 May 2014 08:02:38 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-devtools/php/php.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d5e53c0..b1bf79c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -85,10 +85,10 @@ do_install_append_pn-php() {
     install -d ${D}/${sysconfdir}/apache2/conf.d
     install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
     install -d ${D}${sysconfdir}/init.d
-    sed -i 's:=/usr/sbin:=${sbindir}:g' ${S}/sapi/fpm/init.d.php-fpm
-    sed -i 's:=/etc:=${sysconfdir}:g' ${S}/sapi/fpm/init.d.php-fpm
-    sed -i 's:=/var:=${localstatedir}:g' ${S}/sapi/fpm/init.d.php-fpm
-    install -m 0755 ${S}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
+    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
     TMP=`dirname ${D}/${TMPDIR}`
     while test ${TMP} != ${D}; do
         rmdir ${TMP}
-- 
1.9.0


