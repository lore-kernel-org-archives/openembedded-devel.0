Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 045907D438
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 05:56:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="58450463"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2019 13:56:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 56BCC4CD7FEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:56:11 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 4 Apr 2019 13:56:11 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Apr 2019 13:56:49 +0800
Message-ID: <20190404055649.9747-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 56BCC4CD7FEE.AC5DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libedit: upgrade 20181209-3.1 -> 20190324-3.1
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
X-List-Received-Date: Thu, 04 Apr 2019 05:56:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libedit_20181209-3.1.bb to libedit_20190324-3.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libedit_20181209-3.1.bb => libedit_20190324-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20181209-3.1.bb => libedit_20190324-3.1.bb} (81%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb
similarity index 81%
rename from meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb
index c0a3d2136..9d333e7aa 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb
@@ -15,8 +15,8 @@ FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "22e945a0476e388e6f78bfc8d6e1192c"
-SRC_URI[sha256sum] = "2811d70c0b000f2ca91b7cb1a37203134441743c4fcc9c37b0b687f328611064"
+SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
+SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.20.1




