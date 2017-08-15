Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 08955784CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:21:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,377,1498492800"; d="scan'208";a="23592343"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2017 17:21:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7077C472438F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 17:21:09 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 15 Aug 2017 17:21:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Aug 2017 17:20:55 +0800
Message-ID: <1502788855-1042-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 7077C472438F.A664B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] mailcap: upgrade to 2.1.48
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
X-List-Received-Date: Tue, 15 Aug 2017 09:21:09 -0000
Content-Type: text/plain

Upgrade mailcap from 2.1.46 to 2.1.48.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/mailcap/{mailcap_2.1.46.bb => mailcap_2.1.48.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.46.bb => mailcap_2.1.48.bb} (87%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
similarity index 87%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
index 58b8f02..9553681 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "d865a1baf574ae5d309f5c1f79315800"
-SRC_URI[sha256sum] = "c68eb3b531d731476d5980c9b7cc287bd64c2a13bec5a537009a2c4af63f9bb0"
+SRC_URI[md5sum] = "2c26e18e912a5cf00318fcf7f8f2d747"
+SRC_URI[sha256sum] = "d7b023b237d6053bf05ff6786e0663c55c614efcc99cdf856120be13b5c29157"
 
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
-- 
2.7.4




