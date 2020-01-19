Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF3F7F366
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 08:36:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,337,1574092800"; d="scan'208";a="82261392"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 16:36:23 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8419B406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:27:09 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 16:36:21 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 16:36:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 16:37:49 +0800
Message-ID: <20200119083749.7627-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8419B406AB15.A7523
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] sassc: upgrade 3.5.0 -> 3.6.1
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
X-List-Received-Date: Sun, 19 Jan 2020 08:36:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
index 044c0c7fc..3c7a55cc3 100644
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -7,8 +7,8 @@ DEPENDS = "libsass"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/sass/sassc.git"
-SRCREV = "aa6d5c635ea8faf44d542a23aaf85d27e5777d48"
+SRCREV = "46748216ba0b60545e814c07846ca10c9fefc5b6"
 S = "${WORKDIR}/git"
-PV = "3.5.0"
+PV = "3.6.1"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1




