Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A69EC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:36:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.22554.1647419814361872221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cUSmnrUV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419812; i=@fujitsu.com;
	bh=quf6kXcvHF8iWgbZdsYHA6MPxXYiQisRi9nFUThn9oc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cUSmnrUVPUtVn2gIJa/iy+4fgpHWdhyWZN+q4/XGUlkBXNscr294Upk3xKIk3q80E
	 FmycXtbQoyySpS93pc3uH/2eMhtiT9OIwQyEpZPPQPBltNy/qfUHoUDHNG5OalmU9f
	 Ve6Tiraam+oviyaFrB8hi9nr9Q6v+K53X/C/cdOCy0uUMcdR7cAu4j8eerE94BlIZT
	 w4E4MrrbkCYx+EbktxpcT3xhOCd8MZ0d+g6UZgvbwoatCYdN16GWBYkym2FdV3+CcK
	 i6ryUCa/s0FjuTQWeGAUS7VUv9egT+c4ewLPIZXA+LEsshx+X6RF7VT2UCbYgNTqI5
	 uPUgaPLdgfAmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqLtkoWG
  SwaR2TouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOtfQJLwWeOiq+LF7M2MM7n6GLk4hASeMIo
  sWH+NRYI5wKTxK9zu5kgnBOMEkf39bJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICvxI1GiHoWAVWJQx3/gGo4OHgFnCQWXcwECUsIKEhMefgeLMwp4Cwx/XgFSFgIqOLyqX
  6wibwCghInZz5hgZguIXHwxQtmiFZFidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsY7ZKKMtMzSnITM3N0DQ0MdA0NTXXNzHQNTU31Eqt0E/VSS3WTU/NKihKB0nqJ5cV6qcXF
  esWVuck5KXp5qSWbGIGhnFLsNHsH446+n3qHGCU5mJREec/PNEwS4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMF7ewFQTrAoNT21Ii0zBxhXMGkJDh4lEd6bIGne4oLE3OLMdIjUKUZFKXFehjlACQ
  GQREZpHlwbLJYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmtZkBNIUnM68EbvoroMVMQIv
  nSeuBLC5JREhJNTBVmZ54+uNrh0vH5pd/NlX+9v5oOr/Kcn/u9ClbnKJb1NI49/y1mLZSdfGh
  P+a7mWt1D++Turj3jNDDEh/Ju/nft1hdM+1IcZnw44mzvIq54d49O8oM57fkrvj8dp7xr9aXL
  +6tv/Gq+X7q2Q6nl79NY1fpxlqrlm9ycrzmO2VWvO53wekab+rrXS0arbL2WF3fpvcv8prkeQ
  8XY9N5S/i8el7tPlNs7Tjzm/3pP62s3+1Unq7ninsWxC1bpfriLy/zmvfBH00ibSaqK+0r/7t
  rZ1BdT86ancWz+28anIp9rPVx6R6WTp8z3RZN7+Y7PGVWPXI49mzKwf4bz2W2OK346SaS8l/r
  Q8tFZqliMc6NSizFGYmGWsxFxYkAOHR8DGADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-528.messagelabs.com!1647419811!18866!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12154 invoked from network); 16 Mar 2022 08:36:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:36:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 860851001A5
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5F2E91001A1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:36:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dnspython: upgrade 2.2.0 -> 2.2.1
Date: Wed, 16 Mar 2022 16:36:19 +0800
Message-ID: <1647419779-81651-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
References: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:36:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96017

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.2.0.bb => python3-dnspython_2.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.2.0.bb => python3-dnspython_2.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb
index cf76a142b5..f067a2ce65 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e587cc11b73aca026d6"
+SRC_URI[sha256sum] = "0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e"
 
 inherit pypi poetry_core ptest
 
-- 
2.25.1


