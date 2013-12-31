Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 923B760DD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:27 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so5450124ead.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KkaPyf6x6Q5sZ3/UoODzSm96HN2ihDRvqkyTJMjzdGc=;
	b=BmILjI6uTrWJn+UnAMQzpJRs7ZljouiMpUqKmQrLWDSP/0xLRleZ2rqiFhMKlOjXjX
	kWDoqAt9px9luDPJFSdwQNlk+DDf/9IBetKaJBpyop8R8BvZmVKEJnUdznMPgSo9D3VS
	ufuY6+VFgHMb4WvAtI9UOjwgPlUemtv/T+6QEk3XtDsLt4yM5eSb7MaHYFP7ZBq7MTmx
	RvPA2gkwhwHhMpsGRofnxqz2FAJTNUgGoSIJ5zAfolYW59QxH5WxiPk/ZygOk4rQy7pB
	9mwSaggNs56QHxp+Na8tEjmTfGIaPF4pYzm0bvdevPXPOUTBTc9DvYNyVeb7vajcc5sr
	gSWQ==
X-Received: by 10.14.100.4 with SMTP id y4mr5845520eef.40.1388483368361;
	Tue, 31 Dec 2013 01:49:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm116591771eeo.19.2013.12.31.01.49.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:13 +0100
Message-Id: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][for-dora][PATCH 01/11] libmikmod: use SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:28 -0000

* archives are no longer available on old URL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
index 4ab293f..e0a04ae 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    http://mikmod.shlomifish.org/files/${P}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
 SRC_URI[md5sum] = "60ac77a804d082230df3009af11ef44f"
 SRC_URI[sha256sum] = "2311b209255bf24e95161907a16778cb054ac6d447fd8d05f1f0e41a555c7580"
-- 
1.8.4.3


