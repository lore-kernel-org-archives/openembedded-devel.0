Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 04C55608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 12:55:39 +0000 (UTC)
Received: by pacfa8 with SMTP id fa8so9131969pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/913Cw+Cm7E9PXSFXUGr11vLTuxIikhWvk7zkKKpAiE=;
	b=yTOBKhSvT0+ng7vlj14UbARLvDK0OMI/DVbrliqMPYpjgaFTUD0AdT4ZCpP12xq3Rz
	pZEitY6gEXIM6f4P/C9y4RyfwC5TGdDE9/4l9RZs8dCbl0bQy5DCYknIW0QEWKeYHAap
	M67L/AeykKwQEQwybwbeiJRV+CqVol4hXykffMOtG7bJKAF3yKGk/AznYhDbT/1TTOlM
	ehh57+UZo0ZnScHC/3whrpNftc/C2xW+z1cRiVH+EF7LO9v9Z3eIb/9kOBc46cRYM1Je
	lUD3RI3mm71ecyX46M9IfrUOGeU+6riO9M6qmC8gDJxIlJ2WzbSTbdAdOtwpJm3tWItB
	tYtQ==
X-Received: by 10.68.68.143 with SMTP id w15mr41546525pbt.56.1445864139675;
	Mon, 26 Oct 2015 05:55:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	of1sm33953651pbc.11.2015.10.26.05.55.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 05:55:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2015 23:55:12 +1100
Message-Id: <1445864112-13477-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-qt5][PATCH] libconnman-qt5: update SRC_URI
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
X-List-Received-Date: Mon, 26 Oct 2015 12:55:41 -0000

The repository has moved from github.com to merproject.org.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 229003d..1f4b8c2 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -8,7 +8,7 @@ DEPENDS += "qtbase qtdeclarative"
 PV = "1.0.97+git${SRCPV}"
 
 SRCREV = "4cca434935fa4d70d6841a2c20717eecb0beafa8"
-SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
+SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.1


