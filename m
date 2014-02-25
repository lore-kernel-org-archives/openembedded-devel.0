Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50F266E85D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:09:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1P19BAi024749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:09:11 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 24 Feb 2014 17:09:11 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Feb 2014 09:10:14 +0800
Message-ID: <1393290614-21483-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] bridge-utils: PN -> BPN to fix multilib ALTERNATIVE error
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
X-List-Received-Date: Tue, 25 Feb 2014 01:09:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

update-alternatives.bbclass does not create the brctl symbolic links for
multilib, since the wrong use of PN generates
/usr/sbin/brctl.lib32-bridge-utils, not /usr/sbin/brctl.bridge-utils

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 recipes-support/bridge-utils/bridge-utils.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/bridge-utils/bridge-utils.inc b/recipes-support/bridge-utils/bridge-utils.inc
index bcdc04a..b4ca3f1 100644
--- a/recipes-support/bridge-utils/bridge-utils.inc
+++ b/recipes-support/bridge-utils/bridge-utils.inc
@@ -20,7 +20,7 @@ ALTERNATIVE_LINK_NAME[brctl] = "${sbindir}/brctl"
 EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
 
 do_install_append () {
-    mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
+    mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${BPN}
     install -d ${D}/${datadir}/bridge-utils
     install -d ${D}/${sysconfdir}/network/if-pre-up.d
     install -d ${D}/${sysconfdir}/network/if-post-down.d
-- 
1.7.10.4


