Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1CDCCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:47 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16841.1792136805305582302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gXMKkj5O;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1513; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vGs9TF/jq6kvyc15fW2tDT9q/QMO4uVD/VEigmpjSc4=;
  b=gXMKkj5OWE5GLGVuUVunEgsz8iYAhEvAhQ+2i2KCCOonnTCTDy/p9i7P
   FOJqR0sCqvaLIXXW0gr+v4AJKocyzEMYRsVRIRYLNsLkEgPXhZInx7VSd
   YxbKP//yv3Ra+wKGhA+svr4ib8sDfdPMqCVfQo/SRQRipeFDNo9AYqf4f
   SjIyny96WrZBr0I2Wl/CUBI6KmFngsgPa0ELCTFOteSPvnnqylJjaz9Ty
   TKWGDcrZFSo/hjVC0mmHaIlkF8uvPPCEU6gs5q/dtyeLbYACYypW6VA+h
   cLAYIXWMs659WiFGR+ZHJynK8/xJLSpCkoSkawZoRUXEiXj/M3g97DFdI
   A==;
X-CSE-ConnectionGUID: qBvHUTrERwOkRMqBCwvDYw==
X-CSE-MsgGUID: 9926VeSZT3mLKzPvH3bgPw==
X-IPAS-Result: =?us-ascii?q?A0AXBAAY1NFq/5X/Ja1aglmDTGBDSZNZAaEPgX4PAQEBD?=
 =?us-ascii?q?zcaBAEBhQWOFwImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXJAVNgFGMFxEgwIBgnQDEb0hgiyBAYR+2z4VgTiFQIgjdoR8JxsbgXKEf?=
 =?us-ascii?q?oUQhVYiBIINFXoShmiQOUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUH?=
 =?us-ascii?q?oJlgQ+BQ4EUD5Mokj6hDwoog3aMIpU6GjOqb5kIpFmEaYFqAjiBWXAVgyIJS?=
 =?us-ascii?q?hkPjmDSHicyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:VanGs6uQii3eEjtADO5YDNTSaOfnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTyGOKreMGKjLYpyO4i090NS75LRx4A3GVFlpXwwRiIagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw48xpIVxy7
 9EiNxcOVDWarcmp3p6KVbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHRG58KzxnB+
 Qoq+UyoU0tECtGk+wbe91aPlNfRvXjxV7oNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:KWGDFqulgEVa/iaWgzoQz/VO7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A75zUnGoR2DzZj/aOaDIpoLDmUdkPbF3g8G39GVC?=
 =?us-ascii?q?fClxMUZe+VkG8ybwxxg=3D=3D?=
X-Talos-MUID: 9a23:OX0alwoXv8wUkYT16Wsez2AzbplW7p+cNBsItbYUg9ekbiZ/AyjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536279717"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 54601180001D3;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id F1DFCCC1611; Fri, 16 Oct 2026 00:46:43 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 0/7] ntfs-3g-ntfsprogs: backport security fixes
Date: Fri, 16 Oct 2026 00:46:33 -0700
Message-Id: <20261016074640.3986037-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131072

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport upstream security fixes to ntfs-3g-ntfsprogs 2022.10.3 on
Scarthgap. The seven commits add eleven source patches for
CVE-2026-46572, CVE-2026-42617, CVE-2026-46571, CVE-2026-46570,
CVE-2026-46569, CVE-2026-42618, CVE-2026-42616, and CVE-2026-40706.

The shared index fixes for CVE-2026-46572 and CVE-2026-42617 are kept
in one commit. The CVE-2026-42618 decompression fixes are adapted to
the original 2022.10.3 source layout. Recipe entries apply the patch
parts in dependency order.

Darsh Kelaiya (7):
  ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
  ntfs-3g-ntfsprogs: fix CVE-2026-46571
  ntfs-3g-ntfsprogs: fix CVE-2026-46570
  ntfs-3g-ntfsprogs: fix CVE-2026-46569
  ntfs-3g-ntfsprogs: fix CVE-2026-42618
  ntfs-3g-ntfsprogs: fix CVE-2026-42616
  ntfs-3g-ntfsprogs: fix CVE-2026-40706

 .../files/CVE-2026-40706_p1.patch             |  60 +++++
 .../files/CVE-2026-40706_p2.patch             |  34 +++
 .../files/CVE-2026-42616.patch                |  70 ++++++
 .../files/CVE-2026-42618_p1.patch             |  53 +++++
 .../files/CVE-2026-42618_p2.patch             | 216 ++++++++++++++++++
 .../files/CVE-2026-46569.patch                |  62 +++++
 .../files/CVE-2026-46570.patch                |  42 ++++
 .../files/CVE-2026-46571.patch                |  50 ++++
 .../CVE-2026-46572_CVE-2026-42617_p1.patch    |  66 ++++++
 .../CVE-2026-46572_CVE-2026-42617_p2.patch    | 104 +++++++++
 .../CVE-2026-46572_CVE-2026-42617_p3.patch    |  35 +++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  11 +
 12 files changed, 803 insertions(+)

-- 
2.35.6

