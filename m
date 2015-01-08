Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 69B147284B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:16:15 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so1984298wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fp7871KAv44Pv5bpKgOaLxCAosyftms3842c/5jpNnY=;
	b=1AIW8k3DUir00ySPvvmTgtcQ43phCpJK9RXIFxOzPmGuZIO4TAU1Zq9xajEm8f29OZ
	jwZuL7kISy08+t9LfDGpFZplCELSDuj6Pf4AcRC5caePfhK01UyiWp1mw0wZPuh7bUTP
	TW//gDmPL3sLakNolx1+t1sXH+bbH6Y434wmIWVGQiYJHx3L+yGfZdJUfdfIXWOCZb8B
	ejVBPMv0r3Hdn2kZmLEE8iYKxno31x/yGzjwWiWxiQ5PYzCvaZA7n9NiXXkwjmhkUEUG
	Vv/KDpd6BmCD+ypvJrqzFw7I2+HO/1I0RNerg49e1xActR64J/KTA768X5tdww35Q0DV
	oosg==
X-Received: by 10.180.100.98 with SMTP id ex2mr59327123wib.58.1420715776130;
	Thu, 08 Jan 2015 03:16:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gy8sm21401894wib.23.2015.01.08.03.16.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:16:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jan 2015 12:08:09 +0100
Message-Id: <1420715289-11792-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-xfce][PATCH] xfce4-vala: blacklist
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
X-List-Received-Date: Thu, 08 Jan 2015 11:16:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 8e8e691..7bcffe5 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -5,6 +5,8 @@ DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-
 
 inherit xfce
 
+PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
+
 SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
-- 
2.2.1


