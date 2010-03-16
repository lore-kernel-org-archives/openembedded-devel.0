Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NrcsQ-0004MP-SW
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 20:56:32 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 249D63D0C9; Tue, 16 Mar 2010 22:51:03 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 22:50:38 +0300
Message-Id: <1268769038-30979-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1239889359-13953-1-git-send-email-khimov@altell.ru>
References: <1239889359-13953-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Tue, 16 Mar 2010 19:56:32 -0000

By default cmake guesses whether install shared libaries with exec
permissions or not based on host distribution, so this behaviour
changes from host to host. OpenEmbedded assumes shared libraries to
be with exec permissions (reverse way brakes stripping, for example),
so let's force this in cmake configure invocation.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/cmake.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index f21c4d6..706bdda 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -21,6 +21,7 @@ cmake_do_configure() {
   cmake ${OECMAKE_SOURCEPATH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
     -DCMAKE_FIND_ROOT_PATH:PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_INSTALL_SO_NO_EXE=0 \
     ${EXTRA_OECMAKE} \
     -Wno-dev
 }
-- 
1.6.4.2



