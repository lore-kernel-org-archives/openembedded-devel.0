Return-Path: <pespin.shar@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 66C327066B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:07:38 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id z2so3556093wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tvVI5yXHaG+05L27mfL8WbVKSpYFYoxn5KculfEuRlE=;
	b=PlmATTIX7PuBIYxSLIO5Sx4Xh8SSeXlxadsgDPFEt546Zcf1Alet1VZrEBLDRIs4qh
	5Bj18Q+9aV+MtOglZRuNluFxOaulAHdotfOPKCo4MNQMiTKGyNwt8mc71/SLnPRtuc5C
	wh5bZwECTWZgAZPoDsDBwfwB9YdN8v5xWEs0M2rsorT3pfwntfCjT365mGEZckMMKLPV
	30T+dVfa5FxEspFP5MehPviajxLunHJTP/GR0lq3E4pcEVsPJDiTTXtQanFGOOVXiJDQ
	ujYiqvjNAqiHUhTuUE+MBLL5InO+TkIFQiQ5zLkpkd3ozX+4buwVQj9o8GZQOsF5QREi
	aF8Q==
X-Received: by 10.194.59.232 with SMTP id c8mr62434713wjr.76.1423649259611;
	Wed, 11 Feb 2015 02:07:39 -0800 (PST)
Received: from P8761-linux.aweurope.be
	(130.79-246-81.adsl-static.isp.belgacom.be. [81.246.79.130])
	by mx.google.com with ESMTPSA id jg3sm1687590wid.0.2015.02.11.02.07.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Feb 2015 02:07:38 -0800 (PST)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
X-Google-Original-From: Pau Espin Pedrol <pau.espin@aweurope.be>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Feb 2015 11:06:52 +0100
Message-Id: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
X-Mailer: git-send-email 1.9.1
Cc: Pau Espin Pedrol <pau.espin@essensium.com>
Subject: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
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
X-List-Received-Date: Wed, 11 Feb 2015 10:07:48 -0000

From: Pau Espin Pedrol <pau.espin@essensium.com>

Signed-off-by: Pau Espin Pedrol <pau.espin@essensium.com>
---
 recipes-qt/qt5/qtmultimedia.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 427f688..de1839f 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -14,6 +14,9 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CON
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
 
+QT_MULTIMEDIA_BUILD_PARTS ?= "examples"
+EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_MULTIMEDIA_BUILD_PARTS}"
+
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
     file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
-- 
1.9.1


