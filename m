Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 99FDE738B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:02:40 +0000 (UTC)
Received: by widex7 with SMTP id ex7so27117023wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BlTArB1UEECyzag1zjpk5VN7evO5hxF06r4LRLy9X4k=;
	b=SjirowLSyscyKSB/fHsOx7+Zemd4EIhX0MWOn8XOdLo+71CL8BAPTDbXj88VnytLDv
	13c5Q0v9ImHc4fk+oN6PGzr6gOfqZvKUkz0XIU6YbEqj6wKRWoyBwD7SPsSyC49zz+R5
	uscmDnd4wFApXeiE6z99p5nIdZ4u/QqJk9vqBDVAneW7WbRA9lOxZSQ/GykhKb/fWUhk
	A1dwCLt0XoBAkOKQ7ZsYRVzpiNa7uYuCGzAJwDGjrMqame5gBkvL6CHatVgw6L+VHJHb
	8gUU6dMQrMb/qun1/JhnNTvmPorOoICQqvkVUjVJ+qom3HXwBoL6MfPKlME56FomJv5O
	ZPtA==
X-Received: by 10.194.11.40 with SMTP id n8mr5780796wjb.43.1425459761510;
	Wed, 04 Mar 2015 01:02:41 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id lj13sm6128171wic.9.2015.03.04.01.02.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 01:02:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2015 10:02:09 +0100
Message-Id: <1425459730-7272-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qt5-creator: add qtquick1 to DEPENDS
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
X-List-Received-Date: Wed, 04 Mar 2015 09:02:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt5-creator_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-creator_3.3.0.bb b/recipes-qt/qt5/qt5-creator_3.3.0.bb
index 76f9982..cbcd4bb 100644
--- a/recipes-qt/qt5/qt5-creator_3.3.0.bb
+++ b/recipes-qt/qt5/qt5-creator_3.3.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit qmake5
 
-DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg"
+DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg qtquick1"
 
 SRC_URI = " \
     http://download.qt.io/official_releases/qtcreator/3.3/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
-- 
1.9.3


