Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id F2CAA6B03C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:06 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so1153429eaj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oemv+CU47eAAIZegH/un0sLkFD8RnYJOtOfKR07DL0E=;
	b=jx3fNVikIVbKeyCRtxNwJLj2WyjgDSAupD7l2U/BvGYPYNHCxlfMq1rY5Q/fMnnj4D
	kUaaHZ0CFua3S1vpwDvlA8XiluRdMA0KrT7hxDWEt8AQE2o+BBRUFPl7vog6sm7krNHe
	m6Xp7vwQQEJtCF605jOQ3n7RtLBiNizfU9GCzB7F8M6qUJnwU/CM/gfXbjnaMwboDICz
	AT9z4mCzv6PUJGHRFGM04m25RFun3/jetPWqvqxodI/EZp4TWolkxaeZIfgW+FfDCN9R
	IhQbRbuJpayFNnZrHBjdlEGh8R/7Jm95H/ZYvzZVkIae0dEzrMkZ8II5RbBPmz9jqlNP
	Pyeg==
X-Received: by 10.15.82.132 with SMTP id a4mr9143944eez.107.1372987447612;
	Thu, 04 Jul 2013 18:24:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm9629931eeh.11.2013.07.04.18.24.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:52 +0200
Message-Id: <5055df89a63d6ccb5ca79a7ce66a2bba60f1d0a5.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/10] wbxml2: add missing dependency on expat
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
X-List-Received-Date: Fri, 05 Jul 2013 01:24:07 -0000

* do_configure fails without it:
  | -- Could NOT find Expat

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index c87e477..bca305f 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -4,6 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c1128ee5341ccd5927d8bafe4b6266e1"
 
+DEPENDS = "expat"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f5031e9f730ffd9dc6a2d1ded585e1d1"
-- 
1.8.2.1


