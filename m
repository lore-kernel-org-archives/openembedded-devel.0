Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6F847C2F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 17:10:33 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id x13so10538709ljj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VqeC9+UVfRFYAI81vG3aFUudF2kZxlTV2w5x/35ZQ5o=;
	b=DbC/BocJEtdDvNQeQQ+okC3jgzGsKUkHaPKS9sSS4SB6rMCGCYRHHyLfjh0hXiA+E4
	pyVPAzlkTUDgyaz8YldwAAeSgAKI6E5PJs0Ww/w8WnTPY5ib+C8aYw96QnEMuL3dhR5P
	SILc6pcG9AkePqJhlZCuNg3fYOCKCMUYT2bf+7KL5X06AlDoJuMPFx27wsW7BdMz5Fsv
	1qwVkMX8Q342Xj39OE8IAOU6E/5zvjgGjvvAd4+BCOtEGuzbnGbXxR3yV2HHYOMzKSKt
	CvAyCLAmhwdd6q2Hq4VoBIve1etAxyHfUpj42Fu7sEiCFhJWlM8TqwNJqosp1B+VIrYD
	dkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VqeC9+UVfRFYAI81vG3aFUudF2kZxlTV2w5x/35ZQ5o=;
	b=TX98MXdQyLd6F+pG7Iy6xSzc7yT3qleZsX57XFnr6VIy1Ad8Ne4LOaNvbc5Byh/kVD
	ksOVADNxzibaOlVYREljuMbf0JM/S6DwBq4hG3Z/3la7C81cB+op/1xD88IzqXl3hOHt
	jJpsffqsMoE4iukziuXls8WTE8fEAfoSgIc+SQRTnKsc6RSOqV7fHAG03R6vQVUGt/SY
	pPusl2LJlGqgYbNN5xdCzJyf87ZjImbzt53wLWL8p0F0XpXf0FC9oqjfTmNDnzT1h9Tq
	2FqMF5AosQDveZ2UPJm0ii2HgppKMVy94EiA+xmUbLcMKWA2PIcaY9bCAVDiYiwCKNQE
	whlQ==
X-Gm-Message-State: APjAAAVSZbcqCUjEFKz5yQWLL27YKVi5wi6Jole33QhcqUoYZNNyaBF9
	lEA+nHOwkFiwBxTeviUy5af3IREkHFU=
X-Google-Smtp-Source: APXvYqxenJuXFxAZbuZPgd2aR6+MjaQ9GTOspcU/5wp7IwkmFmR2Xw2jBPU3YZF7hwJdgQEPyptUzw==
X-Received: by 2002:a2e:20cf:: with SMTP id g76mr5534820lji.36.1552756233935; 
	Sat, 16 Mar 2019 10:10:33 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z26sm151592ljz.66.2019.03.16.10.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 10:10:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 18:10:23 +0100
Message-Id: <20190316171023.16955-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] packagegroup-tools-bluetooth: fix rdepends
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
X-List-Received-Date: Sat, 16 Mar 2019 17:10:34 -0000

RDEPENDS are already specified separately for bluez4 and bluez5.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb             | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index f2a16dcf7..913e31111 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -31,7 +31,3 @@ RDEPENDS_bluez5 = " \
          pulseaudio-module-loopback', \
         '', d)} \
 "
-
-# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
-# Otherwise install nothing.
-RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.17.1


