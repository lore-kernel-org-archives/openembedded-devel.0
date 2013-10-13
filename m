Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC496CD55
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 23:26:48 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3037662eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PSr4H+1LITG23ajrKpIlUcU+nc1zZyDZJe6WSuYkNuA=;
	b=eeJQsH1ylaqvWXjf1/l07YC8Cdti6WvQrdCCDFWZSDsgRI31aZLe177dTUXMAM7glu
	p3tAYBXbHPjRDyZXQp1UVIYC7S62Relbmz4iUGaMg8ecbuGInJsad2GBZgBjmLEwGmFA
	aSQzw+UxHpAEpSj9VrTBhA9+VXPsLBxMnzaO3hBC9RDrCcIpHIE37LASxL6nhuWWuyBh
	rkyVjxE/hnjciD1OEh7p4CIstYWG7lzJ1BV1WVJVEaM2PvLtwYc397HDczKe8lGvvn1y
	wlIoeKYNaSPXDDAqjSM5vSMEuPQqg4kf7g4AYwFsZ4zsAil3ASTIHeoPKwcqx1N1t61M
	vl1Q==
X-Received: by 10.14.29.67 with SMTP id h43mr51452466eea.7.1381706810237;
	Sun, 13 Oct 2013 16:26:50 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	m54sm145933934eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 16:26:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 01:26:43 +0200
Message-Id: <1381706804-21803-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381706804-21803-1-git-send-email-andrea.adami@gmail.com>
References: <1381706804-21803-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux_3.1: explicit qvga instead of LOGO_SIZE
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
X-List-Received-Date: Sun, 13 Oct 2013 23:26:49 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 70e604a..bf2d203 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "h1940"
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
            file://defconfig \
-           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
            "
 
 SRC_URI_append_h1940 = " \
-- 
1.8.1.5


