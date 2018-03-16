Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8534A719E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 03:07:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g8so467072pgq.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 20:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eruLKgtKqqRMmcYxrsifRyTe8rBVmg70Hs8BeXh+ln0=;
	b=XwCULk9Cd6ECDwIJTwubJd11/A6RVYxQ8OKflgNtghVGPY6a8EpOq5+LoRBOz1z0K0
	SYuXeMtDk140LV9WDTRBldHLjV+S/C+M0bBfBhBtm9kJ+kLE3DBbLZbtyT7zLvbAMNS7
	Qzszxrmtork1xD0vorN5YjjwuNvxWaCWWfqc4YJk8dPmfIJrf/mZEs8J8nEcB4cEf7ZQ
	kk2MXdN6HJ1f0NZ+sc7301PkJxcV6mSjyRDGKo38E4AtGdbCwlu8DjdD6GJigAqbqjG7
	PBk9342G/oAXPQP3OrsrGEKzU78+/YdCDGCLtTVhzno+R25IL8qIC1XVjQ2GNwgUMots
	jREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eruLKgtKqqRMmcYxrsifRyTe8rBVmg70Hs8BeXh+ln0=;
	b=O8OX62y7fhxUiiSq6gFqAR67eaPoO03jTovGGRzOWezPSJyUUBeuhZfS9tN3hF2g2/
	Eje9S8R9KxmUGsFcYRfJP9RI2zrxVGJCpKX4B/SwqEIJHURv6vGLf0NBJqoQbfvoRen2
	dYYrzCkuSGdnzmqJALh53AurveHooKzPCse1f+RO6sgBuZSYDcpmap6aon9T+/BbqWMk
	iKeIdAJtwdlGJy/6nXfTF2e8n9j7xktexH/8NeQXVz8mIhVn2H0j9Lg46WGzuebF3eiz
	1r2Fof2C5+lZCU6WH02LV4SGmCYCYUv+tyl2XkAN67663df9y9nZlecyRcxfpNkE7aNz
	hLjA==
X-Gm-Message-State: AElRT7GEF/+/idtRn62Tr1OfcbkuWPsm3Ql5Db1AYsy3of/SkGC0q4lQ
	yrH+2b8Csf873dNcUvVNWXS6cQ==
X-Google-Smtp-Source: AG47ELun9GnORD0rJ++WXV105gE8A9aECwekq+n721IIHA7Sw8LeERCOl9Aj69cVITJFlcPXU3Pyaw==
X-Received: by 10.101.85.143 with SMTP id j15mr164132pgs.387.1521169659344;
	Thu, 15 Mar 2018 20:07:39 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q87sm13298953pfa.29.2018.03.15.20.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Mar 2018 20:07:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Mar 2018 20:07:30 -0700
Message-Id: <1521169650-31311-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] hostapd: fix LICENSE + misc recipe updates
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
X-List-Received-Date: Fri, 16 Mar 2018 03:07:38 -0000

According to the COPYING file in the top level of the hostapd source
tree, hostapd was re-licensed from dual BSD/GPLv2 to BSD only in
February 2012. This change has apparently gone unnoticed for the
past 6 years, but fix it now.

Also use pkg-config to find libnl headers (instead of hardcoding),
append to base do_configure (instead of over-riding), respect OE's
default CFLAGS (instead of ignoring) and make some minor formatting
tweaks to bring the recipe more in line with the OE Styleguide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/hostapd/hostapd_2.6.bb    | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
index c3a1ead..7d3260a 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
@@ -1,15 +1,10 @@
+SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://${B}/README;md5=8aa4e8c78b59b12016c4cb2d0a8db350"
-DEPENDS = "libnl openssl"
-SUMMARY = "User space daemon for extended IEEE 802.11 management"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://hostapd/README;md5=8aa4e8c78b59b12016c4cb2d0a8db350"
 
-inherit update-rc.d systemd
-INITSCRIPT_NAME = "hostapd"
-
-SYSTEMD_SERVICE_${PN} = "hostapd.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+DEPENDS = "libnl openssl"
 
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
@@ -19,16 +14,27 @@ SRC_URI = " \
     file://key-replay-cve-multiple.patch \
 "
 
+SRC_URI[md5sum] = "eaa56dce9bd8f1d195eb62596eab34c7"
+SRC_URI[sha256sum] = "01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d"
+
 S = "${WORKDIR}/hostapd-${PV}"
 B = "${WORKDIR}/hostapd-${PV}/hostapd"
 
-do_configure() {
+inherit update-rc.d systemd pkgconfig
+
+INITSCRIPT_NAME = "hostapd"
+
+SYSTEMD_SERVICE_${PN} = "hostapd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+do_configure_append() {
     install -m 0644 ${WORKDIR}/defconfig ${B}/.config
 }
 
 do_compile() {
-    export CFLAGS="-MMD -O2 -Wall -g -I${STAGING_INCDIR}/libnl3"
-    make
+    export CFLAGS="-MMD -O2 -Wall -g"
+    export EXTRA_CFLAGS="${CFLAGS}"
+    make V=1
 }
 
 do_install() {
@@ -42,7 +48,3 @@ do_install() {
 }
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
-
-SRC_URI[md5sum] = "eaa56dce9bd8f1d195eb62596eab34c7"
-SRC_URI[sha256sum] = "01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d"
-
-- 
1.9.1


