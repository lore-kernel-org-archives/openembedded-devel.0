Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11250C54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 00:35:31 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.10256.1709598927054891085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 16:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=J9C60Og3;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=906; q=dns/txt; s=iport;
  t=1709598927; x=1710808527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uRjlCmsMLZR50jxA9uTZh54zekiyJwVPXyzyVQlSohg=;
  b=J9C60Og3olh+PyO56XWbPlB+XUCfiQlS5lXVgRSf64l1qd3R729JvUhh
   IzToRBmp+g+PtCZfgK7YhZe0JEyvn8KqhUwH6mGsMpjTiKyU0yhRZX0D9
   NujfuzRJzVKm1p4msAGb72P9RH5TaxHgef/HlhqVKmt2/SL4YqzvVgTeI
   Y=;
X-CSE-ConnectionGUID: Av3DGL4PRauYGZIFnw4htw==
X-CSE-MsgGUID: 1LgZMbojRdWHDe8Eg6kJQA==
X-IronPort-AV: E=Sophos;i="6.06,204,1705363200"; 
   d="scan'208";a="199695002"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:35:26 +0000
Received: from sjc-ads-8052.cisco.com (sjc-ads-8052.cisco.com [171.68.208.90])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 4250ZPxj012790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 5 Mar 2024 00:35:26 GMT
Received: by sjc-ads-8052.cisco.com (Postfix, from userid 1821000)
	id C1DA1CE1C79; Mon,  4 Mar 2024 16:35:25 -0800 (PST)
From: krkapate@cisco.com
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Krupal Ka Patel <krkapate@cisco.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohappyeyeballs: Correct the typo of BBCLASSEXTEND
Date: Mon,  4 Mar 2024 16:35:21 -0800
Message-Id: <20240305003521.577734-1-krkapate@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.208.90, sjc-ads-8052.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 00:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109106

From: Krupal Ka Patel <krkapate@cisco.com>

This typo resulted in the following error,
"ERROR: Nothing RPROVIDES 'nativesdk-python3-aiohappyeyeballs'"

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
---
 .../recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
index 0ca483477..edad28e77 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "77e15a733090547a1f5369a1287ddfc944bd30df0eb8993f585259c34b
 
 inherit pypi python_poetry_core
 
-BBCLASSSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
-- 
2.35.6


