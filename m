Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E8B3D65CC2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:35:10 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id r201so52937046wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7Ql/VAf+mHCBtxicSVgXgo4x87Xdv3JAvbAXnqnq7pY=;
	b=MJuz+Hsxja/q5BiZUvPm5CaLqiGiSQCcAg0MLyMnp3L9estp84OMpTkT8+n1/JGy1p
	57qBeCT4JVXqaw/Tb5hPG9+/kq3fCMsVPJAfaIygOT28OmldRsDFt5ox87wAPN9kNg78
	usdyl6/CxfZnWAvsdiybHAiTl3VCNtyGr6w18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7Ql/VAf+mHCBtxicSVgXgo4x87Xdv3JAvbAXnqnq7pY=;
	b=VB4AKdTZwAr+mgiQ+TM7th57rhrOqxBvAZMMqLM7eYevBMGpcZXo58w/ofARirqBU1
	IKp7lYA670KF8w9s6ZX85pLD3D+sv3pi/mm/3c+eY9OpTZnr6RPwEU84mKsrWpfGPqTZ
	dQRBgY32uS0SumsdraEzK3GU3/f48qPWVKmaVxvfW+K6vDPoTtJHB7fmQ4hd+3vUI3eF
	E7LFHT00zDwJfrlISh28+2mhM4tGhDzX5gWMqGA81+jb/c1NxrIW1/qe4E52i/ZNOf7h
	/YOoFK2diLK+jY3HPWxDQtOJUTcVaW4MRAoFEnVlLhl2R+Wi8YKUoG7Jjux6Okl3ZB8J
	MMMg==
X-Gm-Message-State: ALyK8tJUWqRLpObEYMydV7yM2EmSYhgXX3cMxM0u6Muz9gHVP+/a3BFXlFUs8GHnqqpV6/kN
X-Received: by 10.28.207.13 with SMTP id f13mr10617926wmg.53.1466415310270;
	Mon, 20 Jun 2016 02:35:10 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by smtp.gmail.com with ESMTPSA id c74sm7756279wme.1.2016.06.20.02.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jun 2016 02:35:09 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jun 2016 11:35:03 +0200
Message-Id: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH v2] fwts: update to latest git and fix build with gcc 5
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
X-List-Received-Date: Mon, 20 Jun 2016 09:35:14 -0000

License checksum change due to 2014->2016 changes. Fix build with gcc 5 by removing -Wno-werror:

	cc1: error: -Werror=misleading-indentation: no option -Wmisleading-indentation

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 197fe20..2868034 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
 HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "14.12.00"
+PV = "16.05.01"
 
-SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
+SRCREV = "4d9500d1fb119e2136e07c0cc2844f51b5e5b97a"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
 
 S = "${WORKDIR}/git"
@@ -16,7 +16,9 @@ DEPENDS = "libpcre json-c glib-2.0"
 
 inherit autotools-brokensep
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
+CFLAGS += "-I${STAGING_INCDIR}/json-c"
+
+RDEPENDS_${PN} += "dtc"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
-- 
2.4.3


