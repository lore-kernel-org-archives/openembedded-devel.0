Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E61DC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:10:57 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4698.1787137854452354858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zv7P+cta;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2005; q=dns/txt;
  s=iport01; t=1787137854; x=1788347454;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2lw/c6LvPvxYB02gXnGVKriq870Z8kX5DieSMfrTlQQ=;
  b=Zv7P+ctauFU1qp8gYaYtcfq8HLaOP6WLdF+v7ssaX0GCpq70od6Q3QMx
   B0nrtjdsE5udh45xroIR70RRLJDxiFuWQQifGDpdZRZKmXF8FKr8K/x3D
   jtq+U6UA13rIilHM9PXx92DAatFodOxXw99L3aDZvkc1u1VWRRp59xpho
   FwkgBNYttZ/FwW1wAuQdPsolTx8TQhfBVTtfrYdfvyWucmhgE1CTP0L8s
   ErAmvsXFHS8udkVEISN5AweLWjCoOG2BVQBrQErAEeF7fJVkxb6ucGrKM
   6I14H+tH16baRlUYuPNMAsR7w77GZ8qE/Ac8O7Zu9qbK+hr/ldwcKln5D
   A==;
X-CSE-ConnectionGUID: 45n9yXkLTgeUdJvUkhgI1A==
X-CSE-MsgGUID: 5A/NbfLrRLKIrGwj3YXU2w==
X-IPAS-Result: =?us-ascii?q?A0BlBABMjoVq/40QJK1aglmDS15DSZNZAYJwnh6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDw12CLIEBgygBgVTbPBUFgTOFP4gidoR8J?=
 =?us-ascii?q?xsbgXKEfoQ0XIV4BIIiehKTP0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRREKCwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeOSSCCR4EPgSYggRERB5Mgkj6hDwoog3aMIZU6GjOqbJkIp?=
 =?us-ascii?q?A1NhGmBbwUwgVlwFYMiCUoZD95cJzICOwIHAgcOAwuRaoF8AQE?=
IronPort-Data: A9a23:1Bol8q0sDMoH9ZT/GfbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2FTz
 WJOXmuAOv+LajSjed8lPInn9h8GsZWBztJlGQI93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUBwwbJwo+cJLDmxz+
 d4GFTMNYTHarrfjqF67YrEEasULJc3vOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME2ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiOm8aoePJIfiqcN9w2/fg
 GjI237DJjI7LvOAy2G0wk/2mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:H5+/Ta5t0A4bCjOJewPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:fyYx4m99K9G/irUrAGCVvxJJHJE0Qn758HjdHkOaF1tqSLK0EHbFrQ==
X-Talos-MUID: 9a23:/kkLYgRQrYJsSMx+RXSxrXZEPslM+Z6KK2EXvooE4Pi0CHZvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="809925263"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:10:53 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 8C26118000481;
	Wed, 19 Aug 2026 11:10:53 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 28221CC12A6; Wed, 19 Aug 2026 04:10:53 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 0/5] libssh: Fix multiple CVEs
Date: Wed, 19 Aug 2026 04:10:42 -0700
Message-Id: <20260819111047.44043-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129347

From: Hetvi Thakar <hthakar@cisco.com>

Backport five upstream libssh security fixes to the 0.10.6 recipe on
 scarthgap:

 - CVE-2026-59843
 - CVE-2026-59844
 - CVE-2026-59846
 - CVE-2026-59848
 - CVE-2026-59850

Carry these as focused backports instead of upgrading libssh because
newer releases include API and functional changes outside the security
scope.

CVE-2026-15370 and CVE-2026-59849 affect libssh >= 0.11.0.
CVE-2026-59842 and CVE-2026-59851 affect only libssh 0.12.0 and rely on
code or features absent from 0.10.6. NVD correction requests have been
submitted for these inaccurate affected-version entries; therefore, no
CVE_STATUS entries are added.

The individual commits retain the upstream fix provenance and advisory
references for each CVE.

Testing:
- Applied all five patches to libssh 0.10.6 in series order without
  conflicts or fuzz.
- Package build completed successfully.

Hetvi Thakar (5):
  libssh: Fix CVE-2026-59843
  libssh: Fix CVE-2026-59844
  libssh: Fix CVE-2026-59846
  libssh: Fix CVE-2026-59848
  libssh: Fix CVE-2026-59850

 .../libssh/libssh/CVE-2026-59843.patch        |  84 +++
 .../libssh/libssh/CVE-2026-59844.patch        |  52 ++
 .../libssh/libssh/CVE-2026-59846.patch        |  87 +++
 .../libssh/CVE-2026-59848-regression.patch    |  45 ++
 .../libssh/libssh/CVE-2026-59848.patch        | 684 ++++++++++++++++++
 .../libssh/libssh/CVE-2026-59850.patch        |  40 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |   6 +
 7 files changed, 998 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch

-- 
2.35.6


