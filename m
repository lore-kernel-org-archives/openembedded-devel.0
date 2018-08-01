Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4019F78D43
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 05:38:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w715chmV021341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:38:43 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 31 Jul 2018 22:38:42 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Aug 2018 13:23:34 +0800
Message-ID: <1533101014-62232-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] usleep: use update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2018 05:38:42 -0000
Content-Type: text/plain

To solve below error:
update-alternatives: Error: not linking [...]/rootfs/bin/usleep to /bin/busybox.nosuid since [...]/rootfs/bin/usleep exists and is not a link
add using update-alternatives in usleep.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-oe/recipes-core/usleep/usleep_1.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-core/usleep/usleep_1.0.bb b/meta-oe/recipes-core/usleep/usleep_1.0.bb
index 9e9c7ed..370dd4a 100644
--- a/meta-oe/recipes-core/usleep/usleep_1.0.bb
+++ b/meta-oe/recipes-core/usleep/usleep_1.0.bb
@@ -22,3 +22,12 @@ do_install() {
     install -m 0755 ${WORKDIR}/usleep   ${D}${base_bindir}
     install -m 0644 ${WORKDIR}/usleep.1 ${D}${mandir}/man1
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "usleep"
+ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_LINK_NAME[usleep] = "${base_bindir}/usleep"
+
+ALTERNATIVE_${PN}-doc = "usleep.1"
+ALTERNATIVE_LINK_NAME[usleep.1] = "${mandir}/man1/usleep.1"
-- 
1.9.1


