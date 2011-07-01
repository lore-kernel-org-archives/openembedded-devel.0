Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcWZI-0006vL-3h
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 07:47:08 +0200
Received: by iwn4 with SMTP id 4so2789488iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 22:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uU1batWrhP2ebjUQMtjTHsy5eEQF9Yih1x6yL/+vWQs=;
	b=rx1GgAp5IvTmNRuf5cq9HEbBQ7O7XXU5jgayfMlcsKBbYWdGwJ2VtryO38MDCU+C4B
	IaiCp5MXz2Og1X6uy/nUVcFeSMjh+I+tyq94BP+QVXAQxi1KVE3jJpKjEVgKA81OneRN
	xzmLJCPvUc4XpSezBrb6ueCOkWO+sDLiqu+ZI=
Received: by 10.231.81.133 with SMTP id x5mr2365428ibk.161.1309499003377;
	Thu, 30 Jun 2011 22:43:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x13sm1659880ibh.16.2011.06.30.22.43.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 22:43:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2011 22:43:13 -0700
Message-Id: <1309498993-13565-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] systemd_git.bb: Add patch to disable --nonet option
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
X-List-Received-Date: Fri, 01 Jul 2011 05:47:08 -0000


Hi I am not particularly happy with this patch but by letting xsltproc
download stylesheets from internet it atleast compiles the thing. But
its very slow. So any better solution if someone has suggestion please
by all means

-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/use-nonet-for-docbook.patch    |   30 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/use-nonet-for-docbook.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/use-nonet-for-docbook.patch b/meta-oe/recipes-core/systemd/systemd/use-nonet-for-docbook.patch
new file mode 100644
index 0000000..e8aa537
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/use-nonet-for-docbook.patch
@@ -0,0 +1,30 @@
+We get errors like
+
+| /bin/mkdir -p man/ && /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-uclibc/sysroots/x86_64-linux/usr/bin/xsltproc -o man/systemd.1 --nonet --param funcsynopsis.style
+ "'ansi'" http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl man/systemd.xml
+| I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
+| warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
+| cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
+| make[1]: *** [man/systemd.1] Error 4
+| make[1]: Leaving directory `/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-uclibc/work/armv5teb-angstrom-linux-uclibceabi/systemd-git-r4/git'
+| make: *** [all] Error 2
+| + die 'oe_runmake failed'
+| + bbfatal 'oe_runmake failed'
+| + echo 'ERROR: oe_runmake failed'
+| ERROR: oe_runmake failed
+| + exit 1
+
+This patch disables --nonet option to xsltproc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- git/Makefile.am.org	2011-06-30 16:07:21.715269183 -0700
++++ git/Makefile.am	2011-06-30 16:07:26.805269182 -0700
+@@ -1315,7 +1315,6 @@ endif
+ 
+ if HAVE_XSLTPROC
+ XSLTPROC_FLAGS = \
+-	--nonet \
+ 	--param funcsynopsis.style "'ansi'"
+ 
+ XSLTPROC_PROCESS_MAN = \
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index c750b2f..40b93b8 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -15,7 +15,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r4"
+PR = "r5"
 
 inherit autotools vala
 
@@ -24,6 +24,7 @@ SRCREV = "8585357a0e5e9f4d56e999d7cd1a73e77ae0eb80"
 SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
            file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
            file://paper-over-mkostemp.patch \
+           file://use-nonet-for-docbook.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.4.1



