Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ogibf-00075e-O5
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:22:50 +0200
Received: by yxi11 with SMTP id 11so2248335yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=tjFHDqJaVDpue94j7A7y5BpkuIXiGkc/hDUTUQmlLDg=;
	b=hRPg5kd7oIxkzS1ORkqoEx15LLOiZC827fhgF7yILCNwwXE3pMrNjXxGcOSWnOjW5l
	XzllwwWbWHAtQP7rJSX86/Acf1aWuiLJjJvajEjm4EqexGFtO2rPTCGE2s9Yf35rfqNs
	8EB5NP5LjeC40ZHJeCk+ZGQjeIZ5jAqHunqaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ckPJSSmIW0MNcNrG78CUyL6l8fAm03PBQjD/hQgLvsSglzTa933pTAesbwp69YW/sN
	5+PQDaXsheo1rKNerlHyG9kupWpWczZp1qVZyRt6yC5tXUW/nerKRB60mJYNe6hMCpQP
	EA1j+MTkeQV4RZSiYCNqZzc+ZfabPHhRm1Omc=
Received: by 10.101.155.15 with SMTP id h15mr10420030ano.162.1280946130933;
	Wed, 04 Aug 2010 11:22:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i30sm14148912anh.29.2010.08.04.11.22.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:22:10 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 13:17:38 -0500
Message-Id: <1280945858-19260-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] matrix-gui-e: bump PR for init file fixes
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
X-List-Received-Date: Wed, 04 Aug 2010 18:22:58 -0000

* Forgot to bump the PR to pick up the changes to the init
  scripts.  This patch bumps the PR.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
index 78ef003..adb14df 100644
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ b/recipes/ti/matrix-gui-e_svn.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 
 SRCREV = "58"
 PV = "1.0"
-PR = "r13+svnr${SRCPV}"
+PR = "r14+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
-- 
1.7.0.4



