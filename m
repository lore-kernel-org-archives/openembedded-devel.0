Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl6o-0005qy-Ts
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:25:14 +0200
Received: by wgbdr1 with SMTP id dr1so1927955wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cKnnqxhzGX39w7c/IkWcY97FVGimpQsfqed1tDLYYWM=;
	b=yKMoGG18n19iEs1/tI1HMs519DSS9sRcxZS78fcgKAAXi6tJgZ6Ugqe1am0o3zMBcs
	PqaD0BGSv3cMb7dYbO63JE6/wFxk0Z4ULCOZL21r3RDkZCohUQdw/F6hEyHowKsWKPxo
	IIZD4AHzT8998AFY+H1q544xhF3SYO8br1zx+x5x6oPulApCDWGdMpV7th5JTtHTYK45
	o50kSKJXWTig+DlDWT7s82pPrkT6b4W+u63caFZg6iXjM2MvEBFkrs5T/4Ca8OvD4nP0
	bOopf287LZr8y4wz/pUsmToszZWeCEaAiU61KnX688sco8FDnUpozDd5Q8veel0/LE8c
	+fRQ==
Received: by 10.180.94.234 with SMTP id df10mr1844759wib.16.1342682033619;
	Thu, 19 Jul 2012 00:13:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm36974768wiz.0.2012.07.19.00.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:13:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 09:13:46 +0200
Message-Id: <8400749d0df8964ffb700bf1d53ffa35d662e795.1342681929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-gnome][PATCH 2/4] dconf: fix unpackaged /usr/lib/gio/modules/.debug/libdconfsettings.so
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
X-List-Received-Date: Thu, 19 Jul 2012 07:25:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
index 39d68cb..af9a83a 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
@@ -12,12 +12,15 @@ DEPENDS = "glib-2.0 gtk+3"
 
 inherit vala
 
+PR = "r1"
+
 PACKAGES =+ "dconf-editor"
 
 FILES_dconf-editor = "${bindir}/dconf-editor ${datadir}/dconf-editor/"
 FILES_${PN} += "${datadir}/dbus-1/ \
                 ${libdir}/gio/modules/*.so \
                "
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
 
 pkg_postinst_${PN} () {
 if [ -n "$D" ]; then
-- 
1.7.8.6



