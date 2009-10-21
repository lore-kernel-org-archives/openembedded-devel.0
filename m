Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0aGC-0005Um-NZ
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 14:25:51 +0200
Received: (qmail 19943 invoked by uid 813007); 21 Oct 2009 12:24:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 12:24:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 14:26:36 +0200
Message-Id: <1256127996-5625-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-12-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-12-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.29: removed two patches from micro2440 which are also in stable update
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
X-List-Received-Date: Wed, 21 Oct 2009 12:25:51 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 ...mp-fix-for-the-40-relocation-binutils-pro.patch |   49 ------------------
 ...2-GRO-Disable-GRO-on-legacy-netif_rx-path.patch |   54 --------------------
 recipes/linux/linux_2.6.29.bb                      |    2 -
 3 files changed, 0 insertions(+), 105 deletions(-)
 delete mode 100644 recipes/linux/linux-2.6.29/micro2440/0005-920T-Temp-fix-for-the-40-relocation-binutils-pro.patch
 delete mode 100644 recipes/linux/linux-2.6.29/micro2440/0012-GRO-Disable-GRO-on-legacy-netif_rx-path.patch

diff --git a/recipes/linux/linux-2.6.29/micro2440/0005-920T-Temp-fix-for-the-40-relocation-binutils-pro.patch b/recipes/linux/linux-2.6.29/micro2440/0005-920T-Temp-fix-for-the-40-relocation-binutils-pro.patch
deleted file mode 100644
index 6b8aaf4..0000000
--- a/recipes/linux/linux-2.6.29/micro2440/0005-920T-Temp-fix-for-the-40-relocation-binutils-pro.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a4cba996cb77da4afc26c35402a70c3f008afe96 Mon Sep 17 00:00:00 2001
-From: Michel Pollet <buserror@gmail.com>
-Date: Sat, 14 Mar 2009 10:34:32 +0000
-Subject: [PATCH] 920T: Temp(?) fix for the 40 relocation binutils problem
-
-This prevents the modules failing to load when made
-with modern toolchains. There is no way to prevent binutils
-to generate these relocations, and on the 920t they are
-in fact not needed. So this patch just skip them.
-
-Signed-off-by: Michel Pollet <buserror@gmail.com>
----
- arch/arm/include/asm/elf.h |    1 +
- arch/arm/kernel/module.c   |    7 +++++++
- 2 files changed, 8 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/include/asm/elf.h b/arch/arm/include/asm/elf.h
-index a58378c..ce3b36e 100644
---- a/arch/arm/include/asm/elf.h
-+++ b/arch/arm/include/asm/elf.h
-@@ -50,6 +50,7 @@ typedef struct user_fp elf_fpregset_t;
- #define R_ARM_ABS32	2
- #define R_ARM_CALL	28
- #define R_ARM_JUMP24	29
-+#define R_ARM_V4BX	40
- 
- /*
-  * These are used to set parameters in the core dumps.
-diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
-index dab48f2..fa03392 100644
---- a/arch/arm/kernel/module.c
-+++ b/arch/arm/kernel/module.c
-@@ -132,6 +132,13 @@ apply_relocate(Elf32_Shdr *sechdrs, const char *strtab, unsigned int symindex,
- 			*(u32 *)loc |= offset & 0x00ffffff;
- 			break;
- 
-+#ifdef CONFIG_CPU_ARM920T
-+		/* modern toolchain generate V4BX for the modules, and there is no
-+		 * way to skip them being generated in the .ko, so in our case, we just
-+		 * can ignore them */
-+		case R_ARM_V4BX: /* Ignore these sections */
-+			break;
-+#endif
- 		default:
- 			printk(KERN_ERR "%s: unknown relocation: %u\n",
- 			       module->name, ELF32_R_TYPE(rel->r_info));
--- 
-1.5.6.3
-
diff --git a/recipes/linux/linux-2.6.29/micro2440/0012-GRO-Disable-GRO-on-legacy-netif_rx-path.patch b/recipes/linux/linux-2.6.29/micro2440/0012-GRO-Disable-GRO-on-legacy-netif_rx-path.patch
deleted file mode 100644
index bfad6d8..0000000
--- a/recipes/linux/linux-2.6.29/micro2440/0012-GRO-Disable-GRO-on-legacy-netif_rx-path.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 11c0b33d2a046a37bcd96528faa0e93359ef4a4b Mon Sep 17 00:00:00 2001
-From: Herbert Xu <herbert@gondor.apana.org.au>
-Date: Thu, 26 Mar 2009 00:59:10 -0700
-Subject: [PATCH] GRO: Disable GRO on legacy netif_rx path
-
-When I fixed the GRO crash in the legacy receive path I used
-napi_complete to replace __napi_complete.  Unfortunately they're
-not the same when NETPOLL is enabled, which may result in us
-not calling __napi_complete at all.
-
-What's more, we really do need to keep the __napi_complete call
-within the IRQ-off section since in theory an IRQ can occur in
-between and fill up the backlog to the maximum, causing us to
-lock up.
-
-Since we can't seem to find a fix that works properly right now,
-this patch reverts all the GRO support from the netif_rx path.
-
-Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
-Signed-off-by: David S. Miller <davem@davemloft.net>
-Signed-off-by: Michel Pollet <buserror@gmail.com>
----
- net/core/dev.c |    9 +++------
- 1 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/net/core/dev.c b/net/core/dev.c
-index e3fe5c7..e438f54 100644
---- a/net/core/dev.c
-+++ b/net/core/dev.c
-@@ -2588,18 +2588,15 @@ static int process_backlog(struct napi_struct *napi, int quota)
- 		local_irq_disable();
- 		skb = __skb_dequeue(&queue->input_pkt_queue);
- 		if (!skb) {
-+			__napi_complete(napi);
- 			local_irq_enable();
--			napi_complete(napi);
--			goto out;
-+			break;
- 		}
- 		local_irq_enable();
- 
--		napi_gro_receive(napi, skb);
-+		netif_receive_skb(skb);
- 	} while (++work < quota && jiffies == start_time);
- 
--	napi_gro_flush(napi);
--
--out:
- 	return work;
- }
- 
--- 
-1.5.6.3
-
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index 6027968..240faf2 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -43,14 +43,12 @@ SRC_URI_append_micro2440 = " \
 	file://0002-S3C-Backported-openmoko-s-touchscreen-filters.patch;patch=1 \
 	file://0003-VENDOR-armworks-logo.patch;patch=1 \
 	file://0004-920T-Use-specific-920t-mtune.patch;patch=1 \
-	file://0005-920T-Temp-fix-for-the-40-relocation-binutils-pro.patch;patch=1 \
 	file://0006-S3C-Allow-the-machine-code-to-get-the-BBT-table-fro.patch;patch=1 \
 	file://0007-MINI2440-Add-machine-support.patch;patch=1 \
 	file://0008-MINI2440-Delays-command-check-response-on-SD.patch;patch=1 \
 	file://0009-MINI2440-Rename-the-SoC-tty-names.patch;patch=1 \
 	file://0010-MINI2440-creates-a-mini2440_defconfig-file.patch;patch=1 \
 	file://0011-MINI2440-Add-touchscreen-support.patch;patch=1 \
-	file://0012-GRO-Disable-GRO-on-legacy-netif_rx-path.patch;patch=1 \
 	"
 
 SRC_URI_append_tosa = " \
-- 
1.6.5





