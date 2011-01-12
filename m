Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Pd9Pc-0007e8-Dy
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 23:43:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C3F6D92FEDF;
	Wed, 12 Jan 2011 17:42:57 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14395-10; Wed, 12 Jan 2011 17:42:57 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 93FE08DF383; Wed, 12 Jan 2011 17:42:56 -0500 (EST)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8F0A08DF383;
	Wed, 12 Jan 2011 17:42:55 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 84A7F14222A7; Wed, 12 Jan 2011 17:42:55 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 17:42:55 -0500
Message-Id: <1294872175-23969-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
In-Reply-To: <1294872175-23969-1-git-send-email-msmith@cbnco.com>
References: <1294872175-23969-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/2] openjdk-6-common.inc: remove reference to do_qa_configure
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
X-List-Received-Date: Wed, 12 Jan 2011 22:43:28 -0000

do_qa_configure is only defined for distros that inherit insane.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/openjdk/openjdk-6-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
index c0f8f1f..f04800b 100644
--- a/recipes/openjdk/openjdk-6-common.inc
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -282,7 +282,7 @@ do_compilestepone() {
         cp -ar openjdk-ecj/${BUILD_DIR}/hotspot/import/include openjdk-ecj/${BUILD_DIR}/j2sdk-image/
         install -d openjdk-ecj/${BUILD_DIR}/j2sdk-image/bin
 }
-addtask compilestepone after do_qa_configure before do_compilesteptwo
+addtask compilestepone after do_configure before do_compilesteptwo
 
 # This part can be shared between cacao and hotspot-zero builds.
 do_compilesteptwo() {
-- 
1.6.3.2



