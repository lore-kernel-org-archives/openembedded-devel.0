Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A231784B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 14:06:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6DE6IoH009149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Jul 2018 07:06:19 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 13 Jul 2018 07:06:18 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jul 2018 07:06:16 -0700
Message-ID: <20180713140616.15664-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180713140616.15664-1-hongzhi.song@windriver.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH] x86: remove "qemu-usermode" from MACHINE_FEATURES_BACKFILL_CONSIDERED
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
X-List-Received-Date: Fri, 13 Jul 2018 14:06:19 -0000
Content-Type: text/plain

error information:
---
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
If the above error message is about missing .so libraries,
then setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
(typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
---

qemux86 will face the error above.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 70814b8d4d..091d60f507 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -26,6 +26,7 @@ TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64',
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', 'qemu-usermode', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '' ,d)}"
 
 # ELF64 ABI
-- 
2.11.0


