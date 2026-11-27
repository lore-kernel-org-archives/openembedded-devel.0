Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8235.1795739781522616830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YTdIFQo1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f02ee04378so58843885ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739781; x=1796344581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3x5eRO23lkjCunD+B+uelv+1cnEDYq5ZCTZJqG8cSg=;
        b=YTdIFQo1HvRNRHj6qdIMD/OjNw/rrhI2ZN9onjSde5BNDZ2vpufGCDcVANB/jNUcRw
         h+DdVI/26pCPxsFrZYbRRmuqxr+0RG+K6cIXNXdOZ6j2ooulXDWfKcNG8JY7cGeIYsx6
         JG/q7BxX5EkuBHaNtwmt9MH7mgUNXnRBkvMp+35YkDjVDOM34fvs5JQjqpHD+lzljQFh
         JhTQBNkQatmwiCFLRjAr89dLY2zJ/v7I11Tfyv8+O9sl766HA/QBGbmUXM+rt2gl3voU
         2cDkk2nKL3XGJHzumC7i610njMjrkAXSqQNCdcIeGQMjMdL4sT18DiaZMkoMbcD9Os3B
         gWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739781; x=1796344581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3x5eRO23lkjCunD+B+uelv+1cnEDYq5ZCTZJqG8cSg=;
        b=HnW7DsqcFc/a04gPACNT5GQd44HJgPVfqZbu4A6sz4GrZDP4iFysp3AbBeEmwYC1P1
         aHeT5Owl/mh/x1aQ49T8Xh7UyLxpcpAdEnZmLn+kwruNTzv6bGujHBuwDnH4jO346g1I
         fsF1qmI4ULlIIJIbcelGw1VtVPonxcs8tbN44oav1x11xfQFpJeBQ5w/m7OpVdrwtUXq
         5gBglJuYcw82HkDEkVueo/9l6lAao4zGp6dJAzqGh2J46dSVIZDRQWO89Ro7HVeEvRKF
         g6NATWvpSFptVTQhiwFUWra+FH4KriiICXcc6AApGkp7DjqdYrh6ODx8eoxN1e+7uoUE
         hpgg==
X-Gm-Message-State: APuU4Z9xiJIfX9pakHIutP3JuYd/ZJaI7WRG0MEe3RLshdE5zfdRkwxd
	ngYqN8hVj2A+onw9LSGMKeM4A4i3QigEHsUJUH2UzLWM1rsqwHaNSTyTPBTOvw==
X-Gm-Gg: AZFdTZfXORcXi13TEnKo52zKcQ670Arr2HYqVSUVDwAVlM10sSftaxPy+VVDHiUa0kJ
	hdglChdt2QKIt9EOikKeIbvw1yw55b7QQQ9R0EirVqE8MYvIotl3UMeoIj+kjHR07kEkkGr+ZrD
	5D8+ozqrGNkaxzc9+WSkU8AD9Tye7MxslOC+yvwnQAQWDRXE+Db/BPvuzI3jjm6zNvQnoyGR91N
	vEb/T/lKR15z7u8n/3XL4PS5dJ/aDBs1F87Qqcw3KsppxyyHSHJYiiHnVlRMYeEeR2WNOGMV8gM
	nVmx38MxTMBgRu6EByWMFaW841fbf3thRGCVHo0hSXaoCfjNGS4odIQQ64VazXcWZaC/D6/sQks
	5A/sqlWgzclYkNanqmSCJdLECBJBGK6g8yIPo1lmXHoBDsGdf0sBAUap7wmWjR6U32fdGyTRuNH
	6E+Lu32dbsw4Z7nM8zYodzEEH9Q9yZyKmwQ1d9dlsag02YEeyjhGMsWVB2oj7HQdoKR6RT3voR3
	hJwuSsFpM7pTb7lupzaFbHZ3METXI0bP6rSmO4tCBGwB535nQTCA8P4fH5wUtZGPtuuuzVfwxWx
	xtePVuW3rrEZjdxvA4NhaUkki4eMPQDYKqTwYc9lgx5p3UZjUU0nGKL7EBQZase9danMp/DikDM
	Y+0pQH0h3hV+bIzIVThMe698bUtgtMxRSKX+IBCKkfc4gH++NiTPsYgqD8VXKQdH9VoVQIc77/0
	558SRBxjjM8vk34KkJy7tDqTqPz/0OkZhbv7yxNrIaWVoIQ8ayThcEZekVlftCFnOPc+ikuoSBD
	yHNV727CEIII90223U0UI24TKhzo6AhvXj5DY+ZTnpBDwpy4XNltAGw3nLhtCAvApK2QtbiIe5n
	e7TV/CyqseNSykveF9eQols6og==
X-Received: by 2002:a17:902:e88d:b0:2ed:916:2a98 with SMTP id d9443c01a7336-2f03f23e4bcmr258911475ad.45.1795739780857;
        Thu, 26 Nov 2026 16:36:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/39] geos: upgrade 3.15.0 -> 3.15.1
Date: Thu, 26 Nov 2026 16:35:18 -0800
Message-ID: <20261127003543.2167775-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133184
Content-Type: text/plain; charset="utf-8"

Bug-fix release, mostly for the new circular arc/curve support:
- Fix arc noding with endpoint intersections and degenerate arcs.
- Fix CircularArcIntersector missed and misclassified intersections.
- RelateNG: fix crashes with empty polygons/holes and a "Cannot compute
  the quadrant" error for inputs with repeated points.
- PreparedPolygonContains: fix infinite recursion with curved inputs.
- GeometrySplitter: support MultiSurface and CompoundCurve inputs.

Add UPSTREAM_CHECK_URI/REGEX for the download.osgeo.org listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../geos/{geos_3.15.0.bb => geos_3.15.1.bb}                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.15.0.bb => geos_3.15.1.bb} (76%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.15.0.bb b/meta-oe/recipes-navigation/geos/geos_3.15.1.bb
similarity index 76%
rename from meta-oe/recipes-navigation/geos/geos_3.15.0.bb
rename to meta-oe/recipes-navigation/geos/geos_3.15.1.bb
index 7430c78860..8d31c60faf 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.15.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.15.1.bb
@@ -6,7 +6,10 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d5e5192a686d065eaed082de14dd26244c5c8e02bff16b2c6cce3265f648e00e"
+SRC_URI[sha256sum] = "8eb6dc2ea78b00c2f5109c6b0dba9e028c60bad42d7b1b0cc9952b12dc71f571"
+
+UPSTREAM_CHECK_URI = "https://download.osgeo.org/geos/"
+UPSTREAM_CHECK_REGEX = "geos-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"
 
 inherit cmake pkgconfig binconfig
 
