Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0156E731F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:53 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi1so30430633pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Ql1H/xOaL4a1e2UulE/rw2Op7IDicZijl5g7J3iVHDQ=;
	b=zcBVnkPBmi1+6td2rJUtzoB8Bq2RWtAHeFGiyqeLFrbFsphpJZ6fMo+aWF+C/T+lFy
	g1v4e/6MvRVPpT5nzTV/+YkQQjqtPMrpKFLXtRKJBJ3MJ1NwAgo7XLDb6sJSvx41pY3u
	bHMFxvk3nQwiwIJ8N1AERXgw9+NpPX7qoQ4LlW6Q1NekwBPfYqRYV1oAN3ZoykG9OCEn
	unHwQBXpcJFTVV3SAsIcs6WmVFOMGCsvFJqFub8WnfqmCLNG3+e/x6dsgkrk0CeeztD0
	x2UlQ+LRBKsmU8eH6VIMQexPmBPN7ktMNs5UgYs+is36Fgeahxl1u4CftfQfRIOEHNTa
	O+ew==
X-Received: by 10.66.240.97 with SMTP id vz1mr170257603pac.29.1452387594589;
	Sat, 09 Jan 2016 16:59:54 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	cq4sm60440014pad.28.2016.01.09.16.59.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:52 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 6029AFCC83A; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:25 -0800
Message-Id: <8e25d89cc2eb0a5348ce12c4a9c4f9bed65b2d63.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 02/22] kexec-tools-klibc: add explicit SRC_URI
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:54 -0000

From: Andrea Adami <andrea.adami@gmail.com>

After commit c2492ed SRC_URI of the recipe contains the kdump script.
Kdump is not in the purposes of this recipe so we restore the plain SRC_URI.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index d5b7bbe..c9fec25 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -8,6 +8,8 @@ inherit klibc
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
 
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+
 SRC_URI += " \
             file://kexec-elf-rel.patch \
             file://kexec-syscall.patch \
-- 
1.9.1


