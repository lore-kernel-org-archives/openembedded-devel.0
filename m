Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0262E78AB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 09:56:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w859u3VT029555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 02:56:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 02:56:01 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 17:55:58 +0800
Message-ID: <1536141358-147474-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536141358-147474-1-git-send-email-mingli.yu@windriver.com>
References: <1536141358-147474-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] esmtp: add sendmail to ALTERNATIVE_${PN}
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
X-List-Received-Date: Wed, 05 Sep 2018 09:56:02 -0000
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

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 9fb817b..663161a 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -18,9 +18,11 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
 
 inherit autotools update-alternatives
 
-ALTERNATIVE_${PN} += "mailq newaliases"
+ALTERNATIVE_${PN} += "sendmail mailq newaliases"
 ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
 ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
 
 ALTERNATIVE_PRIORITY = "10"
 
-- 
2.7.4


