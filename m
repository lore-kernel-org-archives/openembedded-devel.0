Received: from [194.187.214.26] (helo=iohazard.net)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <czr@iki.fi>)
	id 1Mnrc6-00013P-BM for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 12:19:53 +0200
Received: from chehov.intranet (a88-114-240-122.elisa-laajakaista.fi
	[::ffff:88.114.240.122])
	(AUTH: PLAIN czr, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by iohazard.net with esmtp; Wed, 16 Sep 2009 13:19:17 +0300
	id 00065940.4AB0BBA5.00006BFB
Message-ID: <4AB0BBA2.8030607@iki.fi>
Date: Wed, 16 Sep 2009 13:19:14 +0300
From: Aleksandr Koltsoff <czr@iki.fi>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
Mime-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 194.187.214.26
X-SA-Exim-Mail-From: czr@iki.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] armv5te mentioned twice on eabi-capable list
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
X-List-Received-Date: Wed, 16 Sep 2009 10:19:53 -0000
Content-Type: multipart/mixed;
	boundary="=_iohazard.net-27643-1253096357-0001-2"

--=_iohazard.net-27643-1253096357-0001-2
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

(My first patch generated with git, please be gentle :-).

armv5te is mentioned twice in the arm_eabi_supporting_arches list of
sane-toolchain.inc. Remove the latter occurance.

ak.

--=_iohazard.net-27643-1253096357-0001-2
Content-Type: text/x-diff; name="0001-fix-armv5te-mentioned-twice-in-the-eabi-capable-list.patch"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-fix-armv5te-mentioned-twice-in-the-eabi-capable-list.pa";
 filename*1="tch"

From 0776995c4668d744ff96397639ac646fc4b5133c Mon Sep 17 00:00:00 2001
From: Aleksandr Koltsoff <czr@iki.fi>
Date: Wed, 16 Sep 2009 13:12:05 +0300
Subject: [PATCH] fix armv5te mentioned twice in the eabi-capable list

---
 conf/distro/include/sane-toolchain.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index e2c6740..d0bb8bc 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -157,7 +157,7 @@ def detect_arm_abi (d):
 def compute_os_portion_of_target_triplet (d):
 	import bb
 	arm_eabi_supporting_arches = "armv6 armv6-novfp \
-	armv5te iwmmxt armv7a armv7 armv6 armv5teb armv5te armv4t"
+	armv5te iwmmxt armv7a armv7 armv6 armv5teb armv4t"
 	ppc_spe_supporting_arches = "ppce500v2 ppce500"
 
   	if bb.data.getVar("LIBC", d, 1) == "uclibc":
-- 
1.6.4


--=_iohazard.net-27643-1253096357-0001-2--
