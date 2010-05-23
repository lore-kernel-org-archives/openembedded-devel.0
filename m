Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGGn3-00007U-As
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 21:24:51 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NJK6D0006966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 21:20:06 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGGiU-0002Ti-Ki; Sun, 23 May 2010 21:20:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 21:20:02 +0200
Message-Id: <13ca048a9b8e288c16467f1f833aeee6654d9981.1274642314.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
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
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/3] freetype: build with system zlib
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
X-List-Received-Date: Sun, 23 May 2010 19:24:51 -0000

Problems mentioned in 4187d3df8838506f6578a2b0f2fb98f98c41e151 (Aug
2006) seem to went away and build succeeds with system zlib now.  Using
system libraries is preferable because it saves space and allows better
tracking of security issues.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/freetype/freetype_2.3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
index de9ff29..b1f8d6f 100644
--- a/recipes/freetype/freetype_2.3.12.bb
+++ b/recipes/freetype/freetype_2.3.12.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
 LICENSE = "freetype"
-PR = "r0"
+PR = "r1"
+DEPENDS = "zlib"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
@@ -18,7 +19,6 @@ inherit autotools pkgconfig binconfig
 
 LIBTOOL = "${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-EXTRA_OECONF = "--without-zlib"
 
 do_configure() {
 	cd builds/unix
-- 
1.7.0.1



