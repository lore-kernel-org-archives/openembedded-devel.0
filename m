Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF7C6E650
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 04:56:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18264916"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Apr 2017 12:56:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AC81D47E98DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 12:56:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 28 Apr 2017 12:56:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Apr 2017 12:55:46 +0800
Message-ID: <1493355346-33822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: AC81D47E98DA.AA16E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] meta_oe_security_flags.inc: Disable PIE for libdevmapper
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
X-List-Received-Date: Fri, 28 Apr 2017 04:56:15 -0000
Content-Type: text/plain

Modify meta_oe_security_flags.inc to fix error:
/
| collect2: error: ld returned 1 exit status
| ../make.tmpl:426: recipe for target 'ioctl/libdevmapper.so.1.02' failed
| make[1]: *** [ioctl/libdevmapper.so.1.02] Error 1
\

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 815fb16..2a1a1dd 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -25,3 +25,4 @@ SECURITY_CFLAGS_pn-libvdpau = "${SECURITY_NO_PIE_CFLAGS}"
 #| make[1]: *** [Makefile:675: libluajit.so] Error 1
 SECURITY_CFLAGS_pn-luajit = "${SECURITY_NO_PIE_CFLAGS}"
 
+SECURITY_CFLAGS_pn-libdevmapper = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.7.4




