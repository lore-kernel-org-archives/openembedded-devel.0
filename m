Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3496777088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:41 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so35423345wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lXKTUhgv5NHWzcucqgrR8LIYB/tCMP0dShjWsAkn6ZU=;
	b=BdmbyvsJQxC5hnNxANpNPVoCw91+OADl2cGuhzQwC3+MWDdM0pRdcCnLzkF06+hsO/
	DuTVtY5LiacTPJKBeI/dpn1ZPgxneWXFouTk6QfJxS/+6hmYJnBR5oWDg8Bd5MSDayZr
	lbXBgb2hAKbss1nQRcMFAVvPTD5FRLtBIDyfV9npNj5pm72359+vzmSXQURunf7aQRoE
	NwwXgwqXiRqxCQdkVu5kFv4IkO323mQJ4VdvFwqaK9CCqbCUyDGGhKyDnF2cZbJqZ43e
	xSA+k7VLojlJR6eNk9WxarzVjKHI+9CqIWOyT5bvjkgR5Iz3Oy6vL5S9QONgjMomiiYd
	wOSg==
X-Received: by 10.180.102.226 with SMTP id fr2mr4310302wib.3.1443713381989;
	Thu, 01 Oct 2015 08:29:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kj5sm6684167wjb.19.2015.10.01.08.29.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:25 +0200
Message-Id: <1443713428-8635-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 07/10] qt-creator: blacklist because fails to build and conflicts with qt5-creator
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index d911db1..88f7a45 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -49,3 +49,6 @@ INSANE_SKIP_${PN} += "libdir"
 INSANE_SKIP_${PN}-dbg += "libdir"
 
 RDEPENDS_${PN} += "perl"
+
+# /usr/include/qt4/QtCore/qsharedpointer_impl.h:336:11: error: 'product' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+PNBLACKLIST[qt-creator] ?= "BROKEN: fails to build with gcc-5 and conflicts with qt5-creator"
-- 
2.6.0


