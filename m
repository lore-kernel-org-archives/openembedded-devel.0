Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (unknown [209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 035C361FE4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:54 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id p9so6418117lbv.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wSNwzUkSLQ1MsUXcwMC+ileO6+XN/WUxbKTusMUVctc=;
	b=fm+P4edjxn8m4Y998TbP6AyvMRswDA/im5aFikVupC7cbu6chOBWwVZ/dxp5TcpaH/
	M0MdDoGuN8mj578eusQU2fpOICFkeDfNdAVsrFv9jvdRhVXlEsXwA/tBc7XRaB6+jxUU
	glKAdXHl2CkAKsddRDv6Y5Wjf46V8jy7wUPU2MRJHcBjuenz8M2lCpJllFu4DYoSie8Q
	q5qgW/Lk5peyJEiylOby61o8cGdPmWVLQ/P3VLPNr4PPC4BJU4tj76ewowdZNhPCjnts
	R/MB46mG5ImTAhmS5n7MKSFszEqGO7faGzsJ9uwtRj2PF9QWx1Tt9Kcjjj0Tet3lu7zl
	66Hg==
X-Received: by 10.152.28.194 with SMTP id d2mr7370091lah.25.1399790994747;
	Sat, 10 May 2014 23:49:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q4sm9570467lbl.14.2014.05.10.23.49.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:54 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:09 +0200
Message-Id: <1399791009-2718-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] xterm: add PACKAGECONFIG for xft
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
X-List-Received-Date: Sun, 11 May 2014 06:49:55 -0000

* fixes following issue in test-dependencies report:
  xterm/xterm/latest lost dependency on  fontconfig libxft

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_303.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
index 47dfbe5..52e77b7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
@@ -24,3 +24,6 @@ do_configure() {
 }
 
 FILES_${PN} += " /usr/lib/X11"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig"
-- 
1.9.2


