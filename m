Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1570D75A17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 12:33:42 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so35055097wgq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 05:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=GPMydSaypKMuM/cYZVPSlVi8uqw6JMGc8CYXebZLgwM=;
	b=rHA1ZwLeHqIcYQNct3rK/pfSdWKlRmm5RPbhU0is5FD3xDbiW5HOCJvxuwgXY2eSdG
	PIUllo1sedohxOmy7eO3UI0VO3UTRdzJze4IYyz7PT/gpsOvjOGiVVGiX5xEUmRPDHUC
	oKEe2tHsQIrjHzoDUCySrmIQGElviaDHUwhFAc8QpKhBduxJj8fpmRIv3HfU1VX+kKSH
	eOLTHHc/OLVrbLa90tINMKeW2AILM+OC36iPvU9wPDNCr7WIjcldjcytFt6Axr9jaDPC
	Ii02pw3ReXQY3xWsGIqJlALcHiGTGjXunfHLy6NsF25LmFEn/OhyPpEVioMmtrhqjEfX
	0XqQ==
X-Received: by 10.194.203.3 with SMTP id km3mr65770690wjc.114.1435149222661;
	Wed, 24 Jun 2015 05:33:42 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id df1sm2368018wib.12.2015.06.24.05.33.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 05:33:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jun 2015 14:33:13 +0200
Message-Id: <1435149193-5487-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5-creator: add missing RRECOMMENDS for instant usage
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
X-List-Received-Date: Wed, 24 Jun 2015 12:33:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt5-creator_3.3.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-creator_3.3.1.bb b/recipes-qt/qt5/qt5-creator_3.3.1.bb
index 8f993ca..97ca450 100644
--- a/recipes-qt/qt5/qt5-creator_3.3.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.3.1.bb
@@ -82,6 +82,7 @@ RRECOMMENDS_${PN} += " \
     packagegroup-qt5-toolchain-target \
     binutils \
     ccache \
-    gcc-symlinks \
+    make \
+    gcc-symlinks g++-symlinks cpp-symlinks \
     gdb \
 "
-- 
1.9.3


