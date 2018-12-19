Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD079E2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c126so6704716wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=onbb910BVoQY7Vs45N5iyjkZplzEYxGm+31A2ScLeDI=;
	b=SGaNOUzIXA80HNh6neIZdIMC+qAY7YW1EnLB89K4Xb7/An52xbFkaueehf7qA96gSg
	BgpDwRk+4KrbV6X5OdC5Jq43Mx1oWL7NZi1EgXdVE3W/hjDEZ1zWKlVfn1qSxdduuaf4
	65imzbeLIRUp2xIoe73UlTKa/jAU4gLBNUJWACCGhdlrhfk7gk/CUxcoqHR1YNu7kpXX
	ZtiNlbDKvaAG9yRR1Luu/Umx+vxBOPr5onUVGseV4fjBhxTry5n7RAMlhcYhafcBB8iV
	T6+p9laag9c3xxJC45/7AtKkb/dtPIHgSkklECSmwdS9un78/ghIEvKMvjpn/8LlsOog
	NCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=onbb910BVoQY7Vs45N5iyjkZplzEYxGm+31A2ScLeDI=;
	b=uDpjwCxZsUAUPRmjzyDwWIqP6hgbpirGwKvDAZU158week1WgDKwgS2LOwag9KAimW
	sEyuhIEK+I8rdeTtnAR50qee2JZPcH38Xg5CYcni3ZTyg/WtrLRVFkLfsDFJb0u5pljg
	TuVWI8k8rYwVgTUu6/RlHpmvkKWk0FGXZRMus2/8jfLSl9N9vBaJYJze5hAiC07Mu1pS
	qXr310y0+1ODaX3vXbX0mshBbSjDwaid4c+Mowfubl0j7J3Vd1JpLiZeM/m8ExDTb6dF
	gJYe5/xnlON35K+Jobfw1/k3zAuwSc5qB8vnTdUcJZJ8JZ2VVOmLl4w3VujW/txgsO0R
	SplQ==
X-Gm-Message-State: AA+aEWbnJLd3fWZ5qiARbmVHs3uF0pfhoSnLM8ZgoEwVXHN7AzGyfnt5
	FTitX7saIJcFoFyMUvRC5QjJdn/m
X-Google-Smtp-Source: AFSGD/W/cB8Bs/A8MyAWA/v4MwKwjBQgmotytTeBpHlQarwoTe1bLB71emKRYhtfpJLe8tuoT9y9IA==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr7174205wmk.47.1545230518661;
	Wed, 19 Dec 2018 06:41:58 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d2sm5336575wrs.97.2018.12.19.06.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:52 +0000
Message-Id: <20181219144155.31236-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219144155.31236-1-Martin.Jansa@gmail.com>
References: <20181219144155.31236-1-Martin.Jansa@gmail.com>
Subject: [sumo][meta-oe][PATCH 3/6] geoip: update GeoLite Database checksum
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
X-List-Received-Date: Wed, 19 Dec 2018 14:41:58 -0000

From: Changqing Li <changqing.li@windriver.com>

GeoLite Database checksum changed again recently, so
update it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 0657369914..1e1a7ff677 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
 SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
-SRC_URI[GeoIPv6-dat.sha256sum] = "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
+SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
+SRC_URI[GeoIPv6-dat.sha256sum] = "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
 
 SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
 SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "f6dff70c99f8449af1b7a33073eaa743"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
 
 LICENSE = "LGPL-2.1"
 
-- 
2.17.1


