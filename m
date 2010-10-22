Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P9Mdi-0002Wq-Vm
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 20:46:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4FC888D4E41;
	Fri, 22 Oct 2010 14:46:18 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10141-04; Fri, 22 Oct 2010 14:46:18 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id EE6588D4E40; Fri, 22 Oct 2010 14:46:17 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id CDA2A8D4E38;
	Fri, 22 Oct 2010 14:46:15 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id AA0AC5000E6; Fri, 22 Oct 2010 14:46:15 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 14:46:14 -0400
Message-Id: <1287773175-12507-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] openswan: upgrade to 2.6.31
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
X-List-Received-Date: Fri, 22 Oct 2010 18:46:55 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Tom Rini <tom_rini@mentor.com>
---
 .../{openswan_2.6.29.bb => openswan_2.6.31.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/openswan/{openswan_2.6.29.bb => openswan_2.6.31.bb} (87%)

diff --git a/recipes/openswan/openswan_2.6.29.bb b/recipes/openswan/openswan_2.6.31.bb
similarity index 87%
rename from recipes/openswan/openswan_2.6.29.bb
rename to recipes/openswan/openswan_2.6.31.bb
index 4b09fc1..df3fe8b 100644
--- a/recipes/openswan/openswan_2.6.29.bb
+++ b/recipes/openswan/openswan_2.6.31.bb
@@ -31,5 +31,5 @@ FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
 
 CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"
 
-SRC_URI[md5sum] = "cd6c127585ec6db63780e9a40d5387fb"
-SRC_URI[sha256sum] = "03345e7090d0e1d4b844b1205c1444db067c6e2f7c423342e052f44cf6fa12e4"
+SRC_URI[md5sum] = "1f508adf9d0be4f34c003b833d8fce4a"
+SRC_URI[sha256sum] = "bddd2ca79fec2326a69904b59df15753e59b1bf02882416b19507516e9cfcc21"
-- 
1.7.0.4



