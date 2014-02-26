Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA3A60B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 21:50:26 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so900531eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AaZcO/0DF/PGCDeDQBg9AdZE6BZPszcF6mL2ftCEzEg=;
	b=ILDiDSR4BOTP8Kkpcx9AFx5RqL2dy8BqFfOhZukcjxfxXwCCeEdGdbLHLN6QN1BndW
	qcbVGAXxuRTyMzak1F3Zq2uHFjBK/bHFfstcXxmIHSSMLQtYCypyH14Fq3wRZJwZfdps
	j+ILRNNoF5e+rM82H64fo4e7pEHZ0R6C2IkvuHBGnfX9ZnWL8AZOHgurCstOXiaW620G
	9x/fP0UPs6n7Yp+7e47lTxwOF3+r+p6Om91crLtnf/d10KFVL08Tem+i8cegvD01d0yH
	4lQZwGjlloks6q7TQnOvUW2iLizU/BHZf28QuLi1zqc+dSEQo+2BnNGHuEPIALC3xU2F
	vzOg==
X-Received: by 10.14.2.193 with SMTP id 41mr9131767eef.55.1393451422412;
	Wed, 26 Feb 2014 13:50:22 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.139])
	by mx.google.com with ESMTPSA id y51sm8674601eeu.0.2014.02.26.13.50.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 13:50:21 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2014 22:49:57 +0100
Message-Id: <1393451397-23105-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] klcc-cross: force rebuild for each MACHINE of the same arch
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
X-List-Received-Date: Wed, 26 Feb 2014 21:50:33 -0000

In case of subsequent builds for machines belonging to the same arch
we have to rebuild the klcc-cross wrapper because it is harcoding
the path to the headers in machine sysroot.
This hack is necessary to avoid to mark the klibc infrastructure as
machine-specific.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 40a65fd..068b3d5 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
@@ -28,3 +28,9 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_tar[noexec] = "1"
+
+# The linux-libc-headers and klibc custom headers are not machine-specific
+# but are installed into machine sysroot.
+# Klcc wrapper is hardcoding som eof these paths thus, to keep te recipe
+# arch-specific, we force the rebuild of klcc-cross for each machine.
+do_compile[vardeps] += "MACHINE"
-- 
1.8.1.5


