Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id EA71F609B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 21:33:45 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id n8so4569164qaq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 13:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=67xNLLQI7zI0rzhgsnQcnnCEjREjxBbYdJVNL9+A1uw=;
	b=qL4c6NZWIErJYc4ZmN+wfeHAF3MVJLikaeXskzYwEI34VeCDfz8GZTf31l1zOzuixt
	OVzRKeOJJJVu5+Jykgqlxd6hZEVk6a1V/xhwEXIn0YfADFw9l7Fh1r8LCy78SEXrCYD/
	mBSUf4YBBYYI62f7RgTU/Io3vhbS0qU6dXnIR79yN9IuX2yhnPa778B6bCmg1/s1tkIr
	3J7/A2YG21seTNguDbuV/yeGysrzwsYsT+/i/7OYStkjA89itIq94STPioTtddSP/3B7
	KlWg0MdcG5+OaUt9oxUxhhyshiJ7RPZy0Lj12FXpQNX5iohsyRATKscEsvuVFSCgXPIT
	gXJQ==
X-Received: by 10.224.151.208 with SMTP id d16mr8632416qaw.30.1420666425686;
	Wed, 07 Jan 2015 13:33:45 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id a4sm2234849qge.24.2015.01.07.13.33.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 13:33:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 00B941CA7B062; Wed,  7 Jan 2015 19:33:41 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed,  7 Jan 2015 19:33:38 -0200
Message-Id: <1420666418-8503-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] qtmultimedia: Add support to enable/disable PulseAudio and ALSA
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
X-List-Received-Date: Wed, 07 Jan 2015 21:33:49 -0000

The way QtMultimedia use to detect the PulseAudio and ALSA makes it
non obvious how to disable it. After researching how Gentoo does it
the 'done_config_<flag>' has been found. So now, we respect the distro
support for PulseAudio and ALSA.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 8904ca5..427f688 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -1,11 +1,16 @@
 require qt5.inc
 
-DEPENDS += "qtdeclarative alsa-lib"
+DEPENDS += "qtdeclarative"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 PACKAGECONFIG[openal] = ",,openal-soft"
 PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
 
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
 
-- 
2.1.4


