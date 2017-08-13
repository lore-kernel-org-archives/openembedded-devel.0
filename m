Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8E2560778
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 11:37:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so11423445wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 04:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WRYa76UFshLB5R3KvqTWoN13f2mO3vfuunbmauc3zlM=;
	b=KwuE3srlfO7iaRX/ms7IG/UJALkmx7JYV6Qk5I29Fc43105okGFHCC/Dg+9OwBKX/z
	J23ERivlzi/m2iOgOxchN2PltuNeDeSMIfYAP3St5G2Op1GxmIVnKqlGVtF14F0EQApN
	kRicFXxMm//pNzWAZnnICWjDzW4WWBUpo/w5mNfRmSLsdZiM73dnwH5uvKn2R7fE2IM/
	60r7q0Frv4pjVOxMmidl/KAtA/YnjTt4KECiXlePcskKXxx44Dh6EfDTOVxjaVT0NcaI
	Ly+4vJlSW2Ad5wUFmewxsckD9i7eJLTAio1tbAQEkRPojEsBk63/C1IQYOZ628OoxUTw
	TQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WRYa76UFshLB5R3KvqTWoN13f2mO3vfuunbmauc3zlM=;
	b=jSaIalusxnLpRhMTkFozde04rggMDgR71k1mJQc7l+HfDiidm+uN6I4eWypDUP/28E
	BoJqYXNGv4T2SMomMTc/u2Lzi8F0RO11e5ZET6S/huUS96Jl0NbbYlugKvg6C5hUWhlT
	ohlNTACCWDPcT4J/XhlFimB7OKhWva3cwQiuIIVfVAb0PmgsGLCi66n53l+JrDMQJwYC
	mj5/q9UC6MLla+VTE4tnmRtnyoPXrIOH5XUTDwgjopbbDoMU/MyNYhkSRtzQOlsldCBE
	Ml0unlqkVY5/N6NyOG2HcVqcArST3h74iQRiZkF6bi1NSlu40Qzb/dxts+Az0jagyhm9
	68cA==
X-Gm-Message-State: AHYfb5ijofSZbElKRZZ3gk8tcKYCHk6OXPNH+H0qCr35WoeVDoLkv0Jv
	t7qKiK+/TNiluKyG
X-Received: by 10.28.158.148 with SMTP id h142mr2256368wme.102.1502624223208; 
	Sun, 13 Aug 2017 04:37:03 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p20030046E902666856A7C2EFFD165696.dip0.t-ipconnect.de.
	[2003:46:e902:6668:56a7:c2ef:fd16:5696])
	by smtp.googlemail.com with ESMTPSA id
	d26sm5812501wra.92.2017.08.13.04.37.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 04:37:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Aug 2017 13:36:51 +0200
Message-Id: <20170813113651.2987-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170813113651.2987-1-schnitzeltony@googlemail.com>
References: <20170813113651.2987-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] geany-plugins: update 1.30 -> 1.31
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
X-List-Received-Date: Sun, 13 Aug 2017 11:37:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../geany/{geany-plugins_1.30.bb => geany-plugins_1.31.bb}       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.30.bb => geany-plugins_1.31.bb} (96%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
similarity index 96%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
index f01dda8..27fe860 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
@@ -25,8 +25,8 @@ DEPENDS = " \
 inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "13f8e5d900b4911059385649b8dde887"
-SRC_URI[sha256sum] = "8adb90645d273d9549e1fa99b69ea87dc1fd612f7467eb18eee11a6b30c9ba5b"
+SRC_URI[md5sum] = "808f9048b77fd9704569ed2ba12a56e9"
+SRC_URI[sha256sum] = "76bd9e803db5a626b86669f08330cf95b8cc35057a1cdf65759bc00aef120e25"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
@@ -166,6 +166,11 @@ LICENSE_${PN}-git-changebar = "GPLv3"
 FILES_${PN}-git-changebar = "${libdir}/geany/git-changebar.so"
 RDEPENDS_${PN}-git-changebar = "${PN}"
 
+PLUGINS += "${PN}-keyrecord"
+LIC_FILES_CHKSUM += "file://keyrecord/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-keyrecord = "${libdir}/geany/keyrecord.so"
+RDEPENDS_${PN}-keyrecord = "${PN}"
+
 PLUGINS += "${PN}-lineoperations"
 LIC_FILES_CHKSUM += "file://lineoperations/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-lineoperations = "${libdir}/geany/lineoperations.so"
-- 
2.9.4


