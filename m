Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89CF160766
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 11:21:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33091123"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Dec 2017 19:21:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2724848AE9FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 19:21:44 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 27 Dec 2017 19:21:43 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Dec 2017 19:21:48 +0800
Message-ID: <1514373708-2973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2724848AE9FB.A58D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-selinux] [PATCH] audit: 2.7.6 -> 2.8.2
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
X-List-Received-Date: Wed, 27 Dec 2017 11:21:47 -0000
Content-Type: text/plain

Upgrade audit from 2.7.6 to 2.8.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-security/audit/{audit_2.7.6.bb => audit_2.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-security/audit/{audit_2.7.6.bb => audit_2.8.2.bb} (96%)

diff --git a/recipes-security/audit/audit_2.7.6.bb b/recipes-security/audit/audit_2.8.2.bb
similarity index 96%
rename from recipes-security/audit/audit_2.7.6.bb
rename to recipes-security/audit/audit_2.8.2.bb
index 5bfda7b..befce77 100644
--- a/recipes-security/audit/audit_2.7.6.bb
+++ b/recipes-security/audit/audit_2.8.2.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/${BPN}/${BPN}-${PV}.tar.gz \
            file://auditd.service \
            file://audit-volatile.conf \
 "
-SRC_URI[md5sum] = "55a81bbed973b58a90590c949e71dc3e"
-SRC_URI[sha256sum] = "fa65289cffdc95a25bfbdba541f43ee1b12c707090a38fd027dcf9354b9014e7"
+SRC_URI[md5sum] = "1152011dfd77f08d28c1c0364a6f80da"
+SRC_URI[sha256sum] = "67b59b2b77afee9ed87afa4d80ffc8e6f3a1f4bbedd5f2871f387c952147bcba"
 
 inherit autotools pythonnative update-rc.d systemd
 
-- 
2.7.4




