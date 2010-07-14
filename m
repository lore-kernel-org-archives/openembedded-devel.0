Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OZ9eP-0003yp-Nq
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:38:00 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 0488543C43
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:56 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 0488543C43
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279143476; i=@fjfi.cvut.cz; bh=6OEq4kXDdkR5BI34eiyudju+u6Q=;
	h=From:Date:Subject:To:Message-Id;
	b=KocxPrCxHsDkk3jTf6/AHYrAaCm8ABoR0q3tVOr4T6hv3eFvaYineQSM/U/9wWu+f
	Bdx7FcTeXofQqMGz236FQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id e2hP3cHR93of
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:51 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id B406C43D5D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz B406C43D5D
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz B406C43D5D
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 9ED074677A; Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Wed, 14 Jul 2010 23:20:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100714213750.9ED074677A@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] ++dfb: Add a patch to allow compilation with DirectFB 1.4.
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
X-List-Received-Date: Wed, 14 Jul 2010 21:38:00 -0000

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/directfb/++dfb/dfb-api-change.patch |   13 +++++++++++++
 recipes/directfb/++dfb_1.0.0.bb             |    4 +++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/directfb/++dfb/dfb-api-change.patch

diff --git a/recipes/directfb/++dfb/dfb-api-change.patch b/recipes/directfb/++dfb/dfb-api-change.patch
new file mode 100644
index 0000000..bec4e4c
--- /dev/null
+++ b/recipes/directfb/++dfb/dfb-api-change.patch
@@ -0,0 +1,13 @@
+diff -ruN ++DFB-1.0.0-orig/include/++dfb.h ++DFB-1.0.0/include/++dfb.h
+--- ++DFB-1.0.0-orig/include/++dfb.h	2007-02-02 23:48:36.000000000 +0100
++++ ++DFB-1.0.0/include/++dfb.h	2010-06-09 11:53:07.000000000 +0200
+@@ -46,6 +46,9 @@
+ 
+ #include <directfb.h>
+ 
++// Work around old lib expectations.
++typedef u8 __u8;
++
+ #undef IDirectFB
+ #undef IDirectFBScreen
+ #undef IDirectFBDisplayLayer
diff --git a/recipes/directfb/++dfb_1.0.0.bb b/recipes/directfb/++dfb_1.0.0.bb
index e25ca78..412edb9 100644
--- a/recipes/directfb/++dfb_1.0.0.bb
+++ b/recipes/directfb/++dfb_1.0.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 DEPENDS = "directfb"
 LICENSE = "LGPL"
 
-SRC_URI = "http://www.directfb.org/downloads/Extras/++DFB-${PV}.tar.gz"
+PR = "r1"
+SRC_URI = "http://www.directfb.org/downloads/Extras/++DFB-${PV}.tar.gz \
+	    file://dfb-api-change.patch"
 S = "${WORKDIR}/++DFB-${PV}"
 RV = "0.9-25"
 
-- 
1.7.1



