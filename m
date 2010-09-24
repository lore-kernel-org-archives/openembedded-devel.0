Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1OzE7l-0000pt-Va
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:40:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3EC038ADD8F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:39:56 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15335-10 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Sep 2010 15:39:56 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 97FD28ADA12; Fri, 24 Sep 2010 15:39:53 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id D44348ADA12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:39:49 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id AB92314097E5; Fri, 24 Sep 2010 15:39:49 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 15:39:46 -0400
Message-Id: <1285357189-26457-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
References: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] make 3.82: set DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Fri, 24 Sep 2010 19:40:02 -0000

This version has introduced several backwards incompatibilities and some
packages are known not to build with 3.82. In particular:

- glibc-initial fails in do_install when prefix="".
- eglibc manual/Makefile has not yet been patched (see 3a06f50f)

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/make/make_3.82.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/make/make_3.82.bb b/recipes/make/make_3.82.bb
index 3cdc0a0..86c58d6 100644
--- a/recipes/make/make_3.82.bb
+++ b/recipes/make/make_3.82.bb
@@ -1,5 +1,8 @@
 require make.inc
 
+# Stock eglibc fails to build with make 3.82.
+DEFAULT_PREFERENCE = "-1"
+
 BBCLASSEXTEND = "native"
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
 SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
-- 
1.7.0.4



