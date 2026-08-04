Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14721C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:02 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24981.1785872453133954487
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IiTOxkzo;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so156890a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872452; x=1786477252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhrA3Xys5NwN1dCPu3DQDeUHFEks181LttJWhYq+yws=;
        b=IiTOxkzowpG00+vbBJeaw3SbsUAvqzQgcFXb0O6OfSDB9bBvrxaakLmEIJMAtD7R9f
         uulDzIS5w+yhO2T3LvSJ3Y0V1KIoL9ZYzv6CSOZ36CEbEwQNY8r8hlvFhShpB/ad0+V8
         P9SSQ4RYTRsNeTveo6/Mt+BdvD3bWAP0NPfe0yw4uIIgM1uX0cBWGOwl0zhVA2dPGE9h
         /wqMSA56y/iq7itjF/uLXBA+puU6v/hHYhVIeTJeCrRFBpkcuLurHdCb6XdzgSWHePAn
         VkrwWxoeDTx4G6SekIp7ZXDC6imvwdayOjwwqb75FgtdKM396WC90MJ4oubijRf5MOmO
         be8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872452; x=1786477252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhrA3Xys5NwN1dCPu3DQDeUHFEks181LttJWhYq+yws=;
        b=P6H7aMJoyObXeV0r5OHwPFYlZlqWgErPbwqCHHRxqaWDPjNe/frsGrEQ5yfD0B+lyn
         dm9hh29scqGJ3X1vkRGHaxNTaiepYZOXJzNbrSxjmqUSy1Mcu3yBQdMaluCo6/N1aPLu
         wydGaZA+mBedtP/7gS6A4jT0yy11Q7VXlzaZpcRQ/MfNEo3khp1NmYnCM0S3kfwmjtXZ
         vOfkHo4qngIoYeK1vqNl7m2N7cstGlvdtrYr6absQR0JhNS7oDy12lus2BAzAPXg7pO3
         pcFFxDnITwuJAkj4ZMpCE541zXjnQGzsb66gxYOYKtyduN/AkUPkjKkkPBh/Z6FdXL0P
         ocgg==
X-Gm-Message-State: AOJu0Yzodlp+q5wr3GeG4lNKOEdQT84GpmCxQ+TQ+h2+UP5wltmlA38i
	f0jT78hMDSaqCrpmM5KYp1ScSOB5RuCGVPodxkTEfUJ2qENlcrbxlAdoN1QMX0HN
X-Gm-Gg: AR+sD13nln51B8Z9VgMelcTAocHCR2+44dFVHq2JPwMPIuQ9q2gmNqRTXp4pcIMlYuM
	H93NOvFpg+DL75qbvnnQaEKOUjilZWPBFElNoL+AORJXUTD5/X5HNEgl9QZSeoYNXOQqB3qVYLt
	MTMquumcHHPQ0rL3PY9VIV7weXZBsi3xCK4EX4tfZg4+S+JC/6idmmARNQ6v2UO7KKn7Byg+s8F
	5WJa1fEQT7QPjgN1E9Z+9cftFM2v1r08q0437aM0lsc7WbCb09pyz1mx6MW+xua+me3zzL8/YgV
	nNXhJXD/jndtd3q2yK0x377kN2bRcvpIyjwO/oOvqkb69bF0ZS0WPUAZrovlxCZa/dtSXYVaoxE
	WcrlkD4NNkuNT0957X67BX/sRJ1rWAobq95snyzfi7xCrhdZA1gheWtAKsREjsBzu70EDng0Ptp
	XWeLSx7U61S1sBxalqe8vf1TZB6ckULE22y0tLPNZx0/7zPlYvBBFO79Z/uPjb1lwVd8pnTNMjy
	g==
X-Received: by 2002:a05:6300:2213:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3cb85df193amr1330330637.5.1785872452527;
        Tue, 04 Aug 2026 12:40:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 17/36] mpv: propagate ffmpeg's commercial LICENSE_FLAGS
Date: Wed,  5 Aug 2026 07:39:44 +1200
Message-ID: <20260804194003.3158916-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128764

From: Khem Raj <khem.raj@oss.qualcomm.com>

mpv has an unconditional DEPENDS on ffmpeg, which carries
LICENSE_FLAGS = "commercial". When "commercial" is not in
LICENSE_FLAGS_ACCEPTED (the default), ffmpeg is skipped, and parsing the
universe target - which, unlike world, ignores EXCLUDE_FROM_WORLD -
reports mpv as an unbuildable dependency chain:

  WARNING: Nothing PROVIDES 'ffmpeg' (but .../mpv_0.41.0.bb DEPENDS on
           or otherwise requires it)
  ffmpeg was skipped: Has a restricted license 'commercial' ...
  NOTE: Runtime target 'mpv' is unbuildable, removing...

Since mpv cannot be built or shipped without accepting ffmpeg's terms,
propagate the flag onto mpv itself. bitbake then skips mpv cleanly (in
both world and universe) with the same "restricted license" note as
ffmpeg, and no longer emits the confusing unbuildable-dependency
warnings. This mirrors how oe-core's gstreamer1.0-libav (which also
DEPENDS on ffmpeg) carries LICENSE_FLAGS = "commercial".

The explicit EXCLUDE_FROM_WORLD is now redundant - a recipe skipped for
its license flags is already excluded from world - so drop it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5f4e021e2df0cd434f9266aadb2353886e57854a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index ccb66adb7a..d619152902 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -16,6 +16,12 @@ DEPENDS = " \
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 
+# mpv links against ffmpeg, which carries LICENSE_FLAGS = "commercial";
+# propagate the flag so mpv is cleanly skipped (in both world and universe)
+# unless "commercial" is in LICENSE_FLAGS_ACCEPTED, rather than surfacing as an
+# unbuildable "Nothing PROVIDES 'ffmpeg'" dependency.
+LICENSE_FLAGS = "commercial"
+
 SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"
 
@@ -99,4 +105,3 @@ do_configure:append() {
 }
 
 FILES:${PN} += "${datadir}"
-EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"

