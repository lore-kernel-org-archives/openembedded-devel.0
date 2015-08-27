Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0997376DE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:34:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R9Yo4D010395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:34:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 02:34:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Aug 2015 17:30:22 +0800
Message-ID: <1440667822-23807-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] efibootmgr: fix build error with gcc 5.2
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
X-List-Received-Date: Thu, 27 Aug 2015 09:34:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build efibootmgr with gcc 5.2:

src/lib/disk.o: In function `disk_get_scsi_pci':
src/lib/disk.c:154: undefined reference to `get_scsi_pci'
src/lib/efi.o: In function `make_edd30_device_path':
src/lib/efi.c:474: undefined reference to `get_scsi_idlun'
collect2: error: ld returned 1 exit status

Because functions get_scsi_pci and get_scsi_idlun are declared as
inline. It has different semantics for inilne function between gcc 4
and gcc 5.

Pass flag '-fgnu89-inline' to gcc to fix the errors.

Ref:
https://gcc.gnu.org/gcc-5/porting_to.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
index 1870455..501ff2a 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://linux.dell.com/efibootmgr/permalink/efibootmgr-${PV}.tar.gz \
 SRC_URI[md5sum] = "9e9a31d79e579644de83a14139b66d10"
 SRC_URI[sha256sum] = "5167488b92950e60028d1025942ce6bda04638c6fb5e110abb8c8f687844d155"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include'"
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include -fgnu89-inline'"
 
 do_install () {
     install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
-- 
1.9.1


