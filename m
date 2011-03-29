Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q4bzS-00015Z-PT
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 18:41:58 +0200
Received: from jcn (87.6.149.121) by smtp209.alice.it (8.5.124.08)
	id 4D498EF304B2358D; Tue, 29 Mar 2011 18:34:47 +0200
Received: from ao2 by jcn with local (Exim 4.75)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Q4bsU-0001u3-KA; Tue, 29 Mar 2011 18:34:46 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Mar 2011 18:34:43 +0200
Message-Id: <1301416483-7255-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.4.1
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [RFC, PATCH] classes/mirrors.bbclass: add mirror for download.osgeo.org
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
X-List-Received-Date: Tue, 29 Mar 2011 16:41:59 -0000

The host download.osgeo.org is not reachable from some network/country
because of some routing issue, and this makes the do_fetch task of the
libtiff recipe to fail:

NOTE: Running task 400 of 648 (ID: 8, /home/ao2/Proj/EZX/OE/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_fetch)
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_fetch: Started
--2011-03-29 16:57:30--  http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz
 Resolving download.osgeo.org... 198.202.74.218
 Connecting to download.osgeo.org|198.202.74.218|:80... failed: Connection timed out.
 Retrying.

 --2011-03-29 17:00:56--  (try: 2)  http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz
 Connecting to download.osgeo.org|198.202.74.218|:80... failed: Connection timed out.
 Retrying.

 --2011-03-29 17:04:08--  (try: 3)  http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz
 Connecting to download.osgeo.org|198.202.74.218|:80... failed: Connection timed out.
 Retrying.

 --2011-03-29 17:07:20--  (try: 4)  http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz
 Connecting to download.osgeo.org|198.202.74.218|:80... failed: Connection timed out.
 Retrying.

 --2011-03-29 17:10:34--  (try: 5)  http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz
 Connecting to download.osgeo.org|198.202.74.218|:80... failed: Connection timed out.
 Giving up.

 --2011-03-29 17:13:43--  http://mirrors.openembedded.org/tiff-4.0.0beta6.tar.gz
 Resolving mirrors.openembedded.org... 82.197.159.157
 Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed: Connection refused.
 --2011-03-29 17:13:43--  http://sources.openembedded.org/tiff-4.0.0beta6.tar.gz
 Resolving sources.openembedded.org... 140.211.169.165
 Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
 HTTP request sent, awaiting response... 404 Not Found
 2011-03-29 17:13:44 ERROR 404: Not Found.

NOTE: package tiff-3.9.4+4.0.0beta6-r1: task Fetch failed: Unable to fetch URL http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL http://download.osgeo.org/libtiff/tiff-4.0.0beta6.tar.gz from any source.' failed
ERROR: Task 8 (/home/ao2/Proj/EZX/OE/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_fetch) failed with exit code '1'
ERROR: '/home/ao2/Proj/EZX/OE/openembedded/recipes/libtiff/tiff_3.9.4.bb' failed

Add a reachable mirror for it, so that the tiff recipe can build fine.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---

A less invasive solution would be to change the SRC_URI address directly in 
the recipe, but I don't know if that can affects anyone else, or we can even 
have a copy of the archive hosted on mirrors.openembedded.org and live with 
that until the next release. What is  your opinion?

Thanks,
  Antonio Ospite
  http://ao2.it

 classes/mirrors.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index 71ee5f6..bb1f7cb 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -52,6 +52,7 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/
 http://www.apache.org/dist  http://archive.apache.org/dist
+http://download.osgeo.org/ http://download2.osgeo.org/
 ftp://.*/.*     http://mirrors.openembedded.org/
 https?$://.*/.* http://mirrors.openembedded.org/
 ftp://.*/.*     http://sources.openembedded.org/
-- 
1.7.4.1



