Received: from host39-232-static.225-95-b.business.telecomitalia.it
	([95.225.232.39] helo=cindy) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adriano@gmail.com>) id 1Ra51r-0002u2-DO
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 13:30:47 +0100
Received: by cindy (Postfix, from userid 1000)
	id 270805E23C4; Mon, 12 Dec 2011 13:14:25 +0100 (CET)
From: Adriano Pallavicino <adrianopallavicino@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 13:13:55 +0100
Message-Id: <1323692035-24394-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <libtans1_1.17_patch>
References: <libtans1_1.17_patch>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCH] Signed-off-by: Adriano Pallavicino <adrianopallavicino@gmail.com>
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
X-List-Received-Date: Mon, 12 Dec 2011 12:30:47 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

URL sources was wrong. md5sum  and sha256sum now refers to new archive
---
 recipes/gnutls/libtasn1-native_1.7.bb |    1 +
 recipes/gnutls/libtasn1_1.7.bb        |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/gnutls/libtasn1-native_1.7.bb b/recipes/gnutls/libtasn1-native_1.7.bb
index a91bd4f..2d41274 100644
--- a/recipes/gnutls/libtasn1-native_1.7.bb
+++ b/recipes/gnutls/libtasn1-native_1.7.bb
@@ -5,3 +5,4 @@ inherit native
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
+
diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 44da659..92302b5 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -3,9 +3,11 @@ LICENSE = "LGPL"
 
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
 inherit autotools binconfig
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
+
+
-- 
1.7.4.1



