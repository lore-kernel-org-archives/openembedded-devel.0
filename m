Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 77A4672CFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 04:55:20 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so89836209iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 21:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q3Lo98m6myAoielRJ6u1H2GT53knb7w8LFrg9XSrWuU=;
	b=PUVgh8ARv4McEY/lU55yYYH5dD4xNGAf2lNXJUAYN+TxDWpEtEaam9JW/UDjgVUQur
	HkBAmRO6plKvxV0dJWnX4NKp12w+3nRwfpFa+ulUMa9T3RW4NsGLs+orvObPsZkToC3c
	ScVZKmTlmscBdeqSM7lWJkWqMx1dzExlhM+mwKTiAHiCA5bzphxEiBodW1UNK+ESlzST
	58wAeoSHX/5COCHFhTtt7+bwUS+lYGn4S+wmfoiNYploQkVD+tbuVxtPJJImGgVcLDQl
	e0Qh3Kadx5Xo+06uYetuPV7JIqCfwfV2JabP5WMrwWUx3oiHQkgCOr7EL4z/k57Dq7n9
	ByCw==
X-Received: by 10.50.30.202 with SMTP id u10mr12098190igh.28.1431924921163;
	Sun, 17 May 2015 21:55:21 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 35sm6981948ior.34.2015.05.17.21.55.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 May 2015 21:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 May 2015 21:55:14 -0700
Message-Id: <1431924914-22516-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431924914-22516-1-git-send-email-raj.khem@gmail.com>
References: <1431924914-22516-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qt5-opengles2-test: Upgrade to latest tip
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
X-List-Received-Date: Mon, 18 May 2015 04:55:20 -0000

Fix dependencies on the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/examples/qt5-opengles2-test_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/examples/qt5-opengles2-test_git.bb b/recipes-qt/examples/qt5-opengles2-test_git.bb
index 0756e62..f763912 100644
--- a/recipes-qt/examples/qt5-opengles2-test_git.bb
+++ b/recipes-qt/examples/qt5-opengles2-test_git.bb
@@ -5,15 +5,15 @@ window focus handling and some other game-related features."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/main.cpp;beginline=1;endline=26;md5=93b83ece006c9e76b9fca80c3aecb169"
 
-PV = "1.0.2+gitr${SRCPV}"
+PV = "1.0.4+gitr${SRCPV}"
 
-DEPENDS = "qtbase"
+DEPENDS = "qtbase qtsensors"
 
 # Depends on gles2 enabled and that's not default configuration
 EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = "git://github.com/thp/qt5-opengles2-test.git"
-SRCREV = "9500c00a7094a881e53afd71146d76d40834df45"
+SRCREV = "3fa3789c28658b6f0bbddc3105f575f1074e87f2"
 S = "${WORKDIR}/git"
 
 inherit qmake5
-- 
2.1.4


