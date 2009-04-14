Received: from [93.17.128.3] (helo=smtp21.services.sfr.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ptitjes@free.fr>) id 1Ltm4J-0007fu-Pd
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 19:05:10 +0200
Received: from filter.sfr.fr (localhost [127.0.0.1])
	by msfrf2112.sfr.fr (SMTP Server) with ESMTP id 45B6E7000098
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 19:01:26 +0200 (CEST)
Received: from didier.local (unknown [93.6.66.28])
	by msfrf2112.sfr.fr (SMTP Server) with ESMTP id 1ADD57000094
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 19:01:26 +0200 (CEST)
X-SFR-UUID: 20090414170126110.1ADD57000094@msfrf2112.sfr.fr
Message-ID: <49E4C165.5070701@free.fr>
Date: Tue, 14 Apr 2009 19:01:25 +0200
From: "Didier \"Ptitjes\"" <ptitjes@free.fr>
User-Agent: Thunderbird 2.0.0.21 (Macintosh/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 93.17.128.3
X-SA-Exim-Mail-From: ptitjes@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Darwin] cp -d fix in packaged-staging.bbclass
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
X-List-Received-Date: Tue, 14 Apr 2009 17:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fix thanks to kergoth.

 From cce22835b4205649a61eb32dd41cd4f991190c85 Mon Sep 17 00:00:00 2001
From: Didier Villevalois <didier@didier.local>
Date: Tue, 14 Apr 2009 17:51:57 +0200
Subject: [PATCH] packaged-staging.bbclass: BSD doesn't support cp -d, so 
change to -P

Signed-off-by: Didier Villevalois <didier@didier.local>
---
  classes/packaged-staging.bbclass |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/packaged-staging.bbclass 
b/classes/packaged-staging.bbclass
index d6272b8..741abaa 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -196,7 +196,7 @@ python packagestage_scenefunc () {
          #
          # Copy the stamp files into the main stamps directoy
          #
-        cmd = bb.data.expand("cp -dpR ${WORKDIR}/tstage/stamps/* 
${TMPDIR}/stamps/", d)
+        cmd = bb.data.expand("cp -PpR ${WORKDIR}/tstage/stamps/* 
${TMPDIR}/stamps/", d)
          ret = os.system(cmd)
          if ret != 0:
              bb.fatal("Couldn't copy the staging package stamp files")
@@ -401,7 +401,7 @@ python do_package_stage () {
      bb.mkdirhier(destdir)
      # We need to include the package_stage stamp in the staging 
package so create one
      bb.build.make_stamp("do_package_stage", d)
-    os.system("cp -dpR %s.do_* %s/" % (stampfn, destdir))
+    os.system("cp -PpR %s.do_* %s/" % (stampfn, destdir))

      pstage_set_pkgmanager(d)
      bb.build.exec_func("staging_helper", d)
-- 
1.6.2.2




