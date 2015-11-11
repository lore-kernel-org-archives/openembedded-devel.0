Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 87EE0771A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:45 +0000 (UTC)
Received: by wmww144 with SMTP id w144so173226323wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cDpfVF+2p0QTutd4MdINoReinvscquILcPZJoBPCubA=;
	b=kqHDPY4Mfn85QDt48J5jXGZcPMlxgqy5wO8E8/Ia2hB2ispXdc142LULqkw7frV158
	GyK8EELLnWjI1IzMMGjNPtn+pQ2VDLGKMPiuNXLw4LWG910ej4kuZpypsxfU+QITOXNt
	csuYNMrn+AxIQZJYfyPglsw77cbFVQDQeh7g+xnohK9jrDzlvuHfE5piw8XhnQZOcSF6
	A+RzVPazPztEVVheAGYvvBaBWUz3ZU/W7LGkTP7xN2iZrlN7URHLeFRKYSG4k+cWiSLi
	x1OEag7Co3pBnWOzGyTokV95Y4yqydH6cDcMClvgQBeN0O/N1ncazhZm5rsu4ynH4zVh
	n2vg==
X-Received: by 10.28.55.209 with SMTP id e200mr38315691wma.79.1447271325278;
	Wed, 11 Nov 2015 11:48:45 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:44 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:19 +0100
Message-Id: <1447271300-4153-17-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 16/17] networkmanager: use bluetooth from distro
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:45 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 02fe500..7f57826 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
 
 DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
 
-inherit gnomebase gettext systemd
+inherit gnomebase gettext systemd bluetooth
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -52,6 +52,7 @@ EXTRA_OECONF = " \
 # PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
 "
 PACKAGECONFIG[systemd] = " \
-- 
2.4.3


