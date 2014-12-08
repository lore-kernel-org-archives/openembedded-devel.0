Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5CABB72381
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 01:19:37 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so4171117pab.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2014 17:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=qYAu9c5j/Mnvq483lx8xlSqPxuQCYdtSbgTf34u9KN0=;
	b=EpjB7FFraaq3RfCItf3OL7723x3sZHGWWkeg8w8Bq4/Tb6fosjG6Q84xn8sheZEL9u
	eSr6UtyucPX7Uvght20KSSSt3M5sF0MN1lOvGRr14/5Rn7MZ/XhuXRrz/hE/53GAPd+o
	g3c9xKDSB9Nd7v9Dgj/DrXOuyjeG/QbjfSGa90wp2DKRBnKg52szL3TgUFws2gn/ECpB
	ZfVE+ozPJdGvlz3M9zxw08pym3XiH2fxtEHJ+27td7yOHZJuM2Zn+upKHTMKx8YBrP3P
	d5LoA5g0Lnyr24Hb8ICJB/ST+ye9fNSBSUCdPfGW+euHAUybphOAgiltDYDdGC3LNLTN
	Bsgw==
X-Gm-Message-State: ALoCoQmFaxRwUEoTNTCUy1Xz7hi2rEpFw2+vpYGB/WNnhIMVIxIlM72PfJnS8QPsvNgTuyavM55w
X-Received: by 10.70.102.193 with SMTP id fq1mr16357049pdb.19.1418001577937;
	Sun, 07 Dec 2014 17:19:37 -0800 (PST)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	i11sm34630954pbq.23.2014.12.07.17.19.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Dec 2014 17:19:36 -0800 (PST)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Dec 2014 10:19:08 +0900
Message-Id: <1418001549-7216-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][PATCH 1/2] v4l-utils: Update to 1.6.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Dec 2014 01:19:41 -0000

* Bump PV and hash of md5 and sha256
* Add ${libdir}/libdvbv5*${SOLIBS} to FILES_libv4l

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../{v4l-utils_1.0.1.bb => v4l-utils_1.6.2.bb}     |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.0.1.bb => v4l-utils_1.6.2.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index c3a1370..219ed15 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -12,8 +12,8 @@ inherit autotools gettext pkgconfig
 PROVIDES = "libv4l"
 
 SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b06ea8b15e27cff352b4536e835448bc"
-SRC_URI[sha256sum] = "fc0132e82a18dfad9619be3abf50c206e2f449b1c14440cde36f25874fdce7df"
+SRC_URI[md5sum] = "9cb3c178f937954e65bf30920af433ef"
+SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
@@ -22,6 +22,7 @@ PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
 FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
 FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
 FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
+                 ${libdir}/libdvbv5*${SOLIBS} \
                  ${libdir}/libv4l/*-decomp"
 FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
1.7.9.5


