Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpkR-0003Mh-Sp
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:31 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+auTCNDmo1LvlW91xANbmF7V+AjPICPEayJ4sPD7rk4=;
	b=jXI3qE0eeK4aBwXI343byP2cRf9sqCgL65vXoILaDXhzqB/bCW5pT6LhseZiTUMikN
	w1ebDKKjww+RMQoXCmPMuTLrc96CA4duJ8FUKyEhbozaMBK4RBpcAExWpF8EJjhOIh1K
	Mf2XaQUn0GwFLqTKQ5x5a1pfxWBp/jqFR6guX13P6B34ruv/81NJiQvASAqH7NDaVj7C
	/tfQaxkM+KCqu8acIVz7eoXP69sEUGBF3k9ri0kfnmbhPR5h0va6Rxh3G8Ms4gVzQJds
	qANkNA/rXplxq9MHNaIY5NIBvEbxutJZ7qKBXe2Yj+XKCY/ofs3rn16Qelpgr3PcYTcW
	RIlw==
Received: by 10.180.86.106 with SMTP id o10mr6055272wiz.22.1344606464511;
	Fri, 10 Aug 2012 06:47:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm11641082wiy.4.2012.08.10.06.47.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:24 +0200
Message-Id: <0b4cfe03cb2299abccff02fbb4b51b844d9085a1.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 29/46] e-wm: add some evas-loaders to RDEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:32 -0000

* it doesn't even start without those

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 6d4656b..cce5ad1 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -54,6 +54,10 @@ RDEPENDS_${PN} += "\
   edje-utils \
   ${PN}-utils \
   dbus-x11 \
+  evas-loader-png \
+  evas-loader-jpeg \
+  evas-loader-gif \
+  evas-generic-loader-svg \
 "
 
 # Uclibc build don't have 'glibc-utils'
-- 
1.7.8.6



