Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4AA61657
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:45:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83686034"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:35:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0169850A9978
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:25:59 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:35:39 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:35:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 16:37:33 +0800
Message-ID: <20200221083737.17042-2-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
References: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0169850A9978.AD745
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] log4cpp: upgrade 1.1.2 -> 1.1.3
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
X-List-Received-Date: Fri, 21 Feb 2020 08:45:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to version update, SRC_URI has been modified.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../log4cpp/{log4cpp_1.1.2.bb => log4cpp_1.1.3.bb}         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/log4cpp/{log4cpp_1.1.2.bb => log4cpp_1.1.3.bb} (68%)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
similarity index 68%
rename from meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
rename to meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
index 19b94466b..c6f9404d6 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cpp/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PRC = "rc5"
-SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}${PRC}.tar.gz \
+SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
-SRC_URI[md5sum] = "58b4591a2f3e7ef3d5e3e7cfb3a81a62"
-SRC_URI[sha256sum] = "a611d99a20af6676c60219762771c0bfac90f4879bbde70038ece75338b588ec"
+SRC_URI[md5sum] = "b9e2cee932da987212f2c74b767b4d8b"
+SRC_URI[sha256sum] = "2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
2.20.1




