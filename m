Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F0E327589F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jul 2015 21:05:18 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so68470874pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2015 14:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gLf5zaRcUn9ZZXS81AWFhfR8FYKHO8lo3mAbfLOznpc=;
	b=FSk8BX7McyA93qlNsRDn9JXnVi62Yrrdb+EybTPxtYKQFOpYbHIaAdaGbClY2vnuYq
	/F7FMfZuSVm5ST3algkqrnBzdbxqSLZ+xhobT4dRshtkhOrreiVCvQvMpyHxBOfgzyJA
	8Wv8WS5ZZt67TQ7GJ0iDg7FdqGO3e+mr5wNZLRpnwz5BLdhWwApD9/i97itCYtI/9qJ4
	8iOlRcWHJqexh0cgm9inYDb1EcGSvusHJoWigqDzILj7jsGJUdlC8fi9k/CRDKVOr5U8
	FoSwjA6CWCxL1g6UiXrpLKO2FPn8zmgh+m7Zmjhe6CCJ4quGoicEvkYLUCUCpydiee8U
	9Oiw==
X-Received: by 10.68.104.97 with SMTP id gd1mr79747039pbb.15.1435957518284;
	Fri, 03 Jul 2015 14:05:18 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ja1sm10010228pbc.51.2015.07.03.14.05.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 14:05:16 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 2643CFC41B1; Fri,  3 Jul 2015 14:05:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jul 2015 14:04:48 -0700
Message-Id: <1435957488-8054-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][PATCH] unionfs-fuse: fix build warning
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
X-List-Received-Date: Fri, 03 Jul 2015 21:05:20 -0000

WARNING: QA Issue: /usr/sbin/mount.unionfs_unionfs-fuse contained in package unionfs-fuse requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
index 38ded9f..7df9c39 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719
 do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
 }
+
+RDEPENDS_${PN} += "bash"
-- 
1.9.1


