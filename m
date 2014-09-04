Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7F371472
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 18:36:01 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id q200so6364785ykb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 11:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=hD4GhKxAj3L92KAJZdpbRaWWw6+Sb3ys5zzkxE2ktHM=;
	b=GN6xV+dm9gVpTromu6PDzknxJ732YhQfnnx3cTC7KyUeRZyHPEqeCcNj5pgBkWcIs2
	WWYqCCPHng3iECRKPLqz40rm1etzLEdYDRHfcwUiatWGS508LB7Lgg8xsCJQ5j5a8Yds
	7/32cg8BeqftOlG6FJ3HubXdF9+AA1id2nnROCgB1fZ5tuCW+KSm53o8/4cIY5gNaL0J
	Jyxytuysw3DrKgimgpXqvBZbhYl+GEHRkTa7Itikun+SRUedJQyCbAPYUbgR39bbx8Yc
	9sPh8PLHTxF3rtQGsqzoBuEVbhQEL34UYN5+Jd6JN/YyTML6cAztJaKgtfri6RhtU0nr
	TXRA==
X-Received: by 10.236.86.144 with SMTP id w16mr7649625yhe.5.1409855762301;
	Thu, 04 Sep 2014 11:36:02 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id p29sm8961053yho.39.2014.09.04.11.36.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 11:36:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id C8B591C4B576F; Thu,  4 Sep 2014 15:35:57 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  4 Sep 2014 15:35:56 -0300
Message-Id: <1409855756-19821-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] qtwayland: Change module branch for 5.4
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
X-List-Received-Date: Thu, 04 Sep 2014 18:36:08 -0000

This is to fix the fetcher failure as the "stable" branch has been
removed. We does not change the revision we are using so this is
a safe change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtwayland_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 28a3760..0bbb5ab 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -5,6 +5,7 @@ require ${PN}.inc
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
 SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
+QT_MODULE_BRANCH = "5.4"
 
 SRC_URI += " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
-- 
2.1.0


