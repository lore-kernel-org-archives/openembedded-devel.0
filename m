Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 032B77506F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 03:43:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40784205"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2018 11:43:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 593F64818463
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 11:42:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 6 Jun 2018 11:42:59 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 27 May 2018 11:33:56 -0700
Message-ID: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 593F64818463.AD932
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] Fix confilct error in do_rootfs.
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
X-List-Received-Date: Wed, 06 Jun 2018 03:43:09 -0000
Content-Type: text/plain

Error: Transaction check error:
  file /usr/bin/mailq conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64
  file /usr/bin/newaliases conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 7 ++++---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb  | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 09447d5..a5e8618 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -219,9 +219,10 @@ do_install_append_class-target() {
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
 }
 
-ALTERNATIVE_${PN} = "sendmail"
-ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
-ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_${PN} += "mailq newaliases"
+ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
+ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
+
 ALTERNATIVE_PRIORITY = "120"
 
 ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 2da73e7..9fb817b 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -18,10 +18,10 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
 
 inherit autotools update-alternatives
 
-ALTERNATIVE_${PN} = "sendmail"
+ALTERNATIVE_${PN} += "mailq newaliases"
+ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
+ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
 
-ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
-ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
 ALTERNATIVE_PRIORITY = "10"
 
 ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
-- 
1.9.1




