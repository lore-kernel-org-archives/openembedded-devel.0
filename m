Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 433B0762A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:07 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so35171349wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fBanIkUa7fNj9czgLkQ8lpWrvTtJdXlVxWrkBRBP7ug=;
	b=D/xUm2E70B5ACRSDo+MX6c0CQ7aJ5pL3D9lo5D1mtnRRUoW1HTyNLaDJqdvJIxbgoJ
	IHbb3Xf1UIZi9Jj/t6U2TfxeRb9EmCD9Zah4xQnPWS7JkKSzGRzsotoLgq7bot8NVe8g
	LGi9F725cGpAgdVlw9piOcJ0p27pkN1T0NodopuLDfNR00dVCE+edMdzcmKcMxfgkzwE
	FgeDhCCOsJ+A1//js7pbSq4mpaha9f7FEtP7L5tsUiwu2GUOF95ixZ+mDzgEm7Uy9PB4
	9Djco7lvpHzvllMctvpd2d2dn7K3bUpUEXE3He2I5MhhiFLONt25WeWvoYVVsHRirPUs
	wIgA==
X-Received: by 10.180.75.176 with SMTP id d16mr4241793wiw.75.1443713347678;
	Thu, 01 Oct 2015 08:29:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lj12sm3739459wic.0.2015.10.01.08.29.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:00 +0200
Message-Id: <1443713401-8584-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/4] libuio: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index 0142ce7..93dcb39 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -15,3 +15,6 @@ PACKAGES += "${PN}-tools"
 
 FILES_${PN} = "${libdir}"
 FILES_${PN}-tools = "${bindir}"
+
+# 0.2.1-r0/git/tools/lsuio.c:85: error: undefined reference to 'uio_mmap'
+PNBLACKLIST[libui0] ?= "BROKEN, fails to build with gcc-5"
-- 
2.6.0


