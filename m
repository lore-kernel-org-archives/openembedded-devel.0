Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97B9C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 04:17:39 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.6159.1685506650139901092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 21:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ij1AQ2B/;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1095; q=dns/txt; s=iport;
  t=1685506650; x=1686716250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KO2eScrH90Vwje6Dqi8Oms5nFoW5u/udoqH3VGQ0s70=;
  b=ij1AQ2B/YZChgqXvvLxzkdgtV2a9linS13rLxBLTVQFmlViHNnoAPEKG
   qcoEmfPvvtUTDg4nCxkziWa+5TwIrlV54Qmcm/mV4lCwpiGtmHMz5n4fB
   +XONV2B7ioxhpXnCeyr3aNF2G0fHkz9OzCIVmt3FRuORg50mZrs3GZPEM
   M=;
X-IronPort-AV: E=Sophos;i="6.00,205,1681171200"; 
   d="scan'208";a="113007336"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 May 2023 04:17:29 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 34V4HRhc020705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 31 May 2023 04:17:28 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id B31F4CC1293; Tue, 30 May 2023 21:17:26 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sanjay Chitroda <schitrod@cisco.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore,PATCH] gnulib: Update recipe name to 2018-12-18
Date: Tue, 30 May 2023 21:17:06 -0700
Message-Id: <20230531041706.2255984-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102901

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


