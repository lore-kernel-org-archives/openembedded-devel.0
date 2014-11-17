Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF0D47215A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 11:01:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43496657"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 18:58:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAHB1DLJ018936
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 19:01:13 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 19:01:31 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 19:00:05 +0800
Message-ID: <1416222008-9218-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH 2/5] nicstat : add recipe
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
X-List-Received-Date: Mon, 17 Nov 2014 11:01:31 -0000
Content-Type: text/plain

nicstat is a tool that prints out network statistics for all network
interface cards (NICs), including packets, kilobytes per second,
average packet sizes and more.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index 31a015a..c75563d 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -17,15 +17,9 @@ do_compile() {
 }
 
 do_install() {
-        install -d ${D}/${bindir}/
-        install -d ${D}/${mandir}/
+     	install -d ${D}/${bindir}/
+	install -d ${D}/${mandir}/
      	install -m 0755 ${S}/nicstat ${D}${bindir}/
 	install -m 0644 ${S}/nicstat.1 ${D}/${mandir}/
 }
 
-
-
-
-
-
-
-- 
1.8.4.2


