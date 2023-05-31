Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EF1C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 04:19:30 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.6253.1685506763785121423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 21:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=bAkaWZme;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1095; q=dns/txt; s=iport;
  t=1685506763; x=1686716363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KO2eScrH90Vwje6Dqi8Oms5nFoW5u/udoqH3VGQ0s70=;
  b=bAkaWZmePcziGHQQuQlimRh0bn2zojvbfZmMRGQCBjx/meg95Na5G8bG
   sddMPgL0DZmnmzL7w/YeEah9FnarzmPbRTG7g9tq0fOa4YAzppPdcg2Eh
   sx7qTdc5rnnrHpeBby1XyHWsLGbEHJ4GLX6oUF2nT3oScYdIvQ74JO/Vw
   k=;
X-CSE-ConnectionGUID: tRhbgOllTRWhVWK6INVW2Q==
X-CSE-MsgGUID: 6JrLbv6/R0+EWvRgdGUnGQ==
X-IronPort-AV: E=Sophos;i="6.00,316,1681171200"; 
   d="scan'208";a="97037764"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 04:19:23 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 34V4J3D2027420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 31 May 2023 04:19:19 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 33734CC1293; Tue, 30 May 2023 21:19:03 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sanjay Chitroda <schitrod@cisco.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell,PATCH] gnulib: Update recipe name to 2018-12-18
Date: Tue, 30 May 2023 21:19:01 -0700
Message-Id: <20230531041901.2258463-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102903

As per gnulib_2018-03-07 recipe information,
SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
This revision was committed on "2018-12-18".

There is a discrepancy between SRCREV and the recipe version.
Which reports "CVE-2018-17942" as unpatched.

To report "CVE-2018-17942" as patched,
We need to align a recipe name with SRCREV commit date.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9edbe7033cc41f4a49f74717cd3146b52588ce22)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb} (100%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
similarity index 100%
rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
-- 
2.35.6


