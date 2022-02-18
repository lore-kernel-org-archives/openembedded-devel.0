Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D8CC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:18:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.8474.1645172328192090615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Euk13cps;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645172326; i=@fujitsu.com;
	bh=oM+zUulvYzbwzYWiC1Qzuk3wdIFfJMdpcDK4uvAfCto=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Euk13cpsAw1tvb6ms7amJAPfPnExusrOCc9s8tDv2f9ARhscxF0asPkC/P11Vbh/z
	 6uei5xcTtrYWz55R8j5t6ysSuBlsajaKqRIk4CsUZUKyvGOlgXsMApItdxWqnKWKVY
	 XgrlrYk3rZGjZXrmG4I9T70DPyDRIcHbKtExAXXXyHS6Ztmxenpdc/eRfH8BGsjVqK
	 e8MLoJaMB+kEbX07tvHs8ToK36aflOWz8VjhRlggdWR5F9UEFM4aBbTDi0pVs0CFir
	 7d77YIooSwn+wH+FG6k3P2F1m25ynkdMoJ2nmizs/wt6Gu1YRM/QQhAzGsXrIhiawb
	 m7Rdy/RFMwl7Q==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id EA/83-00700-5665F026;
 Fri, 18 Feb 2022 08:18:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSTc1jD/
  JYPIODYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNl9zK2gpUcFXs3mDUwHmfvYuTiEBJ4wihx
  8N9kIIcTyLnAJDHrGRNE4gSjxI83z9hAEmwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43QPWL
  CzgIvF7z1UmEJtFQFXiy73fQHEODl4BJ4mOK2ogYQkBBYkpD9+DtfIKCEqcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU11DUyNNdLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyJRixps7
  GFv7fuodYpTkYFIS5Z3hyZ8kxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3ZBBQTrAoNT21Ii0zB
  xgdMGkJDh4lEd4vAUBp3uKCxNzizHSI1ClGRSlx3rUgMwVAEhmleXBtsIi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmY93II0BSezLwSuOmvgBYzAS2+XMoHsrgkESEl1cBU5Ttj3uv1orP
  P/mYoUDSddNBixsHjW0+kdNj2nfeRiH2x7Rpbh5CIPr+IkF/gvzodF33F4n37ru361pTTJOjz
  /XnrTJZ2y9uLnvcKx0ne681wXWN1PtZu2VHzxvSeKq/SJwJVj2T/tfyYISpRaftpkf6zYN3P5
  nXv35Zb8gn0ep/PtTL6JCG4f2+he73Fz2v9E93So3+U395WNymi1/3B/W+qW0t0F654zHcgdG
  r0igv/Od4bR0m13bvlEfyjoEpA3UlE3Ksj6q9aOO+Py2Y7OdWyS32lU9eEtwuJ12YdfP7r4e5
  0s6RKqUnNwc6rz+k9DUiR2Nz/Ky/44Y7D5ldcHN/urrrkc2dzhEFHjhJLcUaioRZzUXEiAPuY
  RTlDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1645172325!54665!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16170 invoked from network); 18 Feb 2022 08:18:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Feb 2022 08:18:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3953610034F
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 08:18:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2CC231000FE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 08:18:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 08:18:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] dnf-plugin-tui: Fix a bug of multilib
Date: Fri, 18 Feb 2022 16:18:16 +0800
Message-ID: <1645172296-14344-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 08:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95372

Fix the following error when install rpms for multilib:
error: Too many levels of recursion in macro expansion. It is likely caused by recursive macro declaration.
Transaction check succeeded.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 5263aaef30..88c83f1020 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "3ccf87915ceb70eac055a07eb80bc9105e916620"
+SRCREV = "7c45fd65dcd811def66161f6d572c3930f2ba4d8"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


