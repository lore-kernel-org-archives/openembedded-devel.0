Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1227E25A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:39:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j24so16138151ljg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GsJ6fzChEjG/vCydqCjbhDgfQu6KZEHxZtquLo5Imo0=;
	b=AG0uCz/n5vX7NCd/vwy24mqKqX/m/2ZYzP98hG74KifQCESXjUKr5B5lLUimEKoAPp
	ersrtmbGq2jTZl4PPVzBcTBBAUoBGCZJRrTIMS4X5PymR0BuAMY7UIWnf6Imp1NgncIQ
	NtCfTfUHIQlZbPuZ5XyysBgFn38jfFEV8FW/0E2m6LfZOWEZdJ8137GmQuK05s333nEN
	e1TWWrX+mEIR7kxvC2DyxRas8BO8AzSpmkLP4CW26VwdQkq3jW3SgXjISQ6feN30wCDO
	EE/tPg0svN1x5fgL7XVheafRv+dd2dT9AmVIjrRhPhiTep/gge69OWccRPwVupkr5WoS
	TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GsJ6fzChEjG/vCydqCjbhDgfQu6KZEHxZtquLo5Imo0=;
	b=lsQsgmWOwC16Zs+Wxs1ue8gsaQhZYH91tLYOLF6dx6/Mr5PuKh7PPs1ftebTLanU6M
	O2Fbzvtj2+357DvypVAqp/wopoRmpx0lJy5dP285XgwuqyPPP1aD+anXCPV3GNaCGwYD
	h0nwcasGkkvGxjMMEVt4bEAGowrFKBmKFgAZLPeRJ9NGRw08Cgki0JyNYrEyG6QZsx8p
	aL4U9pfBF0Qc6OK9Ywobh+D6qqzAd3RzKu0/qWRpdm/PJ392yq4Yls/yuWmPwYAxbUkk
	1A2aGCywaTQsrg6wjMEhyQZHiJgo95JW9cBag/Ynbj94IAJHjU6Q07Mrru+ZmtPwNBlZ
	waQg==
X-Gm-Message-State: APjAAAXw/539KPLjovURd/l5ziXmuOiSvSzVy29Kx8Xzfda6ZLcvVfSS
	wP1nZDILe11BOWARanXTUVI6RVgGCXw=
X-Google-Smtp-Source: APXvYqyqaPP5IYljg7R+Nya12V3+yOD2dDRRN9ijh/SZoZvvqk75mmmWToTBneYZs3Yz6BC/2/CFpw==
X-Received: by 2002:a2e:89cc:: with SMTP id c12mr35414585ljk.90.1558449580321; 
	Tue, 21 May 2019 07:39:40 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r69sm4707502ljb.16.2019.05.21.07.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 07:39:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 16:39:37 +0200
Message-Id: <20190521143937.18457-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] rp-pppoe: update to 3.13
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
X-List-Received-Date: Tue, 21 May 2019 14:39:40 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pppoe-src-restrictions.patch              | 31 -------------------
 ...1-ppoe-Dont-include-linux-if_ether.h.patch |  0
 ...Enable-support-for-the-kernel-module.patch |  0
 .../configure.in-Error-fix.patch              |  0
 .../configure.patch                           |  0
 .../configure_in_cross.patch                  |  0
 .../discard-use-of-dnl-in-Makefile.am.patch   |  0
 .../dont-swallow-errors.patch                 |  0
 .../pppoe-server.default                      |  0
 .../pppoe-server.init                         |  0
 .../pppoe-server.service                      |  0
 .../top-autoconf.patch                        |  0
 .../update-config.patch                       |  0
 .../{rp-pppoe_3.12.bb => rp-pppoe_3.13.bb}    |  7 ++---
 14 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/0001-ppoe-Dont-include-linux-if_ether.h.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/0002-Enable-support-for-the-kernel-module.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.in-Error-fix.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure_in_cross.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/discard-use-of-dnl-in-Makefile.am.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/dont-swallow-errors.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.default (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.init (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.service (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/top-autoconf.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/update-config.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.12.bb => rp-pppoe_3.13.bb} (91%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
deleted file mode 100644
index 03697ff1f..000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a6a85ec5c85cbd3c86743b6e2fa391198869bff8 Mon Sep 17 00:00:00 2001
-From: Tom Rini <tom_rini@mentor.com>
-Date: Wed, 27 Jul 2011 03:46:52 +0000
-Subject: [PATCH] rp-pppoe: Port from oe.dev
-
-Relax restrictions on the PPPoE src address, as per debian bug
-293811:
-
-  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=293811
-
-Upstream-Status: Inappropriate [Backport from Debian]
-
----
- src/discovery.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/discovery.c b/src/discovery.c
-index 7ee259d..5213a37 100644
---- a/src/discovery.c
-+++ b/src/discovery.c
-@@ -472,8 +472,8 @@ waitForPADO(PPPoEConnection *conn, int timeout)
- 	if (!packetIsForMe(conn, &packet)) continue;
- 
- 	if (packet.code == CODE_PADO) {
--	    if (NOT_UNICAST(packet.ethHdr.h_source)) {
--		printErr("Ignoring PADO packet from non-unicast MAC address");
-+	    if (BROADCAST(packet.ethHdr.h_source)) {
-+		printErr("Ignoring broadcast PADO packet");
- 		continue;
- 	    }
- #ifdef PLUGIN
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.default
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.default
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.init
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.init
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.service
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.service
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/top-autoconf.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/top-autoconf.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
similarity index 91%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
index fbe015f5e..492ade5ae 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r10"
 
-SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
+SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
-           file://pppoe-src-restrictions.patch \
            file://update-config.patch \
            file://dont-swallow-errors.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
@@ -22,8 +21,8 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://0002-Enable-support-for-the-kernel-module.patch \
            "
 
-SRC_URI[md5sum] = "216eb52b69062b92a64ee37fd71f4b66"
-SRC_URI[sha256sum] = "00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2"
+SRC_URI[md5sum] = "ec9dccd9a367a1f71f2dc81069796dd8"
+SRC_URI[sha256sum] = "8cd6bc71ba46bd5f6eb4daf60220ccdcd991a8525111dee466501b1b9717e676"
 
 inherit autotools-brokensep update-rc.d systemd
 
-- 
2.17.1


