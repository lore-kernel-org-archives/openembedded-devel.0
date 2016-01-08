Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E12D731C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:28:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2369098"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jan 2016 16:28:32 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 936CA41890FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 16:28:17 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 8 Jan 2016 16:28:17 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Jan 2016 00:27:55 -0800
Message-ID: <1452241675-34591-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 936CA41890FE.ADDA8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] dovecot: 2.2.18 -> 2.2.21
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
X-List-Received-Date: Fri, 08 Jan 2016 08:28:38 -0000
Content-Type: text/plain

Upgrade dovecot from 2.2.18 to 2.2.21.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-support/dovecot/{dovecot_2.2.18.bb => dovecot_2.2.21.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.18.bb => dovecot_2.2.21.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
index a01ef83..7fb8b44 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket"
 
-SRC_URI[md5sum] = "1e42eb3b69544c447ad882d7858f3630"
-SRC_URI[sha256sum] = "b6d8468cea47f1227f47b80618f7fb872e2b2e9d3302adc107a005dd083865bb"
+SRC_URI[md5sum] = "28c39ab78a20f00701c26960d9190cf0"
+SRC_URI[sha256sum] = "7ab7139e59e1f0353bf9c24251f13c893cf1a6ef4bcc47e2d44de437108d0b20"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
-- 
1.9.1




