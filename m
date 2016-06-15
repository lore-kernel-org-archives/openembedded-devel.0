Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F28CD6FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:22:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so5959925wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DpdERo7jPvDDdAL2V3BjDrt9oz1h89Vd6kxA+iDD3Yc=;
	b=nodP2vP1SSSgFEMbDhXz08yT12d4cjV0+Pi875UuDsufsNQQ4zExF1AnXAA8lOlOT0
	E406Bc+sMaoVgFv6nqgGmgFkxU1XgwkhPWIthZLtKdI0avEmMlEkx/Vq7PZ1GCNUqwfB
	0Wu8Um9KyzVNBgggN3TUWOT/rMwxnV7Z+dIRaKvXkN5uM/0e2Z1QGn+Izy+dv9da2rgN
	LxciupnGBkJNWkBpfETBRfzOFAxGMdGejUeuMSNEsEBTYw0ULBelZ6F0o56F1rQ19rJr
	PHkiA71AHiFOndDVAybUzCDYzTDnzLPcTP4lZGPwr+kDNy/yDYb84sK4hdTigSQ7ARop
	TQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DpdERo7jPvDDdAL2V3BjDrt9oz1h89Vd6kxA+iDD3Yc=;
	b=lA7swbECRSw2jsrbTT7krU4PkwsSNLlKAw5kxbbfHjc0V4tx5ZfJh0aq1tUiuTt98n
	2iUHzVqEC+Qlu8VAK9eRgl8m29Uls+o242Y9dfz703Z+FWONA7a2nQDzfRyzSlnRW6kT
	MWNVvcUc2yCEVvkOVF0k+iGhY3uoOdC/4BBA9nz0nbBu/zmZswMBSeRJ5jDnq9TbCeCR
	fBVxFRNdagXTBX40v8e5bstYZiXui2HgGhARRBH0yKIHh62eV5P83FBiie229KK7rkfv
	F9pgbFujFJx/NZVQg/aJqWUswxkUUAljIsnf3IXmqGXp8KBVK1VaSV2UbQ+GzwT1WFm0
	9rbg==
X-Gm-Message-State: ALyK8tLqaVgR+b4BGA0+OETDVXZhMOOwo7cvtzYkJnlMn10J3eQpeLzpIu6+nnqWjzhwEQ==
X-Received: by 10.28.211.137 with SMTP id k131mr11363663wmg.83.1465996933559; 
	Wed, 15 Jun 2016 06:22:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh4sm8568481wjc.43.2016.06.15.06.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 06:22:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 15:22:33 +0200
Message-Id: <20160615132234.23890-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160614120548.10035-1-Martin.Jansa@gmail.com>
References: <20160614120548.10035-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] gphoto2, mpv: blacklist because dependency on broken libgphoto2 and libv4l
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
X-List-Received-Date: Wed, 15 Jun 2016 13:22:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb | 1 +
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb
index 62d283b..ae5a2f4 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb
@@ -20,3 +20,4 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
+PNBLACKLIST[gphoto2] ?= "Depends on broken libgphoto2"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index 768c87a..b196f60 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -57,3 +57,5 @@ do_configure_prepend () {
 }
 
 FILES_${PN} += "${datadir}/icons"
+
+PNBLACKLIST[mpv] ?= "Depends on broken libv4l"
-- 
2.9.0


