Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1F878AB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 09:55:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w859u03C029122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 02:56:00 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 02:55:59 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 17:55:57 +0800
Message-ID: <1536141358-147474-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] postfix: add sendmail to ALTERNATIVE_${PN}
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
X-List-Received-Date: Wed, 05 Sep 2018 09:56:00 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

There are several packages provide ${sbindir}/sendmail
and should add sendmail to ALTERNATIVE_${PN}
to make it work well.

And the sendmail is removed from ALTERNATIVE_${PN}
in below commit:
===
commit 7b500488115c67d657312135b48027a1c26e0955
Author: Lei Maohui <leimaohui@cn.fujitsu.com>
Date:   Fri Aug 17 18:19:53 2018 -0700

    postfix,esmtp: Fix confilct error in do_rootfs

    Error: Transaction check error:
      file /usr/bin/mailq conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64
      file /usr/bin/newaliases conflicts between attempted installs of esmtp-1.2-r0.x86_64 and postfix-3.2.2-r0.x86_64

    Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
===

Add it back to make sendmail works normally

before adding it back:
 # mime-construct --to root --subject mail-20826 --encoding 7bit --string mail_content

 sendmail: account default not found: no configuration file available
 Error closing sendmail: non-zero exit (78) at /usr/bin/mime-construct line 572.
 # echo $?
 78

After adding it back:
 # mime-construct --to root --subject mail-20826 --encoding 7bit --string mail_content
 # echo $?
 0

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 389136b..49f9f7b 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -214,9 +214,11 @@ do_install_append_class-native() {
     ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
-ALTERNATIVE_${PN} += "mailq newaliases"
+ALTERNATIVE_${PN} += "sendmail mailq newaliases"
 ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
 ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
+ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 
 ALTERNATIVE_PRIORITY = "120"
 
-- 
2.7.4


