Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA37ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 10:17:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.10327.1662027464570728553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 03:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JQaiZxsx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662027462; i=@fujitsu.com;
	bh=Phvce7C/uMiPEOkprgTjsPq4tJwx/f9cFUeEXA1kIoo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JQaiZxsx17TT87Doh3h0I3lITFe+KwhDE5WmT3nojzhfhYxfgoWxb5mR1pWAWeFSH
	 N/jlTGIbRBdpKyHZRVTXXx3Gx+n29Gh5lSOexudq17Lrvhyw6BHjVuRKSSvxGLXt2m
	 38DN720ENde3+aZGBVtR+BMS1ETj+Q6H9ZBTZojuJ4hxwcsBTJsZqTq2piVUjPjFsp
	 UjvlTNVRjQiuHd3FVKw11bD5QG2614OVlHuBNTiDAV3ExbHgoYHqbTJfVr33zFYuo9
	 jNtdorsAs5kuUKU22rJsBoMRcNMQtJRDZqkkM9djUeqLXkPhNJaIqNEoMHGfiGbAal
	 a/0iFxsgn5DcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8OxWfdYm0C
  ywfYzMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8acm6eZCv5xVLxbtISxgXENRxcjF4eQwENG
  ibMPD7J3MXICOVeYJBYut4OwDzBKzLqQAGKzCehKvPixmAXEFhHQl1g6ew8ziC0s4C8x+ekas
  F4WARWJZWu3gNm8Ah4Ss7ZeZASxJQQUJKY8fM8MEReUODnzCdgcZgEJiYMvXgDFOYBqFCVmT5
  eHKK+UaP3wiwXCVpO4em4T8wRGvllIumch6V7AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2Fj
  X3EQvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw8FKKFb12ML5a8VPvEKMk
  B5OSKG+/jkCyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlevSagnGBRanpqRVpmDjAKYNISHDxKI
  rx7W4DSvMUFibnFmekQqVOMilLivGtBEgIgiYzSPLg2WORdYpSVEuZlZGBgEOIpSC3KzSxBlX
  /FKM7BqCTMWwEyhSczrwRu+iugxUxAi6fP5AdZXJKIkJJqYHJoKpxz/8etkIOWE27ZJnZss3E
  rsTG+WSsc7LvToyy4u7rna1PnRhGBbCuff3c9Fr6R0A9wX3Wbc6nKEsbbly+9bqkJvNxnPef8
  t1J+BntVkXgDZafHIv6fLA2tjItfLE28s4jv0p0Lr961/tJhDZf9a6D//fS7uD79v57b/324u
  fjsMhndvNsGdrfCQzMfVq0vCxGojcmPOpaWPqWk3fizqOUhwfo8xf0PVgXr35jX7Ru942f3/Y
  kmD/drm4a3Zc0LnmD3nmf505mRhV+PzKhe3Jo194fz8QtWMQYrHKs1Ch8xFPt59iZ+efuzMLc
  rRHnvtrkyx6e4pG4Wn1u3OFVkZ0fzu5bALduf77W1VmIpzkg01GIuKk4EAGDo4wg3AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1662027462!60220!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12191 invoked from network); 1 Sep 2022 10:17:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Sep 2022 10:17:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3074B142
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:42 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 242387B
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:42 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 1 Sep 2022 11:17:41 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flatbuffers: upgrade 2.0.6 ->
 2.0.7
Date: Thu, 1 Sep 2022 18:17:35 +0800
Message-ID: <1662027455-13158-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 10:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98582

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-flatbuffers_2.0.6.bb => python3-flatbuffers_2.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/flatbuffers/{python3-flatbuffers_2.0.6.bb => python3-flatbuffers_2.0.7.bb} (89%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
similarity index 89%
rename from meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
rename to meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
index 7c05e76d9a..84c80444b7 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://../LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "615616cb5549a34bdf288c04bc1b94bd7a65c396"
+SRCREV = "8367664f15c3ea2ee58c67dacf9d630b49466de5"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
 S = "${WORKDIR}/git/python"
 
-- 
2.25.1


