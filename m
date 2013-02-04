Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2VA9-0003t4-2k
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 00:09:22 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so5354001wey.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 14:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ClLCF7AkgahIlYk7Mu2C3LevN6C7/sWPAb/6Iyc4o64=;
	b=Kng74lCo2hHexbrQjsx7uRtjaKbmfqnvHlSCWyZXmbpU9c5x/g4g457+J8IOb0OfSN
	LWXPw/VF4wpXc9Mrv6LyRjxlRQtE6VPYM4jHTquQMT1efK1fM8zqetdbiY3vlS+DQW7/
	19iFeBiCrv81muiL3QFi/WhuCZcRuAg+vO8EKUw7vOXHu3V7M03Fo+oMLqVVXbL3tIsP
	61jgCAyTlwb6O9p7eiv40Y54L17EprUSc69BmP4h/Z4ACDU9aWj4usvGDzXLDqAWp1gn
	JWyb2MmYiXBFODHIZdMnKvHzFYsU7A4Tplr8u+WUGVCgyqol7504wfTL4HkpomSBZL6Q
	vcvw==
X-Received: by 10.180.80.35 with SMTP id o3mr13418583wix.9.1360018412341;
	Mon, 04 Feb 2013 14:53:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b10sm3741235wix.7.2013.02.04.14.53.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 14:53:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 23:53:27 +0100
Message-Id: <1360018408-29809-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-gnome][meta-efl 1/2] gnome-panel: append pkg_postinst only on PN
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
X-List-Received-Date: Mon, 04 Feb 2013 23:09:22 -0000

---
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb | 2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 3aadd2b..13614a0 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -31,7 +31,7 @@ do_configure_prepend() {
 	sed -i -e s:help:: ${S}/Makefile.am
 }
 
-pkg_postinst_append () {
+pkg_postinst_${PN}_append () {
 	gconftool-2 --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults \
 		--direct --load /etc/gconf/schemas/panel-default-setup.entries
 }
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 3bf7f29..e54579d 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -26,7 +26,7 @@ do_configure_prepend() {
 	sed -i -e s:^#!@PYTHON@:#!/usr/bin/python: ${S}/gnome-panel/gnome-panel-add.in
 }
 
-pkg_postinst_append () {
+pkg_postinst_${PN}_append () {
 if [ -n "$D" ]; then
 	exit 1
 fi
-- 
1.8.1.2



