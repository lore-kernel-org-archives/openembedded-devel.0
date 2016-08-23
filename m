Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47EB060722
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:21:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N7Lr4Z005503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Aug 2016 00:21:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 00:21:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 03:21:50 -0400
Message-ID: <1471936910-9177-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] efivar: fix PIC not found
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
X-List-Received-Date: Tue, 23 Aug 2016 07:21:55 -0000
Content-Type: text/plain

Previously, we tweak gcc option for gold linker to workaround
link failure, it caused shared object dependencies missing
while non gold linker:

Print shared object dependencies in target:
......
root@localhost:~# ldd /usr/sbin/efibootmgr
	linux-vdso.so.1 (0x00007ffdbbbe4000)
	libc.so.6 => /lib64/libc.so.6 (0x00007fce48355000)
	PIC => not found
	libefivar.so.0 => /usr/lib64/libefivar.so.0 (0x00007fce4813d000)
	PIC => not found
	libefiboot.so.0 => /usr/lib64/libefiboot.so.0 (0x00007fce47f33000)
	/lib64/ld-linux-x86-64.so.2 (0x00007fce486f2000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007fce47d2f000)
......

The efivar dynamic library missing PIC option. Do not apply
gold linker fix while non gold linker.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/efivar/efivar_0.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
index 35412b6..efffde5 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git \
 "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
-                                file://0004-fix-unknow-option-for-gold-linker.patch \
+                                ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
                               "
 SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
                                 file://allow-multi-definitions-for-native.patch \
-- 
2.8.1


