Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id AE3856059A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:09:35 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so8969398wiv.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cGbHGD2E6On+Xt5mKLZiR8Xyl2SrEYZ/KNlSy8u/TJk=;
	b=bh6Ut2qNUzmYkhGteOtT9INbQka2XgKDDUS/KW8vzlV1gwX+tYbof2f3JiEoIZD4DO
	v5FGU2wbCa5hFm96WnKI5bJmIJfZ818HR3IlIC2vLZKQC3V8g9BZNNrgoUraure3GsZF
	nrf+XjSu6Mx9w/Zpn+OBu47TKUbGvqRCfLmcr1gQuPF4gjCH08bTL0Kg8zZK3Yuy2QDM
	6ypMvJZJVaCLkJSWfhNGTlmWBTjhepuxUQoydNSiaXrQnsyXsrRuj6o/rSSnmm1DlkXR
	aKY/uZJ01adPJOac35zf9ZY4rAZFp5ButwGrjwkwZ1iNY7pcBJ/sf25MPDLMtREgobLy
	nN4A==
X-Received: by 10.180.99.99 with SMTP id ep3mr4745341wib.42.1403168975834;
	Thu, 19 Jun 2014 02:09:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e11sm9687494wiw.19.2014.06.19.02.09.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:09:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:09:31 +0200
Message-Id: <1403168972-24905-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/4] libusbg: Blacklist, because of B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 09:09:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libusbg/libusbg_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index ed5ac65..280983b 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools
 
+PNBLACKLIST[libusbg] = "BROKEN: Doesn't work with B!=S and nobody sent patch to fix it"
+
 PV = "0.1.0"
 SRCREV = "7e2b04363f319e8936a606bdb122dbde249a2f58"
 SRC_URI = "git://github.com/libusbg/libusbg.git"
-- 
2.0.0


