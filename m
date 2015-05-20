Return-Path: <stefan@agner.ch>
X-Greylist: delayed 506 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 May 2015 07:00:37 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7A790607BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 07:00:37 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D7F135C0FC6;
	Wed, 20 May 2015 08:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=agner.ch; s=dkim;
	t=1432104620; bh=1Vm5qaJ4l8TJdiPI37siSnEpH/uaYjDteGP5pkUYCCA=;
	h=From:To:Cc:Subject:Date:From;
	b=wRpBh5/syWke+jLFlRK6ZnB/R+qgycZvqoFxYYWcMDfMRTcy4oSZ8hVKp4dKFG9zo
	TSpqTboFEGHD6mg8SXDiSOywTyYtLTp2oEqegFqhXo6tuPGRqKjpFUmJgdjfX9klIb
	g3OT1vbbCASF+XxcflxxdFLY0qZo3djaI+DsobIs=
From: Stefan Agner <stefan@agner.ch>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2015 08:52:08 +0200
Message-Id: <1432104728-18440-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.4.1
Subject: [meta-oe][dizzy][PATCH] ptpd: disable libpcap detection via pcap-config
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
X-List-Received-Date: Wed, 20 May 2015 07:00:37 -0000

When the host system provides pcap-config, the configure scripts
detect that and add a bogous CPPFLAG:

checking for pcap-config... /usr/bin/pcap-config
checking if we want to build with libpcap support... yes, pcap-config
...
PCAP_CPPFLAGS =  -I/usr/include

Which down the line can lead to compile errors due to wrong headers
being included. Fix this issue by using --with-pcap-config=no which
prevents detection using pcap-config but does "guessing", which works
fine for OE.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
If the host has libpcap development packages installed (which provide
pcap-config), this lead to compile errors like:
cc1: warning: include location "/usr/include" is unsafe for cross-compilation
[-Wpoison-system-directories]
cc1: warning: include location "/usr/include" is unsafe for cross-compilation
[-Wpoison-system-directories]
cc1: warning: include location "/usr/include" is unsafe for cross-compilation
[-Wpoison-system-directories]
In file included from /usr/include/bits/byteswap.h:35:0,
                 from /usr/include/endian.h:60,
                 from /usr/include/bits/waitstatus.h:64,
                 from /usr/include/stdlib.h:42,
                 from
/home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/ptpd.h:40,
                 from
/home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:54:
/home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:
In function 'initData':
/usr/include/bits/byteswap-16.h:31:5: error: invalid 'asm': invalid operand for
code 'w'
     __asm__ ("rorw $8, %w0"           \
     ^
/usr/include/netinet/in.h:403:21: note: in expansion of macro '__bswap_16'
 #   define htons(x) __bswap_16 (x)

This problem is already solved in fido/master due to the change to
pkgconfig by Joe MacDonald...

 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index db74e44..b6abfee 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -8,7 +8,7 @@ SECTION = "network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
 
-DEPENDS = "libpcap"
+DEPENDS = "linux-libc-headers libpcap"
 
 inherit autotools
 
@@ -30,7 +30,7 @@ S = "${WORKDIR}/ptpd-${PV}"
 
 EXTRA_OEMAKE = ""
 
-EXTRA_OECONF += "--disable-snmp"
+EXTRA_OECONF += "--disable-snmp --with-pcap-config=no"
 
 do_install() {
     install -d ${D}${bindir} ${D}${mandir}/man8
-- 
2.4.1


