Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 44EDF77194
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:13 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so29565480wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H5tmS1wtqReT0aXnxjSI23k7FlKefqSyMXi0AwHrySM=;
	b=W/g2D0Qy9QJ3dHEtiykv7boOBMTUP22EmvKU0OO2CpY73KCrPhxoblAQ8g47kpA646
	UcxH043nv7tK8FMXEGpVbzKPYLDnRiLcdqEuOGF+HBKK8fHkM/LOsce+trzxJfRqKMgP
	8coWYyLgfdXqMRBM8ohayX1k3qilCwgMvsF9kmpCv3JaORB5tTcokIe2nHoQkkGPr2vd
	LHc97yngVxT/KcwbTzXyfrgjH/IGIqqxiJBqNj1JvWkDikgAF/pRWH8qlB3Fx4eh1vOn
	FfJ8Ckx7JqXGmxQm9w4Ouy4W6bzw+E8+gtLtbnR2s8KQc/ZXEVvNifGiNQLZ3eYUaF+l
	wrmw==
X-Received: by 10.28.0.149 with SMTP id 143mr3301369wma.103.1447192213224;
	Tue, 10 Nov 2015 13:50:13 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:12 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:22 +0100
Message-Id: <1447192164-9399-16-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 15/17] networkmanager: PACKAGECONFIG for adsl
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:13 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 590ce3b..383aae9 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -50,7 +50,7 @@ EXTRA_OECONF = " \
 # the following examples to your local.conf or distro config
 # PACKAGECONFIG_pn-networkmanager = "systemd gnutls wifi"
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
-PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
+PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq adsl \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
 "
@@ -71,6 +71,7 @@ PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
+PACKAGECONFIG[adsl] = ""
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
@@ -131,4 +132,9 @@ SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.servic
 
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
+
+    # Delete adsl plugin if adsl is not in config flags
+    if ${@bb.utils.contains('PACKAGECONFIG','adsl','false','true',d)}; then
+        rm ${D}/${libdir}/NetworkManager/libnm-device-plugin-adsl.so
+    fi
 }
-- 
2.4.3


