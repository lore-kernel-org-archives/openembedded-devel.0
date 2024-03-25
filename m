Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE2C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:18:01 +0000 (UTC)
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
 by mx.groups.io with SMTP id smtpd.web11.51849.1711372677497872742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=IhLtjfqf;
 spf=pass (domain: amazon.de, ip: 52.119.213.156, mailfrom: prvs=807c6bc3f=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1711372678; x=1742908678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wZABM0OoVYWS7AZWVnlhP3KJQSxGwU0S106485Tuf0M=;
  b=IhLtjfqfSJqWvKkjEo/M/t4zVEH2nKD6FGxho/DyZurMth0OK0Eyu2uK
   xmI/BGMXKa+LtrFJnxPKYOhWsAkgPTAGA/IVfYLISjqqdomC2O9zYdVhT
   +G1lGJNefLPGHttuxBbAQXtqO/qizNMrb/iwaUsO755cGru+cR2jqf2Mv
   k=;
X-IronPort-AV: E=Sophos;i="6.07,153,1708387200"; 
   d="scan'208";a="643359295"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 13:17:56 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.43.254:61069]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.1.9:2525] with esmtp (Farcaster)
 id e9f9402b-8dfb-4cda-9df8-2ce4f2a2483e; Mon, 25 Mar 2024 13:17:53 +0000 (UTC)
X-Farcaster-Flow-ID: e9f9402b-8dfb-4cda-9df8-2ce4f2a2483e
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 13:17:53 +0000
Received: from u182adcbddbfb55.ant.amazon.com.amazon.com (10.1.212.29) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 13:17:52 +0000
From: <throos@amazon.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] usrsctp: upgrade version to a0cbf4681474fab1e89d9e9e2d5c3694fce50359
Date: Mon, 25 Mar 2024 14:17:40 +0100
Message-ID: <20240325131740.247464-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.1.212.29]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109577

From: Thomas Roos <throos@amazon.de>

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index dcfa7406d..85742d509 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
 
-SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
+SRCREV = "a0cbf4681474fab1e89d9e9e2d5c3694fce50359"
 SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
           "
 
@@ -24,4 +24,4 @@ PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
 
 EXTRA_OECONF += "--disable-debug"
 
-CVE_VERSION = "0.9.3.0"
+CVE_VERSION = "0.9.5.0"
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





