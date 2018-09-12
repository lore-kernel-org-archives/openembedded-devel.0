Return-Path: <3oXiZWwgJANo67NAOPE8S6UIK.8KI@flex--abrestic.bounces.google.com>
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
	[209.85.214.201])
	by mail.openembedded.org (Postfix) with ESMTP id 8B30878E62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:35:44 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id e8-v6so1527140plt.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 13:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=VJR6+QKbV2r9ItYBjLZG4aWQYzlpjvrK1rs+EH8oDSo=;
	b=XRxiV6kMSz43se8taH3ktbCZqsWp4zNRHvQwPV9zyzQAHzjlMCdBEBzlTEO+GfxX1R
	QK0ilM94RhWpqFoHFm2VPRNWib2J7G8Ega7UCEt0igMBkFXnsIH5dtuocsYjp52XGr9n
	ZB2e5VsJLMJmXotifY3YV+fK0c1nHx5NcCvcMKNVZS6+oBjoOxYp2dLZw0uG7htE9OvO
	19aUPR+20o30ZCS/EkYmQkRDC7oLZ3iDhtuN3nMVCikSiol71gunV6LsO/TSaV6SV03G
	Rb5juV0a3MLaHfoq9/29j+vEH5zQjyf6BuZnWUC27anRhTKmctXu40s5nkM1QEVwbJXu
	VKgg==
X-Gm-Message-State: APzg51CVT5ygZiqXDj68LCOzz5LlcXwuP13xjb7IfpDUaNowmj2DJskN
	wFEmxwhpXEv4+8h97hCrQJiUKgFgDBpTPmKNEvWD9QMq3I5jpD5fz7QMjKJLzHZbFv9QxU5i7G2
	YUtp1EFmbO1b+wXV76Ch7hd3ExH9fqOz8IrUxwfCS1AtqU6gj+rclEZ3GsxZ9vbTHTaVoZ2zHYr
	rckyUhp5nlZQgRzA==
X-Google-Smtp-Source: ANB0VdbLMjgjyuY5HWSHfPFWH8kOGid7mh5k619witkXIahU7q5G+qghZ6eOMhv2HkECVNPMz6iI3Dh68UfL2g==
X-Received: by 2002:a63:5e44:: with SMTP id
	s65-v6mr267987pgb.155.1536784545588; 
	Wed, 12 Sep 2018 13:35:45 -0700 (PDT)
Date: Wed, 12 Sep 2018 13:35:27 -0700
Message-Id: <20180912203527.123028-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nbd: Upgrade to nbd 3.17
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
X-List-Received-Date: Wed, 12 Sep 2018 20:35:44 -0000
Content-Type: text/plain; charset="UTF-8"

Upgrade to a more recent version of nbd that supports listening on
multiple IP addresses.

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 .../recipes-support/nbd/{nbd_3.11.bb => nbd_3.17.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbd/{nbd_3.11.bb => nbd_3.17.bb} (78%)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.11.bb b/meta-networking/recipes-support/nbd/nbd_3.17.bb
similarity index 78%
rename from meta-networking/recipes-support/nbd/nbd_3.11.bb
rename to meta-networking/recipes-support/nbd/nbd_3.17.bb
index 2ad75bda6..356023681 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.11.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.17.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "73d11644a28b9f335292cdb3bdc4b74b"
-SRC_URI[sha256sum] = "14420f74cb16dc609a9302ed1efd653064bed7a8357e9d73daabc33608e3f2a0"
+SRC_URI[md5sum] = "98b74c655ed94a66686c5ba19480d98e"
+SRC_URI[sha256sum] = "d95c6bb1a3ab33b953af99b73fb4833e123bd25433513b32d57dbeb1a0a0d189"
 
 inherit autotools pkgconfig
 
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


