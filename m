Return-Path: <frederico.cadete@awtce.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id C2A5565C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 06:59:48 +0000 (UTC)
X-ASG-Debug-ID: 1466492388-0a6d4a62ba779ff0001-aWHRdb
Received: from localhost.localdomain ([172.23.1.67]) by barracuda.aweurope.be
	with ESMTP id fqTrxuNuXUCWOyY4;
	Tue, 21 Jun 2016 08:59:49 +0200 (CEST)
X-Barracuda-Envelope-From: frederico.cadete@awtce.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
From: Frederico Cadete <frederico.cadete@awtce.be>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jun 2016 08:59:36 +0200
X-ASG-Orig-Subj: [meta-efl][PATCH] efl e-module.inc: fix fetching in multi-lib
	configs
Message-Id: <1466492376-3594-1-git-send-email-frederico.cadete@awtce.be>
X-Mailer: git-send-email 1.9.1
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1466492389
X-Barracuda-URL: https://172.23.0.236:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 793
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Subject: [meta-efl][PATCH] efl e-module.inc: fix fetching in multi-lib configs
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
X-List-Received-Date: Tue, 21 Jun 2016 06:59:50 -0000

Using ${PN} in URL's will get messed up in multi-lib configs, where
that can be expanded to things like lib32-${BPN}.
We should use ${BPN} instead.

Signed-off-by: Frederico Cadete <frederico.cadete@awtce.be>
---
 meta-efl/recipes-efl/e17/e-module.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
index 0923575..770f794 100644
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ b/meta-efl/recipes-efl/e17/e-module.inc
@@ -5,7 +5,7 @@ DEPENDS = "e-wm"
 SRCREV = "${EFL_SRCREV}"
 INC_PR = "r0"
 
-SRCNAME = "E-MODULES-EXTRA/${PN}"
+SRCNAME = "E-MODULES-EXTRA/${BPN}"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-- 
1.9.1


