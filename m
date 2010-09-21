Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oy3La-0000YJ-CX
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:58:29 +0200
Received: (qmail 22547 invoked by uid 503); 21 Sep 2010 14:10:45 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 14:10:45 -0000
Received: (qmail 29150 invoked by uid 503); 21 Sep 2010 13:40:11 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 13:40:11 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 15:57:22 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 15:57:20 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 15:56:41 +0200
Message-Id: <1285077403-21171-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285077403-21171-4-git-send-email-eric@eukrea.com>
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>
	<1285077403-21171-2-git-send-email-eric@eukrea.com>
	<1285077403-21171-3-git-send-email-eric@eukrea.com>
	<1285077403-21171-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13384698094156295501
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] gdb-cross-sdk: add RDEPENDS
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
X-List-Received-Date: Tue, 21 Sep 2010 13:58:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* actually we get :
./arm-angstrom-linux-gnueabi-gdb: error while loading shared libraries:
libtinfo.so.5: cannot open shared object file: No such file or directory
* adding these RDEPENDS will install ncurses-sdk and zlib-sdk into the SDK

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gdb/gdb-cross-sdk.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index 7c85653..4545894 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -1,8 +1,9 @@
 require gdb-cross.inc
 LICENSE = "GPLv3"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit sdk
 
 DEPENDS = "ncurses-sdk zlib-sdk flex-native"
+RDEPENDS = "ncurses-sdk zlib-sdk"
\ No newline at end of file
-- 
1.6.3.3



