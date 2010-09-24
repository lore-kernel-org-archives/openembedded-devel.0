Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Oz8dm-0004uA-2m
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 15:48:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C2A198AC4A9;
	Fri, 24 Sep 2010 09:42:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08319-04-3; Fri, 24 Sep 2010 09:42:37 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E6E758AC49C; Fri, 24 Sep 2010 09:42:31 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id B9E148AC499;
	Fri, 24 Sep 2010 09:42:27 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id C20F45000E2; Fri, 24 Sep 2010 09:42:27 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 09:42:27 -0400
Message-Id: <1285335747-10346-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285335747-10346-1-git-send-email-msmith@cbnco.com>
References: <4C9C9CE5.80404@mlbassoc.com>
	<1285335747-10346-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] gst-plugins.inc: fix path to orcc when prefix != /usr
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
X-List-Received-Date: Fri, 24 Sep 2010 13:48:46 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/gstreamer/gst-plugins.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
index 62fbd40..8dc1ef6 100644
--- a/recipes/gstreamer/gst-plugins.inc
+++ b/recipes/gstreamer/gst-plugins.inc
@@ -21,9 +21,11 @@ do_configure_prepend() {
 	sed -i -e 's:`$PKG_CONFIG --variable=includedir gstreamer-0.10`:${STAGING_INCDIR}/gstreamer-0.10:g' ${S}/configure.ac
 }
 
+# orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
+# resulting in /usr/bin/orcc. Force it to use the staged orcc.
 do_configure_append() {
 	for i in $(find ${S} -name "Makefile") ; do
-		sed -i -e s:/usr/bin/orcc:${STAGING_BINDIR_NATIVE}/orcc:g $i
+		sed -i -e s:${bindir}/orcc:${STAGING_BINDIR_NATIVE}/orcc:g $i
 	done
 }
 
-- 
1.7.0.4



