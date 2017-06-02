Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDF9D77794
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:50:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u26so11733900pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x/dXdV2cAk98dDy4PAzTIztc2SiM4YHj4iKIhs34XPU=;
	b=YLTQCAhLZd6oKDj8kDcOVE38bVpIjzy5sUb+7OoFPqe1azm/UHhRtMjh32P4o0B+E+
	YcDZjH6Pc9pHmjP8nZJXBKv/8agjYbNKZBvgnZ3i5mI9kxC83Uuq5BQ8V9OA6HtDzjm4
	epfNPz0ADD99jX1pLl6+J+05dJh3mpJE2kNNE27fIy4XwlQR7xTzW4oRIp2bqm+PDfq/
	BVOE8oZGKaqMf2FJ1f/jxDpWMdJl3CctKYmJvf78gGKJbc7LPMNhm5+yGos7JRIphyl6
	F/PuzaSnn44Q8X+T9oqBJSmSE7wXNkWKNFYgPdYs4bfAEXmXuPyqMGzbEy4h8ksglB0R
	VUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x/dXdV2cAk98dDy4PAzTIztc2SiM4YHj4iKIhs34XPU=;
	b=bOFM/LcUfsu14u/MT4uOxx5g8zhzDCJmMo+muMt4uNbe1z3dmb6UlCtQC5+b/tpZvY
	wz0TYtYX+8mGtP4Gf3P3r4YH3Gy35xbdMr8+Xlq6WoIW2rrQErSgyTlLPRlTtsSwEXOb
	gkMWMLvYpRGaVjb90XJ9PqTOQUur+krMn08J2DYeVToJWHWXVR1a2o0sLj9WIqiWsoCj
	yWdXcU7eEz6vPTrVgmcLIJmThuYWe/J9ogjbkwU85lXPvn65XRLP6ZhklZao0r6yQD7L
	yaQRzJx1/FL5qdqu6WT4Dbe1yxn8GsQIFUII4cocg5eWR3w0Eo9c938lRJrEBVJB1nb2
	DnhA==
X-Gm-Message-State: AODbwcDBP+N3OrLVH1wB9HX2UDexdpNM0gUkTZCb467BFBRRFC4huxiu
	493YNWNTAkKptA==
X-Received: by 10.84.164.106 with SMTP id m39mr43697706plg.58.1496386228959;
	Thu, 01 Jun 2017 23:50:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	a78sm43177369pfk.122.2017.06.01.23.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 23:50:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 23:50:13 -0700
Message-Id: <20170602065016.27954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-gnome][PATCH 1/4] onboard: Upgrade to 1.4.1
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
X-List-Received-Date: Fri, 02 Jun 2017 06:50:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/onboard/{onboard_1.3.0.bb => onboard_1.4.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-support/onboard/{onboard_1.3.0.bb => onboard_1.4.1.bb} (72%)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
similarity index 72%
rename from meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
rename to meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index bdf0a4eb9..3a4f18971 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
 
 DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
 
-SRC_URI = "https://launchpad.net/onboard/1.3/${PV}/+download/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "8000df3e789512a90fcb227580fd60ff"
-SRC_URI[sha256sum] = "fd74b54b8bd7a075cf5f6e1a8ca3e6de5cd2663507adb690d7b1a85e71afa2e4"
+SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
+SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
 inherit setuptools3 pkgconfig gtk-icon-cache gsettings
 
-- 
2.13.0


