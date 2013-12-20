Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8F160D68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2013 18:54:43 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id m1so3295472oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2013 10:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X6Pc7xeXLhi/83wQs3basAHn0Xgc3ixmA/iWSFPHVh4=;
	b=ViWV3Uvaz1GDeFqhljoFM+fkUIlRm1hDPUyLCPcuVUpiiXyIvmQgQzBWFrTAKyi/tY
	KWzsBHxxpwRl4HJHxgp0A7QFDNX3mCJzroakciTdsHJJ6+Day8R5Jtrt58cJ5VQibqdR
	2T+6svn0B5IuF7s22SG8MhdrqC/C1IVafI8C7Kl6FUlFWtiDuXgDdUFLrmwCuvrV3+6W
	n4BGxFlMmKNVuKDm+hQGcCap4IRKgGKTzP7vUP29etmACQv9Y81/QVnKL/f0Yd8UexQJ
	WrUAUcGlyAqjzB9f1uTNK/FCWkfAOjGdUjoaNOnIzROMPhF2FUN6YtnIEn/xksdtYVmh
	YMZA==
X-Gm-Message-State: ALoCoQkMX9ld8iMP9SuUNWtoL+c75EN5fXa//2LoKYa7fX+znm9MsMHxEyTfVTIv//omCsJWnJ0I
X-Received: by 10.182.48.130 with SMTP id l2mr7548561obn.44.1387565683879;
	Fri, 20 Dec 2013 10:54:43 -0800 (PST)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162]) by mx.google.com with ESMTPSA id
	oo13sm12767263oeb.0.2013.12.20.10.54.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2013 10:54:42 -0800 (PST)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2013 10:54:38 -0800
Message-Id: <1387565678-16496-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] fingerterm: Make is executable to other users by default
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
X-List-Received-Date: Fri, 20 Dec 2013 18:54:43 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

By default "xuser" cannot execute this binary. So we fix it.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
index c466a3d..155d282 100644
--- a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -27,7 +27,7 @@ FILES_${PN} = " \
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0744 ${S}/${PN} ${D}${bindir}
+    install -m 0755 ${S}/${PN} ${D}${bindir}
 
     sed -i -e '/Exec.*/d' fingerterm.desktop
     sed -i -e '/Icon.*/d' fingerterm.desktop
-- 
1.8.3.1


