Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0898C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:48 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3036.1785293079893235887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dlOV68jU;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811f512167so449039a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293079; x=1785897879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqagQi0ZS8B4dV1XdHg8OHlynATlxVv3MNzJHSubvvE=;
        b=dlOV68jUjZuamMmzlDPdEGkiulHVPbT04K8QgP2l6dd0rw3BYUrwYSGRezF22VNHuF
         Q06B6Bujoks6KNzKVxY2stfZv4L5KNDUbomWPndKRkGkFnvXbGXRy5hPui8WtOB1wEkC
         j5tZlSQ9R7TYWHgZNIB9AW9J0BVyc72jPASWwiLwTYVfuXHeQDXY8PxkOMANpPbbhQa6
         DNH1j956eQRdVVX1n9c1NjcyDZPOmih0dTIh6zhGfsOmI92sE3WoZjMrYPcUwz+A6Y+C
         /a4zayfPNNcPKvCdn/9GaI20AV2RiaFwYgC7Xc44dDabWdML8KxFrW2jCMgLnOzlthTr
         fTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293079; x=1785897879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqagQi0ZS8B4dV1XdHg8OHlynATlxVv3MNzJHSubvvE=;
        b=OjZKqRReebitiCvJwVj01iCd2yU79HPkZ8fGmlwxIz0tujySCBtn/hj/zQGnbflFnY
         2QjC1SiaCFAt8CiR4/26DmzswhCYQobqsERwPllDG28ifvSMIvmO0YCwq+eXh2+70cll
         0HD5YA1ndsHbELvXqifDRlspIL11/GxgdiiHULVZLv70eJ6De1jT2bXRJiD10aSEh62n
         mLu0a2hsAcHUuFlDXRHIwidlip2GYMnxlJYfs/qiPX4Ubnmh3cuZNYrjsUcCc084ITna
         DN/wm3F8Oh+f0pU7ITFGeWS3J6/vrb3Blvw2UAXEgc2KD1Y1OgGSuAfS9kuwAF/ebvgB
         1oVw==
X-Gm-Message-State: AOJu0Yz/IfLfqLFA/XBUJ5zw+UbE+eQUe5ZQ9jIbTosKVfHvj+nD5G4p
	gXbge/lw2DpD/nk/+t/+jfRPqzS5yB4loq+4F5GZgUQScAyk9uuFwCjAFATFbWee
X-Gm-Gg: AR+sD10wQRyBIr8zZJhpQ8WclxTX98kTgvsJn62H0Ge0VlUQNmjnuvvVCVCLS6tPkpi
	8qMn1Fc9jNBbEGlVQkKDW1cVQHB3vK8IC8t4FwPSQVZtJOjmhPLFNTW31SwYo4M6RgIOJ+WlzzP
	56jKSAok/dGQzNO5s5l8H1+6NVl7vlL+Cq5oMPLE3OMdc1vG55x0nscyDL5UUCwDFhd7XWsyh9a
	OkiBw6JxQtljU92bACHI2paQP37nKGlv6NRUesXDmNcRPeGyjtPtnvx8tRtzzqDjkrywXIxNFDA
	aiy2MFrKxTwnhSjOk3cPsziBz9e0zCvMPkSemhKSi6rju4Vz/V4f0tBPZ9KlEYA9biApj0jsQLb
	2iahLq5uesBFOs3aHZfpwTCxcEUgTtqSrLdcmnwmgidm23F37J7H04DxFkqFb9mHIs+2oT6HcLD
	fLV9U/o3yDTLZwerqgnwi/7O0sxKgu0IvmhAkcc0lIV4+k4HFjSdbaFxbUxwav+pwcwOJUzhuCi
	CpOF6RiRXff2M3dJfSqC7lrVAPnZaGYZY0vmLa1HNeCa6E/dgXFC+nXVhRYA/u6szHU/ZhjPjRt
	z/SVUPCjX4cgxinNdGjOCM0SskZzPrmhqN9fsU9yZwavV2hI9yqUmodnZ4NAqdCxFYrKl2p6yYh
	nGBQ=
X-Received: by 2002:a17:90b:1645:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38f6a45bf01mr4731103a91.33.1785293079239;
        Tue, 28 Jul 2026 19:44:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/18] gst-editing-services: upgrade 1.22.12 -> 1.28.4
Date: Tue, 28 Jul 2026 19:44:17 -0700
Message-ID: <20260729024420.2328180-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128531

Version-locked to oe-core's gstreamer1.0 1.28.4; this jump spans the 1.24,
1.26 and 1.28 stable cycles.

Notable GES changes by 1.28:
- GESPipeline manages a shared task pool (auto-sized to the number of
  processors), with apps able to supply their own via context negotiation.
- New thread-safe controller API for control-point access, fixing
  use-after-free issues in the old API.
- The OpenTimelineIO formatter moved to a standalone Python plugin in
  gst-python.
- Framepositioner z-order is now exposed/controllable; new APIs for detecting
  clip layer movement, a GES error domain, and improved timeline error
  reporting.

License-Update: COPYING and COPYING.LIB
(6762ed442b3822387a51c92d928ead0d -> 69333daa044cb77e486cc36129f7a770).
Upstream replaced the stale "GNU LIBRARY General Public License, Version 2"
text with the correct "GNU LESSER General Public License, Version 2.1" file;
the declared LICENSE (GPL-2.0-or-later AND LGPL-2.1-or-later) is unchanged and
is now more accurately matched.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...g-services_1.22.12.bb => gst-editing-services_1.28.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.22.12.bb => gst-editing-services_1.28.4.bb} (80%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb
similarity index 80%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb
index f0693740f3..505bc739d9 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb
@@ -5,8 +5,8 @@ SUMMARY = "Gstreamer editing services"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-editing-services/"
 
 LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
+                    file://COPYING.LIB;md5=69333daa044cb77e486cc36129f7a770"
 
 DEPENDS = "flex-native gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad python3-pygobject"
 
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "792339135ce713088663cc5d44e0aea8217793e88fabfd11571e7abf4a429f2c"
+SRC_URI[sha256sum] = "6f7eb55e58718dde5b5869f619ed90ebf3b0cfa0376c169c1b83fc773811914a"
 
 PACKAGES += "gst-validate-launcher libges"
 

