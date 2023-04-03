Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA21EC76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:32:05 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.74355.1680535911433225204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=dRyjdFPl;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 333FVmtP1290087
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Apr 2023 17:31:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1680535908;
	bh=nTcO62J5VZcP+2thQ+iqJq6O0AfUQObxVuVhblcKbTM=; l=1138;
	h=From:To:Cc:Subject:Date;
	b=dRyjdFPlMAdQLVeKDuPXvjZRsqxhg81fz/48qyHye9zMGDLLXwpuN3QC01wn9O0K4
	 V50n2srDPgeUVUn+f6QYoUTOBQO+qOXgAQHDEwGo2To0huFAepwijzuaoPdSr4zZYv
	 1OgWxkTwkfEsKDUMOHea08NA4kGcNnQ8EHwgLSAHe5PrVeG9395+b9kO81XM/cW+rG
	 Aa+RdrSKAU0tLRZw1IY/NaqqXPRx6yzGJ8Q9Asv9yImLGFdH9HwtrA870DDnnXxuaa
	 sQDqh7xmHkkJRJVsuDDmT+PgN68XKYZ35OCsKz255FPQV7qyq6t6j8HUZQVlrzqbqh
	 Kd15NY5XncmDA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id 333FVkC11637979
	for <openembedded-devel@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 3 Apr 2023 17:31:46 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 4KPXEA48UG; Mon, 03 Apr 2023 17:31:45 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 333FVjsu1356283
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 3 Apr 2023 17:31:45 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1pjM9p-00EJow-1s;
	Mon, 03 Apr 2023 17:31:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [meta-multimedia] [PATCH] sox: remove ffmpeg dependency
Date: Mon,  3 Apr 2023 17:30:10 +0200
Message-Id: <20230403153010.3412583-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 642af1615038ce378780c1ed
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 15:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101940

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

ffmpeg format handler was removed from sox in 2013 ([1]).  Drop it
also from DEPENDS.

This makes sox generally available without the need to whitelist the
commercial ffmpeg license.

[1] https://sourceforge.net/p/sox/code/ci/5ae4049727d4f29036ad541bde5863c850aa7755

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index ace8743f3afd..011cbc2a9df0 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -4,7 +4,7 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng ffmpeg libsndfile1 libtool"
+DEPENDS = "libpng libsndfile1 libtool"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
-- 
2.39.2


