Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0487E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:52:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id c195so5768065lfg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=o199f47BxXLWZZMHZOIlMuJXgDjlf2ACWKD/7R2hwZc=;
	b=NvNNJ/63ZAcuXeylPFFRDVIByESMoOvF3NA67yvXVZhekfOG8HpQVW5QR7cPqbp7qA
	M3cHnudJr9nQE7zs3DKUCvkQa7BM8Md5aGrLqy+YHWAIilC+SGLUK/jKXvMxk9r7nKcg
	8yB+R2ILB0ZJzcOqd2WntZFPKQWMMyRv6Brs6b7ElyM7vhaxr1VYmRt7biZIkSqLfwLO
	boxYClm5AF4ujJYyyen8S7Wh5FFlqDPGQFMr+L6yfOZaiytWBmWsZcvx811b2xrThXrd
	76uZLjaXLmVHgH9gtooSdaCRkyyI7yADC3IIsNrMqS4rnI8gFfsZHmogUG1vvJ/xQqAv
	Ta3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o199f47BxXLWZZMHZOIlMuJXgDjlf2ACWKD/7R2hwZc=;
	b=ME5luO31IIdDTXPxkK5F3lmXFwVoR37l2xLvxCEkMOP1G6CIdhydM7PzGH6+fhX27+
	J8dqFoRWPrX8M1sLHbJMyp1osarq4xoCVRtfVLXg8OtRywUfTkiSy1PDgU2McQU+UX1w
	SC/LfBpXKd6NYQPuGEqmo9jinG2DVnyMGSRLwJDDWpOuH7dSBmRDQF66rw/Ey76coS7L
	KFi3e/YvRS+h8kuM+h/uJb7rbPr5GKkFfxOKlT2yo4y9jJpLl0GpFdpixZVPSW0lprKQ
	xmYkbY2dN5u/Ne0J9eZiiC48OK7KA1n6h7PNpzkMF+FXkmrNcZwjLGK2we64IuSIMoEC
	qryg==
X-Gm-Message-State: APjAAAX4pFd47ZxyFfPJoRVlD9kBOJTpMKcnsZglEM9fRVDnk7BXVJFg
	mafuTC3vq+6Wtjv37WjduVA+FZL/2b4=
X-Google-Smtp-Source: APXvYqzBsL/bLO/C971p71RVpIqv3Dt5Dec4F6zsDymNeA9t4gmSxwAH777NGBFOmIABsPEls9hjCA==
X-Received: by 2002:ac2:5611:: with SMTP id v17mr7544235lfd.87.1568328739445; 
	Thu, 12 Sep 2019 15:52:19 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id i6sm6435738lfc.37.2019.09.12.15.52.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:52:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:52:12 +0200
Message-Id: <20190912225212.19943-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xmessage: update to 1.0.5
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
X-List-Received-Date: Thu, 12 Sep 2019 22:52:19 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xmessage_1.0.4.bb => xmessage_1.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmessage_1.0.4.bb => xmessage_1.0.5.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb
index 9960706d0..23cfb26c7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73c7f696a728de728d7446cbca814cc5"
 
 DEPENDS += "libxaw"
 
-SRC_URI[md5sum] = "2dd5ae46fa18abc9331bc26250a25005"
-SRC_URI[sha256sum] = "bcdf4b461c439bb3ade6e1e41c47d6218b912da8e9396b7ad70856db2f95ab68"
+SRC_URI[md5sum] = "e50ffae17eeb3943079620cb78f5ce0b"
+SRC_URI[sha256sum] = "373dfb81e7a6f06d3d22485a12fcde6e255d58c6dee1bbaeb00c7d0caa9b2029"
-- 
2.17.1


