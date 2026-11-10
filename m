Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17.1794324471992301976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SlU05MbG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922523d1afso1282282f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324470; x=1794929270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5+S2Nz9ERV1mVvl4KPnoayfuHSCMDyaMQlEyUodDEw=;
        b=SlU05MbGQl+xwZoWOZgpOCjZtE06iqdP5lJXzqeZOoQaj7bgg9PJDkYKVFn0B3KWBf
         3D3KM1+yg8ogn/ecVbJRhLaX5YLWqthIIrT99u9y6oB/oaB22/kplA9qER6qEvQAtAbs
         6dpIuGzhsipUp0zos67oj2pJ3mPjfc8hisC3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324470; x=1794929270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p5+S2Nz9ERV1mVvl4KPnoayfuHSCMDyaMQlEyUodDEw=;
        b=2ZQgqu+RvVBf0c+fpnCgHV0kehbKF26sK0vzlv298qoAPOeEu7Y0ASWJXVughRVGYv
         GGbtaoqmKjTmPCV1GyGqXjv/ZcpPMLaj4NAoxqzoCj1dnP/xwkteJmq/9CLX5CEmJ53f
         w9oIzvbclIvhhPOXrEEtexshowVbL3qaizJSZQRqdBIfYxYhbjBLwuIcSK50YbX4Cgxb
         RXUdJTqoFFIG55NOJy271rDt/nnHk2yFdnyHN8GLwubQHbg/ylQvKDTLI2u23VVG/Ezb
         VQZDz2r3WlOm9jYzlxdw2DEnuJOJh8OLV+eAhgWCNAJr3MYJrmWWooIzrV+45Pot/o9m
         GErw==
X-Gm-Message-State: APuU4Z9IGYTuR7yPNQvvD78HRS+tw5eyVHKH+1pfottUROdEQE97wLhN
	JaAtUpoINIuYX+Mqin5jxrVFxrcR2ZbJsuHLbXOp0bZWv/HPOxSdoXwP6U6vApJMOTMiarxbfol
	TetGO
X-Gm-Gg: AYBFou0X/ilAAotfKBycAtWQ0X5qAChdMeE/UpbSCCwOgz17dDiqad4HWdtC7vCh5iw
	gD9stb7Yr8Q28WsBl9ivfuu+/PZmce5kp2ey73fKpwnN9bDsL2uz4gD2qWv84tL/2nEwb6DAgoB
	jGtB4jtQobMGADlh6B8eJEWyp4e8DG8xCjypb0Lkx7P0Yh/YXlyPo/XDmzSqQHgXquZiXH8rUPX
	iDolfSVFsjxgADPyvfCz4fitsB/hhZYNjMz0qgMvvt9kvuk4U8O7lWZd4DeTOYkKwmktApzTVbI
	5OOocQTU0JRwMWaIu4TNDRkUinEhFxOpbgtAfWBcYTpLpaIwLIlGdXXpvBLFsLIlS/x685YxmWP
	mc8SuIgBgpAIa/kJ5UzeUYolj8gPoG9dsuQkFfN2z7Si7u31kkDk9QRENK87nU1497xtCxmp5BZ
	5S9cjURhE3Hhp0bX0LGZTUGmK4AwIG/oEJAuM0Kq6YXwgSfAEROu6ovBQhZAoTEYHNDRFh9/v1w
	G+z/oc+D75IUWcvubaYbj8Jfs/FLZP1tiYLZf5jl9iDnhf/5oT01vhnaRbeg4XImfO8h1whbSw8
	e3nReTe1MEY89W0vKNsmo9LdFutM4Fzh0LfCpvJCgXtiQw1GEBfwkdMQJZ4doHVTlMErC/aG5cg
	GyWkuY5A2SSIf2Dj249TkoG8ixaZwzbbZwRbv0IASz/MRgvGkZ3KF31M=
X-Received: by 2002:a05:600c:a013:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ba0234a0b2mr49613605e9.20.1794324470172;
        Tue, 10 Nov 2026 07:27:50 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/19] python3-zeroconf: Upgrade 0.153.0 -> 0.154.0
Date: Tue, 10 Nov 2026 17:27:29 +0200
Message-ID: <20261110152729.1065911-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132093
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.154.0:

- Build armv7l wheels for Python 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.153.0.bb => python3-zeroconf_0.154.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.153.0.bb => python3-zeroconf_0.154.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.154.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.154.0.bb
index e902ae6959..ae86cc9b6d 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.154.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "28bd0baa208f4ea481a386e9eefdd3a65663fada34233432301a0c221d741d1d"
+SRC_URI[sha256sum] = "830315497af9bbd75924c2218cd3b64f0bde0e808ee316aabb5d9288836c0c43"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3

