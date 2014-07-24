Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE32170799
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:17:01 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so9538890wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vDlnXA2O6VwxyDhpQlL9raaxg+cSp4m7MHSVcULl2Yg=;
	b=ilSfmhrwLaaue2Z03KIOLud5jkSyMWlvAAeopiP3Mtp3szcbhwCiGVBm9L+ueiMuIn
	tiFv9/oHvsui3NFapkKs+n75tYHO93IeBQ5cbBpo04L7c7jYzuK5nzjCwGAndkk8JBoR
	L787MESntDKMCg51L/Gy5gRNVmMFBeyDbrGMZpMEVO9X/Pj03ARevF+Bsatkkm9doFBb
	wqGC1fCot0IVpXSni8bInVtLYeM7XMDPk+jLvo7rutXgv6cb+vLmKX+SY9B2Zs2nWCs3
	b5OmUiNz2a6jHSfywPhdvc4bvsMgzSpdnssKS5B7pLwnOB2Q1sr6Zzk9dqnk7TUxdsHu
	yy4A==
X-Received: by 10.194.100.34 with SMTP id ev2mr12135424wjb.76.1406207822502;
	Thu, 24 Jul 2014 06:17:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm22935352wib.15.2014.07.24.06.17.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 06:17:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:17:17 +0200
Message-Id: <1406207837-28267-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] libmatroska: upgrade to 1.4.1 required by mkvtoolnix-7.0.0
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
X-List-Received-Date: Thu, 24 Jul 2014 13:17:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libmatroska/{libmatroska_1.4.0.bb => libmatroska_1.4.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-mkv/libmatroska/{libmatroska_1.4.0.bb => libmatroska_1.4.1.bb} (85%)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
similarity index 85%
rename from meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
rename to meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index 9644e84..547e848 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
 DEPENDS = "libebml"
 
 SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5b83155019589b04a49f9db923b5bf74"
-SRC_URI[sha256sum] = "1b6d02e75cdbfb6d282dcf2a902a259c3075404885d5e8063e6652a2b3f6c11b"
+SRC_URI[md5sum] = "f61b2e5086f4bb9d24a43cc8af43a719"
+SRC_URI[sha256sum] = "086f21873e925679babdabf793c3bb85c353d0cd79423543a3355e08e8a4efb7"
 
 do_compile() {
     cd ${S}/make/linux
-- 
2.0.2


