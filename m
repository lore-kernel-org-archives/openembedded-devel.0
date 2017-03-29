Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C1B4A71A30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z133so3861044wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ZxFkRITaEH4rA6d+fMz5okt79IfR89qxBN6hO2dcQM=;
	b=TJaAQuSuH5vwao696JkASoYsvmiULK4WLmiBdqXnJlYFzVveA/w01Ht5pDZMeaqaum
	awWb8XQs6ILta6c9E/aSQIneuonffUCuWqEu93lnjd0K6hNpdxE8yh6y2CHo95Rvm0Ti
	4S/FrLB3n0ZzYlKracOC/KCuEWu9cGICpfr/KXoxbM/hrc6ylRaNzocOee4Cnt9nNDQe
	Alg83jCdIPYLfVHQt4LQiqbobpLe0IVXijS9d1Kfd+R1Nn15VF2lc/c7TebAZwhv21p/
	nr1P0dMZNiX8pfdBMS1HCaIKcPl+1n5+uCOGOZqXAKG+9SkyWsvRyiFeHoOrojJPeXAH
	xvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6ZxFkRITaEH4rA6d+fMz5okt79IfR89qxBN6hO2dcQM=;
	b=k61G7LNp1XPOtbBqrzgk1uncXR/CwuAuRXCzOysywC/zCZarcs9Iv8d5rxw5YrbVcW
	jR8cwz1uFKBB0z4UGKY5HPPX1B3wdHGlah0NRCg5/OBsFrX3lCkGPVPgBwlU8D9pTtO3
	D1kbfs0wRE9N+blqRI/iKhcTk+ctXglj0xLAiyRKsIJ1CN3fET9ilaTd+EHIi8nsiv85
	9Vmtz4dror8ttei8ophDj8/gqIIRxDjFxIKtrz+v4sVBLR3U82t3F+djiWWPcXgPS1NW
	Q5n7+scBcacRrz8QmBKibnTsyND5lxkwtP7wZT4J4hYkvSU5WsNkiJqXy07IjJz0KH/G
	ZtJA==
X-Gm-Message-State: AFeK/H2nUzowcaKlBi6jvhU1e/ZT59rlJCEudWbAP+0IM1RpXZuGd0Td+LpQqimtF7LY4g==
X-Received: by 10.28.166.208 with SMTP id p199mr318467wme.25.1490779010549;
	Wed, 29 Mar 2017 02:16:50 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h76sm7284149wmd.33.2017.03.29.02.16.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:38 +0200
Message-Id: <20170329091643.32180-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/9] ttf-abyssinica: fix SRC_URI
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
index cd96fbb41..ce003e922 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
@@ -6,7 +6,7 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.txt;md5=1694c7fc245cdc85c9971db707928159"
 
 SRCNAME = "AbyssinicaSIL"
-SRC_URI = "http://software.sil.org/downloads/d/abyssinica/${SRCNAME}-${PV}.zip"
+SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 SRC_URI[md5sum] = "a3d943d18e303197c8d3d92d2de54d1e"
-- 
2.12.2


