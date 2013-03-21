Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UIWH7-0001IC-57
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 04:34:45 +0100
Received: from mail189-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE014.bigfish.com (10.7.40.64) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 02:47:40 +0000
Received: from mail189-va3 (localhost [127.0.0.1])	by
	mail189-va3-R.bigfish.com (Postfix) with ESMTP id 583B64C00F5	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:47:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail189-va3 (localhost.localdomain [127.0.0.1]) by mail189-va3
	(MessageSwitch) id 1363834057278600_6186;
	Thu, 21 Mar 2013 02:47:37 +0000 (UTC)
Received: from VA3EHSMHS040.bigfish.com (unknown [10.7.14.240])	by
	mail189-va3.bigfish.com (Postfix) with ESMTP id 365A14A0074	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:47:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS040.bigfish.com
	(10.7.99.50) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 02:47:28 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 21 Mar 2013 02:47:28 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r2L2lOLf015516;	Wed, 20 Mar 2013 19:47:25 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2013 10:47:21 +0800
Message-ID: <1363834041-9889-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: [OE-core][PATCH] fm-ucode: update to the commit for sdk 1.3.2
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
X-List-Received-Date: Thu, 21 Mar 2013 03:35:03 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-ucode/fm-ucode/fm-ucode_git.bb |   51 +++++++++++++++++---------------
 1 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/recipes-ucode/fm-ucode/fm-ucode_git.bb b/recipes-ucode/fm-ucode/fm-ucode_git.bb
index 89c43ba..bc5dc6d 100644
--- a/recipes-ucode/fm-ucode/fm-ucode_git.bb
+++ b/recipes-ucode/fm-ucode/fm-ucode_git.bb
@@ -3,41 +3,44 @@ SECTION = "fm-ucode"
 LICENSE = "Freescale EULA"
 LIC_FILES_CHKSUM = "file://EULA;md5=60037ccba533a5995e8d1a838d85799c"
 
-FMAN_UCODE_INSTALL_FILE = "fsl_fman_ucode"
-FMAN_UCODE_INSTALL_FILE_append_p2041rdb = "_P2041"
-FMAN_UCODE_INSTALL_FILE_append_p4080ds= "_P4080"
-FMAN_UCODE_INSTALL_FILE_append_p1023rds = "_*1023"
-FMAN_UCODE_INSTALL_FILE_append_p5020ds = "_P5020"
-FMAN_UCODE_INSTALL_FILE_append_p5020ds-64b = "_P5020"
-FMAN_UCODE_INSTALL_FILE_append_p5040ds = "_P5040"
-FMAN_UCODE_INSTALL_FILE_append_p5040ds-64b = "_P5040"
-FMAN_UCODE_INSTALL_FILE_append_p3041ds = "_P3041"
-FMAN_UCODE_INSTALL_FILE_append_b4420qds = "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4420qds-64b = "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4860qds = "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_b4860qds-64b = "_B4860"
-FMAN_UCODE_INSTALL_FILE_append_t4160qds = "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4160qds-64b = "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4240qds = "_T4240"
-FMAN_UCODE_INSTALL_FILE_append_t4240qds-64b = "_T4240"
-
-COMPATIBLE_MACHINE = "(p1023rds|p4080ds|p5020ds|p5040ds|p5020ds-64b|p5040ds-64b|p3041ds|p2041rdb|b4420qds|b4420qds-64b|b4860qds|b4860qds-64b|t4160qds|t4160qds-64b|t4240qds|t4240qds-64b)"
+PR = "r1"
+
+
+COMPATIBLE_MACHINE = "(p1023rds|p2041rdb|p3041ds|p4080ds|p5020ds|p5040ds|p5020ds-64b|p5040ds-64b|b4420qds|b4420qds-64b|b4860qds|b4860qds-64b|t4160qds|t4160qds-64b|t4240qds|t4240qds-64b)"
 inherit deploy
 
 SRC_URI = "git://git.freescale.com/ppc/sdk/fm-ucode.git"
-SRCREV = "f4a43e8ad6a6e5fdedff6e1484386f963bccfdff"
+SRCREV = "219bb2c6aaa1e040fb849a771a9bdf3e8dbc49e9"
 
 S = "${WORKDIR}/git"
 
 ALLOW_EMPTY_${PN} = "1"
 do_install () {
-	install -d ${D}/boot
-	install -m 644 ${FMAN_UCODE_INSTALL_FILE}*.bin ${D}/boot/
+    case ${MACHINE} in
+        b4420qds|b4420qds-64b|b4860qds|b4860qds-64b) UCODE=b4860qds;;
+        t4240qds|t4240qds-64b|t4160qds|t4160qds-64b) UCODE=t4240qds;;
+        p5020ds|p5020ds-64b) UCODE=p5020ds;;
+        p5040ds|p5040ds-64b) UCODE=p5040ds;;
+        p1023rds) UCODE=P1023RDS;;
+        *) UCODE=${MACHINE};;
+    esac
+    UCODE=`echo $UCODE | sed -e 's,[a-zA-Z]*$,,'`
+    install -d ${D}/boot
+    install -m 644 fsl_fman_ucode_${UCODE}*.bin ${D}/boot/
 }
 
 do_deploy () {
-	install -d ${DEPLOYDIR}/
-	install -m 644 ${FMAN_UCODE_INSTALL_FILE}*.bin ${DEPLOYDIR}/
+    case ${MACHINE} in
+        b4420qds|b4420qds-64b|b4860qds|b4860qds-64b) UCODE=b4860qds;;
+        t4240qds|t4240qds-64b|t4160qds|t4160qds-64b) UCODE=t4240qds;;
+        p5020ds|p5020ds-64b) UCODE=p5020ds;;
+        p5040ds|p5040ds-64b) UCODE=p5040ds;;
+        p1023rds) UCODE=P1023RDS;;
+        *) UCODE=${MACHINE};;
+    esac
+    UCODE=`echo $UCODE | sed -e 's,[a-zA-Z]*$,,'`
+    install -d ${DEPLOYDIR}/
+    install -m 644 fsl_fman_ucode_${UCODE}*.bin ${DEPLOYDIR}/
 }
 addtask deploy before do_build after do_install
 
-- 
1.7.5.4




