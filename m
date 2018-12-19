Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DD5A779E1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:56 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j2so19809279wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mouItbRtf31UXhiYW82fYl9a1ZS2hmQfz0HEhjlp9hk=;
	b=IdDDCDpAqDn4QOyQ8QFWn/tWUfcXPHseXfb1oA/EgF62EkTtJ5D//aNd6m/ti/3z8f
	AnDpJlzDGxfX6axerDjN2VT0Z0gh15cXfuSrP4KY/+s0RDV+/bmdlNlr2fx6FDfL7KwT
	qohFm3rws0Nwm24aAO1IY+nhPpJL3Vkh3TeJbYrNnSoHHyaLlmbpX1u8w9XMtHLkTbOa
	fSNadl24Z4zUP+Nw7kyMtkdb3c2+jf+uehnWCGzAWWmE+e0l7EdGl6kxTyMZpJFnpF0d
	jodDOibTV2cvgupLzl+Yzmk7+wCqosp6PzmBX4Xd/p4gY+2hX/VsavYJ/UG+15VH+T3U
	VKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mouItbRtf31UXhiYW82fYl9a1ZS2hmQfz0HEhjlp9hk=;
	b=cY7ROMxIPdI90CTA4P0MLqyzDkcQJ7AvmXz//qKZjW+XPCwWpregl00Vphlz5WxflC
	FWkHe4bAVSbSkQ7xgSRZhz/lPvAP74E7SniFh3gG8+B+FRTvj7Vwp51tdt9jNYO8ryzY
	EGVJEymwyTi7KzjX0vTHUqF4QpNN2CagWNqvZiHwDQwSGv4izQH87d5jp5Mj8phLkw3G
	nnberxjB0IQbAs6Y/L1jDvlPKzjHCJnRjSf1EZwgc/rOGbRV8MBJi1/3tz5VQ0KqXX3F
	uK8E4GvBEsaxx8kJ7XKipoLNAbvLJDwVB/zx77DOCF7c/w1SPmQf1epzSqZp7c4nELwg
	6nuA==
X-Gm-Message-State: AA+aEWbiRA2YFK2C2aZpPuRPNNNHCMQ7NZ7TzAO9YgQZQCsMXT6wVuR7
	jP6vaQqkQMLaN9Ew0QWsWKEoACf4
X-Google-Smtp-Source: AFSGD/XDaa2jxIxqrqKcJHlSVn1R4BevAXTjEwZO/aYxdciFvBlo57YRO66gS5aQ2IJu3A78N8uD7g==
X-Received: by 2002:adf:b190:: with SMTP id q16mr18919423wra.95.1545230517446; 
	Wed, 19 Dec 2018 06:41:57 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a1sm7510984wrw.76.2018.12.19.06.41.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:51 +0000
Message-Id: <20181219144155.31236-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219144155.31236-1-Martin.Jansa@gmail.com>
References: <20181219144155.31236-1-Martin.Jansa@gmail.com>
Subject: [sumo][meta-oe][PATCH 2/6] geoip: update md5sum and sha256sum
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
X-List-Received-Date: Wed, 19 Dec 2018 14:41:57 -0000

From: Changqing Li <changqing.li@windriver.com>

Geolite database update periodically, md5sum and sha256sum
have changed, update them

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/geoip/geoip_1.6.12.bb        | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 4e717e4b95..0657369914 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -17,17 +17,17 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 
-SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
-SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
+SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
+SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
-SRC_URI[GeoIPv6-dat.sha256sum] = "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
+SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
+SRC_URI[GeoIPv6-dat.sha256sum] = "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
 
-SRC_URI[GeoLiteCity-dat.md5sum] = "4b6588d0bfe1af22e267ac90aa97f769"
-SRC_URI[GeoLiteCity-dat.sha256sum] = "8a6467033a528f68b1a97de24d9d0ce86c8e8e83683820e16e433ddbd3f712f7"
+SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
+SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "ad0cb42518af7f752499425dca0952bb"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c712f5378bc723a8c29c0b440f"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "f6dff70c99f8449af1b7a33073eaa743"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
 
 LICENSE = "LGPL-2.1"
 
-- 
2.17.1


