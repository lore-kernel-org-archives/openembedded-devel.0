Received: from [93.167.193.22] (helo=mail.mikrofyn.com)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@shuster>)
	id 1MvWQ2-0003tH-Fb for openembedded-devel@lists.openembedded.org;
	Wed, 07 Oct 2009 15:19:05 +0200
Received: from shuster ([10.0.1.9]) by mail.mikrofyn.com with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 7 Oct 2009 15:18:12 +0200
Received: from sgh by shuster with local (Exim 4.69)
	(envelope-from <sgh@shuster>) id 1MvWPF-0001gF-JB
	for openembedded-devel@lists.openembedded.org;
	ons, 07 okt 2009 15:18:13 +0200
From: =?utf-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2009 15:18:13 +0200
Message-Id: <1254921493-6439-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Oct 2009 13:18:12.0703 (UTC)
	FILETIME=[9F2E06F0:01CA4750]
X-SA-Exim-Connect-IP: 93.167.193.22
X-SA-Exim-Mail-From: sgh@shuster
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Update insane.bbclass following siteinfo.bbclass changes for linux -> linux-gnu
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
X-List-Received-Date: Wed, 07 Oct 2009 13:19:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Søren Holm <sgh@shuster.(none)>

---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index c41b84a..cb656f8 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -34,7 +34,7 @@ def package_qa_get_machine_dict():
             "darwin9" : { 
                         "arm" :       (40,     0,    0,          True,          True),
                       },
-            "linux" : { 
+            "linux-gnu" : { 
                         "arm" :       (40,    97,    0,          True,          True),
                         "armeb":      (40,    97,    0,          False,         True),
                         "powerpc":    (20,     0,    0,          False,         True),
-- 
1.5.6.5



