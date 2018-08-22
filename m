Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12E5874A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:08:35 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x17-v6so679606pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lAvW5rj2Kmv9ZGnFpV0+PqCTcbDXvEMiRGe21ACcN70=;
	b=haaWQBrGQ7mTP/0z2aLse+7pi8nyVivw3webVyquBrj6kywGw+/9QQqU4pyEstFpQs
	nw9+x9kgIpTUVN+cqaAoWR0A9EIF/R/h4xeH6uLVm454E4QnuwOoFzwNxAwJfaPM6luS
	LsnqTrDYsqJNESiehMeE/RXLr00+9q1NLb+PR31YDhkoXU9Ic5H0ysZcUY76AyV8btan
	mtnitzqBLvS/qw70PYi3bIi0tLVyx9zaYenDoqO0mZOK4I7iaNHxM4HGBGOf4ou+DR70
	xkismedGeYZjMQy2k3WExuiUZTQ1bBnsxUQBKPKmnVCzzFL4PiCp6AFdT86gvkEkD7fF
	1JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lAvW5rj2Kmv9ZGnFpV0+PqCTcbDXvEMiRGe21ACcN70=;
	b=Sk32GWpu+UZvjHtfd8QDA7yOn7Zra+hEAV3jeDV9FXx2DN4czl8f8QKiXpUqulnI/8
	HhyAH0QpgiLW2t3xt6LPV9OTdwzd/3py01ttfrqaE9xfeYMqBxe6rVoWe0VD/cFxU0Ge
	D+KKItpLrjUPOjXOfkZ15qg3Tf45ALwO9/q3m4LzTb9rVue2DBlbkhAZJfYIfsaFv255
	2M2GjH7f+64f9Chqs7hHHNSIjR1nGLj+a9v9usVyF/galp1nY4i3vwzifbpnEQWCZALi
	dn1gVw8zy3DgnQVn2dgsXEvxkoF0p483SOavHAMaTCUnInmAub2FbXCT6WSmF1X9ur5n
	smfw==
X-Gm-Message-State: AOUpUlFLkPuCa10UHF2mmz2aXlUGy5cVo1TlXAghCGNF6MV5MAWclqaQ
	6rcUWTCx0gmMkkBUIKvdmSXfrowM
X-Google-Smtp-Source: AA+uWPy8JOF4/q1R9uoIN/u/1dvvGrR9dlksei2vI9b/6jdfCwQ0uRWIPfQveRYCbDA0WLSP/UHuug==
X-Received: by 2002:a62:c90a:: with SMTP id
	k10-v6mr56053440pfg.180.1534928916998; 
	Wed, 22 Aug 2018 02:08:36 -0700 (PDT)
Received: from localhost.localdomain ([118.42.82.236])
	by smtp.gmail.com with ESMTPSA id
	9-v6sm1709145pfc.20.2018.08.22.02.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 02:08:36 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:08:25 +0900
Message-Id: <20180822090825.29463-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][morty][PATCH] libconfig: Fix broken src uri
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
X-List-Received-Date: Wed, 22 Aug 2018 09:08:36 -0000

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index fb6e50e51..a0b3a9471 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = "C/C++ Configuration File Library"
 DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
+SRC_URI = "https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
-SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
+SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
+SRC_URI[sha256sum] = "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
-- 
2.17.1


