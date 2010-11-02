Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDIHe-0005mQ-2Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 15:57:04 +0100
Received: (qmail 16195 invoked by uid 503); 2 Nov 2010 14:34:14 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 2 Nov 2010 14:34:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Nov 2010 16:55:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Nov 2010 16:55:33 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Nov 2010 15:56:39 +0100
Message-Id: <1288709799-9891-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4CD02461.3020106@eukrea.com>
References: <4CD02461.3020106@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2766617547390168393
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gdb-cross-sdk: reconfigure before running oe_runmake configure-host
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
X-List-Received-Date: Tue, 02 Nov 2010 14:58:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

so we have : configure then make configure-host which generates the
Makefile that we modify using sed to statically link the libs

Without this patch, we don't statically link libncurses, libtinfo
and libz which leads to :
/usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
error while loading shared libraries: libtinfo.so.5:
cannot open shared object file: No such file or directory

when trying to use the toolchain.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gdb/gdb-cross-sdk.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index 6a708ca..e1d4895 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -8,6 +8,7 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils' L
 # add a depenency on the -sdk versions of them.
 do_configure_append () {
 	cd ${B}
+	oe_runconf
 	oe_runmake configure-host
 	sed -e 's,-lncurses,${STAGING_LIBDIR_NATIVE}/libncurses.a ${STAGING_LIBDIR_NATIVE}/libtinfo.a ,g' -i ${B}/gdb/Makefile
 	sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i ${B}/gdb/Makefile
@@ -16,5 +17,4 @@ do_configure_append () {
 	for SIM in ${B}/sim/*/Makefile; do
 		[ -f $SIM ] && sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
 	done
-	oe_runconf
 }
-- 
1.6.3.3



