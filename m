Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC8A71984
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 02:14:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35302329"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2018 10:14:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CBE9A486A78F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 10:14:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 15 Jan 2018 10:14:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:15:08 +0800
Message-ID: <1515982509-32353-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: CBE9A486A78F.AA48C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] dovecot: 2.2.29 -> 2.2.33
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
X-List-Received-Date: Mon, 15 Jan 2018 02:14:38 -0000
Content-Type: text/plain

Upgrade dovecot from 2.2.29 to 2.2.33.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/dovecot/{dovecot_2.2.29.bb => dovecot_2.2.33.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.29.bb => dovecot_2.2.33.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
index 1663408..5ebda19 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-doveadm-Fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "ff95486a5c43025a2c3f5a712e7962b9"
-SRC_URI[sha256sum] = "d939ea99126eb8a8c6955390b422b6e27ec0fa43a3b59b2b3218cb5ad67139a6"
+SRC_URI[md5sum] = "d61d1e923a22f9062cc9f47696882666"
+SRC_URI[sha256sum] = "e9483d68a7698d701bc06124fcf6e1b1f16380c2986c7ec0cf4e1475b9d0c218"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
-- 
2.7.4




