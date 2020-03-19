Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6043F6010E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 05:38:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,570,1574092800"; d="scan'208";a="86582574"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 13:38:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5A2A850A9986
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 13:28:03 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 13:38:09 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 13:38:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Mar 2020 13:40:32 +0800
Message-ID: <20200319054032.14353-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5A2A850A9986.A93B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [zeus] [PATCH] wireshark: upgrade 3.0.6 -> 3.0.9
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
X-List-Received-Date: Thu, 19 Mar 2020 05:38:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

To fix CVE issues, update to 3.0.9.

3.0.9
wnpa-sec-2020-03 LTE RRC dissector memory leak. Bug 16341.
wnpa-sec-2020-04 WiMax DLMAP dissector crash. Bug 16368.
wnpa-sec-2020-05 EAP dissector crash. Bug 16397.

3.0.8
wnpa-sec-2020-02 BT ATT dissector crash. Bug 16258. CVE-2020-7045.
3.0.7
wnpa-sec-2019-22 CMS dissector crash. Bug 15961. CVE-2019-19553.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.0.6.bb => wireshark_3.0.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.9.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.9.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.9.bb
index ccaa0c94a..76309f140 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.9.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
-SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
+SRC_URI[md5sum] = "4250b5bfb7f0ce04321114df9682503c"
+SRC_URI[sha256sum] = "bb4697ead91824b1fa33ffbe6643f6193459a66c906910a7611d5b26ff32aa04"
 
 PE = "1"
 
-- 
2.20.1




