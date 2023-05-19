Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908C0C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 05:26:46 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web10.19201.1684473996361139899
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 22:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=FtCxxxs9;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=926; q=dns/txt; s=iport;
  t=1684473996; x=1685683596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QVJ2qSYM6Jssog6tuCxXvwNMUVnOern7+/RFQ8XsWEg=;
  b=FtCxxxs9z3mMf34zjJCE2o3bBJzXhe6v7PGZGdp5Xoc8JAwEEoTAf9SX
   TOVc3NZdcTO70rPvmpSCjorD1YT4hXQKxSvXRVo8/YNp0LnCiC9+nBel2
   V1/0tM1223uOYK7JbPPkPrhpe6FZr25QZTBOsppkSKZqrcVjtKXDSBI/e
   A=;
X-IronPort-AV: E=Sophos;i="6.00,175,1681171200"; 
   d="scan'208";a="60015485"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 19 May 2023 05:26:35 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 34J5QYVX009282
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 19 May 2023 05:26:35 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 7FADFCC1293; Thu, 18 May 2023 22:26:34 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: schitrod@cisco.com
Subject: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Date: Thu, 18 May 2023 22:26:17 -0700
Message-Id: <20230519052617.2747159-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 05:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102669

As per gnulib_2018-03-07 recipe information,
SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
This revision was committed on "2018-12-18".

There is a discrepancy between SRCREV and the recipe version.
Which reports "CVE-2018-17942" as unpatched.

To report "CVE-2018-17942" as patched,
We need to align a recipe name with SRCREV commit date.

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


