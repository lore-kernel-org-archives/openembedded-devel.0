Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C21F6E648
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 11:10:00 +0000 (UTC)
Received: by wgv5 with SMTP id 5so54138723wgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pRu7Ar2XOE77Nt/CwrVi3z9zg3MCCiluRb9f3t4o//M=;
	b=WMqaCrIqIv9Mk6K2DbcpoVdpPZCgTYG+XUo+kqknIiJhQ4LkKJ6jrnBxMjaoP5kPf7
	Sua1QRsnRbD0e4F0BQA60gzKnUNyJ0uASL4M/k4IlrvO5s31apP2WSq1fks9pKo91DJK
	uRx43PvyIKJt5jNFhpW/sAVp4HQN+PJirbFrpAKEV990DcH/S4ytP0SYtYn6NmSsJi0n
	5ptjCdZkMWiWIU2ypovkooaQA0/JHqMoAlB97Iu465hN8d6Jl77GzeR8ndiz4khR6hBF
	g3p9Cn70Y/QQlq++ktvRGblihq+9yXXCNovGoujrVoCub1kLyZ7RHWV15QT0B4LPwvKC
	knkg==
X-Received: by 10.180.206.229 with SMTP id lr5mr61972211wic.86.1433502601464; 
	Fri, 05 Jun 2015 04:10:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id a19sm2907201wiv.2.2015.06.05.04.10.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jun 2015 04:10:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jun 2015 13:10:26 +0200
Message-Id: <1433502626-4154-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <CALbNGRQ9CdHqJJzLB1ojkuVBPXfXcK4iwGttMC591y4=aFziFw@mail.gmail.com>
References: <CALbNGRQ9CdHqJJzLB1ojkuVBPXfXcK4iwGttMC591y4=aFziFw@mail.gmail.com>
Subject: [meta-qt5][PATCH] qt3d: fix DEPENDS
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
X-List-Received-Date: Fri, 05 Jun 2015 11:10:03 -0000

* nativesdk dependencies were incorrectly introduced in:
  commit 48ee17af942ac9860e834c8dec049370e7802a56
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Thu May 28 14:58:06 2015 +0200
  Subject: qt5: merge .inc and _git.bb files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 3bebcb5..62f17e1 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
-DEPENDS = "nativesdk-qtbase qtbase-native qtdeclarative"
+DEPENDS = "qtdeclarative"
 
 FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.bez \
-- 
2.4.2


