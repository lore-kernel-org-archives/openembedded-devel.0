Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEE66F7B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 15:52:24 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so8662273pdj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RFjZWfCDh+dFvaZnlNAzxIgK9MiVloLmp2s4dcO932Q=;
	b=i8G4MYxFDVNRCUb+yCz8KPP+N0ET/ZNjzyz9l5iUM1HgXvD+3o5JLL1KvuSheChYFR
	E4Jg71vbkcZFJCGKqCMTwVx7juM4yJMJJp3Ol3uMo6an5Xbrpn4UbZ8dwUJXNgJrELCX
	iGHhVR+/ZtRuBEBtyvXBBv+JoMvwBMIgdkLCxIwqLglH+76UC0/sksJSjuugtX7eOk31
	Sp8zJ9PVGoH85FsMWyGw+bKV5rJGFILNTmtICezmgEOF8seJ3yRSmRjstqvoTNtDnxW2
	7Qsf7QHta4On9biDIClYKI/sEk0zBBLlbwkDUBXQi1INrZzfq9pPvqvnsg6Pkh30fa/O
	NXQQ==
X-Received: by 10.66.136.131 with SMTP id qa3mr47769142pab.77.1394553143596;
	Tue, 11 Mar 2014 08:52:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ac5sm76191423pbc.37.2014.03.11.08.52.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 08:52:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 08:53:52 -0700
Message-Id: <1394553232-5922-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [dora][meta-qt5][PATCH] qtlocation, qtsystems: Fix QT_MODULE_BRANCH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2014 15:52:26 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtlocation_git.bb |    2 --
 recipes-qt/qt5/qtsystems_git.bb  |    2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index ddf3bcb..66032b6 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -7,6 +7,4 @@ PV = "4.999+5.0.0-beta1+git${SRCPV}"
 # drop when bumping SRCREV
 PR = "r1"
 
-QT_MODULE_BRANCH = "master"
-
 SRCREV = "f28408346243cf090326f4738fd838219c21e00f"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index b1126f5..5456dfb 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -7,6 +7,6 @@ PV = "4.999+5.0.0-beta1+git${SRCPV}"
 # drop when bumping SRCREV
 PR = "r1"
 
-QT_MODULE_BRANCH = "master"
+QT_MODULE_BRANCH = "dev"
 
 SRCREV = "701442ad6358b9f27978aafae82074124468f88c"
-- 
1.7.10.4


