Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrto-0004Wz-1J
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:20 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Yvpn7PCV7bL4om1KNsXUKHA787M+FEUJ0+oHgwRwo5w=;
	b=ohdtN3ThKOvlHLD6T0b+L2eWE3s1u+PIHQ0FjMmB3bGGVpI7pmSpgI5327lX60MAu4
	vqO1RHwEf89NEUE0MJxJONLaNq0SaCkzJagXw9lttEB+TpTfdDRlfV9pFvuUwfJdNZ8B
	Rel+8UqDXwpqvQBPOe4Bz9NtrKVGCU7WRbko4=
Received: by 10.213.7.214 with SMTP id e22mr1460335ebe.125.1323165515010;
	Tue, 06 Dec 2011 01:58:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm58113411eej.3.2011.12.06.01.58.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:09 +0100
Message-Id: <af1ee9dd0e4654367ddc2f1f1683718684ced6ed.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 10/16] enjoy: remove SHR override and add autopoint
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
X-List-Received-Date: Tue, 06 Dec 2011 10:05:20 -0000

* autopoint was removed in e.bbclass because most stuff works without it and it was breaking elementary
  but here it's still needed
* without it fails with:
  Making all in po
  make[2]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/enjoy-0.0+svnr65808-r4/enjoy/po'
  make enjoy.pot-update
  make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/enjoy-0.0+svnr65808-r4/enjoy/po'
  make[3]: *** No rule to make target `remove-potcdate.sed', needed by `enjoy.pot-update'.  Stop.
  make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/enjoy-0.0+svnr65808-r4/enjoy/po'
  make[2]: *** [enjoy.pot] Error 2
  make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/enjoy-0.0+svnr65808-r4/enjoy/po'
  make[1]: *** [all-recursive] Error 1
  make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/enjoy-0.0+svnr65808-r4/enjoy'
  make: *** [all] Error 2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 5c7d09b..8f701a3 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -30,9 +30,10 @@ FILES_${PN} += "${datadir}/icons/"
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
 "
-EXTRA_OECONF_append_shr = "\
-  --enable-fso \
-"
+
+do_configure_prepend() {
+       autopoint || touch config.rpath
+}
 
 pkg_postinst_${PN} () {
 	echo "enjoy:	SCAN and LIBRARY MANAGER are not implemeted yet!"
-- 
1.7.8



