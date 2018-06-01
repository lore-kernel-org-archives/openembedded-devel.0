Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DE949745D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 10:35:44 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l1-v6so1819323wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BB+12MH4jZFVeB74ktWv/lVhEW7i54rsyg96iQr5Ns4=;
	b=VFTEKzLnpjOO/AS2V/q40F/PbXjhSPjuJNvIQ/S1OdN5twL3u7smgPMPJT5qJFcasr
	bzNTj69espoSdX5dWl6xq/3FxLn3P6liESbjWOyPHyVCqgEFH6ZZpjg59/0p7wdmC/26
	sY8W6rnHvO+ujo5OxtKCtFXzMTmXaqePGCTk2lOpNfkCI3Aa1kiaPZIPLsu3yDeAzqtk
	HoHHcYW2sfoR42oQlGfFpt4sa7U8rNxkBZl9BIvO06cneaPXfM0HWYRpWsLyy2s8QJj/
	tf+Q8rSGWRl68T7skOdK2RWlGNSUlINnDon9oRWNZWuMn+VMXhw9JbktEclnf6uFLgi7
	jafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BB+12MH4jZFVeB74ktWv/lVhEW7i54rsyg96iQr5Ns4=;
	b=LyMdUjDRJNQG4G/IV9BmODjBwbZu3a/AGILu7X5V6InpaaHwawbeph8vMWDKOBKj9W
	eidJV+Au8m4XvzCEyohCVdXNfA8hWG1xfla0EhK5CRd+pq9H6XIZxKkSKMBKS8HVOJab
	D7RGriIPL8svWYGQc9ssz7nQSlad7tilsxFAR2cv+XCK8QpgO8Mbkkv6H1WBUF0FBk9G
	1tn+h9E8ip73Jk4z3Hj3WjGx3fy8eY8z/Ik9+V8kgn3JYZkZatqCQF5W7zzidfKdpsIX
	zb9m5fJDp5KqTgTh1M739TvlbVS4ONPz8CdUYYO4ca2BgQR57SR8PG0yW4lSujas/isD
	l4dQ==
X-Gm-Message-State: ALKqPwc1YFfWMpwioGxOOSfKFOfL56o+KlIXKQFZmFgnc9gE0hB4VyUV
	kCDby5vGf9DoIj7HIdFcmHv/7A==
X-Google-Smtp-Source: ADUXVKJfx0DbXZg/QrZ5u30bVptXDJfoguXc1Unz7aMJBh7zBFwiDzydYv62EgCKIVZjnZK5WroTJg==
X-Received: by 2002:a50:8307:: with SMTP id
	7-v6mr11951157edh.263.1527849345113; 
	Fri, 01 Jun 2018 03:35:45 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b56-v6sm23722461edd.85.2018.06.01.03.35.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 03:35:44 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 11:35:39 +0100
Message-Id: <20180601103540.13159-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH 1/2] mosquitto: remove example files from installation
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
X-List-Received-Date: Fri, 01 Jun 2018 10:35:45 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

The mosquitto makefile install a lot of example configuration files
on the image: remove those

also move the creation of /etc/mosquitto into the recipe

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 ...move-example-files-from-installation.patch | 36 +++++++++++++++++++
 .../mosquitto/mosquitto_1.4.14.bb             |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/0003-makefile-remove-example-files-from-installation.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/0003-makefile-remove-example-files-from-installation.patch b/meta-networking/recipes-connectivity/mosquitto/files/0003-makefile-remove-example-files-from-installation.patch
new file mode 100644
index 0000000000..ebe9044523
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/0003-makefile-remove-example-files-from-installation.patch
@@ -0,0 +1,36 @@
+From 79627479a30a96ed2326b680eb575306b621eeb9 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Fri, 1 Jun 2018 11:11:45 +0100
+Subject: [PATCH] Makefile: remove example files from installation
+
+also remove /etc/mosquitto directory
+---
+ Makefile | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1fc0805..76f81b1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,18 +39,9 @@ install : mosquitto
+ ifeq ($(WITH_DOCS),yes)
+ 	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} install; done
+ endif
+-	$(INSTALL) -d ${DESTDIR}/etc/mosquitto
+-	$(INSTALL) -m 644 mosquitto.conf ${DESTDIR}/etc/mosquitto/mosquitto.conf.example
+-	$(INSTALL) -m 644 aclfile.example ${DESTDIR}/etc/mosquitto/aclfile.example
+-	$(INSTALL) -m 644 pwfile.example ${DESTDIR}/etc/mosquitto/pwfile.example
+-	$(INSTALL) -m 644 pskfile.example ${DESTDIR}/etc/mosquitto/pskfile.example
+ 
+ uninstall :
+ 	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} uninstall; done
+-	rm -f ${DESTDIR}/etc/mosquitto/mosquitto.conf
+-	rm -f ${DESTDIR}/etc/mosquitto/aclfile.example
+-	rm -f ${DESTDIR}/etc/mosquitto/pwfile.example
+-	rm -f ${DESTDIR}/etc/mosquitto/pskfile.example
+ 
+ dist : reallyclean
+ 	set -e; for d in ${DISTDIRS}; do $(MAKE) -C $${d} dist; done
+-- 
+2.17.0
+
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
index 13ce3811d4..ea76c36e61 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
@@ -13,6 +13,7 @@ DEPENDS = "uthash"
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch \
            file://0002-uthash-remove-in-tree-version.patch \
+           file://0003-makefile-remove-example-files-from-installation.patch \
            file://mosquitto.service \
            file://mosquitto.init \
 "
@@ -47,6 +48,8 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir}/system/
 
+    install -d ${D}${sysconfdir}/mosquitto
+
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
     sed -i -e 's,@SBINDIR@,${sbindir},g' \
-- 
2.17.0


