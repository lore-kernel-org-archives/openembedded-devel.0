Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szphx-0001GZ-1h
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:57 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GFiBonyFad3ivT8xO/zj6KQ/e4j/cj4OoXdGctL3wxc=;
	b=W66Pn5rZ3HkyC8t+Wlq5UeTBDCjlN+PaGtqGhFZfVL9E4+KiQPzFyq6hR8lSmsyF2V
	BGznx1LVppCl/zB6Stlw2dHD3Ix4HDfGPUSgVm5KqG3rNxFqmfpTbMCpp5VjjFkKv+47
	LpAHJRSHUC2Z3EA4sdBpxwBCz5HCGw16cRIqTmj3TYWYSWjqdtKTodhJeFfCe4afRmr/
	Xs5tzJFuffExa+mfcwN3LEp394Ng+GIfGej0vhAVXWIIhIXyD5NAQUS9NOS3HBumLRSh
	sk28uXx3fFsuDoK4Qec7wZO7+A6OLQMbLcuhwHYbKbAMy5AD2jjPE0hrgmrLtvw9Z7jH
	QLLg==
Received: by 10.180.102.136 with SMTP id fo8mr6132021wib.19.1344606309629;
	Fri, 10 Aug 2012 06:45:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm7828939wib.7.2012.08.10.06.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:06 +0200
Message-Id: <9f41c8aa917d6cec01a69cc1e38a17cc2cb47475.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 11/46] terminology: add terminology-themes to RDEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_svn.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
index 2bb4f7c..48d229b 100644
--- a/meta-efl/recipes-efl/e17/terminology_svn.bb
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
 DEPENDS = "evas ecore edje elementary eina eet emotion"
 
 PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
@@ -17,3 +18,8 @@ EXTRA_OECONF = "\
 FILES_${PN} += "\
         ${datadir}/icons/terminology.png \
 "
+
+# doesn't start without own theme
+# ERR<770>:terminology utils.c:26 theme_apply() Could not load any theme for group=terminology/background: No Error
+# CRI<770>:terminology main.c:448 elm_main() Couldn't find terminology theme! Forgot 'make install'?
+RDEPENDS_${PN} += "${PN}-themes"
-- 
1.7.8.6



