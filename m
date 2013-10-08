Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id A81616CE9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 23:40:55 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so11608eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 16:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Plmpzj9t3Fi5ut8wfuwlbDlxUzoguiVbZ8X8UuF2WpM=;
	b=flirl9XuSWYL9O4JCnEkt55Q1k+uf1p7sFRD+8m4pxFN9cxH4IYYgQGV7wm3dRBB7p
	3F5wyYcRLjHlgnPlh1zECkehA59jWvpEWmdLQbGGh6j1gUdWB8ZZ4ZSLOLbjy72LlJn3
	8sm2aEBBk4LuNM2xe42Xm7/w0qZBC2/8pkb+VpVoPwgfEQ1Rdit8IdGcCqzBdo3jcn56
	1yA4dJ81KwNZ4up+2EcjHiBv+QrUgCDzthQN3x7mj0ISSqV2iPoKHZFaJmp2clBwCdK3
	4CraNsih1eE0PuUrLh7hFiEjDAF0Kf45cbR7aCly66Gz+Rvq5oeC61D9ykVo4867pTXD
	7/Cw==
X-Received: by 10.15.36.9 with SMTP id h9mr6511858eev.30.1381275657002;
	Tue, 08 Oct 2013 16:40:57 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id d8sm81475383eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 16:40:56 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 01:40:51 +0200
Message-Id: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [meta-handheld][PATCH 1/3] ipaq-boot-params: h3600: use ttySA0 as default param
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
X-List-Received-Date: Tue, 08 Oct 2013 23:40:57 -0000

These machines use ttySA0,115200n8 (SA1100).

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/ipaq-boot-params/files/h3600/params | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-bsp/ipaq-boot-params/files/h3600/params

diff --git a/recipes-bsp/ipaq-boot-params/files/h3600/params b/recipes-bsp/ipaq-boot-params/files/h3600/params
new file mode 100644
index 0000000..edb83ac
--- /dev/null
+++ b/recipes-bsp/ipaq-boot-params/files/h3600/params
@@ -0,0 +1 @@
+set linuxargs "root=mtd1 noinitrd console=ttySA0,115200n8 console=tty0"
-- 
1.8.1.5


