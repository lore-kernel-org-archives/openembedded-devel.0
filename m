Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C6C0A6BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:08:11 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id g62so11044190pfd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 22:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FDxuQ76CN54/3GzwzpFuChA0s8EjBCh4FLGM/ao+R/M=;
	b=hRLGMudILHCxsusdvB6pyQy0NJlBegHd1BZ+qYQ+PRQGjHq8BQn31oiorWBLUks/t4
	Zz8g/GVsWVVQvjax8uDrBcQNzEZL+qedm+XU25nKOOhTIKzwnWHgLKZxHeVH92AVEhTY
	I4S8M24wANacZatB5oZ/9KFIkgJb2g9yMarDbdrqDNoddxYyd9EiSbMQzG3vSbUvc9sR
	73NsB0yeoeVJ+l4LWrTjnFAOp5gljOYbs4s5QxogGMM/2x9RqpG2YImEzQoH/GEQ2VGS
	zz+Obkuk53O1UP8qTYkVoAzQI2h9R5aDopwle2gBR8fWKi4LuVtMvSnKfFfQ4p3t9qUZ
	yBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FDxuQ76CN54/3GzwzpFuChA0s8EjBCh4FLGM/ao+R/M=;
	b=gxOI6IqCKspI+V8/w5b8bh/NrPPbsABoVbI2WgJi10c+eLsEl6lkiOv+vsWIs2d2cv
	xeAx7gAl+MW493NzvrlhQ+V1pYAPZ1ED1NUnyAAL0ggVr+25SPnomgo6upGihQsEdP/9
	6Tf3Bg+fZ5Whq00OS7QkLSDn1vVz2mfeN3DpejBBAGggkyYo6wZP7GBCHceMrkdpYvsd
	ZK254wT49kUIMMlASaUobpQ780qTUYk72WxYM/FZDf2EgOX4Hr8xpn7I8bg7VS7HhqPP
	RHQJPPKpQ/3EJNY3tSkXoj8wzMkds0p4g0NbZelpKtuVRO0o6YmNXuHNImuO4ZRZsBLl
	xrLA==
X-Gm-Message-State: AGRZ1gLg2nMghdU7rTtbdbsXwmW9iDQnfkGI5Q0f1qkFouLca68dw70e
	3MMEde/VqtE9WxjN3HQN9tNOltJc3Co=
X-Google-Smtp-Source: AJdET5cAacQTHipt6TriD5xFphmrvSBHItKqLWWljP+ugkJVjLi0ixgYAc8hyJbPoda2LMNcdrB7Jg==
X-Received: by 2002:a63:2222:: with SMTP id i34mr17496739pgi.83.1542607692328; 
	Sun, 18 Nov 2018 22:08:12 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	z9sm15141161pfd.99.2018.11.18.22.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 22:08:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2018 22:07:55 -0800
Message-Id: <20181119060755.22477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] geoip: Update checksums
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
X-List-Received-Date: Mon, 19 Nov 2018 06:08:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/geoip/geoip_1.6.12.bb            | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 1e1a7ff677..619f5f05f1 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -8,6 +8,7 @@ using reverse DNS lookups."
 HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
+SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
@@ -15,20 +16,17 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
            file://run-ptest \
 "
-SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
-
 SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
 SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
-SRC_URI[GeoIPv6-dat.sha256sum] = "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
+SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
+SRC_URI[GeoIPv6-dat.sha256sum] = "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
 
 SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
 SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
-
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
 LICENSE = "LGPL-2.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
-- 
2.19.1


