Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F014732EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:14 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id s11so537014qcv.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ga2e+yqFj/aPnKzFOAVLVe396lr9ADMM4KBNg5veSYA=;
	b=bjfNQYdd1FkdvFko/IQ4OO9HUURBbyfiNwpv8dJbFxmmzsgUAuR3lV7+1iFha6WgNP
	HD4QX0NxsswEwnK8bzsT1GsJGfvqcFi4/Rx2VfmY8I14GMB+Jezs6XSNWxXO3CeeVMey
	UWDD4oXC6bz5e21LINAN01noOa0JOz5YAbonHv3uTNwh/KtLSm9aFnDaswWBnQWYmZrg
	aD11CJxCK3oXQ4ljFqANkAGdykLdjQpZ8oJtbCMa7Y2062xAJZmo3/Ue1Pvg7t1KgnDI
	sMq8QQJ4W3bHo1K5F5RhDF03nALvofjsodxRZqbg53/4hFxKP1B8Kw56pdLPk03tl8V1
	wrcg==
X-Received: by 10.140.28.166 with SMTP id 35mr19813159qgz.5.1423619056298;
	Tue, 10 Feb 2015 17:44:16 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:36 -0200
Message-Id: <1423619019-17403-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 5/8] qtmultimedia: Easy use of GStreamer 1.0 support
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:15 -0000

This rework how we add the GStreamer 1.0 support in the code. A new
PACKAGECONFIG option called 'gstreamer' has been added for it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 1be4e85..c4792e6 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -7,12 +7,18 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d
 PACKAGECONFIG[alsa] = ",,alsa-lib"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', 'done_config_gstreamer', d)}"
+
+# Handles GStreamer support
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer', 'GST_VERSION=1.0', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', '', d)}"
+# Disable GStreamer if completely disabled
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', 'CONFIG+=done_config_streamer', d)}"
 
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
-- 
2.1.4


