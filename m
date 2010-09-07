Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OssD9-000389-Et
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 09:03:20 +0200
Received: by pwj8 with SMTP id 8so1324966pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nXQ5D0/fdeDaWanpzRUUDwRd0bKeGL77U64+5y5XbwU=;
	b=vg2Mp6Re9IO5pDVCdMBcU1IPmPybZAF0trZ757NAYM5LvjC1P7bzFtSQnjWmk0RumI
	Ki4lG50grVFhRwFEem8AeoeHFGtp5YcVli2vZ6DThscjk24lcYhcTeCiqFwOK7vb8ObE
	0lczgjimxIc6Sbqf7LKYyn/szCFZI7C65/hAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EstfBLYlkFxl14Y9lNUL6rfPXvEsx+7UEnkRorZWUIxyiSzeWKn65sQB7j2P5uF4Tq
	G2ePf5aQhSdgk7+eACV9sGIVutuv6A2034PlZi8bsnEqEXT/sN4s6STQ/wnC3UDgs5fi
	sCFTCgYKeK5pr38xgc3C68V4iKlKYgsfjofKU=
Received: by 10.114.39.10 with SMTP id m10mr4141183wam.184.1283842957859;
	Tue, 07 Sep 2010 00:02:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o17sm12901596wal.9.2010.09.07.00.02.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 00:02:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 00:02:31 -0700
Message-Id: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] java-library.bbclass: do_stage is not needed anymore
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
X-List-Received-Date: Tue, 07 Sep 2010 07:03:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/java-library.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 904b4f1..5ce0537 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -65,7 +65,3 @@ do_install() {
 java_stage() {
   oe_jarinstall -s ${JARFILENAME} ${ALTJARFILENAMES}
 }
-
-do_stage() {
-  java_stage
-}
-- 
1.7.1



