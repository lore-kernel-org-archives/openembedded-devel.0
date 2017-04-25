Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 05FD677A67
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 05:06:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18120501"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2017 13:06:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F2414670219
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 13:06:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 25 Apr 2017 13:06:13 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Apr 2017 13:05:59 +0800
Message-ID: <1493096759-12915-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 3F2414670219.A4A57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] dovecot: 2.2.25 -> 2.2.29
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
X-List-Received-Date: Tue, 25 Apr 2017 05:06:24 -0000
Content-Type: text/plain

Upgrade dovecot from 2.2.25 to 2.2.29.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/dovecot/{dovecot_2.2.25.bb => dovecot_2.2.29.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.25.bb => dovecot_2.2.29.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
index 243dda7..b2a3de3 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket"
 
-SRC_URI[md5sum] = "8f62ea76489c47c369cbbe0b19818448"
-SRC_URI[sha256sum] = "d8d9f32c846397f7c22749a84c5cf6f59c55ff7ded3dc9f07749a255182f9667"
+SRC_URI[md5sum] = "ff95486a5c43025a2c3f5a712e7962b9"
+SRC_URI[sha256sum] = "d939ea99126eb8a8c6955390b422b6e27ec0fa43a3b59b2b3218cb5ad67139a6"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
-- 
2.7.4




