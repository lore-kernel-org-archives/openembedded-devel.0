Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D037C73D0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:19:57 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so19709554pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SqqpTVi50cZSG+4Pfae33UCuRLtXEx8u/tuclP21DEc=;
	b=iFyv17+AfpWisyxudVkl63h2kNcj/ovWIb42fvOYMBBwIGYQkJ6H015pIJhaXrdmOe
	KtwFFz2TPWCX8wd71kVs8vT5PriCKYtLhiLytlPHPcHY/FJlqXqi72aXukGZvj0RtSpX
	S6GXmT8r7s5K5kwZINS6PSnEe/W6LUi/5w4zQzKvERjFnAIrkJOgdgM2TlOP6HBgA8wB
	mZFIMHyjhVe6weS4D88aeDg+GwUg3KbcQ4NwEH3GqGZVVWmvY0/eDlzvrsIbWsn1EXv1
	Aagd804uSWzxP4xzrzAr1wcylzXTnrkODy/EtgnD6Y6+r/LKiKlV4TgMN33rLkWhE2sW
	mrww==
X-Received: by 10.68.102.161 with SMTP id fp1mr5799807pbb.64.1429798798937;
	Thu, 23 Apr 2015 07:19:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id b10sm8300296pdo.84.2015.04.23.07.19.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 07:19:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 00:19:28 +1000
Message-Id: <1429798768-4541-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-qt5][PATCH] qtwebsockets: specify GFDL license version
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
X-List-Received-Date: Thu, 23 Apr 2015 14:19:57 -0000

Fixes the following warning:
"WARNING: qtwebsockets: No generic license file exists for: GFDL in any provider"

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebsockets.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
index 1043a06..5fb149a 100644
--- a/recipes-qt/qt5/qtwebsockets.inc
+++ b/recipes-qt/qt5/qtwebsockets.inc
@@ -2,7 +2,7 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
 
-LICENSE = "GFDL & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-- 
2.3.5


