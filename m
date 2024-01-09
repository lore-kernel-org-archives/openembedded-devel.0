Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89970C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 12:44:20 +0000 (UTC)
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
 by mx.groups.io with SMTP id smtpd.web11.15582.1704804251103535930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 04:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=ZGXz4To/;
 spf=pass (domain: amazon.de, ip: 207.171.188.206, mailfrom: prvs=73170cd5c=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1704804251; x=1736340251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ohpr8cwJpbSTV/TS7t3HPGB2mYn2k5AX+Ko693M/Dwo=;
  b=ZGXz4To/ymLnZfr8jmmsoapt5gxbRS8Lcae3Y7DeCz62UuWGqiY5Bhjx
   4gINB0yY+WCYeEdeKnqGPQStYBuk8JJT3QX8GcpXXRRM1uGWCU9aleduT
   0WMnWgVIwn3cX5mFMLGDfM5n90fWuq9XmyMOxI6q2S47ChSug3gNxqWjL
   4=;
X-IronPort-AV: E=Sophos;i="6.04,182,1695686400"; 
   d="scan'208";a="695980651"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-1box-2bm6-32cf6363.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 12:44:05 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
	by email-inbound-relay-pdx-1box-2bm6-32cf6363.us-west-2.amazon.com (Postfix) with ESMTPS id CF2E480686
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jan 2024 12:44:04 +0000 (UTC)
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:22576]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.35.236:2525] with esmtp (Farcaster)
 id 89b0db5b-e768-499a-a7e1-a3f74fc7ac02; Tue, 9 Jan 2024 12:44:03 +0000 (UTC)
X-Farcaster-Flow-ID: 89b0db5b-e768-499a-a7e1-a3f74fc7ac02
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 12:44:02 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.1.212.30) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 12:44:01 +0000
From: <throos@amazon.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] abseil-cpp: readd use of -std=c++14
Date: Tue, 9 Jan 2024 13:43:50 +0100
Message-ID: <20240109124350.206419-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.1.212.30]
X-ClientProxiedBy: EX19D044UWB004.ant.amazon.com (10.13.139.134) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 12:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108187

From: Thomas Roos <throos@amazon.de>

Protobuf is compiled with -std=c++14, so abseil-cpp must be as well.
Details can be found here: https://github.com/protocolbuffers/protobuf/issues/10768

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index ee62d4b59..1a713e1c5 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -26,6 +26,7 @@ ASNEEDED:class-nativesdk = ""
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
+                 -DCMAKE_CXX_STANDARD=14 \
                  -DBUILD_TESTING=OFF    \
                  -DABSL_ENABLE_INSTALL=ON \
                 "
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





