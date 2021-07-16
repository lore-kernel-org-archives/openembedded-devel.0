Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.2884.1626416938034875123
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 23:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dJo0VoV8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626416935; i=@fujitsu.com;
	bh=9eOYCSIaO9TDSLmXWTAWNkWxTMTcTM0xvGPswqVzMaw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dJo0VoV8as13RiXE8WPF03jWeM0qpxJaG+lrh2aIhbyz/Iv032crCacf5SqQCU95E
	 XaX5xSLxKch6uu3H6Hanx2PtehEyX/Rn+qCxsyk9PQtSLCwBahmemWgeI3oTK0LPHq
	 HWnTaYGCmUyWK1j1Lk9K8BjDgpG3zOILZ1wu+6tVMfPgReOMi8JeyMucH6DtfXjqnJ
	 8ucdrtAcRc+c3UhgRLC+NI0hsXRlFeDkqdGbVQF0HH+GRq+7Xn6FL5uC9Vx6Xt2gEq
	 krL5/g4bR7b278zcFtVyOqYP1PU2HjDVPmC70ZDySdRv8w4d7AmdKjubyCWv6yqtP5
	 fLOWExv45xf7Q==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 2A/9C-07230-72721F06; Fri, 16 Jul 2021 06:28:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqquu/jH
  B4Pt0XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPRlo/MBTM4K2ZOMWxgPMzRxcjFISSwjUni
  /qyL7BDOXkaJU6eeMHYxcnKwCehKnHu8lh3EFhHQl1g6ew8ziC0sECCx/dBiMJtFQFViy9YZY
  DW8Ap4Sr57fAOuVEFCQmPLwPTNEXFDi5MwnLCA2s4CExMEXL4DiHEA1ihKzp8tDlFdK7JnVzz
  SBkWcWko5ZSDoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdE1MjDVS6zSTdJLLdVNTs0rKUo
  EyuollhfrFVfmJuek6OWllmxiBIZRSiHL2R2MX15/0DvEKMnBpCTKe/nzhwQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKEryeCh8ThASLUtNTK9Iyc4AhDZOW4OBREuFVA0nzFhck5hZnpkOkTjEqS
  onzTlUFSgiAJDJK8+DaYHF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73MloCk8mXklcN
  NfAS1mAlqsveYtyOKSRISUVANTmWH44rCvfMlrDmnO75kqJvDy6x7VyDU6WZsOeeWcNZ/2oen
  Vjjcvb18XvZauuNz7jPt0pkKGPcv/PdNt+pOz5zBDgoviw1U8M37KbUzfNEsq6o5swtz3/bnW
  nn5vl2ztutTxsIJTTVf1+eIfD/gavMocwn5fn9NTFnHm9KTs3a/Ozzj4a9+fuAiZYnZ231T71
  JXJbCrZirdffvnBsee284W1i7/O2b32L+PLJtnXsd0rVtyaLi5yvcpZQef+rLo1EmsezeNTOz
  JRIefPwt1xKhFxNYtEti6N2qUyu+vUNeFZviz+4g1iqy/6JK4K/J4dUbCy99LkyA97ZXR5DfU
  01xYpRIrMP6aXrrwzLTj3oxJLcUaioRZzUXEiAOctT2geAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-248.messagelabs.com!1626416934!123242!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28680 invoked from network); 16 Jul 2021 06:28:55 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 06:28:55 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G6SshM015787
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 07:28:54 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 07:28:52 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 21.5.17 -> 21.5.18
Date: Fri, 16 Jul 2021 14:28:49 +0800
Message-ID: <1626416929-107469-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-pulsectl_21.5.17.bb => python3-pulsectl_21.5.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.5.17.bb => python3-pulsectl_21.5.18.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb
index 3c0a9c0e5b..d039b7ee30 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "3f782b3adf6d91b2398504002d248b36aa047bd04d5acd0ae5d4e2d3c8e746a0"
+SRC_URI[sha256sum] = "14e34563cdad5f01d193f1ef7cd859a0fbdaa846726d44b0b68f4451a7458458"
 
 RDEPENDS_${PN} += " \
 	libpulse \
-- 
2.25.1

