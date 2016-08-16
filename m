Return-Path: <prvs=02916f861=Richard.Leitner@skidata.com>
X-Greylist: delayed 639 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Aug 2016 12:59:47 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 99EA5731D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 12:59:47 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DOAQA8C7NX/0oKEKxehRcHtzGCD4F9hh2CDhQCAQEBAQEBAYEFhV4ogRYOBcZYAQEIJ4YqiVmFDwWZQYFijTmJa4VYkDAehDJshhh/AQEB
X-IPAS-Result: A2DOAQA8C7NX/0oKEKxehRcHtzGCD4F9hh2CDhQCAQEBAQEBAYEFhV4ogRYOBcZYAQEIJ4YqiVmFDwWZQYFijTmJa4VYkDAehDJshhh/AQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 14:49:00 +0200
Message-ID: <1471351740-4974-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex2srv.skidata.net
	(172.16.10.93)
Subject: [meta-java][PATCH] openjdk-7: disable IcedTea's auto-downloading
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
X-List-Received-Date: Tue, 16 Aug 2016 12:59:49 -0000
Content-Type: text/plain

Pass "--enable-downloading=no" to IcedTea's make. This ensures
IcedTea uses the versions and checksums we defined in the openjdk-7-jre
recipe for its "sub-modules".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 759b426..f848a06 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -84,6 +84,8 @@ get_jdk7_jobs[vardepsexclude] += "OPENJDK_PARALLEL_MAKE"
 JDK_JOBS = "${@get_jdk7_jobs(d)}"
 
 EXTRA_OECONF = " \
+    --enable-downloading=no \
+    \
     --disable-tests \
     --disable-hotspot-tests \
     --disable-langtools-tests \
-- 
2.1.4


