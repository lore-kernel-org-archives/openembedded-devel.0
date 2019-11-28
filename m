Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CE66B7F9B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:14:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79195428"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 10:14:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 01BA04CE1BED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:06:19 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 10:14:43 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Nov 2019 10:15:28 +0800
Message-ID: <20191128021528.16067-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 01BA04CE1BED.A2418
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] mksh: upgrade 56 -> 57
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
X-List-Received-Date: Thu, 28 Nov 2019 02:14:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-shells/mksh/{mksh_56.bb => mksh_57.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-shells/mksh/{mksh_56.bb => mksh_57.bb} (74%)

diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-shells/mksh/mksh_57.bb
similarity index 74%
rename from meta-oe/recipes-shells/mksh/mksh_56.bb
rename to meta-oe/recipes-shells/mksh/mksh_57.bb
index e4eb54286..7e9c18ed2 100644
--- a/meta-oe/recipes-shells/mksh/mksh_56.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_57.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
 SECTION = "base/shell"
 
 LICENSE = "${@bb.utils.contains("TCLIBC", "glibc", "MirOS & ISC", "MirOS", d)}"
-LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=25;md5=7204fec4d12912f2a13fe8745bc356f9 \
+LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=0651e575e39d1a3e884562e25d491fc7 \
                     file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
                    "
 
-SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
+SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R57.tgz"
 
-SRC_URI[md5sum] = "4799a9ac6d55871d79ba66713d928663"
-SRC_URI[sha256sum] = "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77"
+SRC_URI[md5sum] = "4d2686535252ea6a57bdec531498239a"
+SRC_URI[sha256sum] = "3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75"
 
 inherit update-alternatives
 
-- 
2.20.1




