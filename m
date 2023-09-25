Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B6ECE7A8C
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 05:43:08 +0000 (UTC)
Received: from bgl-iport-2.cisco.com (bgl-iport-2.cisco.com [72.163.197.26])
 by mx.groups.io with SMTP id smtpd.web10.55022.1695620581873821669
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 22:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=AqbeXn90;
 spf=pass (domain: cisco.com, ip: 72.163.197.26, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1146; q=dns/txt; s=iport;
  t=1695620582; x=1696830182;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2XwrlKGC329WniRlLbBjCoEU51h5roYtBETmrK547Vk=;
  b=AqbeXn90jK6WdhI/HZ1lvmkhIzLuiIfQVw2yOf80DNCEdljv4TXiMROe
   FxcsbGbbAtC0MstiRl6RU7qpf6rkh5u0eXN6q//GAXZnJgu9aaMidliOV
   m05xw3PjP1zjldFWzzrGE8sBcQB+jNriRP3WkU7zEqzYV3uAhf8N7ecVn
   o=;
X-CSE-ConnectionGUID: m0dvxNFzRX6aSeK0UlW3CA==
X-CSE-MsgGUID: Nl+77iatRIe3HoyUyzNq/A==
X-IronPort-AV: E=Sophos;i="6.03,174,1694736000"; 
   d="scan'208";a="18654876"
Received: from vla196-nat.cisco.com (HELO bgl-core-1.cisco.com) ([72.163.197.24])
  by bgl-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:42:58 +0000
Received: from bgl-ads-3120.cisco.com (bgl-ads-3120.cisco.com [173.39.57.7])
	by bgl-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 38P5gwmU021370
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 25 Sep 2023 05:42:58 GMT
Received: by bgl-ads-3120.cisco.com (Postfix, from userid 1784405)
	id 33A49CC1280; Mon, 25 Sep 2023 11:12:58 +0530 (IST)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Shinu Chandran <shinucha@cisco.com>
Subject: [meta-oe][kirkstone][PATCH] c-ares: CVE-ID correction for CVE-2022-4904
Date: Mon, 25 Sep 2023 11:12:56 +0530
Message-Id: <20230925054256.788656-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 173.39.57.7, bgl-ads-3120.cisco.com
X-Outbound-Node: bgl-core-1.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 05:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105119

- The c-ares commit https://github.com/c-ares/c-ares/commit/9903253c347f
  (Add str len check in config_sortlist to avoid stack overflow),
  fixes the CVE-2022-4904 instead of CVE-2022-4415
  https://security-tracker.debian.org/tracker/CVE-2022-4904
- CVE-ID inside the CVE-2022-4904.patch is wrong
  in the OE commit[092e125f44f6]
- Hence corrected the CVE-ID in CVE-2022-4904.patch

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
index 0a0e8f0b6..328075ca6 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -20,7 +20,7 @@ fixes #496
 
 Fix By: @hopper-vul
 
-CVE: CVE-2022-4415
+CVE: CVE-2022-4904
 Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]
 
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
-- 
2.28.0


