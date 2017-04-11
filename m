Return-Path: <btv1==2746b3a4bf2==fgiovanardi@aragnet.com>
Received: from ess.meadinformatica.it (ess.meadinformatica.it [83.139.208.7])
	by mail.openembedded.org (Postfix) with ESMTP id AB09B77BDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 12:44:54 +0000 (UTC)
X-ASG-Debug-ID: 1491914693-06cfaf6eced8500001-aWHRdb
Received: from mail.aragnet.com (mail.aragnet.com [87.241.1.10]) by
	ess.meadinformatica.it with ESMTP id HMF6U6xhslRaCPqG for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:44:53 +0200 (CEST)
X-Barracuda-Envelope-From: fgiovanardi@aragnet.com
X-Barracuda-RBL-Trusted-Forwarder: 87.241.1.10
Received: from arag-domino-mail.aragnet.lan (unknown [172.30.0.142])
	by mail.aragnet.com (Postfix) with ESMTP id 526D711406E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:49:04 +0200 (CEST)
Received: from pcfedericog.aragnet.lan ([172.31.0.4])
	by arag-domino-mail.aragnet.lan (IBM Domino Release 9.0.1FP2)
	with ESMTP id 2017041114445309-905 ; Tue, 11 Apr 2017 14:44:53 +0200 
X-Barracuda-RBL-IP: 172.30.0.142
From: Federico Giovanardi <fgiovanardi@aragnet.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Apr 2017 14:46:42 +0200
X-ASG-Orig-Subj: [PATCH] picocom: Fix incorrect handling of ldflags
Message-Id: <20170411124642.12647-1-fgiovanardi@aragnet.com>
X-Mailer: git-send-email 2.11.0
X-MIMETrack: Itemize by SMTP Server on N02_Rubiera/ARAG/IT(Release
	9.0.1FP2|August 03, 2014) at 11/04/2017 14.44.53,
	Serialize by Router on N02_Rubiera/ARAG/IT(Release 9.0.1FP2|August  03,
	2014) at 11/04/2017 14.44.53,
	Serialize complete at 11/04/2017 14.44.53
X-TNEFEvaluated: 1
X-Barracuda-Connect: mail.aragnet.com[87.241.1.10]
X-Barracuda-Start-Time: 1491914693
X-Barracuda-URL: https://83.139.208.7:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 849
X-Virus-Scanned: by bsmtpd at meadinformatica.it
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.50
X-Barracuda-Spam-Status: No, SCORE=0.50 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=8.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.37987
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.50 BSF_RULE7568M          Custom Rule 7568M
Subject: [PATCH] picocom: Fix incorrect handling of ldflags
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
X-List-Received-Date: Tue, 11 Apr 2017 12:44:54 -0000

The previous version reports QA issue: no GNU_HASH in elf binary
during build

Signed-off-by: Federico Giovanardi <fgiovanardi@aragnet.com>
---
 meta-oe/recipes-support/picocom/picocom_1.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb b/meta-oe/recipes-support/picocom/picocom_1.7.bb
index dbee65609..c85c344e3 100644
--- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
+++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
@@ -10,6 +10,7 @@ SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
 SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
 
 CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\" -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install () {
     install -d ${D}${bindir}
-- 
2.11.0


