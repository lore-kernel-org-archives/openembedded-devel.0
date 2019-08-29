Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC397F358
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:22:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q139so2710099pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xhT5dNSFKJ3utig6eDN1xpelfgwQvdOK7wDDwmn3dY0=;
	b=sBLXKZLk83lgxEph5iw9qnVIb6winmUNweF9ZBkE3XLlttOD1z7vqjx3LeHeI+AG/U
	eCuE2dwNNFlEImb3VAVOLbSzdwmNPx28qUB0y43jm1vbGkK1g1FoHMUTkOzSHm+vkGrt
	gjZePoaF2+kZgpsAvvOAoB5E+HBQ5FyensF6Q+U9/dsWCg35fF9jj7UMnEg2PoNN0eGe
	Fc9wLfbWPp2y23UHmtkjDQHunqYxda+23g+S+PheUfFwdSCdBOyUhPhL5PhDmJE28+oz
	+tdsZaO5MHokzEn2JZt2A87tE9on/oK9h6qjd2ckvZjFCOsNb+t2RuOgt9DLW/ezyxGz
	xQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xhT5dNSFKJ3utig6eDN1xpelfgwQvdOK7wDDwmn3dY0=;
	b=Ik731OJWcNhR1s7THtn+FK/5Sgkxp1uIa0zIdGSMD+0ijvS1QqwSW1INxIP/P0hVXe
	0VDFRkJPDTkqmHWRsY0XwnAxPp8lR0KoLn4ajQ55mah5G2+d33Kz1KGe/INwQpEs+Ege
	OfAlb3N0thTl8216o0Nu8FbjlZvswroTW4T4/8E+VLcuBL0OgjzlxQp8CCAqJzQv4bmL
	FmSXmKrmTMYx7NM0Zpc1lcM7V87Ly++eDTSGRgOZ6Qzz3TK8wREKik+sjZkBiyyneBmG
	AVmgQQpc+qrn3VtxNj+7x6+awZxkuul1xcKJFELKj9mjMXnPdI5LMNaMqOLvd5u0iOw2
	z0dQ==
X-Gm-Message-State: APjAAAXpe6oUdYdi+hDpwcrRzGlVSzcFSQMhGBcwwBqrH2N1h4uBr/Jh
	53Oax25McXa37Jrf9Wii4C5uSBRZ4YE=
X-Google-Smtp-Source: APXvYqz0yZdNokdvvoekoh1DEPgVuzm4fBLXk+zyPX90N/utfjtTtCcTWhZ8VkzOd0d60TXHrPJXcQ==
X-Received: by 2002:a65:4841:: with SMTP id i1mr9781823pgs.316.1567106536757; 
	Thu, 29 Aug 2019 12:22:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id s16sm4893281pfs.6.2019.08.29.12.22.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 12:22:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 12:22:04 -0700
Message-Id: <20190829192206.1200-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829192206.1200-1-raj.khem@gmail.com>
References: <20190829192206.1200-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] can-isotp: Update to latest tip
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
X-List-Received-Date: Thu, 29 Aug 2019 19:22:16 -0000
Content-Transfer-Encoding: 8bit

Fixes build with 5.2 kernel headers

For complete changes see [1]

[1] https://github.com/hartkopp/can-isotp/compare/6003f999...b31bce9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 6ce3cab112..5df44f21f4 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "6003f9997587e6a563cebf1f246bcd0eb6deff3d"
+SRCREV = "b31bce98d65f894aad6427bcf6f3f7822e261a59"
 PV = "1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"
-- 
2.23.0


