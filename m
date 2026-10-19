Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE380CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:59 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27954.1792386476550505389
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F0/S6nPG;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1439; q=dns/txt;
  s=iport01; t=1792386476; x=1793596076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V5dUodPZEqeWS85U8z3sCHtzoovjDw08nrZTk/18BGE=;
  b=F0/S6nPGQua0MDDTPPSyxG/9pM4WxIiY8LfZB5eXgCY+zOpFAutq5oXm
   MwGARSUCph+nGq9+/vETdYoVBsp/UlM4S5XK8bw0k3/Uh4w+GbQQJR2+v
   6Un7j3Wb+whJwuk/Y/Sle2T51tT1nVq9vRroBKGgOEqyVl6sdCzAtTq2e
   zvo0we9aEfXRpuWFGDd21pdHnB053N0SeNioyKkiXO8soGcpUQl602wRo
   iCS8+HCNi5DdtfBvQjseMaFlUMYEE6wxDT9REDScHNjZJRYu4SGgGR4Z/
   ELSDornxKvvGhKHh2Xyo2y/+Qi4KXYK0mfEAiijNEX2WzYDXmdCk8CyJk
   g==;
X-CSE-ConnectionGUID: 7Iw4x6aBRpGhRs2F04R01g==
X-CSE-MsgGUID: Ug6fzOYrQ3yNygLJeeB4tA==
X-IPAS-Result: =?us-ascii?q?A0BZAwCipNVq/5D/Ja1aglmDTGBDSZNZAYJwnh+Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2AUYwXESDAgGCdAMRvWCCLIEBhH7bPhWBOIVAiCN2hHwnGxuBc?=
 =?us-ascii?q?oR+hRCFViIEgg0VehKGaJBPSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQdNGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?ioegmUBgQMLB4JQD5Mokj+hDwoog3aMIpU6GjOqb5kIpFqEaYFoPIFZcBWDI?=
 =?us-ascii?q?glKGQ+OYNIMJzICOwIHAgcOAwuGSYshLYFPAQE?=
IronPort-Data: A9a23:Q8Doaa5GfHXtFQDr8F7rYQxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 jcWCj3SOfuKMWf2ftknb9yzox4CuMPRmNJlTVQ9/HxnZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYqwHpvYpCEt07
 dMYEitXQEjfvbrvz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeOJYXXGZoNxC50o
 Er78Dr3EDYrLuXE2ByU/VaOi+LlwT/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:L9imhKNMZshu9MBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:UiCJpG2LYHXYmxkYiFmWyrxfReE6Lm2DxV3qO2C4M30zZuXJcwfJ9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A/pJ65Q1XMsd6c09iO3z5id3CNjUj3qvwBlIqoI8?=
 =?us-ascii?q?/4NiiJCNUGTqQpmira9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537154702"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9268118000231;
	Mon, 19 Oct 2026 05:07:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3878CCC1611; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 0/7] ntfs-3g-ntfsprogs: backport security fixes
Date: Sun, 18 Oct 2026 22:07:34 -0700
Message-Id: <20261019050741.1688261-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131108

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport upstream security fixes to ntfs-3g-ntfsprogs 2022.10.3 on
Wrynose. The series addresses CVE-2026-46572, CVE-2026-42617,
CVE-2026-46571, CVE-2026-46570, CVE-2026-46569,
CVE-2026-42618, CVE-2026-42616, and CVE-2026-40706.

The series includes shared index validation fixes, decompression
hardening, and a follow-up check for POSIX ACL allocation failure.

Darsh Kelaiya (7):
  ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
  ntfs-3g-ntfsprogs: fix CVE-2026-46571
  ntfs-3g-ntfsprogs: fix CVE-2026-46570
  ntfs-3g-ntfsprogs: fix CVE-2026-46569
  ntfs-3g-ntfsprogs: fix CVE-2026-42618
  ntfs-3g-ntfsprogs: fix CVE-2026-42616
  ntfs-3g-ntfsprogs: fix CVE-2026-40706

 .../files/CVE-2026-40706_p1.patch           |  60 ++++++
 .../files/CVE-2026-40706_p2.patch           |  34 +++
 .../files/CVE-2026-42616_p1.patch           |  70 +++++++
 .../files/CVE-2026-42616_p2.patch           |  79 +++++++
 .../files/CVE-2026-42618_p1.patch           |  53 +++++
 .../files/CVE-2026-42618_p2.patch           | 221 ++++++++++++++++++++
 .../files/CVE-2026-46569.patch              |  62 ++++++
 .../files/CVE-2026-46570.patch              |  42 ++++
 .../files/CVE-2026-46571.patch              |  50 +++++
 .../CVE-2026-46572_CVE-2026-42617_p1.patch  |  66 ++++++
 .../CVE-2026-46572_CVE-2026-42617_p2.patch  | 104 +++++++++
 .../CVE-2026-46572_CVE-2026-42617_p3.patch  |  35 ++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb          |  12 ++
 13 files changed, 888 insertions(+)

-- 
2.35.6

