Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxF-0004mH-HK
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:33 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKub-0007as-6W by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:29:51 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKua-0000ze-A6
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:29:48 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:29:47 +0200
Message-Id: <cover.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 0/7] Openjdk fixes from master
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
X-List-Received-Date: Mon, 09 May 2011 07:32:33 -0000

From: Stefan Schmidt <stefan@buglabs.net>

Hello.

Another pull request for openjdk related fixes. They have been in master for
quite some time now and we tested them heavily at Buglabs. They improve the
openjdk build situation a lot making it more robust and eliminating random
failures.

The patch from myself is for the 2011.03 release only as it covers a merge
failure I introduced with my last pull request.

Please pull.

Pull URL: git://github.com/Stefan-Schmidt/openembedded
  Branch: for-2011.03
  Browse: https://github.com/Stefan-Schmidt/openembedded/tree/for-2011.03

Thanks,
    Stefan Schmidt <stefan@buglabs.net>
---


Henning (1):
  ecj-bootstrap: try 5 times to compile the classes

Henning Heinold (5):
  llvm: merge native recipe into the normal recipe
  ecj: for ecj-initial 512 mb heapsize is okay for ecj-bootstrap we
    need 1024
  inetlib: move to proper place
  icedtea6-native: add libxext-native to the dependencies
  cacao-native: add fix for vm-shutdown and multiple threads are
    involved

Stefan Schmidt (1):
  icedtea6-native_1.7.10: Remove reference to deleted patch.

 recipes/cacao/cacao-native_hg.bb                   |    6 +-
 recipes/cacao/files/cacao-shutdownguard.patch      |  180 ++++++++++++++++++++
 .../inetlib-1.1.1/datadir_java.patch               |    0
 recipes/{classpath => classpathx}/inetlib_1.1.1.bb |    0
 recipes/ecj/ecj-bootstrap-native.bb                |    2 +-
 recipes/ecj/ecj-initial.bb                         |    6 +-
 recipes/ecj/files/ecj-initial.in                   |    1 +
 recipes/ecj/files/ecj.in                           |   14 ++-
 recipes/icedtea/icedtea6-native.inc                |    5 +-
 recipes/icedtea/icedtea6-native_1.7.10.bb          |    1 -
 recipes/llvm/llvm-native.inc                       |   33 ----
 recipes/llvm/llvm.inc                              |   70 ++++++---
 recipes/llvm/llvm2.7-native_2.7.bb                 |   12 --
 recipes/llvm/llvm2.7_2.7.bb                        |    5 +-
 14 files changed, 256 insertions(+), 79 deletions(-)
 create mode 100644 recipes/cacao/files/cacao-shutdownguard.patch
 rename recipes/{classpath => classpathx}/inetlib-1.1.1/datadir_java.patch (100%)
 rename recipes/{classpath => classpathx}/inetlib_1.1.1.bb (100%)
 create mode 100755 recipes/ecj/files/ecj-initial.in
 delete mode 100644 recipes/llvm/llvm-native.inc
 delete mode 100644 recipes/llvm/llvm2.7-native_2.7.bb

-- 
1.7.5.1



