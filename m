Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2882.1612492218645526047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222175"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:30:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 54A4C4CE6D74
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 10:30:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:30:11 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] open-isns: upgrade 0.99 -> 0.101
Date: Fri, 5 Feb 2021 10:30:03 +0800
Message-ID: <1612492203-18318-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 54A4C4CE6D74.A7A5E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

* Changes v0.100 to v0.101:

Dmitry Bogdanov (1):
      Fix parsing of GetNextRsp

Lee Duncan (10):
      Ignore common build files
      Fix compiler issue when not in security mode
      Do not ignore write() return value.
      Fix 586 compile issue and remove -Werror
      Added a TODO: 'make depend' not worrking
      Update version string to "0.100".
      Fix broken server authentication initialization.
      Add man page for isnssetup.
      Added TODO to test "isnsd --init"
      Preparing for version 0.101

Leo (1):
      socket.c: include poll.h instead of sys/poll.h for POSIX compatibility

Rosen Penev (2):
      fix compilation without deprecated OpenSSL APIs
      libisns: remove sighold and sigrelse

* Changes v0.99 to v0.100:

Chris Leech (1):
      Travis-CI and Coverity Scan setup

Lee Duncan (7):
      Fix compiler complaint about possible alignment issue
      add tags to ignored list of files
      Change isns_portal_string() to return allocated string.
      Remove old compiler option, and add "-Werror".
      openssl: handle newer version with ifdefs
      General cleanup for the compiler.
      Fix problem with parsing IPv6 Addresses with brakcets.
      Preparing for version v0.100
      Added debugging, moved .cvsignore to .gitignore
      fixed issues with old openssl usage
      Adding python compiled files
      Change isns_portal_string() to use static mem
      Running make twice should not rebuild everything
      Fix mdebug.c so it compiles when enabled.
      Handle restarting test harness server correctly
      Ignore SO lib
      Create and use pythong unittest framework

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../open-isns/{open-isns_0.99.bb => open-isns_0.101.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/open-isns/{open-isns_0.99.bb => open-isns_0.101.bb} (96%)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.99.bb b/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
similarity index 96%
rename from meta-networking/recipes-support/open-isns/open-isns_0.99.bb
rename to meta-networking/recipes-support/open-isns/open-isns_0.101.bb
index eb04dfae3..0b1bb6d51 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/open-iscsi/open-isns \
            file://0001-isnsd.socket-use-run-instead-of-var-run.patch \
            "
 
-SRCREV = "cfdbcff867ee580a71bc9c18c3a38a6057df0150"
+SRCREV = "0d86dc31fae2e2d77a082ccea5aba95426b40c3c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



