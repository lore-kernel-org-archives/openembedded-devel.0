Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lx14Q-0002eV-Cn
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 17:42:38 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090423153758.IHDJ6112.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 11:37:58 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id j3dv1b0044dMFYL043dvFn; Thu, 23 Apr 2009 11:37:57 -0400
X-Authority-Analysis: v=1.0 c=1 a=OJXpgpEhvlIA:10 a=tbtiFN4IJFoA:10
	a=4HVRqb_MAAAA:8 a=YeHLNu4KA0Vy5SMvqj4A:9 a=0M4ZRmgkNRrLb3DotrgA:7
	a=EFr3UQjTlf_n-2poXfanf74jHuoA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Thu, 23 Apr 2009 08:37:54 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090423153754.GW17629@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC][PATCH] Make initscripts banner stop trying to be smart
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
X-List-Received-Date: Thu, 23 Apr 2009 15:42:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I ran into this on my boards that start out with the really minimal
(console and null only) set of dev nodes prior to udev running.  The
banner script looks around for what might be the vtmaster (aka what's
got console) to say that we're booting.  But that's where things go by
default anyhow.  This would also let slugos use the normal version, if
they want.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

diff --git a/recipes/initscripts/initscripts-1.0/banner b/recipes/initscripts/initscripts-1.0/banner
index 0349ce1..4e69c29 100644
--- a/recipes/initscripts/initscripts-1.0/banner
+++ b/recipes/initscripts/initscripts-1.0/banner
@@ -1,17 +1,3 @@
 #!/bin/sh
 
-if [ ! -e /dev/tty ]; then
-    /bin/mknod -m 0666 /dev/tty c 5 0
-fi
-
-if ( > /dev/tty0 ) 2>/dev/null; then
-    vtmaster=/dev/tty0
-elif ( > /dev/vc/0 ) 2>/dev/null; then
-    vtmaster=/dev/vc/0
-elif ( > /dev/console ) 2>/dev/null; then
-    vtmaster=/dev/console
-else
-    vtmaster=/dev/null
-fi
-echo > $vtmaster
-echo "Please wait: booting..." > $vtmaster
+echo "Please wait: booting..."
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index cbcfec5..6642144 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 DEPENDS = "makedevs"
 RDEPENDS = "makedevs"
 LICENSE = "GPL"
-PR = "r114"
+PR = "r115"
 
 SRC_URI = "file://functions \
            file://halt \

-- 
Tom Rini


