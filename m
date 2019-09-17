Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCD77F81C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 01:27:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8H1RqRe028648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 18:27:52 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 16 Sep 2019 18:27:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Sep 2019 09:27:49 +0800
Message-ID: <1568683669-25198-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] samba: upgrade 4.10.7 -> 4.10.8
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
X-List-Received-Date: Tue, 17 Sep 2019 01:27:51 -0000
Content-Type: text/plain

Security fixes:

CVE-2019-10197: Combination of parameters and permissions can allow user
                to escape from the share path definition.

See: https://www.samba.org/samba/history/samba-4.10.8.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/{samba_4.10.7.bb => samba_4.10.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.7.bb => samba_4.10.8.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
index 1b2bc08..d824eac 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "05472d0dd943b3ccbc3be5032a9eb563"
-SRC_URI[sha256sum] = "34f30494b6b63700f54be22be636e8a6e0430577166a76a017075e11c02a1ebb"
+SRC_URI[md5sum] = "f3c722bbcd903479008fa1b529f56365"
+SRC_URI[sha256sum] = "c41f05fb567f7359998b451543501c7690a2bf6551d658a76bd6916316a410f4"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.7.4


