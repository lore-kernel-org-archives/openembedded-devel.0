Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9848D6077D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 22:26:29 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id c10so2659192wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Uee6EJGAoOX9/rEUw/yo46vgsyrR/B9uPcLGPm19OvA=;
	b=nE7MzLtZlJstQQcH3A4t6HsTrOxBWur+JbHKlR/f9abUGzn6zmCmZVasOHKY2dPEoO
	TqyocJ/b3Yo2twwAEZcP2GkIMEKowPyAAQaxrjeoL2SqLuBnZ3zw2CQqJ7f6j7Z0SKpf
	sN3oQoc4P1FWPNckSa3itSn75kJrVdEAUSQnVs3RkJupc4nH/9tsD/sYb1y6ZzM3vEXE
	V1fhOQ65ZWqZIWU3s81B/acVPvfHBKPtmSv+9eF7guGTHMt7U0Tov3mXjxfyeMFKVJWj
	99Z5SIyHs1JCQISN9m601pHQVruNlaTgmkdP7mMPDzGgiY9ePqklt1OzNFQkEpaIoh29
	DbdQ==
X-Received: by 10.180.9.35 with SMTP id w3mr6094120wia.51.1371507990339;
	Mon, 17 Jun 2013 15:26:30 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	b19sm25183354wik.10.2013.06.17.15.26.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 15:26:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 00:26:21 +0200
Message-Id: <1371507981-3819-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] cramfs_1.1: fix fetch error of cramfs-native
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
X-List-Received-Date: Mon, 17 Jun 2013 22:26:30 -0000

* the SRC_URI was pointing to an inexistent tarball

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-support/cramfs/cramfs_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
index 14d9754..0bca0e1 100644
--- a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
+++ b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "zlib"
 
 PE = "1"
 
-SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${PN}-${PV}.tar.gz"
+SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
 SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
-- 
1.8.1.5


