Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77727774EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 May 2017 19:18:46 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u187so4996238pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 May 2017 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8W2zYt5oEL8OCJ0tri/6W9aFPQ/C3A3PtprIp2/K8qQ=;
	b=hnZZCTY3rywiEltFCUoQE+0tnhm92V0hxMJnWo7gHc6p/ouA40qEWS5QbwNbMNU3yh
	rZztAAZlFjJ4kJDtQGk/Zk70rwhcYNx/JVQv6Pk7lTTt1nKGaSWKAklH20mtTcyuJ7K1
	yrCoFltK+xjKrHX7wWKb9DAl3oMU2J31qAsJcD5rL+kX2JyXGVx06kdekL2NvckM96ya
	KyihY05QnHPnKrAUfV2SefALJ7HE/KGKz0lJonh2bEMK017/XO/MSxaIpVG+ttxk8N4W
	4cRCurM8vLGwKY1WZ5X/A41BxgdF54gyh2iIssLWRsKOpnWM8j5Mpxui5hKTJhy4pFrv
	DoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8W2zYt5oEL8OCJ0tri/6W9aFPQ/C3A3PtprIp2/K8qQ=;
	b=GyhpoosMBdQ85wg8p+GjOEUOGMfe90EwH6QRJG92PKxqDUQB2mG0tQBtTr8xx8WlnY
	G7OMEvSSS4EvH03vEPmCZFoEic+wJECHs3FfAM4anCVgn0YvvwpjLV01F9/QE/OWsfGo
	ASWVI0KqJr2FSnlmIpl7smMCmmMccUx+asAreE9wbRxqTMWqHdplBLsVJl1RkHEzHojO
	aKE/A0E3Hv8EJANJ2nmb/vBTq+Dzg1p+ponx76c7lwvUFmu0ImTZIHLpxGSZYHCJLPMc
	SuWQF4V7uyNbvKyLsiXKj/eni/YR2DMgg5Gt9t9rive3iShpkmkZ8laXM/npEcI5KARy
	kpYw==
X-Gm-Message-State: AN3rC/7dbGvEjQuC6NmkwD83d0L34lDNqgPKllgJhLNcV+If3IeEoW3r
	K2LZWZNTrtwRuw==
X-Received: by 10.84.149.168 with SMTP id m37mr74192582pla.74.1494098328246;
	Sat, 06 May 2017 12:18:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8882:b8c::d586])
	by smtp.gmail.com with ESMTPSA id
	p62sm14237888pfp.48.2017.05.06.12.18.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 12:18:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 May 2017 12:18:37 -0700
Message-Id: <20170506191840.26070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-multimedia][PATCH 1/4] gupnp-av: Update to 0.12.10
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
X-List-Received-Date: Sat, 06 May 2017 19:18:47 -0000

Needed by latest rygel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gupnp/{gupnp-av_0.12.6.bb => gupnp-av_0.12.10.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.12.6.bb => gupnp-av_0.12.10.bb} (65%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb
similarity index 65%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb
index b8cfa27d4..cfd0227e4 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb
@@ -1,8 +1,7 @@
 require gupnp-av.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/0.12/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f56cdb269376a9e6cb062eb9960ccf57"
-SRC_URI[sha256sum] = "e0553d60dd7c7277c65c02a68a270c4dcb9036a4c7075c902fc8111c6a5e6a44"
-
+SRC_URI[md5sum] = "215f626508d76b767f5da7c9b92e87d8"
+SRC_URI[sha256sum] = "8038ef84dddbe7ad91c205bf91dddf684f072df8623f39b6555a6bb72837b85a"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=2b47b7b5f799d2ebabe62b895e848820"
-- 
2.12.2


