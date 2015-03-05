Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 36A77738CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:50:12 +0000 (UTC)
Received: by wesx3 with SMTP id x3so424802wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FTDVGB9BN7MAcfs6sgvKTiCqCPRNQWkQsnVwwhFMDzA=;
	b=uAtQSQWshPiOssroGAKsN9cbIBuAGOF4XXBq3MuMILKMiajcLaU+HIJJn3SsPEquiy
	ZwmqdquQaz4+MDXv7sH8740W7tG/3n4SLKbVKUwHXUriHKCUJICVNX/zJrc391gfShPr
	DtqZ4NzpRQ5a0/H6MVVQkWvjWU3b0PhFIoqoNv6Bz0pzOZRsbv8pJoXnFefk0guiyucZ
	paAY2ymq/4uOyhMZDu50+o5bVFaAr3B8pLDIurNM9S1gjqAx6d1N5mBvgMhPPJfNUpjh
	vP+mub1SotluI/uGwVqsyzAgVK3P1ZNqWWy100YiU2n6ddWymh8M/7FNkjTqAZtHeORG
	ylyQ==
X-Received: by 10.194.222.197 with SMTP id qo5mr19510562wjc.142.1425570613537; 
	Thu, 05 Mar 2015 07:50:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r3sm11060794wjw.7.2015.03.05.07.50.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:50:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:50:14 +0100
Message-Id: <1425570615-21705-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425570615-21705-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425570615-21705-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] ktap: change kernel-module-ktapvm RDEPENDS to RRECOMMENDS
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
X-List-Received-Date: Thu, 05 Mar 2015 15:50:15 -0000

* even if it makes sense in this case, don't give bad example for other people to
  copy & paste to other recipes, kernel modules should be only recommended, so that
  it still works fine if someone includes the module inside kernel image

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/ktap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ktap/ktap_git.bb b/meta-oe/recipes-kernel/ktap/ktap_git.bb
index cbdabf8..2053783 100644
--- a/meta-oe/recipes-kernel/ktap/ktap_git.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap_git.bb
@@ -23,4 +23,4 @@ do_install() {
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-RDEPENDS_${PN} = "kernel-module-ktapvm"
+RRECOMMENDS_${PN} = "kernel-module-ktapvm"
-- 
2.3.1


