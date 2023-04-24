Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CA3C77B76
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:25:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.42833.1682306704862504289
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vQBURI3x;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306702; i=@fujitsu.com;
	bh=MCsPGf0IU0eeywblmks83EeKYCtP3nZy2JkocYNKrRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vQBURI3xFofNjmF/aDCAkllG9OhjTZ2RS3VQEx+fZ79cveJbhzGtigA4AQnsMQAoV
	 GQgkdQk1+px3Khcq0NLUZE6+srSmoUahpUftKjiB+s2B5LxBXklxUr4VGHIi/DcTbg
	 cuAe6DpkvRuNlUGU4/IMWzqvFMDUADLWII4U8tgWGbOQqgkMiz6mf2hbWZlDS3S6Ok
	 mnOw/Fc9k3zSKmT6Ci6y9Je1e5roR+UDzyOsC4Yn7l5i2gz8UphtQodq0QHrH7ZbIn
	 NUQozpRQOP1b0BQRKoV3hAkDTLEIq4sd7EgORBZR6nw679/e8nFaFP2/yjfkNwpKbY
	 dwjnFlbxjrNRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqNv3zTX
  FYPd8eYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP1wduMBd2cFScOb2JrYNzE0cXIxSEk8IRR
  YuP2NywQzg0miceLfzNBOHsZJVadvMLaxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAgMTz3qdgNSwCqhJ7Wi4ygti8Ak4S+2YtBKuREFCQmPLwPVgvp4CzxLHeW2C2EFDN8w
  vX2CDqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6RrqJRVlpmeU5CZm5uglVukm6qWW6ublF5VkAKUSy4v1UouL9Yorc5NzUvTy
  Uks2MQLDN6U44dsOxradf/UOMUpyMCmJ8i7Z4JIixJeUn1KZkVicEV9UmpNafIhRhoNDSYK36
  JNripBgUWp6akVaZg4wlmDSEhw8SiK8y74ApXmLCxJzizPTIVKnGBWlxHklvgIlBEASGaV5cG
  2w+L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhX8gPQFJ7MvBK46a+AFjMBLd7F7QKyuCQ
  RISXVwFT++c37mw4se+X+iAdViPk9iptS4mir3yBvdkuBTfqVyaep566+s0lKruWreGv8ud1Z
  c6GbYHlZWefDBNuy6wkeoo/ySw5wTIl96tprXO6SZi18VnWi9+e1F7iMnswpeXG20I9ZseWb8
  8+/2dvWT/+sJ6jV+qBSRbbyS2TW7qeT4sSu3s5WTnVeU5VbuG26iNd3a8E3DbUzb6s9k54+b/
  mKL9+7GBafvHJb7kmNYDj7yVanme/ZVofoOByYfOTkztvnP6fXup9ldV/erfmtcLOa9ir/44v
  mbM6fwyXgdELwH+/dzp3hj6vmvJnFoJx498+0+lb18+eyvG8eLSr6Hnf/17r9+0LPzDpuylQQ
  /1KJpTgj0VCLuag4EQCYJqoeWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1682306702!290797!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5361 invoked from network); 24 Apr 2023 03:25:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:25:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F12F21001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:25:01 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DDFB210019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:25:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:25:00 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.170 -> 2.4.170.1
Date: Mon, 24 Apr 2023 11:24:36 +0800
Message-ID: <1682306676-11881-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
References: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.170.bb => python3-pymisp_2.4.170.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.170.bb => python3-pymisp_2.4.170.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb
index dbfcebe5d..5fc33d642 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "6b28d8e606747cade1638f651ea531850027ddf4"
+SRCREV = "75435df663376d26bf8044b76906ecadba112000"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


