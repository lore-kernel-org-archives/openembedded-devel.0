Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TiHdq-0003p9-1s
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 05:40:26 +0100
Received: from mail168-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Dec 2012 04:25:53 +0000
Received: from mail168-va3 (localhost [127.0.0.1])	by
	mail168-va3-R.bigfish.com (Postfix) with ESMTP id 74E602A00A5	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 04:25:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzc857hzz1de0h1202h1e76h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail168-va3 (localhost.localdomain [127.0.0.1]) by mail168-va3
	(MessageSwitch) id 1355199950782610_21503;
	Tue, 11 Dec 2012 04:25:50 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.244])	by
	mail168-va3.bigfish.com (Postfix) with ESMTP id B9237100057	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 04:25:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Dec 2012 04:25:50 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 11 Dec 2012 04:24:23 +0000
Received: from localhost.localdomain (rhuath.am.freescale.net [10.82.176.1])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id qBB4OMIv031880;
	Mon, 10 Dec 2012 21:24:22 -0700
From: Chunrong Guo <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Dec 2012 22:24:22 -0600
Message-ID: <1355199862-7933-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.6.2.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, B19537@freescale.com
Subject: [OE-core][PATCH] mtd-utils:fix corrupt cleanmarker with flash_erase -j command
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 04:40:26 -0000
Content-Type: text/plain

     *Flash_erase -j should fill discrete freeoob areas with required bytes
      of JFFS2 cleanmarker in jffs2_check_nand_cleanmarker(). Not just fill
      the first freeoob area.

Signed-off-by: Chunrong Guo <b40290@freescale.com>
---
 ...t-cleanmarker-with-flash_erase--j-command.patch |  133 ++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    5 +-
 2 files changed, 136 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
new file mode 100644
index 0000000..a66087e
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
@@ -0,0 +1,133 @@
+Upstream-Status: Pending
+From patchwork Mon Aug  8 08:16:43 2011
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: mtd-utils: fix corrupt cleanmarker with flash_erase -j command
+Date: Sun, 07 Aug 2011 22:16:43 -0000
+From: b35362@freescale.com
+X-Patchwork-Id: 108873
+Message-Id: <1312791403-13473-1-git-send-email-b35362@freescale.com>
+To: <dwmw2@infradead.org>
+Cc: Liu Shuo <b35362@freescale.com>, Artem.Bityutskiy@nokia.com,
+ Li Yang <leoli@freescale.com>, linux-mtd@lists.infradead.org
+
+From: Liu Shuo <b35362@freescale.com>
+
+Flash_erase -j should fill discrete freeoob areas with required bytes
+of JFFS2 cleanmarker in jffs2_check_nand_cleanmarker(). Not just fill
+the first freeoob area.
+
+The below is the result without this workaround:
+
+JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00004000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
+JFFS2: Erase block at 0x0000c000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00014000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
+JFFS2: Erase block at 0x0001c000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00024000 is not formatted. It will be erased
+JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
+...
+
+Signed-off-by: Liu Shuo <b35362@freescale.com>
+Signed-off-by: Li Yang <leoli@freescale.com>
+
+---
+v2 : get length of availble freeoob bytes from oobinfo information,
+      not use the ioctl ECCGETLAYOUT which is being deprecated.
+
+ flash_erase.c |   46 +++++++++++++++++++++++++++++++++++++++-------
+ 1 files changed, 39 insertions(+), 7 deletions(-)
+
+diff --git a/flash_erase.c b/flash_erase.c
+index fe2eaca..3e94495 100644
+--- a/flash_erase.c
++++ b/flash_erase.c
+@@ -98,6 +98,7 @@ int main(int argc, char *argv[])
+ 	int isNAND;
+ 	int error = 0;
+ 	uint64_t offset = 0;
++	void *oob_data = NULL;
+ 
+ 	/*
+ 	 * Process user arguments
+@@ -197,15 +198,43 @@ int main(int argc, char *argv[])
+ 			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
+ 				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
+ 
++			cleanmarker.totlen = cpu_to_je32(8);
+ 			/* Check for autoplacement */
+ 			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+-				/* Get the position of the free bytes */
+-				if (!oobinfo.oobfree[0][1])
++				struct nand_ecclayout_user ecclayout;
++				int i, oobavail;
++
++				for (i = 0, oobavail = 0; oobinfo.oobfree[i][1]; i++)
++					oobavail += oobinfo.oobfree[i][1];
++
++				if (!oobavail)
+ 					return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
++
++				/* Get the position of the free bytes */
+ 				clmpos = oobinfo.oobfree[0][0];
+-				clmlen = oobinfo.oobfree[0][1];
+-				if (clmlen > 8)
+-					clmlen = 8;
++				clmlen = MIN(oobavail, 8);
++
++				if (oobinfo.oobfree[0][1] < 8 && oobavail >= 8) {
++					int left, n, last = 0;
++					void *cm;
++
++					oob_data = malloc(mtd.oob_size);
++					if (!oob_data)
++						return -ENOMEM;
++
++					memset(oob_data, 0xff, mtd.oob_size);
++					cm = &cleanmarker;
++					for (i = 0, left = clmlen; left ; i++) {
++						n = MIN(left, oobinfo.oobfree[i][1]);
++						memcpy(oob_data + oobinfo.oobfree[i][0],
++								cm, n);
++						left -= n;
++						cm   += n;
++						last = oobinfo.oobfree[i][0] + n;
++					}
++
++					clmlen = last - clmpos;
++				}
+ 			} else {
+ 				/* Legacy mode */
+ 				switch (mtd.oob_size) {
+@@ -223,7 +252,6 @@ int main(int argc, char *argv[])
+ 						break;
+ 				}
+ 			}
+-			cleanmarker.totlen = cpu_to_je32(8);
+ 		}
+ 		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
+ 	}
+@@ -272,7 +300,8 @@ int main(int argc, char *argv[])
+ 
+ 		/* write cleanmarker */
+ 		if (isNAND) {
+-			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, &cleanmarker) != 0) {
++			void *data = oob_data ? oob_data + clmpos : &cleanmarker;
++			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, data) != 0) {
+ 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
+ 				continue;
+ 			}
+@@ -291,5 +320,8 @@ int main(int argc, char *argv[])
+ 	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
+ 	bareverbose(!quiet, "\n");
+ 
++	if (oob_data)
++		free(oob_data);
++
+ 	return 0;
+ }
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index bdfb022..487b6cb 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -8,11 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRCREV = "ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
+		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+                file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
-- 
1.6.2.5




