Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9EF771C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:18:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10906065"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Sep 2016 09:18:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DDB3B404240C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 09:17:59 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 13 Sep 2016 09:17:56 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Sep 2016 21:17:54 -0400
Message-ID: <1473729474-2662-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: DDB3B404240C.A755B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] lksctp-tools: 1.0.16 -> 1.0.17
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
X-List-Received-Date: Tue, 13 Sep 2016 01:18:07 -0000
Content-Type: text/plain

Upgrade lksctp-tools from 1.0.16 to 1.0.17.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../lksctp-tools/{lksctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb} (94%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
similarity index 94%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
index e6a84cc..11c43ff 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
     file://v6test.sh \
 "
 
-SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
-SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
+SRC_URI[md5sum] = "68e9b8fa4d4e331029b247b72d46d7a5"
+SRC_URI[sha256sum] = "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c0a8ca9b10533aa15"
 
 #| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/connectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .libs/recvmsg.o    -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-script=/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o .libs/libsctp.so.1.0.16
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
-- 
2.7.4




