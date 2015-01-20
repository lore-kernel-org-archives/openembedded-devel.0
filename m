Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0C49B72C22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:15:10 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so24634030wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EVkwGs/3qNb4ijpXoOxX16YLllIj/DgGAnymomkqleY=;
	b=gu5sgZif9roNdun6KqGIrKpiD3VWUeiZWvXmbDS1ZuTjrtawUDAPllT+LFXIdE6CCS
	UDL3HNHmpab6m10+I7Gg2iNoTnWgU/v9TX/vU/XBSw1sFqpj/OJy7x0hLAQozRr1++bC
	J2evWBxyll3xAsDd8/nuthwejI3xL1GGSnCWWFOPerxyLWmexlu9Djt2h8nJ6dRPNAb+
	/NcFSf0DL/oGvIPczJAMZwA4Ffsnv/f3Cu+mIeKSgdh2JaCT15wahZi93HjNeVBp+AnK
	hwZ64u6+ZJn+dpPEfE4IkT1ZGhsi1jaGlNqLcZMDyQtcDN3TiUzyQF0hw6jzJxP1hifk
	FLZg==
X-Received: by 10.180.97.195 with SMTP id ec3mr48367410wib.79.1421766910877;
	Tue, 20 Jan 2015 07:15:10 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gu5sm3372486wib.24.2015.01.20.07.15.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jan 2015 07:15:10 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jan 2015 16:14:24 +0100
Message-Id: <1421766864-9515-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421766864-9515-1-git-send-email-max.oss.09@gmail.com>
References: <1421766864-9515-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 2/2] Revert "openjdk: Fix QEMU call to use sysroot for libs"
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
X-List-Received-Date: Tue, 20 Jan 2015 15:15:17 -0000

This reverts commit ab51e51d9a9a51bedd19de09bcba4ce830dfc5e7.

Using an oe setup with ptest enabled makes qemu never to return due to testfiles
staged by udev in the sysroot 
See also:
http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097098.html

All binaries compiled for qemu are now linked with -static. The -L, -E parameters
pointing to the sysroot and dynamic linker are not needed anymore and removel works
around the issue.

Further details:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/openjdk/openjdk-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 97947b5..349ce9e 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -72,6 +72,6 @@ export WANT_LLVM_RELEASE = "2.8"
 export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152 -L ${STAGING_DIR_TARGET} -E LD_LIBRARY_PATH=${STAGING_BASELIBDIR}"
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152"
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
-- 
1.9.3


