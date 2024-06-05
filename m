Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65634C41513
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:39:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8627.1717569593112505092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OCvDPkE4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717569593; x=1749105593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xbYb07gTuJR4TvnRfpN+BLVnno4SpY6hmOMSoLtSXcc=;
  b=OCvDPkE4dJ21aJIEmpP1glLWNXrBWbLI/B7Y3yva5BKY2yo0O0J0aOGN
   rfBi3/5NdmFis3hMR0mod/qrTheOKWOyvB9izJEgykO1cPozXyXSXIXQ4
   9STRtGr4ju/WLM8J+SMlMv4uIhQ63DhaYpWi2jManpAQziujM9ObAN6xD
   KbLhsnQ3LsmdEYEdb6KSEBySN8T8yoKFdQDD/y6tUjD22p2inHW6Nfr2q
   9l5/MMyjyGAmWQIBHSdDqA3lDDip8HTlgQkzn14liqpvpytl/IsILtSIH
   IJPZ3KdJrpWgcovdhePsJtNGr+2Q14bvrpuLwAwULP/6MwKEJiL7ga8tk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="162072557"
X-IronPort-AV: E=Sophos;i="6.08,215,1712588400"; 
   d="scan'208";a="162072557"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:39:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4541AD63C7
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74946BDC8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09A0CE2915
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:47 +0900 (JST)
Received: from ubuntu24.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8E8B1A000A;
	Wed,  5 Jun 2024 14:39:46 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 2/2] openldap: ignore incompatible-pointer-types errors for now.
Date: Wed,  5 Jun 2024 14:39:45 +0800
Message-ID: <20240605063946.83219-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605063946.83219-1-leimaohui@fujitsu.com>
References: <20240605063946.83219-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28432.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28432.005
X-TMASE-Result: 10-6.287200-10.000000
X-TMASE-MatchedRID: rP+DoEmnPppXY5ze6zUPKRVof5GwqGWEQR7lWMXPA1tfA5bZHmtHYuK5
	fhRxt1aACC8aAmGeO6lV00+whwxVQy/7QU2czuUNA9lly13c/gHdKRNjzo2IOHjyHMch8kOwrUn
	QUdjG6vWYZP+m6YSSzKoYo9yhpHUWyMK/JJUJ765YKMMlFh4Bnc78PItWKHEPyAjBfDxwziU0/K
	dvtu8lnDxOxTEbgyTygDLqnrRlXrZ8nn9tnqel2LI7zVffJqTz2302tjagq9vYXWh2oCJLVBl29
	Mt1evFHpvbFt6OYeEit2IVHxNzsE0UkvYu+OQ/Io1QBOsxJ30q1MoGOcIbL3oQs0rXQ6nxI
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 06:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110696

From: Lei Maohui <leimaohui@fujitsu.com>

GCC 14 implicitly turns a warning into a compiler error:

| tls_g.c:971:57: error: passing argument 4 of 'gnutls_fingerprint' from incompatible pointer type [-Wincompatible-pointer-types]
|   971 |                                         keyhash.bv_val, &keyhash.bv_len ) < 0 ) {
|       |                                                         ^~~~~~~~~~~~~~~
|       |                                                         |
|       |                                                         ber_len_t * {aka long unsigned int *}
| In file included from tls_g.c:44:
| /build-ubinux-daily/tmp/work/armv7ahf-neon-ubinuxmllib32-linux-gnueabi/lib32-openldap/2.6.7/lib32-recipe-sysroot/usr/include/gnutls/gnutls.h:2406:32: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'ber_len_t *' {aka 'long unsigned int *'}
|  2406 |                        size_t *result_size);
|       |                        ^~~
| make[2]: *** [Makefile:432: tls_g.lo] Error 1

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/openldap/openldap_2.6.7.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
index c229667d68..8bb801a1b1 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
@@ -31,7 +31,6 @@ inherit autotools-brokensep update-rc.d systemd pkgconfig
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
 # when cross compiling (should be in site?)
 EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
-
 # CONFIG DEFINITIONS
 # The following is necessary because it cannot be determined for a
 # cross compile automagically.  Select should yield fine on all OE
@@ -39,7 +38,7 @@ EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
 EXTRA_OECONF += "--with-yielding-select=yes"
 # Shared libraries are nice...
 EXTRA_OECONF += "--enable-dynamic"
-
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 PACKAGECONFIG ??= "asyncmeta gnutls modules \
                    mdb ldap meta null passwd proxycache dnssrv \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.34.1


