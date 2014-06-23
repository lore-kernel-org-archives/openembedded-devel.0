Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ECE8766078
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 19:57:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5NJvi8b008938 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LOfiNpnK16K2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5NJvdC4008924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:40 +0100
Message-ID: <1403553453.2104.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jun 2014 20:57:33 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-oe][PATCH] libbonoboui: Add missing intltool-native and gnome-common dependencies
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
X-List-Received-Date: Mon, 23 Jun 2014 19:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 74dd908..6c2d67a 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -7,7 +7,7 @@ inherit gnomebase pkgconfig gtk-doc
 SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
 SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
 
-DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade"
+DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade gnome-common intltool-native"
 
 FILES_${PN} += "${libdir}/libglade/2.0/*.so"
 FILES_${PN}-dev += "${libdir}/libglade/2.0/*.la ${datadir}/gnome-2.0/ui \



