Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8326B15C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:24 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so3019835eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7s4F6o0gLfA6o373VlQZp+f6cp3miUpV5w9yT2a9zMs=;
	b=NdtAEW8Sb5EdEuYQb5X6b9o7uYduCIZFWY8mFEseFxRM11oWzEChZV5ysDG+1w5j50
	owNcaZckXN1uRsvD9vpf7ckt1SpHrcjOb/emO1HZKe4ncZ9Xyp6pRrxbZ6QNYY98Bm6J
	PGtzTFyvv28Di3dRXSK2yid/tAALYNhWNzYVfpteGwyCxLJvRiR2lvO5i/oKNoAELGqu
	kuIzEgc80hxeWE5yZIIKcpqAc1uBQn4Z9W/EzIr364NLYm+fL9r6FMNSoEY/nqspMzPI
	AXNHz3kb4odkBcSbwbMPqWViadY0xQqxz9rMKt3QrTVCUXoPBhJrix4GRvIt7dVaqxt8
	RJ0g==
X-Received: by 10.14.173.70 with SMTP id u46mr20246143eel.92.1374332904915;
	Sat, 20 Jul 2013 08:08:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm35925984eev.8.2013.07.20.08.08.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:30 +0200
Message-Id: <80805b2daa7b1f7bf161981121c296f80dc649eb.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/11] glog: add dependency on libunwind
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:24 -0000

* it's autodetected from sysroot and configure doesn't have parameter to explicitly
  disable it so PACKAGECONFIG won't work OOTB

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/glog/glog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog.inc
index 97f3728..8a1fb42 100644
--- a/meta-oe/recipes-support/glog/glog.inc
+++ b/meta-oe/recipes-support/glog/glog.inc
@@ -6,4 +6,6 @@ HOMEPAGE = "https://code.google.com/p/google-glog/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
+DEPENDS = "libunwind"
+
 inherit autotools pkgconfig
-- 
1.8.3.2


