Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4EC77ABF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2017 21:14:45 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id a43so9001919wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Sep 2017 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=R6dwf2e91nhkvIDpEGzyDNjp781PzHKEoSZhQC0gUDY=;
	b=Et+FXETwYdo7czhTuTs6R3JpLPnHXg9W3ouIAegxUC6Z8XEGzQNdkP0Wwr1i4MYt9r
	ov8cAZxSxMD4g0eQeQVMVv1AC0LEgrqGiFoXF/xylaHiyELTFO/tQsDK049KlBlMdRSD
	+KbBYVK0GEXWkBYx+3LewkscD/h4OpoeOiAufwG44p57ax4WiDP2Nif0c4+EjAjBoSTc
	17XgOU3PPBITnEPOvB3aNMPVAwQWdvHTxNPRxyTuiDn3R2m3Yc6yFSOpHm8eGXyYuR4R
	cGtTO94K/FfjTVvr/16BCdKPr80cxz4LJlZyU0paIRdIcKgRayg/D2zKXZEcp6JBC1EQ
	DlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R6dwf2e91nhkvIDpEGzyDNjp781PzHKEoSZhQC0gUDY=;
	b=FxhfpTlkT/qX5ejeEMwvZThstRjzqhaLbGgkV71AtzWg57afwCfJ3B4Dae8vhhXaNp
	r8mgKccrF5/PnK5OiIEbq1qWWwB39pWPXr16YaRaug1WkOFLPJQmvNfyX/acYEaqjMjB
	nN7PSrfuwKLPoeDcTDD75ycS/sLWQ7rs2SwySbE0ZK1ymuJU4TznpYdVFlR81PC6Q75d
	3kU47SA1bCVsKRc/8zUj22uJFNkvVLzwjeOejBdaqk3My8GVtBRqUFPv/m4AkuBgHnnx
	vADogoBLsw/gCdfBs45N4sB7oN7Hs4kmyA+yRDM3XheijhlzlOxdeGyi9pdcVR6hedVb
	MDTw==
X-Gm-Message-State: AHPjjUiweg6PN6zul04bxGTCXvt0qiGvq4vlyqzWvEcSMxWfc8pdKslJ
	QnC94NMaMX96HtxI
X-Google-Smtp-Source: ADKCNb6qCSz+ZzZSy8F12PdGp96My3zL/mAV8hbB3k4RWD9TLlCkjDxV32GKUcFI6GrzuqID/wdrRg==
X-Received: by 10.223.177.18 with SMTP id l18mr2581686wra.167.1504991686656;
	Sat, 09 Sep 2017 14:14:46 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	p71sm2067245wmd.40.2017.09.09.14.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Sep 2017 14:14:46 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Sep 2017 00:19:30 +0300
Message-Id: <1504991970-596-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Sat, 09 Sep 2017 21:14:46 -0000

Upgrading to newer v4l-utils 1.12.3 on commit f84a551f2d419df88b85987855fec866d9e84b4a
Is causing issues because libdvbv5 now require libudev in order to work
(commit db42484881bf5e6a902de51fe42444ddf286d52a on v4l-utils).

First issue is missing dvb utils dvb-fe-tool, dvb-format-convert, dvbv5-daemon, dvbv5-scan, dvbv5-zap
because libdvbv5 requires now libudev.

Another issue was the failure of building dvb-apps (currently removed from master)
because the v4l-utils-native is missing dvb-format-convert.

This commit adds the missing udev dependency only on target and brings back the missing dvb utils.

Adding udev on native build is not possible because nothing provides udev-native.
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index 42da5cc..dacc406 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -7,6 +7,7 @@ PROVIDES = "libv4l media-ctl"
 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_append_libc-musl = " argp-standalone"
+DEPENDS_append_class-target = " udev"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.4


