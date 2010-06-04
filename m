Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OKayu-00048D-GS
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 19:46:58 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o54HgSXh016582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Jun 2010 19:42:28 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OKaua-0004N8-FR; Fri, 04 Jun 2010 19:42:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jun 2010 19:42:25 +0200
Message-Id: <1275673345-16778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	David-John Willis <John.Willis@Distant-earth.com>
Subject: [PATCH] encodings/font-util: swapped inter-DEPENDS
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
X-List-Received-Date: Fri, 04 Jun 2010 17:46:58 -0000

'encodings' uses font-util's pkg-config file to determine location of
the X11 font directory.  When 'font-util' is not staged yet (as it was
the case), it will use buildhost information which point to something
like /usr/share/X11 (which is outside of the staging dir) and which are
not writable.

This results into an empty 'encodings' package on first bitbake run in a
pristine tree; 'encodings' must be rebuilt so that it can use font-util
information from previous runs.

As 'font-util' itself does not require 'encodings' during build-time,
there were swapped the DEPENDS.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: David-John Willis <John.Willis@Distant-earth.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-font/encodings_1.0.3.bb |    4 ++--
 recipes/xorg-font/font-util_1.1.1.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/xorg-font/encodings_1.0.3.bb b/recipes/xorg-font/encodings_1.0.3.bb
index 168a67a..bc95836 100644
--- a/recipes/xorg-font/encodings_1.0.3.bb
+++ b/recipes/xorg-font/encodings_1.0.3.bb
@@ -1,8 +1,8 @@
 require xorg-font-common.inc
 PE = "1"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-DEPENDS = "mkfontscale-native font-util-native"
+DEPENDS = "mkfontscale-native font-util-native font-util"
 
 SRC_URI[archive.md5sum] = "29637480e7ce12546668631067c19ced"
 SRC_URI[archive.sha256sum] = "07d9766d4aebe05ac572599f8f903a4fe06ab667a8182f2b6cc03e5fb3b80f53"
diff --git a/recipes/xorg-font/font-util_1.1.1.bb b/recipes/xorg-font/font-util_1.1.1.bb
index f42b505..3f9b4c8 100644
--- a/recipes/xorg-font/font-util_1.1.1.bb
+++ b/recipes/xorg-font/font-util_1.1.1.bb
@@ -4,11 +4,11 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 
 DESCRIPTION = "X font utils."
 
-DEPENDS = "encodings util-macros"
+DEPENDS = "util-macros"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 do_configure_prepend() {
         sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
-- 
1.7.0.1



