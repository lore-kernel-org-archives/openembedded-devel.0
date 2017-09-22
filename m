Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id ECAA478397
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a7so3247101pfj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XekEmVXB1H/mleIjVYHIZf6DNwFPYZhqrlyISjdbYwU=;
	b=HVL1of0zMnMHrOO//2qDQxZovkPZ3XZsl/ND19RHruXITmkxYIZAEWsuSKD0+B28Sg
	+qeccgLGEgDpXgUAQtJk9icoxv90SISNV2pvUIL7wBJbDf8ACddPRtc5CUHq1omfZqCJ
	Fjk33rPavmhC4z/vcO70y+qBaDqrhg0cYz7NpSbBaN5aI0V3I7nRaZyi7gOj76rGei1n
	jrRRbXJzJfKwUCffD8RNxTCfb82y0RaIixYof5BhjFIPhtVuHiMgnMMTUTeRAGcW2KXJ
	QI2h0xFMuiYJYogANav2AraoG/mp3zvdFkn5GOazGmLXWx1Jpc+KceFRp3k/ai6dnuzM
	bc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XekEmVXB1H/mleIjVYHIZf6DNwFPYZhqrlyISjdbYwU=;
	b=gaNBGyV2l0e8qUuMG7Ia39+e9d/Rwpk3UHa+mPnVPIg0nCignjLNTsbFG2o8fTbKjJ
	B9DgJhU0u93XVg3XLT4aLNF4iqBkLiY4Xin2b/fjD7G6ElNu7YDuWMbXfaWL21sD7Cct
	0RlhIJPNPKiP1r4XWoQg8tA/4JuSmiBN+Ka/Qu3oirS2l1vWnFPE+DOfkuKWwK+v4PJI
	bYU/Hx6T4qOO+u/bIzbMZGFYFplSXtNHhzWed+1/6leLfljX4I4MhnR2uGz/rsViIRJZ
	hhoZrW9fnaMm8XUbujAyJMnMtiJ8C8K9Z0uDjEgFMVzQ7eqogGehHooUO1Q7DbpmFOTP
	wfeQ==
X-Gm-Message-State: AHPjjUgfQ0WsMjqhnGgeOcEgJlHYyOxP5e9JSJhqBrAHk+kE8ynY3F7x
	SIPK2FST8FbeYeUL5p0Gv18cBw==
X-Google-Smtp-Source: AOwi7QAI2ZXkI1p0x55f8LwP/Azflzul/T/Vg1adKNkmz/K9uc8uzRS899SI+RH7QUSrt/WsNJl52w==
X-Received: by 10.99.114.19 with SMTP id n19mr7563074pgc.300.1506050609067;
	Thu, 21 Sep 2017 20:23:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:13 -0700
Message-Id: <20170922032316.18616-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] toybox: Upgrade to 0.7.4
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:28 -0000

enable parallel build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb}   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb} (87%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
similarity index 87%
rename from meta-oe/recipes-core/toybox/toybox_0.7.3.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.4.bb
index 0cd44ff64..76a7af459 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
@@ -2,12 +2,10 @@ SUMMARY = "Toybox combines common utilities together into a single executable."
 HOMEPAGE = "http://www.landley.net/toybox/"
 DEPENDS = "attr"
 
-SRC_URI = " \
-    http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
 "
-
-SRC_URI[md5sum] = "6fa2a001402cb067ba541e0d8948da50"
-SRC_URI[sha256sum] = "e6469b508224e0d2e4564dda05c4bb47aef5c28bf29d6c983bcdc6e3a0cd29d6"
+SRC_URI[md5sum] = "55ea59a31c7da9510c8fabe70f4bc561"
+SRC_URI[sha256sum] = "49d74ca897501e5c981516719870fe08581726f5c018abe35ef52c6f0de113e7"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
@@ -16,7 +14,7 @@ SECTION = "base"
 
 TOYBOX_BIN = "generated/unstripped/toybox"
 
-EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()}'
 
 do_configure() {
     oe_runmake defconfig
-- 
2.14.1


