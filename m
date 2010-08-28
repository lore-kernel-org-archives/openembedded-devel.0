Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxx-0001rn-H6
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:41 +0200
Received: by pzk2 with SMTP id 2so1637564pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=jZ5KFDafFqKOur263e1ng/i1SvdfpddCKW9SjaZ7Ujs=;
	b=dVbVw0lpRerG1Yv87DCgEHLgHrpDJ3PFCuBQw9RKIRkac2Tc8FVDLQF5+btWIi6tac
	JNau7K9ry9aKi0UNooGZEk9tY7HgL0GtSMb/OVZn3vDl+ls/Sa8M1c4CdBBNNXlo5sV8
	LghrifsWKTIshGwkYo6kfBsComTSEmyKO1B8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kunk/ab+2+Haexxf1Irb1Xd205YUp7xWxK7bp04wMFW91hw9JmvT/54X/tkenL9lQM
	+MY4JglnmMVNdYmuZa2n7oB/ufkblA8zx+/560BYJoxzLSrq3NGbP14fPkXJSx7Fq1Pr
	W2jcK8kwPNpfIuTuHpjiPIm3Z28sBQ82Dh6wQ=
Received: by 10.142.136.1 with SMTP id j1mr2637472wfd.331.1283027095056;
	Sat, 28 Aug 2010 13:24:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:20 -0700
Message-Id: <1283027073-12308-11-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/23] task-gpe.bb: virtual/xserver can not be RDEPEND'ed on it can be DEPEND'ed upon
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-gpe.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-gpe.bb b/recipes/tasks/task-gpe.bb
index 785f018..92efb3a 100644
--- a/recipes/tasks/task-gpe.bb
+++ b/recipes/tasks/task-gpe.bb
@@ -18,7 +18,9 @@ PACKAGES = "\
     gpe-task-sectest"
 
 RDEPENDS_gpe-base-depends = "\
-    diet-x11 \
+    diet-x11"
+
+DEPENDS_gpe-base-depends = "\
     virtual/xserver"
 
 RDEPENDS_gpe-task-base = "\
@@ -102,7 +104,7 @@ RDEPENDS_gpe-task-games = "\
     xdemineur"
 
 RDEPENDS_gpe-task-connectivity = "\
-    gpe-mini-browser"
+    gpe-mini-browser2"
 #    gaim
 #    linphone-hh
 
-- 
1.7.1



