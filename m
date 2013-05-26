Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A9DB06065B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 May 2013 21:37:00 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y11so5937319pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 May 2013 14:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=bwjtD+VRf2vQ+i5/MPpDhFAGoOd1OGpqcrArBbvqdFo=;
	b=kK4XvN6BqyXejATud8v+kTCn5mIMOzotVvUrxG1dUVOGKWxAWZInfofX4ClaQzdmdV
	u6bSQ980VBsu96p67VKcah+5IqygpXutLlZ/WFQnWrsw5901XPD7UqVDO0TPXoHxiBv+
	+r9mmsn7l9+u/hOjyMqftWXlx2nakb9BR74aw/s+bMrbf35cc0mjC2ACDJm90UBfcEtY
	qYDISI/6TL8rrZSFH/d/i1NpjKzrCbyo2BBkBtyyHlsXZ6U805O3jPa+0kIdepM3xiJt
	pIFR5Q0rlk7gbDUNNO/BPwqhaeIoeH4HOBWyHv+7WfM1YQlKH9L3FBClbdEiOlh5vB+9
	rWyA==
X-Received: by 10.68.1.34 with SMTP id 2mr26477987pbj.3.1369604221852;
	Sun, 26 May 2013 14:37:01 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qb1sm25659069pbb.33.2013.05.26.14.37.00 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 14:37:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 May 2013 14:35:02 -0700
Message-Id: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-browser][PATCH 1/2] chromium_24.0.1312.52.bb: Fix build with hardfp
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
X-List-Received-Date: Sun, 26 May 2013 21:37:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing dep on gconf-2
Pass Wno-error=unused-local-typedefs to please gcc 4.8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Eric Bénard <eric@eukrea.com>
CC: Denis Carikli <denis@eukrea.com>
CC: Otavio Salvador <otavio@ossystems.com.br>

---
 recipes-browser/chromium/chromium_24.0.1312.52.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
index a9a2d28..f877812 100644
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Chromium browser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0750f191c9bbf46869b70508e7eb455b"
-DEPENDS = "xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native"
+DEPENDS = "xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
 
 SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
         file://include.gypi \
@@ -35,7 +35,8 @@ EXTRA_OEGYP =	" \
 	-I ${WORKDIR}/include.gypi \
 	-f ninja \
 "
-
+ARMFPABI_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
+export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs'"
 do_configure() {
 	cd ${S}
 	# replace LD with CXX, to workaround a possible gyp issue?
-- 
1.8.1.2


