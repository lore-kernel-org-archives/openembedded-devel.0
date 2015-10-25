Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C566D758D2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2015 09:42:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9P9gVI1015222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2015 02:42:31 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 25 Oct 2015 02:42:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Oct 2015 17:42:51 +0800
Message-ID: <1445766171-27531-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] waf-samba.bbclass: add missing qemu options
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
X-List-Received-Date: Sun, 25 Oct 2015 09:42:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- QEMU_OPTIONS is needed for running binary through qemu,
  add it for CROSS_EXEC.
- "-r ${OLDEST_KERNEL}" is already included in QEMU_OPTIONS,
  remove it from CROSS_EXEC

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/classes/waf-samba.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/classes/waf-samba.bbclass b/meta-oe/classes/waf-samba.bbclass
index 241aa69..b5b85e6 100644
--- a/meta-oe/classes/waf-samba.bbclass
+++ b/meta-oe/classes/waf-samba.bbclass
@@ -28,10 +28,9 @@ do_configure() {
 
     libdir_qemu="${STAGING_DIR_HOST}/${libdir}"
     base_libdir_qemu="${STAGING_DIR_HOST}/${base_libdir}"
-    oldest_kernel_qemu=${OLDEST_KERNEL}
 
     CROSS_EXEC="${qemu_binary} \
-                -r ${oldest_kernel_qemu} \
+                ${QEMU_OPTIONS} \
                 -L ${STAGING_DIR_HOST} \
                 -E LD_LIBRARY_PATH=${libdir_qemu}:${base_libdir_qemu}"
 
-- 
1.9.1


