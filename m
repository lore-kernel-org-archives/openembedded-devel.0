Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PD3bt-0000a0-Qf
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 00:17:30 +0100
Received: (qmail 16884 invoked by uid 503); 1 Nov 2010 21:07:34 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 1 Nov 2010 21:07:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Nov 2010 23:28:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Nov 2010 23:28:47 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Nov 2010 22:29:51 +0100
Message-Id: <1288646991-15775-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3535044233336106313
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
Subject: [PATCH] gdb-cross-sdk: don't reconfigure after making changes in gdb/Makefile
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
X-List-Received-Date: Mon, 01 Nov 2010 23:17:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

else we don't statically link libncurses, libtinfo and libz which leads
to :
/usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
error while loading shared libraries: libtinfo.so.5:
cannot open shared object file: No such file or directory

when trying to use the toolchain.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gdb/gdb-cross-sdk.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index 6a708ca..d32111f 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -16,5 +16,4 @@ do_configure_append () {
 	for SIM in ${B}/sim/*/Makefile; do
 		[ -f $SIM ] && sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
 	done
-	oe_runconf
 }
-- 
1.6.3.3



