Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E93DC6010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 03:29:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6875456"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 May 2016 11:29:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BAB0642B671F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 11:29:40 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 25 May 2016 11:29:40 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1456644183-12870-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: BAB0642B671F.ADCD8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] postfix: Fix rootfs creation errors
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
Date: Wed, 25 May 2016 03:29:49 -0000
X-Original-Date: Sun, 28 Feb 2016 10:23:03 +0300
X-List-Received-Date: Wed, 25 May 2016 03:29:49 -0000
Content-Type: text/plain

1) error: file /usr/share/man/man1/mailq.1 from install of postfix-doc
        conflicts with file from package esmtp-doc
2) error: file /usr/share/man/man1/newaliases.1 from install of postfix-doc
        conflicts with file from package esmtp-doc
3) error: file /usr/share/man/man1/sendmail.1 from install of postfix-doc
        conflicts with file from package esmtp-doc

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 228a815..c00c77f 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -224,6 +224,11 @@ ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_PRIORITY = "120"
 
+ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
+ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
+ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
+ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
+
 pkg_postinst_${PN} () {
     if [ "x$D" = "x" ]; then
         touch /etc/aliases
-- 
1.8.4.2




