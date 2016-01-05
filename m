Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 03BE6605FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:20:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b14so28677924wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vounSbrkR/Ur12NfV1OBP/lsSpdKx+YTMEKojENQnik=;
	b=GnTRU9+9q0ro+QnCdwDJMBUqa0TFVIjsF1XtnNhE3lJS9HR39r2wiJ6uZmRjXkJ4U7
	GyjjLP3Kg3o80MJIoYhsyjfwGrg6o+W31FnoFLEAb5OOhkYBpZ0ATmlS+D6OMRCPQ+4F
	DqRgAy8v15850aIWmy3SMD2zqmbA3D/5jpVjXxr8N+ETcBC9KL9GuJ2ISsX6gDYAWN4m
	659i5Y+j2f9m2m69hJELzcUhgPZUkoia0yeqDyJWmd/mI1II/XpZ7LPkPHg18+kdGh/2
	Foo3mOm9b72Epynq61tdEmySzl0KBnewv/Sw08N4jgxOWi9LOR7Heqali0sg3GJfxj7/
	ilYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vounSbrkR/Ur12NfV1OBP/lsSpdKx+YTMEKojENQnik=;
	b=HPbXPPjz+yYNf+SDC/X8Ds8AjN73ZraC6F0MgDrKda7euxM+yhrPmUOY51OJmERhl5
	UwvGxOOanaQYEbohL1EK8k+FC/zWDwRXdU44UIYIesuGhP1i6KGaMpXhhpGEZZ1sTlt2
	LfN3UEzYSv1zLcZ8TJRATUPj15prsyw1J65+h0s1x6o0Db8lcz/RMui1nvBMpp8jcg57
	mYc6ijWw2zPXt5oj+rRU92Iymc7wOp/vwoKz9nJIBMOYpC2liDiB2920xbj2xEGHpSGj
	Pz0tGsiJ3TywH5CLx8m3ctY7v361FJkybTcIyJqoESQxqHrJIN5WhAA6AUCT73m4yEBF
	kxpw==
X-Gm-Message-State: ALoCoQnielG/lcXiWNB963NJ7wkonkSyrtd677rnqrZ3hDUPvXopjy9YsU8iCnFupzUKLNLoLjbA3DvI9NS8sedR1Ju1FJm9Uw==
X-Received: by 10.28.57.69 with SMTP id g66mr4321521wma.63.1452000021829;
	Tue, 05 Jan 2016 05:20:21 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	198sm3547071wml.22.2016.01.05.05.20.20
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:20:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 14:20:17 +0100
Message-Id: <1452000017-19496-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] xf86-video-ati: update to 7.6.1
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
X-List-Received-Date: Tue, 05 Jan 2016 13:20:24 -0000

Glamor support needs work in the xorg recipe as well as testing, it
produced weird artefacts in the picture on my HD6450 when I enabled it a
few months ago. Anyway, glamor wasn't enabled in 7.2.0 so no actual
change.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../{xf86-video-ati_7.2.0.bb => xf86-video-ati_7.6.1.bb}      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_7.2.0.bb => xf86-video-ati_7.6.1.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
index d4d9591..f1d06f2 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
@@ -8,10 +8,13 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
             virtual/libgl xineramaproto libpciaccess"
-RDEPENDS_${PN} += "xserver-xorg-module-exa"
-RRECOMMENDS_${PN} += "linux-firmware"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "5ab9a826699e5c86ef89fca43ebb3821"
-SRC_URI[sha256sum] = "f30f5efdc8d7d18d06eda7ef2f91a8b7290f1cfbf6ff26362cd47ab8969daec4"
+SRC_URI[md5sum] = "ede86cd3d1b1d8882f0aea61d9e924ed"
+SRC_URI[sha256sum] = "2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c"
+
+EXTRA_OECONF += "--disable-glamor"
+
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
+RRECOMMENDS_${PN} += "linux-firmware"
-- 
2.0.1


