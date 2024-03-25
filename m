Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D9EC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:20:21 +0000 (UTC)
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
 by mx.groups.io with SMTP id smtpd.web10.51786.1711372811830242876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=Un9eVNpm;
 spf=pass (domain: amazon.de, ip: 52.119.213.156, mailfrom: prvs=807c6bc3f=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1711372812; x=1742908812;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2c26GuvWwVqrcxXrY6AiMr1BawSsz4bdr7kSlHO07Z0=;
  b=Un9eVNpmqU9Db9+3jPWTgSbwOTmVmx5iORDnum4fy05iMIhBc7jLmhpP
   ylcjRyzL2VoCF/p1Ph10Ee1gUON50vyd8pery5zHfVO1axltvBi5tasw7
   Pu0sUxNowNK/ojRfaQqZHKBQHaV5a2HgvaNiwcw2bkxQMOhqAL0ofkmg4
   w=;
X-IronPort-AV: E=Sophos;i="6.07,153,1708387200"; 
   d="scan'208";a="643359845"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 13:20:11 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.43.254:49179]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.24.234:2525] with esmtp (Farcaster)
 id d490f5d5-875e-4d19-b6aa-5d2523b8f63b; Mon, 25 Mar 2024 13:20:09 +0000 (UTC)
X-Farcaster-Flow-ID: d490f5d5-875e-4d19-b6aa-5d2523b8f63b
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 13:20:09 +0000
Received: from u182adcbddbfb55.ant.amazon.com.amazon.com (10.1.212.29) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 13:20:08 +0000
From: <throos@amazon.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] usrsctp: upgrade to latest version
Date: Mon, 25 Mar 2024 14:19:56 +0100
Message-ID: <20240325131956.256380-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.1.212.29]
X-ClientProxiedBy: EX19D035UWB002.ant.amazon.com (10.13.138.97) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109578

From: Thomas Roos <throos@amazon.de>

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 38fb46fa4..4c18c6aff 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
 
-SRCREV = "a0cbf4681474fab1e89d9e9e2d5c3694fce50359"
+SRCREV = "848eca82f92273af9a79687a90343a2ebcf3481d"
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





