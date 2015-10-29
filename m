Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB20C73CC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:27:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T9RUdX013686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:27:30 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 02:27:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Oct 2015 17:27:51 +0800
Message-ID: <1446110871-29764-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libssh2: specify the search dir to avoid host contamination
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
X-List-Received-Date: Thu, 29 Oct 2015 09:27:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Set the search dir for libssl and libz to only STAGING_LIBDIR
to avoid searching host libs.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
index 022482c..4f03b99 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
@@ -14,5 +14,7 @@ SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--with-openssl \
-                --with-libz \
+                 --with-libz \
+                 --with-libssl-prefix=${STAGING_LIBDIR} \
+                 --with-libz-prefix=${STAGING_LIBDIR} \
                 "
-- 
1.9.1


