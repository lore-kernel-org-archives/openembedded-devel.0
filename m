Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P4DBT-0004np-KC
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 15:40:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 877DF8BF3E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Oct 2010 09:40:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00463-04 for <openembedded-devel@lists.openembedded.org>; 
	Fri,  8 Oct 2010 09:40:03 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 1AB888BEE7F; Fri,  8 Oct 2010 09:40:01 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 67FC48B7639
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Oct 2010 09:40:00 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 662CA5000E3; Fri,  8 Oct 2010 09:40:00 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 09:39:58 -0400
Message-Id: <1286545200-15699-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
References: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH resend 2/4] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Fri, 08 Oct 2010 13:40:30 -0000

This should work around package incompatibilities with whatever version
of make is installed on the build system.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/base.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 964fe1c..2e49a3c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -71,7 +71,8 @@ def base_deps(d):
 	if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
 		if (bb.data.getVar('HOST_SYS', d, 1) !=
 	     	    bb.data.getVar('BUILD_SYS', d, 1)):
-			deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
+			deps += (" virtual/${TARGET_PREFIX}gcc virtual/libc "
+				"make-native")
 		elif bb.data.inherits_class('native', d) and \
 				bb.data.getVar('PN', d, True) not in \
 				("linux-libc-headers-native", "quilt-native",
-- 
1.7.0.4



