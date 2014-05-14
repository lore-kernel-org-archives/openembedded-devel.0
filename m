Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f169.google.com (unknown [209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 958EC660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:29 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ij19so2065447vcb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kquDnQgliVR7QmQ7g/xXvP694/2u/L1PMRPeJKrvgGk=;
	b=QEJiBAcWhnuGglqHBhwRuLet5sxvjm8fE7EcR8fDEVPJhCqlhkjTrhPdd6JIvWRyFi
	BQZtvC6h4PwNPGXS3hCTlvtZ4WaJPl6jpN1qJjznCMDYPDKCQXBCuzs/6r9B2B2Hky2h
	PaDAtJrp7lCuK/bQlktLNZ2F16HQNnmzfOcKPfDOUooRdmRGPZzci3FCNMA5tGPCEsPW
	4/hCZIlUo9cTd6p5AUTkT47MjarEdzPKeP8L/Nr2lgRdxYzQO9AT7tuMaAGQy29Xqyx2
	kGV9coip8o7OCeoXjbHBAWeOe6qhkQvfcMn/gyx1cv/c9m+H9IRt8vmf3yo2SAlqSMY8
	Ntdg==
X-Received: by 10.220.95.204 with SMTP id e12mr94502vcn.37.1400058210877;
	Wed, 14 May 2014 02:03:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p1sm2218430vdp.17.2014.05.14.02.03.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:30 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:45 +0200
Message-Id: <1400058231-23201-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/8] lightmediascanner: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index 2b12a87..a50563a 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 
 do_install_append() {
     install -d ${D}/${bindir}/
-    install -m 755 ${S}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+    install -m 755 ${B}/src/bin/.libs/test  ${D}/${bindir}/test-lms
 }
 
 PACKAGES =+ "${PN}-test"
-- 
1.9.3


