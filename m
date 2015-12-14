Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A0A617002B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:02:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1549144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Dec 2015 17:01:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E848409255D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:01:53 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 14 Dec 2015 17:05:04 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2015 12:01:51 +0300
Message-ID: <1450083711-1654-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-Information: Please contact the ISP for more information
X-yoursite-MailScanner-ID: 9E848409255D.ACDF0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl][PATCH] libnet-dns-perl: remove it from PNBLACKLIST
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
X-List-Received-Date: Mon, 14 Dec 2015 09:02:06 -0000
Content-Type: text/plain

Since errors will not occur anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
index 312a812..9dc4268 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
@@ -23,6 +23,3 @@ do_compile() {
 	cpan_do_compile
 }
 BBCLASSEXTEND = "native"
-
-# Bareword "Errno::EINVAL" not allowed while "strict subs" in use at /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/perl/5.22.0/IO/Socket.pm line 135.
-PNBLACKLIST[libnet-dns-perl] ?= "BROKEN: Fails to build since some changes in perl recipe"
-- 
1.8.4.2




