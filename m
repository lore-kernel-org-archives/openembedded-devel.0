Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PIR6b-0004kr-IS
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 20:22:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 76D3F8F6EAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:21:09 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21712-05 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 16 Nov 2010 14:21:09 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 427D78F7244; Tue, 16 Nov 2010 14:21:08 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 105A68F6E87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:21:06 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id E54935000E6; Tue, 16 Nov 2010 14:21:05 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 14:21:05 -0500
Message-Id: <1289935265-26637-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev 141: fix postinst check for /lib/udev/rules.d symlink
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
X-List-Received-Date: Tue, 16 Nov 2010 19:22:14 -0000

[ -d foo ] succeeds even if foo is a symlink to a directory.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/udev/udev_141.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 816637f..7a34ada 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
 
 require udev.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://mount.blacklist \
 	    file://run.rules \
@@ -107,7 +107,7 @@ else
 fi
 update-rc.d $OPT udev-cache start 12 S .
 
-if [ -d $D/lib/udev/rules.d ] ; then
+if [ -e $D/lib/udev/rules.d ] && [ ! -L $D/lib/udev/rules.d ] ; then
 	echo "$D/lib/udev/rules.d is not a symlink, fixing that"
 	mv $D/lib/udev/rules.d/* $D${sysconfdir}/udev/rules.d/
 	rm -rf $D/lib/udev/rules.d
-- 
1.6.3.2



