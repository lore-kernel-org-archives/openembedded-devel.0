Return-Path: <Adrian.Dudau@enea.com>
X-Greylist: delayed 511 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Apr 2016 11:43:44 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.35])
	by mail.openembedded.org (Postfix) with ESMTP id 9706A6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:43:44 +0000 (UTC)
Received: from 1aqJ4i-0001cF-WF by out11a.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>)
	id 1aqJ4j-0001d5-Uz; Wed, 13 Apr 2016 04:35:13 -0700
Received: by emcmailer; Wed, 13 Apr 2016 04:35:13 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with smtp (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>)
	id 1aqJ4i-0001cF-WF; Wed, 13 Apr 2016 04:35:12 -0700
Received: from sestovs32.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 13 Apr 2016 13:35:12 +0200
Received: by sestovs32.enea.se (Postfix, from userid 4451)	id 788A22413BD;
	Wed, 13 Apr 2016 13:35:12 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2016 13:35:12 +0200
Message-ID: <1460547312-56674-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20160412172539.GE2564@jama>
References: <20160412172539.GE2564@jama>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH] umip: Disable parallel make
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
X-List-Received-Date: Wed, 13 Apr 2016 11:43:47 -0000
Content-Type: text/plain

The following error can ocurr in a race condition:

scan.l:38:18: fatal error: gram.h: No such file or directory
http://errors.yoctoproject.org/Errors/Details/56158/

That is, the scan.l file is parsed before the gram.h file is generated.
To avoid this, we clear the PARALLEL_MAKE variable.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 76901ab..e80c1b1 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -16,3 +16,5 @@ S = "${WORKDIR}/git"
 EXTRA_OE_CONF = "--enable-vt"
 
 inherit autotools-brokensep
+
+PARALLEL_MAKE = ""
-- 
1.9.1


