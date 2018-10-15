Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E60287947D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 21:11:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9FLBXbx010547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 14:11:33 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 15 Oct 2018 14:11:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Oct 2018 17:11:21 -0400
Message-ID: <1539637881-20308-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] polkit: fixup 'installed but not shipped' error
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
X-List-Received-Date: Mon, 15 Oct 2018 21:11:33 -0000
Content-Type: text/plain

When building with 'installed-vs-shipped' QA check enabled you will
see the following when building polkit:

    ERROR: polkit-0.115-r0 do_package: QA Issue: polkit:
     Files/directories were installed but not shipped in any package:
      /usr/lib64/gir-1.0
      /usr/lib64/gir-1.0/Polkit-1.0.gir
      /usr/lib64/gir-1.0/PolkitAgent-1.0.gir
    Please set FILES such that these items are packaged. Alternatively
      if they are unneeded, avoid installing them or delete them within
      do_install.
    polkit: 3 installed and not shipped files. [installed-vs-shipped]
    ERROR: polkit-0.115-r0 do_package: Fatal QA errors found, failing task.

This is a result of the gobject instrospection GIR files not being
included in any package. Create a do_install_append() to move these
files to '/usr/share' where they will be picked up by the -dev
package. This is also the commonly used location for these files.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.115.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index ad0f66a..ffaacaa 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -53,3 +53,12 @@ USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysco
 
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append () {
+    # should always be true since we inherit gobject-introspection, but let's just be sure
+    if [ -d ${D}${libdir}/gir-1.0 ]; then
+        install -d ${D}/usr
+        install -d ${D}/usr/share
+        mv ${D}${libdir}/gir-1.0 ${D}/usr/share/.
+    fi
+}
-- 
2.7.4


