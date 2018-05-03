Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 May 2018 09:58:22 UTC
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3627482C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 May 2018 09:58:22 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/03/2018 5:43:21 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.2.1)
	with PIPE id 372257798; Thu, 03 May 2018 05:43:21 -0400
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.2.1)
	with ESMTPS id 372257780; Thu, 03 May 2018 05:43:17 -0400
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fEAlh-0005JC-Te; Thu, 03 May 2018 10:43:17 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fEAlh-00030V-SF; Thu, 03 May 2018 10:43:17 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 May 2018 10:43:08 +0100
Message-Id: <20180503094308.7549-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/03/2018 5:43:17 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-82/SG:2 5/3/2018 5:42:28 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.528638 p=-1 Source White
X-Signature-Violations: 0-0-0-3606-c
X-Note-419: 15.6266 ms. Fail:0 Chk:1360 of 1360 total
X-Note: VSCH-CT/SI: 0-1360/SG:1 5/3/2018 5:42:28 AM
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G335 G336 G337 G338 G342 G343 G475 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>,
	Mike Crowe <mac@mcrowe.com>
Subject: [meta-java][PATCH] jdepend: Update download hashes
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
X-List-Received-Date: Thu, 03 May 2018 09:58:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Bitbake downloads jdepend-2.9.1.zip itself and I download
https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
the calculated hashes don't match the ones included in the recipe.

The hashes were last changed in commit
dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
that the file being downloaded was published on 20th January, so I can't
explain why they are wrong.

Nevertheless, let's update the recipe to use hashes that match the current
download.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: André Draszik <andre.draszik@jci.com>
---
 recipes-core/jdepend/jdepend_2.9.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index 5f09a8b..a924f1d 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -18,7 +18,7 @@ do_compile() {
   fastjar cf ${JARFILENAME} -C build .
 }
 
-SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
-SRC_URI[sha256sum] = "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
+SRC_URI[md5sum] = "0cbaf43493cd30838bee261f69e76fe9"
+SRC_URI[sha256sum] = "b9f34236aaea5ddc070caa29794d2f5ae79bc12e199bec6ebba6c29093a17a9e"
 
 BBCLASSEXTEND = "native"
-- 
2.11.0



