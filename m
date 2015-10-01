Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F4045770A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:32 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so34061218wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Yp0mC+UVKJqCG6DCpNkq8ezxkLGtHCbuUatgP61IKE4=;
	b=oq1wtuP/HDErEK6c6ZtQCDYjjXDOVpvdrFo5ghXnWTTZ6LOIVtjeJ8J7lTLRb3TMB2
	yl5W2ntqp4rxMqHzGxKzdPwdiG+XXqqc8MejKybfB60diuMQEab24byO6VzC4PZ5dsca
	ImfIQ4z7genZAuUA+xn1qW1RazB3ubdH9yHBmSLic5HUN+uqHN+sQSodukzp9Pub8u6d
	rqRNVHhuTliD8VdlY59ubX87dG31mxYD4O/2f64BtXLGE7ECZiUHbsrVXkMJxMqr1/qh
	5qHHCB2hR5OpBay4WJXcTgzfPXe4ofDls7c2knpVPxxmtZMGenB1fNQQ97ygG84cNkzy
	uqkQ==
X-Received: by 10.180.24.102 with SMTP id t6mr4153216wif.83.1443713372082;
	Thu, 01 Oct 2015 08:29:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	go2sm3695967wib.20.2015.10.01.08.29.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:19 +0200
Message-Id: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <20150918115458.GA11095@jama>
References: <20150918115458.GA11095@jama>
Subject: [PATCH][meta-oe 01/10] nautilus3: Fix build with B != S
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 8da8ca0..5dede0a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --enable-nst-extensi
 export SYSROOT = "${STAGING_DIR_HOST}"
 
 do_configure() {
-    sed -i -e /docs/d Makefile.am
+    sed -i -e /docs/d ${S}/Makefile.am
     autotools_do_configure
 }
 
-- 
2.6.0


