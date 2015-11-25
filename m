Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44ABC6011F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:30:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAP8U6DR025030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:30:06 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 00:28:01 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Nov 2015 16:27:59 +0800
Message-ID: <1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
References: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] iscsitarget: skip the arch test for kernel modules
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
X-List-Received-Date: Wed, 25 Nov 2015 08:30:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Kernel modules may not have the same architecture as user space.
So we tell INSANE_SKIP to skip checking the arch for the modules.
This is consistent with other kernel modules and the kernel recipe.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 9d49759..9db16bc 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -54,3 +54,6 @@ FILES_${PN} += "${sbindir} \
 
 RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
 RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
+
+# Skip the arch test for kernel modules
+INSANE_SKIP_kernel-module-iscsi-trgt = "arch"
-- 
2.3.5


