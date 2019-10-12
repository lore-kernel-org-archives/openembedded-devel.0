Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id 495887F634
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 12:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 5436AE0197
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:46:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4s91e5y89jtJ; Sat, 12 Oct 2019 14:46:03 +0200 (CEST)
Received: from pfanne-bionic1.mle (p578c5bfe.dip0.t-ipconnect.de
	[87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 0778FE011C;
	Sat, 12 Oct 2019 14:46:02 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2019 14:44:34 +0200
Message-Id: <20191012124434.129278-2-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20191012124434.129278-1-stefan.wiehler@missinglinkelectronics.com>
References: <20191009151926.1733788-1-raj.khem@gmail.com>
	<20191012124434.129278-1-stefan.wiehler@missinglinkelectronics.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nvme-cli: defer host ID generation to post installation
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
X-List-Received-Date: Sat, 12 Oct 2019 12:46:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
index 256d83f03..061c7a0fe 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
-DEPENDS = "util-linux util-linux-native"
+DEPENDS = "util-linux"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
@@ -15,15 +15,18 @@ S = "${WORKDIR}/git"
 inherit bash-completion systemd
 
 do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix} \
+    oe_runmake install-spec DESTDIR=${D} PREFIX=${prefix} \
         UDEVDIR=${nonarch_base_libdir}/udev SYSTEMDDIR=${systemd_unitdir}
 }
 
 pkg_postinst_ontarget_${PN}() {
     ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
+    ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
 }
 
 PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
 
 FILES_${PN}-dracut = "${libdir}/dracut/dracut.conf.d"
 FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
+
+RDEPENDS_${PN} = "util-linux-uuidgen"
-- 
2.19.2


