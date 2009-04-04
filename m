Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LqBy8-0007b2-BN
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 21:55:59 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090404195313.KKOI15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 4 Apr 2009 15:53:13 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id bXtE1b0064dMFYL04XtEqw; Sat, 04 Apr 2009 15:53:14 -0400
X-Authority-Analysis: v=1.0 c=1 a=dCPe7Aef5DIA:10 a=3Vc4vK90Be8A:10
	a=9qJxKk-okkm3dTASPu0A:9 a=ItbMwiYGYptqhIbg-nNWjcnhGRcA:4
	a=0oFHZcPLJ8YA:10
X-CM-Score: 0.00
Date: Sat, 4 Apr 2009 12:53:14 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090404195314.GQ30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<20090403221813.GK30840@smtp.west.cox.net>
	<20090404192517.GP30840@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090404192517.GP30840@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.41
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] meta-toolchain-gpe-sbox: Drop task-sdk-gpephone (to match	m-t-gpe), bump PR
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
X-List-Received-Date: Sat, 04 Apr 2009 19:55:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After a quick check with Florian Boor, this is also correct.

---
meta-toolchain-gpe-sbox: Drop task-sdk-gpephone (to match m-t-gpe), bump PR

---
 recipes/meta/meta-toolchain-gpe-sbox.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/meta/meta-toolchain-gpe-sbox.bb b/recipes/meta/meta-toolchain-gpe-sbox.bb
index 29e39c5..679e50c 100644
--- a/recipes/meta/meta-toolchain-gpe-sbox.bb
+++ b/recipes/meta/meta-toolchain-gpe-sbox.bb
@@ -1,12 +1,11 @@
-PR = "r1"
+PR = "r2"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-base \
     task-sdk-sbox \
     task-sdk-sbox-gpe \
     task-sdk-x11 \
     task-sdk-x11-ext \
-    task-sdk-gpe \
-    task-sdk-gpephone"
+    task-sdk-gpe"
 
 require meta-toolchain.bb
 
-- 
1.5.6.3

-- 
Tom Rini


