Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE5AF7874E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w637Lghr017994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:42 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:41 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:23 +0800
Message-ID: <1530602486-4522-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 5/8] samba: upgrade 4.7.6 -> 4.7.8
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:41 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/{samba_4.7.6.bb => samba_4.7.8.bb}   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.7.6.bb => samba_4.7.8.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
index ba2b7f2..593ff57 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
@@ -30,8 +30,10 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
 
-SRC_URI[md5sum] = "0253021a45c479cec1e135b004a0177a"
-SRC_URI[sha256sum] = "1eede30fc8ef6504e24602fb72b00baa0a7b73b59f16d25cb0771dc8c7c57d6e"
+SRC_URI[md5sum] = "16b70fda54cf84521ed976a0856430cc"
+SRC_URI[sha256sum] = "ca6fca9d7e248bcaa55c54bdcc115eeed10660074da5c54a2b78dd3cccc604de"
+
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.7(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
-- 
2.7.4


