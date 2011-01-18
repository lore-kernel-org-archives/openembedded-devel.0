Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PfJh3-00061z-Ed
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:06:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5F8F1923F6F;
	Tue, 18 Jan 2011 17:05:47 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13555-01; Tue, 18 Jan 2011 17:05:47 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 7B7FE923F53; Tue, 18 Jan 2011 17:05:46 -0500 (EST)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 73B566D85E0;
	Tue, 18 Jan 2011 17:05:44 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 4C0E81C004B7; Tue, 18 Jan 2011 17:05:44 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jan 2011 17:05:42 -0500
Message-Id: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] gnutls: move to latest stable branch 2.10.2 -> 2.10.4
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
X-List-Received-Date: Tue, 18 Jan 2011 22:06:26 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gettextize-with-gettext-0.18.patch             |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-replace-siginterrupt.patch              |    0
 .../gnutls/{gnutls_2.10.2.bb => gnutls_2.10.4.bb}  |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/gnutls/{gnutls-2.10.2 => gnutls-2.10.4}/gettextize-with-gettext-0.18.patch (100%)
 rename recipes/gnutls/{gnutls-2.10.2 => gnutls-2.10.4}/gnutls-openssl.patch (100%)
 rename recipes/gnutls/{gnutls-2.10.2 => gnutls-2.10.4}/gnutls-replace-siginterrupt.patch (100%)
 rename recipes/gnutls/{gnutls_2.10.2.bb => gnutls_2.10.4.bb} (77%)

diff --git a/recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.patch b/recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
similarity index 100%
rename from recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.patch
rename to recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch b/recipes/gnutls/gnutls-2.10.4/gnutls-openssl.patch
similarity index 100%
rename from recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch
rename to recipes/gnutls/gnutls-2.10.4/gnutls-openssl.patch
diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.patch b/recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
similarity index 100%
rename from recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.patch
rename to recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
diff --git a/recipes/gnutls/gnutls_2.10.2.bb b/recipes/gnutls/gnutls_2.10.4.bb
similarity index 77%
rename from recipes/gnutls/gnutls_2.10.2.bb
rename to recipes/gnutls/gnutls_2.10.4.bb
index 8af70ec..3e582b0 100644
--- a/recipes/gnutls/gnutls_2.10.2.bb
+++ b/recipes/gnutls/gnutls_2.10.4.bb
@@ -24,5 +24,5 @@ do_configure_prepend() {
 
 }
 
-SRC_URI[gnutls.md5sum] = "777823f5746ab80cd6f7f7b5fcb2f91b"
-SRC_URI[gnutls.sha256sum] = "e82e7a3fc69b02cc06c291a1652789d73e45bc0732e139817838248f814f8724"
+SRC_URI[gnutls.md5sum] = "4e1517084018a8b1fdc96daabea40528"
+SRC_URI[gnutls.sha256sum] = "b8bfe36450fe671e99db5ff1e44e6b65fda8a79cacd9e77d550eff7da3745fc8"
-- 
1.6.3.2



