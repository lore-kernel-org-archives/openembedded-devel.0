Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 311566B33A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:30 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so2949805eei.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RYXq+6mqzJRoY7u8DugiMsCkK0kWwjGdnWd3Gwans2c=;
	b=E3qGWdyw7MXE2JaVRn5nIARdk1sFQcrmoHdwSEu19STfYruozX+FEBL7TU065YhnFO
	u3os4W9XASjGmrOSGx5g1sN9NHOa0LaqXrAcDtOBykxQ6QeED2yFdUcnGD2W9EQa5adb
	lKk0mVn7YfE0DXijvgI8awz1KJPLYqwoQKiv3fT9INZWtwAcA4oL6DetBFqm6tErYvMN
	bgzZDiXnToqZb3JeKB52NAmRTRua8JUPZhq9FTp6pbzo81zfSvvOJYy2/iQswL2gG7Fr
	LLMQdWjR4a2v9o12VMbr3fZ1FFrkeXKNle4LU89d+KAYGvduLR2SgUqWasVu1CyUqSeB
	lbQw==
X-Received: by 10.14.215.197 with SMTP id e45mr20489217eep.130.1374332910638; 
	Sat, 20 Jul 2013 08:08:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm35862449eeo.14.2013.07.20.08.08.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:34 +0200
Message-Id: <7772add23c7ac5bb2ab1ceb18f3f0d858b4f44b9.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/11] vim: add PACKAGECONFIG for acl
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:30 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 12e8c1e..d7336c2 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -32,6 +32,7 @@ do_configure () {
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 
-- 
1.8.3.2


