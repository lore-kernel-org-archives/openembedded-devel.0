Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NNm-0002QW-AX
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:09:35 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 5C5281D363F6;
	Sun,  3 Oct 2010 14:02:03 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:01:56 +0200
Message-Id: <1286107318-10285-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107318-10285-1-git-send-email-ynezz@true.cz>
References: <1286107318-10285-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] linux-2.6.34: upgrade to latest stablepatch 2.6.34.7
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
X-List-Received-Date: Sun, 03 Oct 2010 12:09:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/linux/linux_2.6.34.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.34.bb b/recipes/linux/linux_2.6.34.b=
b
index b3c850f..469f23b 100644
--- a/recipes/linux/linux_2.6.34.bb
+++ b/recipes/linux/linux_2.6.34.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r1"
+PR =3D "r2"
=20
 module_autoload_ohci-hcd_omap5912osk =3D "ohci-hcd"
=20
@@ -17,11 +17,13 @@ DEFAULT_PREFERENCE_omap5912osk =3D "1"
 DEFAULT_PREFERENCE_tqm8540 =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=
=3Dkernel \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;a=
pply=3Dyes;name=3Dstablepatch \
            file://ARM-Add-support-for-LZMA-compressed-kernel-images.patc=
h;status=3Dpending \
-           file://use-noclone-attribute-for-naked.patch;status=3Dpending=
 \
            file://defconfig"
=20
 SRC_URI_append_c7x0 =3D " file://fix-corgi-card-detection.patch;status=3D=
pending "
=20
 SRC_URI[kernel.md5sum] =3D "10eebcb0178fb4540e2165bfd7efc7ad"
 SRC_URI[kernel.sha256sum] =3D "fa395fec7de633df1cb85b6248b8f35af98380ed1=
28a8bc465fb48bc4d252633"
+SRC_URI[stablepatch.md5sum] =3D "a88e4b5a9fcb23c2229301ac4dae1f1a"
+SRC_URI[stablepatch.sha256sum] =3D "b146904ea07cc87a3fbcbd4eab51d331d567=
18431539e6aa29c24b072e6b7832"
--=20
1.7.0.4



