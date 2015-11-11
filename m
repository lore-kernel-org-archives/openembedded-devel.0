Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C6C21771B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 20:42:12 +0000 (UTC)
Received: by wmec201 with SMTP id c201so63509630wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:content-type:mime-version
	:content-transfer-encoding;
	bh=e6ApRTgphKAtI0HCZkKN4UpRbt9w3rAPaEcB7VHk8wc=;
	b=nA9BR7V3e6GSIjr0TpTtA0TM/Xc5LksJqAqWwHO3mFuQzdaiZJ1NrBmlioIcqPVPEr
	7bN4v9X5ps98Keep3z2i6f0eNUxcKrAPLWp8NzIDfOinrBEcOS0YV9YqN73gHj6TWGNP
	0Qe+CiJIddpBPV5OpesXSzP6/am6Wp/3hhJOcF+9aGi5BzDQZoLhF0avITtuNkNtqtR1
	NLUZWz9STy/Cg0K3v9fBwmT3x9VifccoNp+0aUf7r7N9T6HDLnPiTdSWoAX0PKFPylfK
	DTsMa2jCoZCkCvt+tqXX4Z6ppAg67bDQCBHgk7DfdgsMpb6zWRLCkwpIVc/Y9w4GoPy7
	X/xQ==
X-Received: by 10.28.61.213 with SMTP id k204mr24851091wma.5.1447274532280;
	Wed, 11 Nov 2015 12:42:12 -0800 (PST)
Received: from chl500346 (c-82-192-248-24.customer.ggaweb.ch. [82.192.248.24])
	by smtp.gmail.com with ESMTPSA id
	b1sm10799774wjx.12.2015.11.11.12.42.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 12:42:11 -0800 (PST)
Message-ID: <1447274530.2528.135.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 21:42:10 +0100
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 11 Nov 2015 20:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes
-connectivity/networkmanager/networkmanager_1.0.6.bb
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

