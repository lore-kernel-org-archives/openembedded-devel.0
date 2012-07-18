Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrI9T-0005rB-HZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 02:30:03 +0200
Received: by wibhm11 with SMTP id hm11so785455wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 17:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cKnnqxhzGX39w7c/IkWcY97FVGimpQsfqed1tDLYYWM=;
	b=0ov8OcGwlSlwXPxhFZ3pw+5+9ybHB0oem/0puIIZen+yFS5on2LUPKFzyAZsfqW8sh
	xQ2QbCs6LknmjgMiEaLtFF7d8SXPzbYdvhM0cB4YY8La9biZqHhKJJVA77p8bxUrMLBt
	DC2LP+FfwVf5JhaaKKEpMwCjUri7R3VJi9j+pOmcHUOVwWFRMw2X3AKWzgecrUD67rIE
	PaeS7+jeJ4cFPui/4U8NevRylappjTUyKy/LDvFPgkULvRYweFu4wAQt0uTunMJ2VAjr
	B25VdzBqX3E5gtzpuddtdTI95TBqZE1mgpdcKmU1RewLDkLioR7cktgNWrS9UDZKRCAq
	Ws8w==
Received: by 10.216.136.227 with SMTP id w77mr458652wei.111.1342570723698;
	Tue, 17 Jul 2012 17:18:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm29743137wib.10.2012.07.17.17.18.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 17:18:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 02:18:50 +0200
Message-Id: <1342570731-8385-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342564992-18614-2-git-send-email-Martin.Jansa@gmail.com>
References: <1342564992-18614-2-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-gnome][PATCH 1/2] dconf: fix unpackaged /usr/lib/gio/modules/.debug/libdconfsettings.so
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
X-List-Received-Date: Wed, 18 Jul 2012 00:30:03 -0000

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



