Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 579DF77A0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n11so9226633pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JSIXxPCHlmmyoUlDNjA/XSMfbuUgRcZFeYT8EHuN74o=;
	b=fr+WDMzPhLAR2VyCLYSeXEvcdAPUx4HIU+EhNJ43C+NjKem9vmoK+0Yv9E6Pcv05TV
	cW0ZYvgHvaz4NFAN412HhT1+q0CDu2wolwS4zjUQiL7PptcQhzjMJ8cARcFb+kHZWipv
	Pq85FWNwedVy7WbwADXuhCi5AalHaeA8BItYZXU8TBsnGTL/27YR3IjOFM8aLbcuEBfH
	vue2VJIumPPo5W/XSCMTCDctjN388BaVOqm/r9g4UTsj6qd1HAo9sfL1Id/9/1qG5Ayh
	DLgSeUOMyn7K1+UDo/VCCQPQEipB+xDFHBY7WEPTff/gJBGFPfWpuMBqym7A/IxZazkP
	XYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JSIXxPCHlmmyoUlDNjA/XSMfbuUgRcZFeYT8EHuN74o=;
	b=FP8yZ/mDMWNM5IuL6fyTjv1Rw98UlmDogEGOfB05i/nblbQmwDppNrmL72B/DODioz
	wTtcCTx5SCiU2QX1XvzIBu1zxAY7uEu26zdVseI3yw0sKDQPVrCo2jHEzz7rFw38XG77
	7A/hDjuIVrntL89QUTOP4NgSGSdJZexjUyL3nbaxI7rf6XRA+Znpqo0XeNaxigjPGW0x
	9RQSXZPdWpF97k6zMigkGxfZpirgXIRphJqDoKBQMfiQPqvQk5r4P/W9MJu3DihvT7oT
	uHVOVclkjVrXA8iW2FF6nZGaTblPG74nQ2w7CD8jGvAcUmM+PGK3tdHn3z32HOS6G+4f
	TCyA==
X-Gm-Message-State: AFeK/H2rt3YH3gt5uh3hbjFnRh7ZboRRNIB3wc6ryFVXjwHh+Ni/QqoaU4PKszCTC3mw5w==
X-Received: by 10.99.108.74 with SMTP id h71mr34515500pgc.99.1490077961627;
	Mon, 20 Mar 2017 23:32:41 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:23 -0700
Message-Id: <20170321063227.11565-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] libnice: Upgrade to 0.1.13
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:40 -0000

works with gst1x therefore unblacklist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libnice_0.0.13.bb => libnice_0.1.13.bb}       | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.0.13.bb => libnice_0.1.13.bb} (62%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.1.13.bb
similarity index 62%
rename from meta-oe/recipes-support/farsight/libnice_0.0.13.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.13.bb
index c4d4cd2b8..48c8221a3 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.13.bb
@@ -2,6 +2,8 @@ SUMMARY = "Interactive Connectivity Establishment library"
 DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
+SRC_URI[md5sum] = "3226faeaf48a9150ada00da2e2865959"
+SRC_URI[sha256sum] = "61112d9f3be933a827c8365f20551563953af6718057928f51f487bfe88419e1"
 
 LICENSE = "LGPLv2.1 & MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
@@ -9,21 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-PR = "r4"
-
-DEPENDS = "glib-2.0 gstreamer"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
 
-inherit autotools pkgconfig gtk-doc
-
-EXTRA_OECONF = "--disable-gtk-doc"
+inherit autotools pkgconfig gtk-doc gobject-introspection
 
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
 
 do_configure_prepend() {
     mkdir ${S}/m4 || true
@@ -36,9 +34,3 @@ do_compile_append() {
                   $i
     done
 }
-
-
-SRC_URI[md5sum] = "e5b9f799a57cb939ea2658ec35253ab9"
-SRC_URI[sha256sum] = "d8dd260c486a470a6052a5323920878a084e44a19df09b15728b85c9e3d6edf0"
-
-PNBLACKLIST[libnice] ?= "Depends on blacklisted gstreamer"
-- 
2.12.0


