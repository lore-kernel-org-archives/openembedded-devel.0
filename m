Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M28PQ-0002ZK-OM
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 20:33:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4AB5F4A60FD;
	Thu,  7 May 2009 14:27:21 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13941-02; Thu,  7 May 2009 14:27:21 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 14F614A7B28; Thu,  7 May 2009 14:27:19 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id CC52649B44C;
	Thu,  7 May 2009 14:27:15 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id BED3841710; Thu,  7 May 2009 14:27:15 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2009 14:27:14 -0400
Message-Id: <1241720835-17998-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1241720835-17998-1-git-send-email-msmith@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 18:33:39 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/grub/grub_0.97.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/grub/grub_0.97.bb b/recipes/grub/grub_0.97.bb
index ef37af1..e1162ef 100644
--- a/recipes/grub/grub_0.97.bb
+++ b/recipes/grub/grub_0.97.bb
@@ -20,11 +20,12 @@ python __anonymous () {
 
 do_install_append() {
         install -d ${D}/boot/
-	ln -sf ../usr/lib/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
+	ln -sf ..${libdir}/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
 
 	# TODO: better use grub-set-default script here?
-	install -m 0644  ${WORKDIR}/menu.lst ${D}/boot/grub
+	install -m 0644 ${WORKDIR}/menu.lst \
+		${D}${libdir}/grub/i386${TARGET_VENDOR}/
 }
 
 FILES_${PN}-doc = "${datadir}"
-FILES_${PN} = "/boot /usr"
+FILES_${PN} = "/boot ${prefix}"
-- 
1.5.6.5



