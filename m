Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <r63875@freescale.com>) id 1UZdve-0005xO-Qr
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 11:11:24 +0200
Received: from mail75-am1-R.bigfish.com (10.3.201.236) by
	AM1EHSOBE016.bigfish.com (10.3.207.138) with Microsoft SMTP Server id
	14.1.225.23; Tue, 7 May 2013 08:08:09 +0000
Received: from mail75-am1 (localhost [127.0.0.1])	by mail75-am1-R.bigfish.com
	(Postfix) with ESMTP id 61543460268	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2013 08:08:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail75-am1 (localhost.localdomain [127.0.0.1]) by mail75-am1
	(MessageSwitch) id 1367914037251844_25563;
	Tue,  7 May 2013 08:07:17 +0000 (UTC)
Received: from AM1EHSMHS013.bigfish.com (unknown [10.3.201.226])	by
	mail75-am1.bigfish.com (Postfix) with ESMTP id 3ACD6140275	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2013 08:07:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS013.bigfish.com
	(10.3.207.151) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 7 May 2013 08:07:17 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 7 May 2013 08:07:15 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r4787C7F007605; Tue, 7 May 2013 01:07:13 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 May 2013 15:26:47 +0800
Message-ID: <1367911607-10346-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] lvm2: add configure option --with-usrlibdir to install shared library in 64-bit systems
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
X-List-Received-Date: Tue, 07 May 2013 09:11:24 -0000
Content-Type: text/plain

According to make.tmpl.in, shared lib will be installed under $(usrlibdir)
install_lib_shared: $(LIB_SHARED)
        $(INSTALL_PROGRAM) -D $< $(libdir)/$(<F).$(LIB_VERSION)
        $(INSTALL_DIR) $(usrlibdir)
        $(LN_S) -f $(USRLIB_RELPATH)$(<F).$(LIB_VERSION) $(usrlibdir)/$(<F)

But default $(usrlibdir) is $(DESTDIR)${prefix}/lib no matter it is 32-bit or 64-bit system.
So we need align $(usrlibdir) with $(libdir).

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 157e11b..5de1e3f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -4,7 +4,7 @@ DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r0"
+INC_PR = "r1"
 
 
 S = "${WORKDIR}/LVM2.${PV}"
@@ -37,3 +37,4 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
+EXTRA_OECONF = "--with-usrlibdir=${libdir}"
-- 
1.7.0.4




