Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4115674D49
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:18 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id p9-v6so5500564pgc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WYltArjLyoGFiZD/t8oLFtpWGSzjQ9R86qe3q8S9zj8=;
	b=uN3rO7+xVutSzK2AYYDy9wdaUUFNIiu9kNn+Aa3t06sAMtTTYrY1eMJswYE1wPPSdz
	DQFW5ZgflI/AeDSKVn7GPCKrB+8yMeg1hCe1QfeYu4w1VhxcmpjcFKgt1AT5RtaPJUsd
	7Xzs3WAQBoGc+7ifJ4F5OVyoAGqF/+MAMNBY6r0A+qx3Dafc7jZ+Btg4Yx3Lw9z/b+rt
	66GmdrB6suIcyMNPE37iWaptbOYcfgAN3bLVPNrA6J+OlGZu8I05Nx5F3z0Y5QsQYv3R
	aCnlASWT9Lp/9viEl5NpxJgJ6F1DOClxTlSOMDasKSuwjnhPDffcU/rcETXxLYIWQCPA
	5rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WYltArjLyoGFiZD/t8oLFtpWGSzjQ9R86qe3q8S9zj8=;
	b=H6ALXe4Qk5sCVJxkCvBkYLj4KYvzYbWKgsKB4VA6f1QL9cTNv+5B7QG9ptS3DIz04r
	Gz0qP3Lxp8GzVW+K4GuO2/oUxZK//tJt8WgW/0jKpJMl4zPUZkhyzqLP9hHTENrwp8C0
	Xv3y3B4+7f03Y+edtNXX8j1VPS9Fu7MtUVOd67FTOSMWf/05Y+fqLP7lXVRBlPBSEM9I
	1Qxch6pHegDV9SSTh4lpw9VNJKm1GFhvbrBP675F9QVdM9WWH6RRdBMjTvk23iAFOL7G
	kwygGZ1LOIt9W/pSWrm6kLwh4uBS8Tph0mwAIcfFNMyxKKEkNPumU60b1FR3h4m9iwWe
	NL4A==
X-Gm-Message-State: ALKqPwcKImLw0KHpFLElkV/FkaNeRtByaWLHJXFqHNtVOPSJ1jPRVjr3
	JpbcJGWoiXhV+JOyD9UxJ8sg5g==
X-Google-Smtp-Source: AB8JxZroDfj4PzAHzpzaB2Ehq/Q8L7efW9OPBYPsCrF7cku2vGM8e07d067wIiQy00eOsWJ7jybzKQ==
X-Received: by 2002:a62:5050:: with SMTP id
	e77-v6mr17934541pfb.16.1526855719637; 
	Sun, 20 May 2018 15:35:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:13 -0700
Message-Id: <20180520223517.9869-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] xf86-video-nouveau: Remove obsolete deps
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
X-List-Received-Date: Sun, 20 May 2018 22:35:19 -0000

All protos are now in xorgproto

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
index 2746821cd2..2b1b87c4d0 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
@@ -6,8 +6,8 @@ SUMMARY = "X.Org X server -- nouveau video driver"
 
 DESCRIPTION = "Open-source X.org graphics driver for NVIDIA graphics"
 
-DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
-            virtual/libgl xineramaproto libpciaccess"
+DEPENDS += "virtual/libx11 libxvmc drm xorgproto \
+            virtual/libgl libpciaccess"
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 inherit distro_features_check
-- 
2.17.0


