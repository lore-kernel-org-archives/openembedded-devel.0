Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC676C4A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJYZ6Xxvz4x
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548841923;
	bh=4YQRl8bcC+4lXKSB9BulQnrdTYOfa78EiIqdT5QTKWo=;
	h=From:To:Subject:Date:From;
	b=Oz5YzrvsQB89eRxrvpKd6Z7BbdsWBkTGmedSKImLrznpAvvTOM+wrrT9mn0I7W3K6
	mE4AkkAYktO4XZ1UkpL9kvZqN1yHI4Wp6oRzw6CenNO0uPMZrBqinZ7XSXxpJ+yadT
	12iCVCj+nkTFW5oaCS0s0ixW6V5nQ+FUhaCGtetZTC+5mB5vFmwtC+YTHpzMlMwNbA
	StaCRo/DbVZD9iGSGoMKND7wfqbEbL5mQoU4NRH56R2YUu4G9lXXouE92S8MvOMG2q
	62snXx5KuGI5Q8RqOyCL+ApL3xcOdJFf7PX2j0Q2tJO43lTNJubV5WkId1rxCjAUo9
	PUvqg52WwUs5bm5mGZEgxMvGOj7Gn4Bv6FDVBWrS29fmtVAyPPs6rnCqui2kasOkRK
	P2AffauHiBNwQy1rm/IFb/eX7w/TOG0vy+oqVyv9YKz7SKeBU0A7AtSUoVC29V8C3F
	kaVc7vIooK5R2r/Z66H8jvDy91kkO3huJ6Im1Vg1n8AQxv3UpdqNzGVa1UuNmU7ZyO
	HmB5V/UawuZENb9477FaBf+02cdOP8Q8Nrwb78EJD6t/mA2879tsqx/RQJElnzujeO
	dfFe6x8bGepFOXVeYybPS4OOiwCUJU1TxNgKcjFHx1GoELOUA2Qtx/3wdOo77/I2CP
	/RXgF5bKP5llUTpozsvQTQRU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:52:00 +0200
Message-Id: <20190130095201.11965-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] Fix the libnm* packages
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
X-List-Received-Date: Wed, 30 Jan 2019 09:52:02 -0000

- libnmutil, libnmglib and libnmglib-vpn no longer exist
  after the 1.10.10 -> 1.14.4 upgrade
- add a package for libnm

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index f1826c68e..9efe1fe49 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -90,14 +90,12 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
+PACKAGES =+ "libnm \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl \
 "
 
-FILES_libnmutil += "${libdir}/libnm-util.so.*"
-FILES_libnmglib += "${libdir}/libnm-glib.so.*"
-FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
+FILES_libnm += "${libdir}/libnm.so.*"
 
 FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
 
-- 
2.11.0


