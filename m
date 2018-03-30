Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id E3DB47473F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:35 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id 80so8088184wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vjsM1dn3NMUlBOPRoxu3K/eLxOExt59wfSL+fyRr33M=;
	b=MuB9d33/xVv7dKpWyjBea+Jh2+sU3lT+wXyZdIdgk4T45yQPdFGH3WZcdnTkqVctQ1
	30qfD9le5tYGHJJsrEPnPNsaQyLH69bnDnuiT+YHD6E73nsUdYW3wFVkKbQupeyFxxLv
	yY4GyODOWBs140MhQ10/XGP8cvCSWIrDKlRrlX7uFa5FNCXGVO2qMkL1FbNP5ZHIx7lI
	GAAkLzU5DMBzjfh49mN3p3q/yMq4R8zzEEkPhU75r6lbxB88rXDJpWvdgZ4lWk1QyEMn
	7He3HkELQB5LJe1U905IR1q8gPOOjeFX+RtnXwW1q1VY5jMnPmqja2bQLavYrVhc1Jjv
	Dzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vjsM1dn3NMUlBOPRoxu3K/eLxOExt59wfSL+fyRr33M=;
	b=lvULRC6kk52xxrUPLD2dZTuFGbPJS2qwh37+kl7JZUmszc+TcXB8di90iiIRxb+3VK
	IAGOWiQzLPkXkCQRVSmmr/7U65upd3MlguS9QJ6YDgLAESJmtT++b4e4TBaE/5R5JisW
	av8lyjghCu2pSxeTKo+XhyqV6AyzPP5rJR3JISgrYpbW6D2ON06ihHjUqzBDvftAQ4Mf
	CvMnb+V3roh+mcT91XhnGdfxlORfzD0GyAoaFeDsQU+ySftMW2N4vfdmJAFBLpwss2l3
	nmpfRgG1KVT9/IG1WuU4lmgHrX3iOlp3HS06kToEmvMtgyzRFpWdgf0/lLX3BCiCDu+Q
	QOcw==
X-Gm-Message-State: AElRT7Ho752JfVm9Df5XjX8FS+qd9odRe0IjRmYERuJSV2Yq0hHiO+Zw
	RbTADjmZb89Nrf6TdgvbapBstQ==
X-Google-Smtp-Source: AIpwx48XGo8s22sETIOP0+1JaeO55n7/g4E3ozY64imcSBE8a7hHOSGg6cispH5I4QI9YvNRazAKcg==
X-Received: by 10.223.209.198 with SMTP id m6mr10052575wri.267.1522416756057; 
	Fri, 30 Mar 2018 06:32:36 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:44 +0200
Message-Id: <20180330133151.25882-33-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 32/39] libass: update 0.13.6 -> 0.14.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Migrate libass.inc into recipe - nothing else uses it
* Use git repo to avoid github checksum trouble

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb                 | 4 ----
 meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} | 4 +++-
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
 rename meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} (86%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
deleted file mode 100644
index 40ac0f811..000000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-multimedia/${BPN}/${BPN}.inc
-
-SRC_URI[md5sum] = "daa6cfca437c0776af5f79750cdd9b4e"
-SRC_URI[sha256sum] = "f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d"
diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
similarity index 86%
rename from meta-oe/recipes-multimedia/libass/libass.inc
rename to meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
index 4bc3db062..3454a5c27 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "enca fontconfig freetype libpng fribidi"
 
-SRC_URI = "https://github.com/libass/libass/releases/download/${PV}/libass-${PV}.tar.xz"
+SRC_URI = "git://github.com/libass/libass.git"
+SRCREV = "73284b676b12b47e17af2ef1b430527299e10c17"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-- 
2.14.3


