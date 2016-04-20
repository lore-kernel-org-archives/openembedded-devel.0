Return-Path: <Adrian.Dudau@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1087F60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 11:43:53 +0000 (UTC)
Received: from 1asqXw-0003q4-V2 by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1asqXw-0003qV-VV
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2016 04:43:52 -0700
Received: by emcmailer; Wed, 20 Apr 2016 04:43:52 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1asqXw-0003q4-V2
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2016 04:43:52 -0700
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 20 Apr 2016 13:43:52 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 2D4AB2413C1;
	Wed, 20 Apr 2016 13:43:52 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Apr 2016 13:43:52 +0200
Message-ID: <1461152632-35663-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH] umip: Unblacklist recipe and disable parallel make
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 11:43:56 -0000
Content-Type: text/plain

The SRC_URI is up again, no need to blacklist the recipe anymore.

The following error could ocurr in a race condition:
scan.l:38:18: fatal error: gram.h: No such file or directory
http://errors.yoctoproject.org/Errors/Details/56158/

That is, the scan.l file was parsed before the gram.h file was
generated. To avoid this, we clear the PARALLEL_MAKE variable.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 41e5340..e80c1b1 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -17,4 +17,4 @@ EXTRA_OE_CONF = "--enable-vt"
 
 inherit autotools-brokensep
 
-PNBLACKLIST[umip] ?= "BROKEN: SRC_URI seems to be down and build from premirror fails to find gram.h, see http://errors.yoctoproject.org/Errors/Details/56158/"
+PARALLEL_MAKE = ""
-- 
1.9.1


