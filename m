Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 01CDA732EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:12 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so560158qga.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=3l0ZtcFB7bDGGUE2PNhdo8wZEQJjW/BEJuOOMqz1IwA=;
	b=qCIdk/WHJytGdpQAKQADDiNg/w8k8VZMTnVhwaoqiCGGOJsPETXdmPC10UC33DwcMP
	JQESSDl2FQcba6ZwHevx5O1CsIK6Fe5ib3GgTKFsDX83EcMla9iCRgDrpYiOG3YFbH1r
	mkmOJz6GRLyqG5/Sw5UdGqZ7bUY5snKYLf19KI7QX390KYcXpqQ62ClR1hDoGhfuyIdE
	Iwfn4pELQWKqTZv/ITJiLzkqlYMAubNU9JsNgGyFrHFWB29waKX08CiZ0DfXJJWRZ1C9
	+AcIhmP44xVTuZcY8PesGq4iKEenICOAGTSMwIxJRXYFTTBKMGwPpH+ZspIrQQOazCyV
	xpuA==
X-Received: by 10.140.42.83 with SMTP id b77mr52875728qga.43.1423619053581;
	Tue, 10 Feb 2015 17:44:13 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:35 -0200
Message-Id: <1423619019-17403-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 4/8] qtmultimedia: Use 'bb.utils.contains' function
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

The 'base_contains' function is deprecated and we should to use the
bb.utils.contains one instead. Update the code accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index cd89583..1be4e85 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -9,10 +9,10 @@ PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 PACKAGECONFIG[openal] = ",,openal-soft"
 PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', 'done_config_gstreamer', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', 'done_config_gstreamer', d)}"
 
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
-- 
2.1.4


