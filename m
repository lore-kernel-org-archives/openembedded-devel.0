Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0B7E6AB99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:00:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.14.9) with ESMTPS id t4L810Eh010497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 01:01:00 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 21 May 2015 01:00:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 May 2015 16:00:49 +0800
Message-ID: <2efe6735e4862803c64b4ea9ca4f9a1da0afa5b2.1432194921.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432194921.git.yi.zhao@windriver.com>
References: <cover.1432194921.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/4] lprng: fix QA issue for multilib
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
X-List-Received-Date: Thu, 21 May 2015 08:00:59 -0000
Content-Type: text/plain

bitbake lprng
[snip]
ERROR: QA Issue: non debug package contains .debug directory: lprng path
/work/core2-64-poky-linux/lprng/3.8.C-r0/packages-split/lprng/usr/lib64/lprng/filters/.debug/lpf [debug-files]
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index 3357828..80b93d9 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost"
-FILES_${PN}-dbg += "/usr/lib/lprng/filters/.debug"
+FILES_${PN}-dbg += "${libdir}/lprng/filters/.debug"
 
 do_install_append() {
     mv ${D}/etc/printcap.sample ${D}/etc/printcap
-- 
1.7.9.5


