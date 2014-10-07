Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 72D24717FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 01:11:23 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so6299938wid.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 18:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NWQl/A4j57mgghypb4UGzg1wzO91QDTK5RWTeIGi3Rg=;
	b=TW/sZeASntDMOuG9V2RFzjogUjpxSBH6DOa/w+wn/0aph6vsBjP8iHX5UCjvo13O0f
	0R78prC0ZOOQ0rxLNp65ZBvcZqpDNctFbiLmm6gCgzklL1oxvIJKItUDS2r8Nl9MDMj7
	+lx85b0kHSVtdPBjfcYpMOxb3eigNOm35G8zi9ZUTcEx6vAIQvIJfq3C1IyEKnFqSPEF
	OD96OrFN9lcw5TeMQf0o9C20N9q9M+xMY++pKGFYmTcUcjwsHOv+ksiAVqVpXvIARH3y
	zi34D/iR/cVjZyfGG51LI6I1cmxkDscdAH539QF9XMWQmzecp1TER7H5/kCr5PVh+ijx
	CoFQ==
X-Received: by 10.180.83.134 with SMTP id q6mr24238806wiy.12.1412644284131;
	Mon, 06 Oct 2014 18:11:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gg18sm12880958wic.21.2014.10.06.18.11.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 18:11:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 03:12:21 +0200
Message-Id: <1412644341-15169-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [oe-core][RFC][PATCH 3/3] modphp: blacklist because of conflict with php
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
X-List-Received-Date: Tue, 07 Oct 2014 01:11:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 6932429..8707950 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -14,6 +14,9 @@ S = "${WORKDIR}/php-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
+PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
+# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
+
 inherit autotools
 
 CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
-- 
2.1.1


