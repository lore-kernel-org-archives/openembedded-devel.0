Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 75D6972E62
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:34:33 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z107so4799319qgd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=gMmt3JFjc7RBOmxwX/Ez0d4KmF7UTm1E9Cqob/yqOD8=;
	b=q6WsmeDH5Cs9cb7zTuO/qxH0QZrHd+sj6J3DkCkeLXNMG3mguDch+XthRI5Vt2opfn
	ur9++6K7x0GUJ2nMtPjTUQSTm3aCnkEzjU719/TKqzKHmoh+O8P+xEhaTgmZq9i/I+4M
	hewflltSIsg8qtFk60h3HgjCzDjgWxyu15oOD4WV+aBAnyZLF0kqug3/EN/XgDiJKgX9
	hhhGrkkQlmN1bkv7Dv9zBSz9YwcQnYHwvbqoQ2r6MMhyl8Z2HWGVEc3LHCBxRHzFFq5E
	3MVUMyU2/RqyIDdvptr09xPgaHdgdlgbd/HtvPsBEY0reYkWd3JlD5Cp8DOoWpm303rp
	gpcA==
X-Received: by 10.140.91.201 with SMTP id z67mr32383803qgd.27.1423431275173;
	Sun, 08 Feb 2015 13:34:35 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 103sm9794660qgg.11.2015.02.08.13.34.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Feb 2015 13:34:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  8 Feb 2015 19:34:34 -0200
Message-Id: <1423431280-890-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/8] qtmultimedia: Fix floating dependency gst-plugins-bad
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
X-List-Received-Date: Sun, 08 Feb 2015 21:34:38 -0000

When using GStreamer 0.10 support, QMake detects if GStreamer
Photography interface is available. To avoid a floating dependency we
add the gst-plugins-bad as dependency so it is always present.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 427f688..e85d202 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -7,7 +7,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d
 PACKAGECONFIG[alsa] = ",,alsa-lib"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 PACKAGECONFIG[openal] = ",,openal-soft"
-PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
-- 
2.1.4


