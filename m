Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 423BD700F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 21:50:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7ULoFAl005810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:50:15 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 14:50:14 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Aug 2016 16:48:16 -0500
Message-ID: <1472593696-29393-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-keyring: Turn off QA check dev-elf
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
X-List-Received-Date: Tue, 30 Aug 2016 21:50:18 -0000
Content-Type: text/plain

The ${PN}-dev part of the recipe intentionally adds several .so files
which are used for development.

The latest OE will fail as follows building the package as a result.

ERROR: gnome-keyring-2.32.1-r12 do_package_qa: QA Issue: -dev package contains non-symlink .so: gnome-keyring-dev path '/work/core2-64-oe-linux/gnome-keyring/2.32.1-r12/packages-split/gnome-keyring-dev/usr/lib64/gnome-keyring/devel/gkm-ssh-store-standalone.so'
-dev package contains non-symlink .so: gnome-keyring-dev path '/work/core2-64-oe-linux/gnome-keyring/2.32.1-r12/packages-split/gnome-keyring-dev/usr/lib64/gnome-keyring/devel/gkm-user-store-standalone.so' [dev-elf]
ERROR: gnome-keyring-2.32.1-r12 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: gnome-keyring-2.32.1-r12 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /git/core/build-intel-x86/tmp/work/core2-64-oe-linux/gnome-keyring/2.32.1-r12/temp/log.do_package_qa.14188
ERROR: Task (/git/core/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:do_package_qa) failed with exit code '1'

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index f8f5ddd..100d32e 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -36,6 +36,8 @@ FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
                     ${base_libdir}/security/*.la \
                    "
 
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
 FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
                     ${libdir}/${BPN}/devel/.debug/ \
                     ${base_libdir}/security/.debug/"
-- 
1.9.1


