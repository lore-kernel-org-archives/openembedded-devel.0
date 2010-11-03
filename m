Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDm1Z-0001zF-MG
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 23:41:46 +0100
Received: by pxi2 with SMTP id 2so58414pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=3WrjeNRXw/QQrc2JJ2G2Igi16TlUrayqBtUrkJdyjEg=;
	b=h98PTj1DbymUhQDEHyJ4IT67N10EtllAoh9cJpGarYhkdrtpp6jO4cM4eRwiGRVOcI
	dHIlq6/ibXU/efUGOW+6UjXAw1dVALVg5DGeX8QP0dzh8UJ9qiMn2nVUhtksNhckb0P7
	7gwn1kQy0ArC8hG15xHqaaR9vO/DtvUjZrHhU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=D1uVdFDXH4+RztxVuqFuDjeJZOtB+i+ty3U6R1uAHlMhIiSLIiwX+8Vfno5xBWkUiv
	65wvcGF7RKjUGNgFKtVx1P1v8lRiiyb+W+u26BVTokEz2Tw9ExjO3XQjPPn+qazASa/b
	ZfIuBGSCyHWP2JJRsBUZtI60KSD9eMk8o2mPs=
Received: by 10.142.194.4 with SMTP id r4mr8009547wff.264.1288824053029;
	Wed, 03 Nov 2010 15:40:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e36sm14342545wfj.2.2010.11.03.15.40.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Nov 2010 15:40:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 15:40:35 -0700
Message-Id: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Wed, 03 Nov 2010 22:41:46 -0000

Currently we report wrong revision when we build from branches not based
on master because we only fetch the HEAD value which is remote master
This patch makes it to report the HEAD of whatever branch one has
checked out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/metadata_scm.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/metadata_scm.bbclass b/classes/metadata_scm.bbclass
index ffc6a8a..37024b7 100644
--- a/classes/metadata_scm.bbclass
+++ b/classes/metadata_scm.bbclass
@@ -70,7 +70,8 @@ def base_get_metadata_git_branch(path, d):
 	return "<unknown>"
 
 def base_get_metadata_git_revision(path, d):
-	rev = os.popen("cd %s; PATH=%s git show-ref HEAD 2>/dev/null" % (path, d.getVar("PATH", 1))).read().split(" ")[0].rstrip()
+	branch = os.path.basename(base_get_metadata_git_branch(path, d))
+	rev = os.popen("cd %s; PATH=%s git show-ref HEAD %s 2>/dev/null" % (path, d.getVar("PATH", 1), branch)).read().split(" ")[0].rstrip()
 	if len(rev) != 0:
 		return rev
 	return "<unknown>"
-- 
1.7.1



