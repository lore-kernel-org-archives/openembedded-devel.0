Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58T-00039p-FU
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:25 +0200
Received: (qmail 30422 invoked by uid 813007); 1 Jul 2009 18:54:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:15 +0200
Message-Id: <1246474461-16671-9-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 014/125] qemu-native.inc : force qemu native to use our C/LDFLAGS so that you don't need the required dev packages installed on host. Use our OE versions
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:25 -0000

From: Graeme Gregory <dp@xora.org.uk>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/qemu/qemu-native.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
index e4064a2..9edad66 100644
--- a/recipes/qemu/qemu-native.inc
+++ b/recipes/qemu/qemu-native.inc
@@ -1,3 +1,6 @@
 inherit native
 
 DEPENDS = "libsdl-native zlib-native"
+
+export OS_CFLAGS="${CFLAGS} ${LDFLAGS}"
+
-- 
1.6.3.1





