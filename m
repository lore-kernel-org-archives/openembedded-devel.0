Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OOVs7-0003mV-Vg
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 15:08:12 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o5FD38ou002154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Jun 2010 15:03:09 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OOVnI-0002GX-Is; Tue, 15 Jun 2010 15:03:08 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 15:03:07 +0200
Message-Id: <1276606987-8681-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] ipkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Tue, 15 Jun 2010 13:08:23 -0000
X-List-Received-Date: Tue, 15 Jun 2010 13:08:23 -0000

The st_mtime attribute (which is a float) is compared against a value
from the timestamp database, which was stored as an integer there.

When working on a filesystem with precise timestamps the comparision
will fail nearly everytime hence.

Although it might be possible to enhance the database to store the
fractional part too, this will complicate things more than we would
gain by this change.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../ipkg-utils-native_1.6+cvs20050404.bb           |    2 +-
 .../ipkg-utils/ipkg-make-index-track-stamps.patch  |    2 +-
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
index 98cc7f1..11e124b 100644
--- a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
@@ -1,7 +1,7 @@
 require ipkg-utils_${PV}.bb
 
 RDEPENDS_${PN} = ""
-PR = "r22"
+PR = "r23"
 
 inherit native
 
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
index ad6df4f..68758ed 100644
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
+++ b/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
@@ -53,7 +53,7 @@ Index: ipkg-utils/ipkg-make-index
 +     fnameStat = os.stat(filename)
       if old_pkg_hash.has_key(basename):
 -          if (verbose):
-+          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
 +            if (verbose):
                 sys.stderr.write("Found %s in Packages\n" % (filename,))
 -          pkg = old_pkg_hash[basename]
diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index fe1f28b..aa2bfbb 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 CONFLICTS = "ipkg-link"
 RDEPENDS_${PN} = "python"
 SRCDATE = "20050930"
-PR = "r25"
+PR = "r26"
 
 SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
            file://ipkg-utils-fix.patch \
-- 
1.7.0.1



