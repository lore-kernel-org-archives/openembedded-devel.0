Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EE5117704E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 22:18:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n5-v6so2181434wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Oo9xe6TQ46fN07SGIXwlmXfmYfwVFvaRcCbxgAPZsws=;
	b=o727K7WCKB6PuOs61y+pxC6aKS3n1lc0TPub6JxPWtzqSkvUl8EgV6LKQ1Yannjoa8
	P14X0S5w4vlmF/0tbT+Km0eRlOMNV7pFHB2aXV1slrzYYm45o7IKHk11z+juocWbG7kP
	wKs55b9ILTjYk77BeJPA1WRoxDdLEEAr80TgKnpIVE3Z1rXSobCzrE6yjn15lEty8ymg
	k1slKqGMOTiddMhPzpAV5BuFveOdsRDPKsn3zk585qPcplIniCz+wQkjhtr/mw3Ddcyq
	6I4dhlOxeD1MSrkYm4QwLPnVTtgpy01/YfMCoTVwqMfYkGs4vRBqnopfsZ5noKtlyRER
	3ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Oo9xe6TQ46fN07SGIXwlmXfmYfwVFvaRcCbxgAPZsws=;
	b=cFwT/Sv9xy5QVFMoYof4OZn0vFZ5U1Dz9mSNE9OjuQJgjbrHXKKNBGJmCa1Int08wB
	HTIQlVOzynXLa3VhSAGE5pT7rVZkKqhOIJHYnAfTM7tIlH8wUcv0X/hU60lsi7xJugh+
	0/0SDh6ORs5w6/+H8Xd3OmIvmsGjwxbEgDjcq9tLqA8Y12vTVsYyD02mgVAZ5hha66x4
	x/VIR9nuE0Qh5iOkDiHsoyZhKaqIPPJP4yaeXGKFlNn5wa3ZbXsgmkga3EStjcHmVFaT
	pPAN1sPyQ0KHDRZw+N3BsidbslhFUk9GplYaYvLesmWEuLzAUJF8WGnieLhkVqZ80N6L
	KN3g==
X-Gm-Message-State: APt69E0Q7GtnkreQrc/f8/Gp4b16Bsc6qLFNcEjRSmjs1c2wIUKbMZ45
	VV8GKptJVjH52BsYQWKy1sRKlz5c
X-Google-Smtp-Source: ADUXVKJxcvuCCeALmHxeHMRqA4Mo4WaOy23Haj58i/8eZPpuBhkwb21LY24jHm5eTbhWknIY1H8gjA==
X-Received: by 2002:a50:f190:: with SMTP id
	x16-v6mr19932356edl.59.1529533099144; 
	Wed, 20 Jun 2018 15:18:19 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:a55e:b35e:1873:c1c0])
	by smtp.gmail.com with ESMTPSA id
	h2-v6sm1304947edq.6.2018.06.20.15.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 15:18:18 -0700 (PDT)
From: open.source@oleksandr-kravchuk.com
X-Google-Original-From: dev@sashko.rv.ua
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2018 00:18:11 +0200
Message-Id: <20180620221811.9199-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] README: fix links to repos and improve formatting
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
X-List-Received-Date: Wed, 20 Jun 2018 22:18:19 -0000

From: Oleksandr Kravchuk <dev@sashko.rv.ua>

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-oe/README | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/README b/meta-oe/README
index 7cde0a2da..db5697dd9 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,6 +1,9 @@
+meta-oe
+=======
+
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 
@@ -9,6 +12,11 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]'
 When sending single patches, please use something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
 
-You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
+You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
+to share your patches, this is preferred for patch sets consisting of more than one patch.
+
+Other services like gitorious, repo.or.cz or self-hosted setups are of course accepted as well,
+'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
+to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.17.1


