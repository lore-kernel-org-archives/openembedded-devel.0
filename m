Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <buchner.johannes@gmx.at>) id 1Mb6Vp-0003uV-GN
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 07:36:38 +0200
Received: (qmail invoked by alias); 12 Aug 2009 05:20:12 -0000
Received: from unknown (EHLO [10.1.1.2]) [121.98.210.253]
	by mail.gmx.net (mp064) with SMTP; 12 Aug 2009 07:20:12 +0200
X-Authenticated: #25574588
X-Provags-ID: V01U2FsdGVkX1+Io2YXW0WIm8Be4NriprwjflFBjvkFS6BbfAOKUL
	k1+8DYTP9cwFq8
Message-ID: <4A82DF34.7050408@gmx.at>
Date: Wed, 12 Aug 2009 17:26:44 +0200
From: Johannes Buchner <buchner.johannes@gmx.at>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.5,0.44
Subject: [PATCH] hx2750 compile errors
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
X-List-Received-Date: Wed, 12 Aug 2009 05:36:38 -0000
Content-Type: multipart/mixed; boundary="------------060701060700020108060902"

--------------060701060700020108060902
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi.

I noticed the linux-rp-2.6.23 on angstrom (MACHINE=hx2000) doesn't
compile on stable/2009 because of errors in the hx2750 code (probably
was not updated).

The attached patch makes it compile again. Not tested yet, might not
have full pm functionality (if it ever had).

Cheers,
Johannes

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFKgt8y7X1+MfqVcr0RAvvaAKCROYtxVIS4ypC/nQ3s2vpDLgA0KwCeO4Er
p/KH4Gu9dm5jQ7qMNrEVv58=
=tN91
-----END PGP SIGNATURE-----
From ef0a00966367a5d5fcda5c468dabb0a62c510c41 Mon Sep 17 00:00:00 2001
From: user <user@oebuild.localdomain>
Date: Wed, 12 Aug 2009 10:55:30 -0400
Subject: [PATCH] made hx2750 compile again

note that the hx2750_pm_ops struct now is quite crippled, I don't really
know where all the functionality went.
---
 recipes/linux/linux-rp-2.6.23/hx2750-make.patch |   77 +++++++++++++++++++++++
 recipes/linux/linux-rp_2.6.23.bb                |    1 +
 2 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100755 recipes/linux/linux-rp-2.6.23/hx2750-make.patch

diff --git a/recipes/linux/linux-rp-2.6.23/hx2750-make.patch b/recipes/linux/linux-rp-2.6.23/hx2750-make.patch
new file mode 100755
index 0000000..c40d725
--- /dev/null
+++ b/recipes/linux/linux-rp-2.6.23/hx2750-make.patch
@@ -0,0 +1,77 @@
+Index: linux-2.6.23/arch/arm/mach-pxa/hx2750.c
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/hx2750.c	2009-08-12 10:37:26.000000000 -0400
++++ linux-2.6.23/arch/arm/mach-pxa/hx2750.c	2009-08-12 10:38:53.000000000 -0400
+@@ -443,7 +443,7 @@
+ 	.io_pg_offst	= (io_p2v(0x40000000) >> 18) & 0xfffc,
+ 	.boot_params	= 0xa0000100,
+ 	.map_io		= pxa_map_io,
+-        .init_irq 	= pxa_init_irq,
++        .init_irq 	= pxa27x_init_irq,
+         .timer		= &pxa_timer,
+ 	.init_machine 	= hx2750_init,
+ MACHINE_END
+Index: linux-2.6.23/arch/arm/mach-pxa/hx2750_test.c
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/hx2750_test.c	2009-08-12 10:37:26.000000000 -0400
++++ linux-2.6.23/arch/arm/mach-pxa/hx2750_test.c	2009-08-12 10:40:35.000000000 -0400
+@@ -203,14 +203,15 @@
+ 
+ static DEVICE_ATTR(ssp2write, 0200, NULL, ssp2write_store);
+ 
+-+static ssize_t sspr_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
++static ssize_t sspr_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+ {
+-	unsigned long val,ret;
++	unsigned long val;
++	int ret;
+ 	val = simple_strtoul(buf, NULL, 0);
+ 
+ 	hx2750_tsc2101_send(1<<15,val,&ret,1);
+ 
+-	printk("Response: %lx\n",ret);
++	printk("Response: %x\n",ret);
+ 
+ 	return count;
+ }
+@@ -219,8 +220,9 @@
+ 
+ static ssize_t sspw_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+ {
+-	unsigned long val,ret;
+-	sscanf(buf, "%lx %lx", &val, &ret);
++	unsigned long val;
++	int ret;
++	sscanf(buf, "%lx %x", &val, &ret);
+ 
+ 	hx2750_tsc2101_send(0,val,&ret,1);
+ 
+@@ -336,10 +338,10 @@
+ }
+ 
+ static struct pm_ops hx2750_pm_ops = {
+-	.pm_disk_mode	= PM_DISK_FIRMWARE,
+-	.prepare	= pxa_pm_prepare,
++	/* .pm_disk_mode	= PM_DISK_FIRMWARE,  ** not sure why this element doesn't exist anymore and what replaced it **  */
++	/* .prepare	= pxa_pm_prepare, */
+ 	.enter		= hx2750_pxa_pm_enter,
+-	.finish		= pxa_pm_finish,
++	/* .finish		= pxa_pm_finish, */
+ };
+ 
+ 
+Index: linux-2.6.23/include/asm/arch/hx2750.h
+===================================================================
+--- linux-2.6.23.orig/include/asm/arch/hx2750.h	2009-08-12 10:42:15.000000000 -0400
++++ linux-2.6.23/include/asm/arch/hx2750.h	2009-08-12 10:42:24.000000000 -0400
+@@ -85,6 +85,10 @@
+ void hx2750_set_egpio(unsigned int gpio);
+ void hx2750_clear_egpio(unsigned int gpio);
+ 
++/* for _test.c */
++void hx2750_ssp_init2(void);
++void hx2750_tsc2101_send(int read, int command, int *values, int numval);
++
+ 
+ #endif /* __ASM_ARCH_HX2750_H  */
+ 
diff --git a/recipes/linux/linux-rp_2.6.23.bb b/recipes/linux/linux-rp_2.6.23.bb
index 460ac53..e45006a 100644
--- a/recipes/linux/linux-rp_2.6.23.bb
+++ b/recipes/linux/linux-rp_2.6.23.bb
@@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.tar.bz2 \
            ${RPSRC}/hx2750_base-r29.patch;patch=1 \
            ${RPSRC}/hx2750_bl-r9.patch;patch=1 \
            ${RPSRC}/hx2750_pcmcia-r2.patch;patch=1 \
+           ${RPSRC}/hx2750_make.patch;patch=1 \
            ${RPSRC}/pxa_keys-r7.patch;patch=1 \
            ${RPSRC}/tsc2101-r16.patch;patch=1 \
            ${RPSRC}/hx2750_test1-r7.patch;patch=1 \
-- 
1.6.0.4



--------------060701060700020108060902--
