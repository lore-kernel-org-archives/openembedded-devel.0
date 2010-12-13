Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PSHjM-0000oX-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 00:22:57 +0100
Received: by qyk36 with SMTP id 36so16302qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 15:21:20 -0800 (PST)
Received: by 10.229.85.80 with SMTP id n16mr4322247qcl.50.1292282480056;
	Mon, 13 Dec 2010 15:21:20 -0800 (PST)
Received: from localhost.localdomain (cpe-24-165-208-114.neo.res.rr.com
	[24.165.208.114])
	by mx.google.com with ESMTPS id y17sm4363705qci.21.2010.12.13.15.21.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 15:21:19 -0800 (PST)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 18:21:01 -0500
Message-Id: <1292282461-13310-1-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: Get rid of "WARNING: Function do_build doesn't exist"
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
X-List-Received-Date: Mon, 13 Dec 2010 23:22:57 -0000

Signed-off-by: Bob Foerster <robert@erafx.com>
---
 classes/base.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index ac0f388..4c27273 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -287,6 +287,9 @@ base_do_package() {
 addtask build
 do_build = ""
 do_build[func] = "1"
+do_build() {
+       :
+}
 
 def set_multimach_arch(d):
     # 'multimachine' handling
-- 
1.7.0.4



