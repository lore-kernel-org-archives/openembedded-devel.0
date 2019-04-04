Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3AC6C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:18:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="58467122"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2019 17:18:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C3FA54C8B03D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 17:18:36 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 4 Apr 2019 17:18:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Apr 2019 17:19:14 +0800
Message-ID: <20190404091914.25463-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: C3FA54C8B03D.A97FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] lockfile-progs: upgrade 0.1.17 -> 0.1.18
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
X-List-Received-Date: Thu, 04 Apr 2019 09:18:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from lockfile-progs_0.1.17.bb to lockfile-progs_0.1.18.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{lockfile-progs_0.1.17.bb => lockfile-progs_0.1.18.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/lockfile-progs/{lockfile-progs_0.1.17.bb => lockfile-progs_0.1.18.bb} (85%)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
similarity index 85%
rename from meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb
rename to meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
index 4354fff9a..c76e0f69e 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liblockfile"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/l/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "64424a766fbc8cf6d613fcc14a096e14"
-SRC_URI[sha256sum] = "03fb05d25499532f497775b1747b61fa6beebf12d3bcc951e125349ae166c511"
+SRC_URI[md5sum] = "4eb83bdf88016db836b7cc09591fb0f3"
+SRC_URI[sha256sum] = "a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6"
 
 do_compile() {
     oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables'
-- 
2.20.1




