Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 54CD3771A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:44 +0000 (UTC)
Received: by wmww144 with SMTP id w144so59046550wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eTCv+sGZdf4/QmlhYseFIz9F3iLb53HTgXYTQ7HU8I4=;
	b=bzWsimWsRxLmbZVIVO2qvkNgTPXxx7Aj+imNArYW5+WC1uyzyocACNXBqghIG61+WV
	X31XTMApu2liO52EGFcmEn43r58wPrUlKbUbdI0Yd9Bjuk/Wu+p5Ke62NfETRTbVWDU0
	/5A0teA8u6T2U9XglJrQCYeSyZwZCVn7lqVpzsRwAZimhyin4FD12CBUYoW/DYH//uB1
	s4qFJj3L9YU98XJA4z8DcYCm5Ofy8HVL81WELVdWL130oBTTx5rfEi161uXCaCuOcolg
	u0QO+WJ2FbzlAe/+RHHcjJnH4CWAhr+g7GDZrzx+URyT/P476Z5iNqtN6EDJ6/MwmFof
	Cnaw==
X-Received: by 10.28.64.11 with SMTP id n11mr3443937wma.37.1447271324247;
	Wed, 11 Nov 2015 11:48:44 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:43 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:18 +0100
Message-Id: <1447271300-4153-16-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 15/17] networkmanager: package for adsl plugin
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:44 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 326ac31..02fe500 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -74,12 +74,18 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion ${PN}-nmtui ${PN}-nmtui-doc"
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
+  ${PN}-nmtui ${PN}-nmtui-doc \
+  ${PN}-adsl ${PN}-adsl-staticdev \
+"
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
 FILES_libnmglib += "${libdir}/libnm-glib.so.*"
 FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
 
+FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
+FILES_${PN}-adsl-staticdev = "${libdir}/NetworkManager/libnm-device-plugin-adsl.la"
+
 FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
-- 
2.4.3


