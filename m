Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oy4WM-0002mc-4h
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:12:40 +0200
Received: by qyk4 with SMTP id 4so6074924qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AWWnxLK/Y6NGee0d2A2C6t+mR109mrVTy7ZMNXnRFQQ=;
	b=cRy5tj1DxH2nr4keiD9dOBT4AXF72pc4lGLtz68YuMhWfHFTBnIdaGdSBVz3ZQVXtA
	9Ma43c05RQNij5GcOmmHcJZrz4VxtEZ3L+tVFdzE7REJt6pcQQ/PhBty8Q+1tgusavxG
	Dd7IrmIaqF/YJ0I3TPplJVUzB6Vr+t+b19cq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lIiWTToLrFMRlKSfuIfrqOPFIdluByCydynLVfxqd7h1aGj4TBium3b1JNjyLyjG02
	P2AfQSfbHsK52FjkxOTktm8mqUhn/K+gWW+yFuzkVa8Hewwesl8UXrOrjEWln7oD/jaL
	rZLdddCQ9+wy2SNfHd37qElPBMIBmimmgjAVw=
Received: by 10.224.47.85 with SMTP id m21mr7068814qaf.270.1285081589920;
	Tue, 21 Sep 2010 08:06:29 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id t4sm8982360qcs.28.2010.09.21.08.06.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 08:06:29 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 08:06:21 -0700
Message-Id: <1285081581-19915-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] utility-tasks.bbclass: drop mrproper task
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
X-List-Received-Date: Tue, 21 Sep 2010 15:12:40 -0000

From: Chris Larson <chris_larson@mentor.com>

This task is misleading and potentially quite harmful, as it wipes the entire
DL_DIR, yet tasks are supposed to be recipe specific.  We have the proper
distclean task to wipe sources for a recipe + run do_clean, and the user can
always wipe all of DL_DIR manually if necessary.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/utility-tasks.bbclass |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/classes/utility-tasks.bbclass b/classes/utility-tasks.bbclass
index 29bc781..7495d96 100644
--- a/classes/utility-tasks.bbclass
+++ b/classes/utility-tasks.bbclass
@@ -38,18 +38,6 @@ python do_rebuild() {
 	"""rebuild a package"""
 }
 
-addtask mrproper
-do_mrproper[dirs] = "${TOPDIR}"
-do_mrproper[nostamp] = "1"
-python do_mrproper() {
-	"""clear downloaded sources, build and temp directories"""
-	dir = bb.data.expand("${DL_DIR}", d)
-	if dir == '/': bb.build.FuncFailed("wrong DATADIR")
-	bb.debug(2, "removing " + dir)
-	os.system('rm -rf ' + dir)
-	bb.build.exec_func('do_clean', d)
-}
-
 addtask distclean
 do_distclean[dirs] = "${TOPDIR}"
 do_distclean[nostamp] = "1"
-- 
1.7.2.3



