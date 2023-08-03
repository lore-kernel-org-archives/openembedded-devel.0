Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21078C04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:48:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9948.1691052532898171169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nq/KaxVN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 620D01C0011;
	Thu,  3 Aug 2023 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDeREQyXYdvLfgSuIYJXb3st2MkRVXV9BQRG1e0vnIs=;
	b=nq/KaxVNXuabSIkO9VNtsa8zL13D0Sg9+/9kcEWNlPbOKRb7SbeL0mudKQgsriB2N68725
	i3jBFq0MdccDO8gakWYPImVUsyBgCz0SEZ9/6a5eAVc6MHXT88CfY6AZc0bIC5gmVJnAFK
	x+dPeuV4PpXqK4zD2fc7AxVhNi81UBwMMIH6GC0giYXHwztgUEkdFhUOUliR7fxO20VdEA
	NJ5yK5MWpAdENWd3HPE4dNtYx5KGeULchTavtD0PRRCVgBGON0GWFrlHdVWlQBzIDPVigB
	Z+fu3XtFpdLMvLP96YcaeKfIyxugiOLGg37fU46IsYhcOqgl7AQDykXYj+b9Ew==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/7] [meta-networking] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:35 +0200
Message-Id: <20230803084839.3012610-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104213

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb | 1 -
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb          | 1 -
 .../networkd-dispatcher/networkd-dispatcher_2.1.bb               | 1 -
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb       | 1 -
 meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb | 1 -
 5 files changed, 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index 03eff43dd..9239bd81c 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -2,7 +2,6 @@ SUMMARY = "Header-only C++14 library that gives you an embedded HTTP server"
 DESCRIPTION = "Cross-platform, efficient, customizable, and robust \
                asynchronous HTTP/WebSocket server C++14 library with the \
                right balance between performance and ease of use"
-AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE = "https://stiffstream.com/en/products/restinio.html"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index adc2a72ee..fe9c038f5 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -1,6 +1,5 @@
 SUMMARY = "A client for the Cisco3000 VPN Concentrator"
 HOMEPAGE = "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
-AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
 SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
index a83dad350..65bf91c7e 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
 DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
 more limited in the types of events it supports due to the limited nature of \
 systemd-networkd(8)."
-AUTHOR = "Clayton Craft and others"
 
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 0b9e05b32..c53d1b805 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -7,7 +7,6 @@ These addresses are allocated from the 169.254.0.0/16 address range and \
 are normally attached to each Ethernet device in your computer. \
 Addresses are assigned randomly by each host and, in case of collision, \
 both hosts (are supposed to) renumber."
-AUTHOR = "Anand Kumria <wildfire@progsoc.uts.edu.au>"
 HOMEPAGE = "http://www.progsoc.org/~wildfire/zeroconf/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index d4f76850d..528289b7f 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -6,7 +6,6 @@ DESCRIPTION = "This is a parser for HTTP messages written in C. It parses \
               interrupted at anytime. Depending on your architecture, it \
               only requires about 40 bytes of data per message stream (in a \
               web server that is per connection)."
-AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE = "https://github.com/nodejs/http-parser"
 SECTION = "libs"
 LICENSE = "MIT"
-- 
2.34.1


