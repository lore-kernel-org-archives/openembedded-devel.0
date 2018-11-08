Return-Path: <primoz.fiser@norik.com>
X-Greylist: delayed 452 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Nov 2018 07:48:31 UTC
Received: from out-2.mail.amis.net (out-2.mail.amis.net [212.18.32.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6BC79DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 07:48:31 +0000 (UTC)
Received: from in-2.mail.amis.net (in-2.mail.amis.net [212.18.32.19])
	by out-2.mail.amis.net (Postfix) with ESMTP id 2AF6280BC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 08:40:59 +0100 (CET)
Received: from in-2.mail.amis.net (localhost [127.0.0.1])
	by in-2.mail.amis.net (Postfix) with ESMTP id 2878FC9408;
	Thu,  8 Nov 2018 08:40:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at amis.net
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 required=5 tests=[ALL_TRUSTED=-1]
	autolearn=disabled
X-Amavis-OS-Fingerprint: MYNETWORKS, [2001:15c0:ffff:f::44]:60664
Received: from in-2.mail.amis.net ([127.0.0.1])
	by in-2.mail.amis.net (in-2.mail.amis.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3qCmXdWGpXt9; Thu,  8 Nov 2018 08:40:58 +0100 (CET)
Received: from smtp2.amis.net (smtp2.amis.net [IPv6:2001:15c0:ffff:f::44])
	by in-2.mail.amis.net (Postfix) with ESMTP id D9CA7C9407;
	Thu,  8 Nov 2018 08:40:58 +0100 (CET)
Received: from probook.lan (cpe-90-157-180-95.static.amis.net [90.157.180.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp2.amis.net (Postfix) with ESMTPSA id BB47080BAD;
	Thu,  8 Nov 2018 08:40:58 +0100 (CET)
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Nov 2018 08:40:37 +0100
Message-Id: <1541662837-29069-1-git-send-email-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] sedutil: Add recipe
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
X-List-Received-Date: Thu, 08 Nov 2018 07:48:32 -0000

sedutil is utility to manage self encrypting drives that conform
to the Trusted Computing Group OPAL 2.0 SSC specification.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 meta-oe/recipes-extended/sedutil/sedutil_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sedutil/sedutil_git.bb

diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
new file mode 100644
index 0000000..cec569f
--- /dev/null
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A utility to manage self encrypting drives that conform \
+to the Trusted Computing Group OPAL 2.0 SSC specification."
+SUMMARY = "The Drive Trust Alliance Self Encrypting Drive Utility"
+HOMEPAGE = "https://github.com/Drive-Trust-Alliance/sedutil"
+SECTION = "console/utils"
+LICENSE = "GPLv3"
+
+LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
+
+BASEPV = "1.15.1"
+PV = "${BASEPV}+git${SRCPV}"
+SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
+SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
-- 
2.7.4


