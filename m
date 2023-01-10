Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1C2C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:39:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.97330.1673329183432510174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J0juE77w;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329181; i=@fujitsu.com;
	bh=oQk+UOW0XBrePZVMtIgQvGhOlcpzbs6YMj6b3zjR/aQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J0juE77wjPqYOFDdGhdCtVYBmow/ind/w2N/AiQd4Wc/QUTpHLo1UoK8lF9INUYdX
	 cKN2qfGJKILXfQQCT2s+dJ+UJzec4d1N5uSYzaFglgcbfYZ/tCAybj1fWD8PTxLlz6
	 Vq813WB7j56+qAKPGw8IJbtLK/O6jxWE/a25R2AkGAk5XU2v65hM7A4yrUBt0vZ/gk
	 W1jREZ6/PhvUiP4hJmVUC+QjCUmjsRk8rt/8zeSseuNlSqtwC1UDR7YqIfe8oZLbsg
	 YKkAIAdkvEhCA+IyjGlMM1Gmn1STNbSA5hN4A5enfy5+vEHzMRsiVFL+N5tuSK6AoB
	 oj7JILp0Y7LPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqCvza0+
  ywZ8jWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPF1/YCq6xVryaPoOlgXE2axcjF4eQwBNG
  iSmLJjFDODeYJHY9PscG4exllPizeBZTFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC7hLNm9aA1bAIqEpsnLSfFcTmFXCU+NczFcyWEFCQmPLwPVgvp4CTxJLNvWC9QkA1b3
  avYYeoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtoqJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxQzTdzD+XPZH7xCjJAeTkihv0ac9yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  HV+AOUEi1LTUyvSMnOAsQSTluDgURLhnXcdKM1bXJCYW5yZDpE6xagoJc67FKRPACSRUZoH1w
  aL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmtvwJN4cnMK4Gb/gpoMRPQ4h9Td4IsLkl
  ESEk1MLGyPgkyWXXm4J4Vmf9KUiwZuJfOldf8btds47124fyNzoGVPp9F5mcrvq7X+zMt8pnO
  xex8jszq+WFBW9Tfzvv94XIP+5v06/qsEze8u8N+tU/o3ZO4oycZit1fJ239zCEcc9341sOND
  /j+vK594bVh2qUc7wBPC/GPoZfyFG6d6k5Q2nhuQcE9iS8T5ljP/7rdtvjZexNL0wni8fp+X7
  WmWwU68E9Ju/FDZb9Tc75fuMvLiWk+Py8Ftc6c8Er4Y0yWzIcf7KELVZh2FH694v2m6OzS3TK
  pp3/92eD4/8CE4MMzZeQi4rY/MLJ6LNymn9fQrnDemFsojjfE4VV264cTL3j6TXfrzJiw2SHr
  +0UlluKMREMt5qLiRABY30cOWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1673329180!394371!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1390 invoked from network); 10 Jan 2023 05:39:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:39:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 47FB1100188
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3BC2F100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:39:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.12.06 -> 23.1.4
Date: Tue, 10 Jan 2023 13:39:15 +0800
Message-ID: <1673329158-5189-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100500

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index c87a449f0..a85c74c12 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "22.12.06"
-SRCREV = "acf39ff056df8c9e5bfa32cf6f7b5e6b87a90544"
+PV = "23.1.4"
+SRCREV = "af9ceabeef1a10c1004e2741f8c0c090ca59e5af"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.25.1


