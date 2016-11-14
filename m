Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F96A6E65F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 05:03:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAE53grw019517
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Nov 2016 21:03:43 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 13 Nov 2016 21:03:42 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Nov 2016 12:56:27 +0800
Message-ID: <20161114045627.22289-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ifenslave: make option '-h' work
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
X-List-Received-Date: Mon, 14 Nov 2016 05:03:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When pass option '-h' or '--help' to ifenslave, it calls 'exec man 8
ifenslave' to show help information. But the manual page is missing and
then outputs nothing.

Install the manual page and split it to ifenslave rather than
ifenslave-doc to make option '-h' of ifenslave work.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
index 7473b0d..5028921 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
@@ -17,4 +17,10 @@ do_install() {
     install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfdir}/network/if-post-down.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-up ${D}${sysconfdir}/network/if-up.d/ifenslave
+    install -m 0644 -D ${S}/debian/ifenslave.8 ${D}${mandir}/man8/ifenslave.8
 }
+
+FILES_${PN}-doc_remove = "${mandir}"
+FILES_${PN} += "${mandir}/man8/ifenslave.8"
+
+RDEPENDS_${PN} = "man"
-- 
2.10.1


