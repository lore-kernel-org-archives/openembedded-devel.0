Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1OzE7m-0000qE-LT
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:40:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0F5068ADA96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:39:57 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15335-10-3 for
	<openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Sep 2010 15:39:56 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 6F6488ADD76; Fri, 24 Sep 2010 15:39:55 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id EAE8C8ADCE1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:39:49 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id E49FC14097E8; Fri, 24 Sep 2010 15:39:49 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 15:39:49 -0400
Message-Id: <1285357189-26457-4-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285357189-26457-3-git-send-email-msmith@cbnco.com>
References: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
	<1285357189-26457-1-git-send-email-msmith@cbnco.com>
	<1285357189-26457-2-git-send-email-msmith@cbnco.com>
	<1285357189-26457-3-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] eglibc, eglibc-initial: depend on make-native
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
X-List-Received-Date: Fri, 24 Sep 2010 19:40:03 -0000

In case the version of make installed on the build host is incompatible,
we'll use make-native.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/eglibc/eglibc-initial.inc |    2 +-
 recipes/eglibc/eglibc.inc         |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-initial.inc b/recipes/eglibc/eglibc-initial.inc
index eb765df..4384ed4 100644
--- a/recipes/eglibc/eglibc-initial.inc
+++ b/recipes/eglibc/eglibc-initial.inc
@@ -1,5 +1,5 @@
 SECTION = "libs"
-DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial make-native"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 66bb90e..78e03c4 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -5,7 +5,9 @@ PRIORITY = "required"
 LICENSE = "LGPL"
 INC_PR = "r11"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate \
+		linux-libc-headers \
+		make-native"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-- 
1.7.0.4



