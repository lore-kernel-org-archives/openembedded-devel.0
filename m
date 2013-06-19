Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB3F6AD45
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:57 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so3386101eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tc9oSstnXdSPFQ8ZesRDZwAJQeT0v2hoAdbWBW2o7VU=;
	b=vj83VWTmCdQ9kouIhUmxMSjopuiY1iIYli1u5f2rfskGuSRjRFu2HmYmf8PSLuuShL
	yugI2zKF/2EFRiGuWxgLpLrpiRhRJp927+fqqwIsJWoqzD0E+9tQWCQ4zQtDz4WRz25q
	piveZ3ae89Zs0e9j8LZ4+DIMaDP1F1B2wzAg265zhSjv2zf1uKKpzPGnA6rU3BHZ+SSW
	+UHhRD3g1jJUqocsPBdXepQhaoleAM0/QqMe22kNiSX9LSmrJ3JOfBIVTn/wlbQOwuSf
	e85VmLmpAAl43iShBcyGpWr3zgrXR39PvuTWm37T+b6Ht/3/WONcya3r7gdshWjV35Yc
	BLtA==
X-Received: by 10.14.182.132 with SMTP id o4mr3549675eem.94.1371662998290;
	Wed, 19 Jun 2013 10:29:58 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:19 +0200
Message-Id: <1371662967-31734-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 12/20] networkmanager: replace absolute paths
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.8.0.bb       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 6957f35..07f0c28 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -50,14 +50,14 @@ do_install_prepend() {
 }
 
 do_install_append () {
-    install -d ${D}/etc/dbus-1/event.d
+    install -d ${D}${sysconfdir}/dbus-1/event.d
     # Additional test binaries
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/test/.libs/libnm* ${D}/usr/bin
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/test/.libs/libnm* ${D}${bindir}
 
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
-    install -d ${D}/etc/NetworkManager/VPN
+    install -d ${D}${sysconfdir}/NetworkManager/VPN
 }
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
-- 
1.7.4.4


