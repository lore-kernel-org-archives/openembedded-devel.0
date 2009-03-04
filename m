Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letat-0005dX-KE
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:15 +0100
Received: (qmail 28591 invoked by uid 813007); 4 Mar 2009 15:54:22 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:22 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQE-0001Fg-Ow; Wed, 04 Mar 2009 16:54:14 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:16 +0100
Message-Id: <1236182004-4523-62-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 61/70] openssl-native: make sure that PACKAGES will be empty (proper way)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:16 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 packages/openssl/openssl-native_0.9.7g.bb |    1 +
 packages/openssl/openssl-native_0.9.7m.bb |    1 +
 packages/openssl/openssl-native_0.9.8g.bb |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/packages/openssl/openssl-native_0.9.7g.bb b/packages/openssl/openssl-native_0.9.7g.bb
index f48e123..14f6d92 100644
--- a/packages/openssl/openssl-native_0.9.7g.bb
+++ b/packages/openssl/openssl-native_0.9.7g.bb
@@ -14,3 +14,4 @@ do_install() {
 	:
 }
 
+PACKAGES = ""
diff --git a/packages/openssl/openssl-native_0.9.7m.bb b/packages/openssl/openssl-native_0.9.7m.bb
index e7dc7c7..b00dc5e 100644
--- a/packages/openssl/openssl-native_0.9.7m.bb
+++ b/packages/openssl/openssl-native_0.9.7m.bb
@@ -18,3 +18,4 @@ do_install() {
 	:
 }
 
+PACKAGES = ""
diff --git a/packages/openssl/openssl-native_0.9.8g.bb b/packages/openssl/openssl-native_0.9.8g.bb
index 9ae8e39..1ad90a0 100644
--- a/packages/openssl/openssl-native_0.9.8g.bb
+++ b/packages/openssl/openssl-native_0.9.8g.bb
@@ -22,3 +22,4 @@ do_install() {
 	:
 }
 
+PACKAGES = ""
-- 
1.6.1.3





