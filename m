Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4E0771BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:20:08 +0000 (UTC)
Received: by wmww144 with SMTP id w144so176000814wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8cnULDIdxypRCESz8DpE3PN+FgNp56JZ4Xoh90HJ0wY=;
	b=WxuArOw2rek9a7h+pQs8zmQg8aedrlCAzRnGX3/9EKkK8Y2JPoyWqh8kYRtE8J0HRr
	0/+KCFGg6eMyNCVp+kYAIrew8W6S7htQB2qkdhy6gJUQomxxGbwJf+LVz/EQBpgJlnUa
	Ndq2qyYI2fS9AKn7chAf272PmRCeQoAE12zTGeJmzUSP+92LXf2qtUIA1eAdfFoDwOtG
	a6Dh1QACScG/sFmsoRG1k5Uege1Vu1bI1LoqZSUbMfzr4cMNArcQ1Fjn4QhCrpcEWb9N
	xp8v5RZ0aZlGfZBtu6Qp0QOQ9MUch+aBqTstRlwuFdyg+LfEPapka0ocu6vxw1Y3YSCy
	1Ikw==
X-Received: by 10.194.76.178 with SMTP id l18mr12527306wjw.75.1447276808453;
	Wed, 11 Nov 2015 13:20:08 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	d10sm10938053wje.14.2015.11.11.13.20.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 13:20:07 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 22:19:59 +0100
Message-Id: <1447276799-13086-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: Re: [meta-oe][PATCH V2 15/17] networkmanager: package for adsl plugin
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
X-List-Received-Date: Wed, 11 Nov 2015 21:20:12 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 326ac31..0101b36 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -74,12 +74,17 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion ${PN}-nmtui ${PN}-nmtui-doc"
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
+  ${PN}-nmtui ${PN}-nmtui-doc \
+  ${PN}-adsl \
+"
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
 FILES_libnmglib += "${libdir}/libnm-glib.so.*"
 FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
 
+FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
+
 FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
-- 
2.4.3


