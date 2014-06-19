Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0DB6FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:07 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so2082441wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m1LZUrU+wvFlAwqYoJkuMwFvGrbhD7bH/AYdJM9bkBY=;
	b=jCBC83AftSo5KpkGz/Hs9l1FQVKYJDgnwXDtf7wMx4CmhgHRghP534aqFQtxTRdkyL
	m61yGtgfRTVvCJgiWp8Ciy8T8Sih4g4aM3TZ9HgfeWO6ZI63qElvAHBowuSIkL3mr/vy
	mPZDma3GeR3LXmOb+wXVK9DoPtVKvxOFYyQH5VWiCRHRi2tNDdUl6QsYNoZgYf9bBK5W
	0YN1AEAG5E+v3VdJeEeZW4+dS0xmyg7YHEC2iGFwH5ACxDGZ3Er2QqeFDDSddUdo4Esx
	KptPC36W7qhrZTt76vVFY1D0XXTFxhSR1e4GyTFaPFXGOr9D4bIEjv6CM//JIKa8Bs/R
	Y1gg==
X-Received: by 10.194.71.81 with SMTP id s17mr4003166wju.10.1403172008425;
	Thu, 19 Jun 2014 03:00:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj2sm27218515wib.11.2014.06.19.03.00.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:40 +0200
Message-Id: <1403171993-26208-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 12/25] xchat: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index 8f05062..fe07bc2 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
 PR = "r1"
 
+PNBLACKLIST[xchat] = "BROKEN: Doesn't work with B!=S"
+
 SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
     file://glib-2.32.patch \
 "
-- 
2.0.0


