Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 679547710D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:51:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9955173"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 10:51:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9868642BC506
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:51:17 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 10:51:16 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 22:51:14 -0400
Message-ID: <1471315874-1564-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 9868642BC506.A5A15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] dovecot: 2.2.21 -> 2.2.25
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
X-List-Received-Date: Tue, 16 Aug 2016 02:51:23 -0000
Content-Type: text/plain

Upgrade dovecot from 2.2.21 to 2.2.25.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-support/dovecot/{dovecot_2.2.21.bb => dovecot_2.2.25.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.21.bb => dovecot_2.2.25.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
index c1980ef..66af361 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket"
 
-SRC_URI[md5sum] = "28c39ab78a20f00701c26960d9190cf0"
-SRC_URI[sha256sum] = "7ab7139e59e1f0353bf9c24251f13c893cf1a6ef4bcc47e2d44de437108d0b20"
+SRC_URI[md5sum] = "8f62ea76489c47c369cbbe0b19818448"
+SRC_URI[sha256sum] = "d8d9f32c846397f7c22749a84c5cf6f59c55ff7ded3dc9f07749a255182f9667"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
-- 
2.7.4




