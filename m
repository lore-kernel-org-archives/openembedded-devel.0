Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1O0CJp-00008f-PJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 13:24:14 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id E1A9B6826F;
	Fri,  9 Apr 2010 15:20:39 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1O0CFd-0003s5-6C; Fri, 09 Apr 2010 15:19:53 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 15:19:53 +0400
Message-Id: <1270811993-14861-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <201004091439.53806.khimov@altell.ru>
References: <201004091439.53806.khimov@altell.ru>
X-Altell-MailScanner-ID: E1A9B6826F.1E7A2
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rootfs_ipk.bbclass: run preinst/postinst scripts with "-e"
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
X-List-Received-Date: Fri, 09 Apr 2010 11:24:14 -0000

There are scripts that can and should work when being ran on build
host (for example, simple update-rc.d), but there are also many which
can't and won't ever (for example, anything adding users/groups).
The second group sometimes doesn't get "unpacked" flag because
scripts throw errors in the middle and return something nice from
the last command.

It can be considered as a bug in pre/postinst script (as it should
either explicitly check for "${D}" or just do "set -e" at start),
but it is common enough.

There is also another aspect to this as in general we can't be sure
that everything is OK wrt preinst/postinst if script commands throw
errors.

Running preinst/postinst scripts on host with "-e" should solve
that.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/rootfs_ipk.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 3a73ed8..5483c7e 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -70,12 +70,12 @@ fakeroot rootfs_ipk_do_rootfs () {
 	fi
 
 	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
-		if [ -f $i ] && ! sh $i; then
+		if [ -f $i ] && ! sh -e $i; then
 			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
 		fi
 	done
 	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
-		if [ -f $i ] && ! sh $i configure; then
+		if [ -f $i ] && ! sh -e $i configure; then
 			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
 		fi
 	done
-- 
1.5.6.5



