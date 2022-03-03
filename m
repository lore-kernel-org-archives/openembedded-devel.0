Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2861C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:59:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.9120.1646301561489036194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LX9NAGO+;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.126, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646301561; x=1677837561;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+LY6FHbptoMDacOdcNsngWPohc49ENH3EFtst19EdG4=;
  b=LX9NAGO+egryVjNY0qsQ/1XHJ1sUgt9dQp6PtbP0p4C8YKUyMmYSuO6R
   VaofxVY/VIyfn5ob0NabeHTih2wtRO6hpmeoETqWI5XjjhJ7wv+z3dvkG
   0pz959wwIu873+QLI2R0ecyjW+nJaTAdrLK8MwZ/EwTr+M2uKMtKoeVjQ
   FSojZieTYbsrPiSuf1eMTf5rqdapWuwD9lAUlOpoUb1PcCGE9Tbk364A+
   FP0+GUQR+nFBRgGtjUXnupQxwbPHOhlTTHraVYDYoCbIuYBqEfHnwmHIN
   hFM3khpBS9jFjZ5Vs/OyXR10Ayj/D8HpWOw+S1aTgoomZG6KQ6sMROG70
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237143513"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="237143513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="686450857"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:13 -0800
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-networking][PATCH 0/2] Bump libesmtp to 1.1.0
Date: Thu,  3 Mar 2022 09:58:58 +0000
Message-Id: <20220303095900.2533635-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 09:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95734

Bumps libesmtp to 1.1.0, this fixes CVE-2019-19977.
https://nvd.nist.gov/vuln/detail/CVE-2019-19977

Jiaqing Zhao (2):
  libesmtp: bump 1.0.6 -> 1.1.0
  esmtp: fix libesmtp dependency check

 .../0001-Fix-libESMTP-dependency-check.patch  | 44 +++++++++++++++++
 .../recipes-support/esmtp/esmtp_1.2.bb        |  6 ++-
 .../libesmtp/libesmtp/include-topdir.patch    | 48 -------------------
 .../libesmtp/libesmtp/snprintf.patch          | 19 --------
 .../libesmtp/libesmtp_1.0.6.bb                | 38 ---------------
 .../libesmtp/libesmtp_1.1.0.bb                | 32 +++++++++++++
 6 files changed, 80 insertions(+), 107 deletions(-)
 create mode 100644 meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb

-- 
2.32.0


