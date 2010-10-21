Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHh-0007Zh-3G
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:25 +0200
Received: by gyd5 with SMTP id 5so802562gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0HmbOoCs05X358/ACJFC+U7fBTPfNfFPpyKmyvVxa2c=;
	b=gCY+Fmv53cfQpjdDc31dEtmjqapqLdFrCHNXXTw6rI5vivlMiU1LGq9ThFLqw/+VwQ
	JlHmk47tbfH9Zs2rHybqmPgRW5btopI/JijpsTVdFvQnLb446Vn1yUlE57Fdy+hcsCYx
	o/1O1S6Q9/OHLscqdIcaYNdluJHuLXksgceho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BWXe+5tgFhTBqZxmBoCq0rpsaFaLNRGJYtUgyRlswcO3l0K7HvT+l2vgKolDVVsIQk
	l0wXLKzLHjK4GRnvDKLChbGbJ7drBxBmRGs+msHBAZyEgfp51v9Y6outjoiG0joOfPpE
	yNlR9vDMNx7JqP/f6vRdyzeo5rKDTe7dcK0d8=
Received: by 10.151.147.19 with SMTP id z19mr3777719ybn.150.1287668019231;
	Thu, 21 Oct 2010 06:33:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:38 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:11 -0500
Message-Id: <1287668010-11310-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 03/22] dbus: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:26 -0000
X-List-Received-Date: Thu, 21 Oct 2010 13:34:26 -0000
X-List-Received-Date: Thu, 21 Oct 2010 13:34:26 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/dbus/dbus-c++_git.bb          |    2 +-
 recipes/dbus/dbus-daemon-proxy_git.bb |    2 +-
 recipes/dbus/dbus-glib.inc            |    2 +-
 recipes/dbus/dbus.inc                 |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/dbus/dbus-c++_git.bb b/recipes/dbus/dbus-c++_git.bb
index 7d9db3e..6459823 100644
--- a/recipes/dbus/dbus-c++_git.bb
+++ b/recipes/dbus/dbus-c++_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "C++ bindings for dbus"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1+"
 SECTION = "libs"
 DEPENDS = "dbus dbus-c++-native expat"
 SRCREV = "530a887913d3b0dd7091eabb8eef8e3c279e3bb8"
diff --git a/recipes/dbus/dbus-daemon-proxy_git.bb b/recipes/dbus/dbus-daemon-proxy_git.bb
index 16cc34f..32ed7db 100644
--- a/recipes/dbus/dbus-daemon-proxy_git.bb
+++ b/recipes/dbus/dbus-daemon-proxy_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "dbus forwarding daemon"
-LICENSE = "GPL"
+LICENSE = "LGPLv2.1+"
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
 PV = "0.0.0+gitr${SRCPV}"
diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
index 4db734b..c1c1813 100644
--- a/recipes/dbus/dbus-glib.inc
+++ b/recipes/dbus/dbus-glib.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "GLib bindings for the dbus message bus system"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 SECTION = "libs"
-LICENSE = "GPL"
+LICENSE = "GPLv2+ AFLv2.1"
 
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS_virtclass-native = "expat-native glib-2.0-native dbus-native"
diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index 55a156d..73fc426 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "A message bus system for inter-process communication"
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
-LICENSE = "GPL"
+LICENSE = "GPLv2+ AFLv2.1"
 DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
 
 INC_PR = "r19"
-- 
1.7.0.4



