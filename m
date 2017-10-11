Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA6E177A60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 04:53:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 131so1020191wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nXfnIJwct65IpgQPBoI/nnBo0ygsLQodDL9Nmgy4BZA=;
	b=bZhMeqC7QY1X3L2JyLbWjABMu0c9hmjEQlP5DDouZxfXIZ1yKU5vvxHeLBRPjfpwMR
	zDdd5f8X8VEkNa+uliD+BYV+poCnVUvSHc6/p5Vl2CK59brpFoYZB8H+SC70s61Nmr6H
	X5wml0T9oNPipwJJql9Ld+tu2t72TZ7LC6vPF+Znwv1iTAmwGJDsspNeKpESK5IfNWxX
	BgxnObjb6pO0Jvx7PrulSSs0a01TgjFs5Qx/W654cD4Eh5BTbDhwbaQIaD9yagvMMrPC
	NXQnqe2a7/U+SAtYJxhrdTHXKK4/7pBjlKRyh4dsTRcD7uQUL4p5G8anGL3E40AywtVo
	YZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nXfnIJwct65IpgQPBoI/nnBo0ygsLQodDL9Nmgy4BZA=;
	b=LeFEjFTbB8B4Jl+JEzzFfCANKcFY1uS07VHM7dLvt9FwiE89srlEepPNq3PaS2Xane
	sqNy6hlNnOv2IOl7gyG5NSitGL2TwTNV1wHqSMPvC+14AHCINCMFcvhtO4n4Qam5QBD0
	XqoPXVJBVw1/JtP8qMURtAWSilOJay8l6D/rGP6FK+qkpRN5CrosOL60CQn60RiWRmI3
	TyGE1UTu0IwM7gHeL3DVci+RCH5FV0ul3waLCq9f2Z7jEGvqqW5i9MVbC1rHwOFOLvtc
	AoBeoma1gXg8Nf9vkzFfGse+DFStCGP2Lvgr1DafFD3qLqPg0/Dg3yiUFEEZCoU8yKM/
	j9kQ==
X-Gm-Message-State: AMCzsaXDpUCmuOY6a50Cz2OB6l8WUo31+3x8HEl/4gi5643bssp5+CVo
	QEWiJ40MqMsjeYj6DBKWufAWSQ==
X-Google-Smtp-Source: AOwi7QBxjYN/YGvjxwviVWhLJ7thQZ6JNgUSlgBef6tJ57AttKxO5SlXfEBgBjqmjmpfLsx3bI0SgQ==
X-Received: by 10.80.240.208 with SMTP id a16mr18520849edm.288.1507697617428; 
	Tue, 10 Oct 2017 21:53:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	w28sm1482169edl.16.2017.10.10.21.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 21:53:35 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Oct 2017 06:53:27 +0200
Message-Id: <1507697607-18935-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java/master-next][PATCH] openjdk-8-cross.inc: add pulseaudio PACKAGECONFIG
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
X-List-Received-Date: Wed, 11 Oct 2017 04:53:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

Add pulseaudio PACKAGECONFIG and set it by default if pulseaudio is
enabled in DISTRO_FEATURES, this introduces a dependency DEPENDS on
pulseaudio which is currently missing.

Without this patch, jdk/jre will be built as soundless even pulseaudio is
enabled in PACKAGECONFIG.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index ad3a44d..d21d9a7 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -34,10 +34,12 @@ PACKAGECONFIG ??= " \
     repack \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 cups', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
-- 
2.7.4


