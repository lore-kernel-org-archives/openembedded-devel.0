Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIUjS-00013w-TN
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:14:49 +0100
Received: by ewy6 with SMTP id 6so550108ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=BJ6LE9aIIy/Mvex323DkPsAMGKt1NOXUzh4IxaVH8Jo=;
	b=G/9CMi83IDf/8eVk9qtrfOJthQfqaiVVtA0xfQ7XcSRTBUUy2fiO22jX5HnP6Jip05
	QAYIpX2BwKzOV881IqY2Bm/wsfRNs04uc9Nq9bxd3+f2p8hk0LHoAFGMM0WOXNecvZaG
	npClIMY9p8OcWDeYwu6JIDtH82K6ogFTDF7K0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=i6iQ9j0ayxMBJ2sqVfT8MqeqTBHRqRNGB84fml88iu1p2DzlkRCSoxAi8XEYad53Y7
	Bue5Ku7l0r3w+B0eDN6hugJTJ2UdZEwL5nKMoDZWV19+GtQh+7+IzYZUsxFnKEQa2BHB
	bMt0CCynlZbkLSXaOBOn1r96yJKiPCbSjWav8=
Received: by 10.213.10.72 with SMTP id o8mr6755737ebo.90.1289949211233;
	Tue, 16 Nov 2010 15:13:31 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v51sm1656021eeh.22.2010.11.16.15.13.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 15:13:30 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 00:13:25 +0100
Message-Id: <1289949205-6664-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gtkmm: added gtkmm-demo package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2010 23:14:49 -0000

There were some unpacked files in /usr/share/gtkmm-2.4/demo/
This patch addes a new package gtkmm-demo and stuffs the files from
that demo dir in it

Also added INC_PR

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gtkmm/gtkmm.inc       |    5 +++++
 recipes/gtkmm/gtkmm_2.12.7.bb |    2 +-
 recipes/gtkmm/gtkmm_2.14.1.bb |    2 +-
 recipes/gtkmm/gtkmm_2.18.1.bb |    2 +-
 recipes/gtkmm/gtkmm_2.20.0.bb |    2 ++
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes/gtkmm/gtkmm.inc b/recipes/gtkmm/gtkmm.inc
index f2d1246..0cd314b 100644
--- a/recipes/gtkmm/gtkmm.inc
+++ b/recipes/gtkmm/gtkmm.inc
@@ -7,6 +7,8 @@ DEPENDS = "atk glibmm gtk+ cairomm"
 
 inherit gnome autotools pkgconfig flow-lossage
 
+INC_PR = "r2"
+
 LIBV = "2.4.0"
 
 do_install_append () {
@@ -15,5 +17,8 @@ do_install_append () {
         install -m 0644 gtk/gtkmmconfig.h ${D}${includedir}/gtkmm-2.4
 }
 
+PACKAGES =+ "${PN}-demo"
+
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
+FILES_${PN}-demo += "${datadir}/*/demo/"
diff --git a/recipes/gtkmm/gtkmm_2.12.7.bb b/recipes/gtkmm/gtkmm_2.12.7.bb
index 8c17952..5406e41 100644
--- a/recipes/gtkmm/gtkmm_2.12.7.bb
+++ b/recipes/gtkmm/gtkmm_2.12.7.bb
@@ -1,6 +1,6 @@
 require gtkmm.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 # Hack! Remove once gtkmm likes libtool 2x
 do_configure() {
diff --git a/recipes/gtkmm/gtkmm_2.14.1.bb b/recipes/gtkmm/gtkmm_2.14.1.bb
index ec9ea23..0c82fa3 100644
--- a/recipes/gtkmm/gtkmm_2.14.1.bb
+++ b/recipes/gtkmm/gtkmm_2.14.1.bb
@@ -2,7 +2,7 @@ require gtkmm.inc
 
 DEPENDS += "pangomm"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 # Hack! Remove once gtkmm likes libtool 2x
 do_cconfigure() {
diff --git a/recipes/gtkmm/gtkmm_2.18.1.bb b/recipes/gtkmm/gtkmm_2.18.1.bb
index 13fc95b..631a59a 100644
--- a/recipes/gtkmm/gtkmm_2.18.1.bb
+++ b/recipes/gtkmm/gtkmm_2.18.1.bb
@@ -2,7 +2,7 @@ require gtkmm.inc
 
 DEPENDS += "pangomm"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF = " --disable-documentation "
 
diff --git a/recipes/gtkmm/gtkmm_2.20.0.bb b/recipes/gtkmm/gtkmm_2.20.0.bb
index cc33fc4..24c40af 100644
--- a/recipes/gtkmm/gtkmm_2.20.0.bb
+++ b/recipes/gtkmm/gtkmm_2.20.0.bb
@@ -1,5 +1,7 @@
 require gtkmm.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[archive.md5sum] = "c0cb0ea5bc1ab511d9b2461083f0445f"
 SRC_URI[archive.sha256sum] = "c1199bbee423d6f0ef9b5e88973c5620a1e1c52f9f1298dffcfa36284a7fd91a"
 
-- 
1.6.4.2



