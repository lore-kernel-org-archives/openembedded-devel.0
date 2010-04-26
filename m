Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O6QQE-0000Hm-Lx
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 17:40:35 +0200
Received: from FBCMMO05.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Apr 2010 17:36:54 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Apr 2010 17:36:53 +0200
Received: from jcn ([87.3.13.230]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 26 Apr 2010 17:36:43 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1O6QMS-0004gr-Jg; Mon, 26 Apr 2010 17:36:40 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Apr 2010 17:36:34 +0200
Message-Id: <1272296194-17980-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <hqpfou$igp$1@dough.gmane.org>
References: <hqpfou$igp$1@dough.gmane.org>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 26 Apr 2010 15:36:44.0679 (UTC)
	FILETIME=[4688A970:01CAE556]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] image.bbclass: create /etc/device_table from IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Mon, 26 Apr 2010 15:40:35 -0000

Right now when the 'devices' script from initscripts is called the
layout specified in IMAGE_DEVICES_TABLES is lost.

With this change the default behaviour when no IMAGE_DEVICE_TABLES is
specified is to always use files/device_table-minimal.txt

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
Hi Koen et al.,

This looks to be enough in my preliminary tests.
As for the default behaviour change, I guess it is acceptable and
files/device_table-minimal.txt can always be changed in a later commit, maybe
to resemble more the very /etc/device_table from initscripts.

This patch fixes http://bugs.openembedded.org/show_bug.cgi?id=3593 and I
consider it an orthogonal problem to having static /dev, so this can be
reviewed alone.

Note that I used /etc instead of ${sysconfdir} on purpose as /etc is already
hardcoded in several places in image.bbclass.

Thanks,
   Antonio Ospite
   http://ao2.it

 classes/image.bbclass                  |    4 ++++
 recipes/initscripts/initscripts_1.0.bb |    4 +++-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 8e202f0..0fcbc44 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -119,8 +119,12 @@ fakeroot do_rootfs () {
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
+	mkdir -p ${IMAGE_ROOTFS}/etc
+
 	if [ "${USE_DEVFS}" != "1" ]; then
+		rm -rf ${IMAGE_ROOTFS}/etc/device_table
 		for devtable in ${@get_devtable_list(d)}; do
+			cat $devtable >> ${IMAGE_ROOTFS}/etc/device_table
 			makedevs -r ${IMAGE_ROOTFS} -D $devtable
 		done
 	fi
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index 2c0689f..43cf347 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 DEPENDS = "makedevs"
 RDEPENDS = "makedevs"
 LICENSE = "GPL"
-PR = "r117"
+PR = "r118"
 
 SRC_URI = "file://functions \
            file://halt \
@@ -35,6 +35,8 @@ SRC_URI = "file://functions \
 
 SRC_URI_append_arm = " file://alignment.sh"
 
+CONFFILES_${PN} += "${sysconfdir}/device_table" 
+
 KERNEL_VERSION = ""
 
 do_install () {
-- 
1.7.0.5



