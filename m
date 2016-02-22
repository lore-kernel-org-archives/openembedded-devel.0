Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5737B7706E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:21:14 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c200so179653894wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sjUMRBGu4K7Lqa15Eg9oBr4JdJNmv2UMTxwtVJw+fYE=;
	b=MAVqXLh1sMcbTnrf6ba2dXOi9h829jLAdorxyl5oTqQGIbZU3SzIekFfz8uEywBnoh
	mqYRi7T27JGC3VR8020c2q3dBE0cUdYeA9moj9O9zlWQyMzg/zrFALxcniHSvmd0UUME
	1JBBA5LkIe7yJlXoZkm0i9x7nqAfMnAqSl1G6UYhtHdp8HyGoZOFWZN16YW3C72p+ySf
	DjpTtad2+cyAgqVMGHGcSujcd93NU67YEZattoFD7mKmDFHLUYS8nQUGwcNSOx/V9BOM
	nfyGELlfoQQZhxP1lOecVde/qmrZsmpoQtbHwtEkiaD2h3w9hRGg81qdoEqIKENb5BTZ
	fxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sjUMRBGu4K7Lqa15Eg9oBr4JdJNmv2UMTxwtVJw+fYE=;
	b=NIlij23dWxS4Yhs2BWGJ8tC8v4knsukTBV+rC9gskv6W4wlcN8yNLVKlwtzt3bu3Zh
	1fiFQHPAfbo+j0/FeDWwcRiGHQFlGzR5SEinZ/iYhhkmFnkKvNVujrRMHW5FEZXCm/nc
	pGWNH4rjckOxb4TYX823G5/CJHFqbH3ELJoCTiFvKK2DihECu4V2lUonlVF1DfagOoIz
	56fuU0w5EswVInP1Q1OOlBlpkdkT/XKaU/wQIjGXo71aKadi17daX/vlE3LtznsKeTG4
	lMWNb3gwbT23KIo7raSGGsTPVEGnP1lvLQCPJP40KnfhXCm6dI0kJT8YhgiW9LImLZWS
	FpAg==
X-Gm-Message-State: AG10YOSJdaSTxQuD5zZs5kXpS1KYwcqr593vuZ65lLS2XsyL0yKJZFwhUul+8qx/gdFxJw==
X-Received: by 10.28.51.9 with SMTP id z9mr12524819wmz.59.1456158074529;
	Mon, 22 Feb 2016 08:21:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a128sm21761052wmh.6.2016.02.22.08.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 08:21:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 17:22:05 +0100
Message-Id: <1456158125-7516-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][WIP][meta-xfce] xfce4-vala: unbreak by telling configure new vala API version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 16:21:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index c1900e9..4bd085a 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.28"
+EXTRA_OECONF = "-with-vala-api=0.30"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.7.1


