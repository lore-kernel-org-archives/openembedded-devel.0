Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2569A7316D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:43:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c206so46841550wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=I6fl9llHYJiuX+Rjiewsj7oSQG5H/3pyd59orsJAmHw=;
	b=SkvWDBU9QipJB/7tJ5QwFA1gmY3sTZprskyXUKrp0xxVmYimJERBpf+O7EIgTmvAGN
	OGckc9q77p/CSwJMH8Y5Q6xCgWMNJxtRcrwl4cpQL3+yroY92lAl+fcNnzMdNB5NblTs
	FEGhWlTvEz1Rv8u8N7VxedqBHqjFBCGPIRPvkFxxRmNYufFn6vb0hikR4NRJJcSVWIEf
	JE+0LR5rbRxH82sruwvIxXIHCncLEzbqwZdlVZopOOGeKy3JvxpJWWVft5gtWFctqO8m
	d0Ds5PkBHxDCFDZczmJUfudnO4ptRuPGSnmlnD15QdgNrKMhqJiaLDHmIjkyN3vLfOJj
	sNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I6fl9llHYJiuX+Rjiewsj7oSQG5H/3pyd59orsJAmHw=;
	b=Wbe75ztjy4Cpg2vxaJokWCcNDng/4pm2ocVIOrXlnMYOW7tcJohQIdOIoLJ/HRYNT9
	MG3We7Kg6PvIv2K5mqaTfP2m/TUk8Sd+N+Qw695BDP83DwdpAC2UCQDbn8f0krfSvRHa
	UF8Nw67BRTDy0/6sESYos/wGzy5DSvVeaKdcf2gh9WvlyGdPjHmPx2GD3ukkf8z2gWpV
	xxZswMyntqLGZhAq8CktkfFGQMkTfyQnzIIV5v7MuGDfdkZ5vTRzo3tPoen1Z3StW1bH
	uDBm8FaZaWAG5g9C2WjlG+SH9lRPNdrpym950GTOC1cTnnMAWroQqK0BJmS2K8KWpB/R
	iACA==
X-Gm-Message-State: AIkVDXL35LUsMJeKfXwzV1Fw5QFG/8CppBq8ECb/sVlA6Tu2i1B2zM5nzP2fXOD431PVT0Hl
X-Received: by 10.223.176.142 with SMTP id i14mr14490148wra.4.1484923436299;
	Fri, 20 Jan 2017 06:43:56 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d29sm70220wrc.42.2017.01.20.06.43.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:43:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:43:49 +0000
Message-Id: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH 1/2] calibrateproto: add, from oe-core
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
X-List-Received-Date: Fri, 20 Jan 2017 14:43:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/calibrateproto/fix.patch            | 42 ++++++++++++++++++++++
 .../xorg-proto/calibrateproto_git.bb               | 19 ++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/calibrateproto/fix.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/calibrateproto_git.bb

diff --git a/meta-oe/recipes-graphics/xorg-proto/calibrateproto/fix.patch b/meta-oe/recipes-graphics/xorg-proto/calibrateproto/fix.patch
new file mode 100644
index 0000000..ff8cb25
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/calibrateproto/fix.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Pending
+
+Add missing length fields to the replies. Without these, sanity checking in recent X
+breaks things.
+
+RP 11/2/10
+
+
+Index: git/xcalibrateproto.h
+===================================================================
+--- git.orig/xcalibrateproto.h	2010-02-11 11:47:45.711985932 +0000
++++ git/xcalibrateproto.h	2010-02-11 11:40:21.000000000 +0000
+@@ -67,13 +67,13 @@
+     BYTE    type;   /* X_Reply */
+     BYTE    pad1;
+     CARD16  sequenceNumber B16;
++    CARD32  length;
+     CARD32  status;
+     CARD32  pad2 B32;
+     CARD32  pad3 B32;
+     CARD32  pad4 B32;
+     CARD32  pad5 B32;
+     CARD32  pad6 B32;
+-    CARD32  pad7 B32;
+ } xXCalibrateRawModeReply;
+ 
+ #define sz_xXCalibrateRawModeReply	32
+@@ -92,13 +92,13 @@
+     BYTE    type;   /* X_Reply */
+     BYTE    pad1;
+     CARD16  sequenceNumber B16;
++    CARD32  length;
+     CARD32  x;
+     CARD32  y;
+     CARD32  pad2 B32;
+     CARD32  pad3 B32;
+     CARD32  pad4 B32;
+     CARD32  pad5 B32;
+-    CARD32  pad6 B32;
+ } xXCalibrateScreenToCoordReply;
+ 
+ #define sz_xXCalibrateScreenToCoordReply	32
diff --git a/meta-oe/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta-oe/recipes-graphics/xorg-proto/calibrateproto_git.bb
new file mode 100644
index 0000000..b88d157
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/calibrateproto_git.bb
@@ -0,0 +1,19 @@
+require xorg-proto-common.inc
+
+SUMMARY = "XCalibrate: Touchscreen calibration headers"
+
+DESCRIPTION = "This package provides the wire protocol for the \
+Touchscreen calibration extension."
+
+LICENSE = "MIT-style"
+LIC_FILES_CHKSUM = "file://xcalibratewire.h;endline=23;md5=7f86ef7b03cce6c4c9ebd59d20ca485f \
+                    file://xcalibrateproto.h;endline=23;md5=e4490491edcc171ca24f98569ee580db"
+
+SRCREV = "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
+
+PV = "0.0+git${SRCPV}"
+PR = "r2"
+
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto \
+           file://fix.patch;apply=yes"
+S = "${WORKDIR}/git"
-- 
2.8.1


