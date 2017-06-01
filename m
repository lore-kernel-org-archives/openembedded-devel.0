Return-Path: <bkylerussell@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E147177CFB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 18:43:24 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v195so6839533qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j6TJBRfGLv0N8w95KQpFLUXMMl+DVUe4Wr2NLNyqdm4=;
	b=TQ8WFUqjsKxyfu0E4VkDeKRNAbhCGsjEtqnLhgfGl8oFDZ5dAznOFWpausw5f1eAdk
	NQZXaO/ZTCRBYFZBXyWwPz7/vVzgax3DCtnt1iRdwXp67Qe2NlW8/J1biS/PB6ioJzh5
	QSeGMKHnq91m73A8C4mfWnBpf0RlpUNIFVuNTwoCAgbjE1sANVsd0mLvyxljeUjGfLGM
	xIKmSg3UizeMZpWUBGO/cpdZ7AGtMyJmOrKpeY7IHTBxzulTwldN345TcQ2WVE9iHPzS
	cR4BskaVhIWWMNVNOU7+LihCyfDeoSvI/uqA5snF2gY0dZUonKVeIWPbpTSYEGP9OTFp
	2mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j6TJBRfGLv0N8w95KQpFLUXMMl+DVUe4Wr2NLNyqdm4=;
	b=lR5ihHW6ldCszUWgfgije+UjjNrI6gxDD2nXgo+OJAbwOfMukk2vcEiGNMRsm/62iu
	IY+D5IgZwKZ42kWVnkylQfmzLULFrQ1Ug9tIWplM6JU2sqjyfPYd7LnAqXsOkLdeO0lp
	19IXOCQuel4zSSfnAbBWF1NqGAQZYqQ31qfprypuwAwhtQpkZybAL5IcHxWCX8UWoo8i
	EVsjWOXMBzg9G0zQSYDmkFSddznUK6RfG/RUfd4X0Yv37qjFtzU42XrhWrcUL7BTOJ9k
	qpvUeL4oPbpFk5w6hSDPCkwgrFwhtwtBrFxQYOBzRFxPTIwl6/7hRQuH6KI+2twKpC32
	McIA==
X-Gm-Message-State: AODbwcAUqbFECj/P/fPXRKpeQR0n/GJT/2WBpC7G1Oq29cfoieuu55j1
	4TbGnTsJI/IAtPzps5Q=
X-Received: by 10.55.105.2 with SMTP id e2mr3488541qkc.48.1496342605468;
	Thu, 01 Jun 2017 11:43:25 -0700 (PDT)
Received: from localhost.localdomain ([172.56.13.112])
	by smtp.gmail.com with ESMTPSA id t9sm33785qth.46.2017.06.01.11.43.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 11:43:24 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 14:43:15 -0400
Message-Id: <1496342595-24185-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-filesystems][PATCH] fuse: update 2.9.4 to 2.9.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 18:43:26 -0000

---
 .../recipes-support/fuse/{fuse_2.9.4.bb => fuse_2.9.7.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.4.bb => fuse_2.9.7.bb} (89%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
similarity index 89%
rename from meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
index 153fcb4..e66f3cd 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
@@ -4,20 +4,20 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
                also aims to provide a secure method for non privileged users to \
                create and mount their own filesystem implementations. \
               "
-HOMEPAGE = "http://fuse.sf.net"
+HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
+SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${P}/${P}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse.conf \
 "
-SRC_URI[md5sum] = "ecb712b5ffc6dffd54f4a405c9b372d8"
-SRC_URI[sha256sum] = "6be9c0bff6af8c677414935f31699ea5a7f8f5f791cfa5205be02ea186b97ce1"
+SRC_URI[md5sum] = "9bd4ce8184745fd3d000ca2692adacdb"
+SRC_URI[sha256sum] = "832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874"
 
 inherit autotools pkgconfig update-rc.d systemd
 
-- 
2.7.4


