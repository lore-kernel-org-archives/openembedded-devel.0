Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ojvgq-0006L8-Tc
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 16:57:13 +0200
Received: by pxi11 with SMTP id 11so819170pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 07:56:13 -0700 (PDT)
Received: by 10.142.238.2 with SMTP id l2mr1364812wfh.164.1281711373790;
	Fri, 13 Aug 2010 07:56:13 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id u1sm964282vcf.46.2010.08.13.07.56.11
	(version=SSLv3 cipher=RC4-MD5); Fri, 13 Aug 2010 07:56:11 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 09:56:08 -0500
Message-Id: <1281711368-11618-2-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1281711368-11618-1-git-send-email-jkridner@beagleboard.org>
References: <1281557643-24477-1-git-send-email-jkridner@beagleboard.org>
	<1281711368-11618-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-image: add dsplink
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
X-List-Received-Date: Fri, 13 Aug 2010 14:57:13 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-test-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/beagleboard-test-image.bb
index 7361017..cbb2e7d 100644
--- a/recipes/images/beagleboard-test-image.bb
+++ b/recipes/images/beagleboard-test-image.bb
@@ -23,6 +23,7 @@ IMAGE_INSTALL += " \
   u-boot-mkimage \
   sox \
   devmem2 \
+  ti-dsplink-examples \
 "
 
 export IMAGE_BASENAME = "beagleboard-test-image"
-- 
1.5.6.4



