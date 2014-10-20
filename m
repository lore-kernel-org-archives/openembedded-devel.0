Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4888F65CDB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:27:56 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so5443691wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0L4Odk1ZOPhwt9ie9Igr9fV+tSDDSfm7+uLcM1A9Ujg=;
	b=sn5rQvDkrN5IkGhLxqvxytCCa72M95rRI6SHcXVK3lNFi5r+79eyx9qBaP3uPQ8c+J
	awdD52C+tkO59ezPVhB6Uv8C8rYTLaUBZoN1J8CMyjHHRNJrayevC2WDqZ16ZieRU2iW
	1wKIi2nHZdKKhQ8xOiyOwuYsbN0+Mcj1h/j002BatPUiBGXwLcCQP2jVhVBndFul8Xrv
	sIGptua1v++3EzxYRimeuwsXC+vRtiGgi+XxQjAIGle4zzZ+5bYHZ1h5aTwq+j/UzIwP
	wKCYWPSVwYxiw+RsJ85beG9vr8iS6+yuKmDAdLpJUlo6nHBebFKXdoxeQy9hSapKxlbQ
	re3w==
X-Received: by 10.194.90.144 with SMTP id bw16mr3287707wjb.133.1413811677057; 
	Mon, 20 Oct 2014 06:27:57 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	fm10sm9621757wib.21.2014.10.20.06.27.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 06:27:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 15:27:45 +0200
Message-Id: <1413811666-20325-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] networkmanager: make shared connections work
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
X-List-Received-Date: Mon, 20 Oct 2014 13:28:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* set correct path for dnsmasq
* add dnsmasq to RRECOMMENDS

this popped up when testing access point enabled for network-manager-applet

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
index 0792e8e..8d37c98 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = " \
     --with-dhclient=${base_sbindir}/dhclient \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
+    --with-dnsmasq=${bindir}/dnsmasq \
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
@@ -80,7 +81,7 @@ FILES_${PN} += " \
     ${systemd_unitdir}/system/NetworkManager-wait-online.service \
 "
 
-RRECOMMENDS_${PN} += "iptables"
+RRECOMMENDS_${PN} += "iptables dnsmasq"
 RCONFLICTS_${PN} = "connman"
 RDEPENDS_${PN} = " \
     wpa-supplicant \
-- 
1.8.3.1


