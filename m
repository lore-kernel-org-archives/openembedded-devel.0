Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rztyw-0007qv-Er
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 18:58:30 +0100
Received: by eekd41 with SMTP id d41so2333793eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 09:50:11 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.125.3 as permitted sender) client-ip=10.14.125.3; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.125.3 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.125.3])
	by 10.14.125.3 with SMTP id y3mr13827325eeh.9.1329846611399 (num_hops =
	1); Tue, 21 Feb 2012 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ka6s3ej0MGdmCirpKWja3RLCPjgCTC0Bw4KXyflTMjU=;
	b=kc9up0C6FH7fM/T3rSPscOr7/2sGHOIMOPGSkq/yZGoIW/wFICefq+uSNl5bk24JbK
	9pQCGLJKqzp+m1ae0EYIAE4+kwz4AgrjI/of3x3n+e8Qe5wyqPrMaOSa+p2O3ZojPbfv
	1QJ95pj5wx1jjMTM/0U/AB4xZvGgVdjB47pEY=
Received: by 10.14.125.3 with SMTP id y3mr11046184eeh.9.1329846611292;
	Tue, 21 Feb 2012 09:50:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm92472574eei.3.2012.02.21.09.50.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 09:50:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 18:49:59 +0100
Message-Id: <1329846599-3469-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] midori: disable gtk3
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
X-List-Received-Date: Tue, 21 Feb 2012 17:58:30 -0000

* waf configure/waf build always hangs when gtk3 was built before midori

* usually it's on this line:
  | Checking for program glib-genmarshal        : /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/glib-genmarshal
  | Checking for program glib-mkenums           : /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/glib-mkenums
  | Checking for program msgfmt                 : /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/msgfmt
  | Checking for program intltool-merge         : /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/intltool-merge
  | Checking for header locale.h                :
  but I guess, that's it's because glib-genmarshal or glib-mkenums,
  because if I finish do_configure somehow manually then waf build hangs
  as soon as it starts glib_genmarshal (or seemingly a bit later if there is more processes)
  | Waf: Entering directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/midori/midori-0.4.3-r0/midori-0.4.3/_build_'
  | [  1/121] glib_genmarshal: midori/marshal.list -> _build_/default/midori/marshal.h _build_/default/midori/marshal.c
  | [  2/121] valac: katze/midori-uri.vala midori/midori-extensions-column.vala -> _build_/default/katze/midori-uri.c _build_/default/midori/midori-core.h _build_/default/midori/midori-core.vapi _build_/default/midori/midori-core.deps _build_/default/midori/midori-extensions-column.c _build_/default/midori/midori-core.h _build_/default/midori/midori-core.vapi _build_/default/midori/midori-core.deps
  | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassigned parameter `path'
  | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassigned parameter `path'
  | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassigned parameter `path'
  | ../katze/midori-uri.vala:134.34-134.49: warning: use of possibly unassigned parameter `label'
  | ../katze/midori-uri.vala:134.13-134.31: warning: use of possibly unassigned parameter `checksum'
  | Waf: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/midori/midori-0.4.3-r0/midori-0.4.3/_build_'
  | Build failed:  -> task failed (err #-15):
  |       {task: glib_genmarshal marshal.list -> marshal.h,marshal.c}

* I was able to reproduce this 100%, I know that before it also hanged from
  time to time in waf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |    1 +
 .../recipes-connectivity/midori/midori_0.4.3.bb    |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 05db643..6837bfb 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -22,6 +22,7 @@ do_configure() {
             --infodir=${infodir} \
             --mandir=${mandir} \
             --disable-hildon \
+            --disable-gtk3 \
 }
 
 LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
index 2be8274..635eb9e 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
@@ -1,5 +1,7 @@
 require midori.inc
 
+PR = "r1"
+
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
            file://waf \
           "
-- 
1.7.8.4



