Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75277C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:42:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.4041.1665391347210798713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SCDd9mij;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391345; i=@fujitsu.com;
	bh=cpcHWB3MhnpsLYSUSOncIs7uFvbDb8EVSjvIQ2Ol00Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SCDd9mijN4tnbdXAjipwuBw6CXGRrnov/Aaxt0o/HxcyjX+9DUZDLWbfGQps+8AHC
	 ABP53yF5LRk1qqFImbyaozY+dOIbRrCAW0OL01NWj7KGTumbeVQXSyTyP8NNdgf2xG
	 G556L70rTY7kOdbssl3qxQfUWVTndiF2KFGhOMCFDND6EWm6hcxCn9t5AhMCgzZJ4n
	 Cr6Ys+lYzcrKl6B4jvLq/fQhvOtD49QHpcAy2QNxZ3+e59Dk+BjFShxk3EOSJCsS5H
	 4ABZ2Um1HeUJzXtuc7PTr4A8RBizL5Elp/k9HBYsHDuAyF9u5h2hTunCylQaAsLng6
	 9uwveOvbWydeg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSffjLed
  kg2XnuCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozzSyILDnJW7N/wlKmB8Q1HFyMXh5DAE0aJ
  a6suMEI415kk/t0+xQzhHGCUWP3jOmsXIycHm4CuxIsfi1lAbBEBfYmls/cwg9jCAn4Sb68cB
  IuzCKhKdHSeYgexeQXcJf7M+MEGYksIKEhMefieGSIuKHFy5hOwemYBCYmDL14AxTmAahQlZk
  +XhyivkJg1q40JwlaTuHpuE/MERr5ZSLpnIelewMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU19h
  S19RIL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3OSdHLSy3ZxAgMvZRidZMdjN0rf+odYpTk
  YFIS5TU45JwsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3yQ2gnGBRanpqRVpmDjAOYNISHDxKI
  rwPLgKleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolztt+E6hIAKQoozQPbgQsJi8xykoJ8z
  IyMDAI8RSkFuVmlqDKv2IU52BUEua9dAVoCk9mXgncpldARzABHXHyqhPIESWJCCmpBqaehZL
  NL25d+ux7e1Fz7LFpmzee+HeCLeFj1/W7LLccfA9XSJcvn7H4f1p3OsccCad96W+/np7Ft1iF
  Y7Pe+nCWs1JFu0uE+6dMaQ9eYyIVccT9kdiiF0ltFgqrBac21Uhdtpv2Y1nxVzG3wB4z7U0vZ
  G7//MbE7jLPiG12qm9UtsqMf/4rGLunHfvGwPHE37LmW8KL17O+KHt17T2bv/PqombFred2fh
  AKFZOO4H949dHO0vOLEycI/TXjP3MiKJP9cbLRQ0+VrrCUb018Mg+KyqcbbHX1COk40LxednZ
  +RMHTdz3u5j0/fkR83JNgctv34YmkfevDv93zs4mbcOeb+5utWz35+QQDFlZvviKpxFKckWio
  xVxUnAgAOicLp0QDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1665391345!175094!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25886 invoked from network); 10 Oct 2022 08:42:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:42:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B454A1000EE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:42:24 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 98F711000CE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:42:24 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:42:23 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.6 -> 4.21.7
Date: Mon, 10 Oct 2022 16:41:51 +0800
Message-ID: <1665391311-2414-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:42:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99122

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-protobuf_4.21.6.bb => python3-protobuf_4.21.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.6.bb => python3-protobuf_4.21.7.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
index 96b3d02120..24ce61cad7 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6b1040a5661cd5f6e610cbca9cfaa2a17d60e2bb545309bc1b278bb05be44bdd"
+SRC_URI[sha256sum] = "71d9dba03ed3432c878a801e2ea51e034b0ea01cf3a4344fb60166cb5f6c8757"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


