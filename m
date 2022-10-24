Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A63C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:54:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.16348.1666594492122462375
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mcnyHMqc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594490; i=@fujitsu.com;
	bh=pu1IArYePoh6pJ5PKIo0xycEePAY6brPjSZY1g7bmGo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mcnyHMqcf/ebTYWeIZkgfXOb9yP/gJyd7GZtDupK0xwVxmmp5yJRGpPmc9toeeagO
	 0Wgk70MrETjhXN2APN1WogX/kFe6zujNKe2qoNIyV/X66vziE5kQUlD4cIHrs0YHx1
	 JVQ07dgJmts/UeQbugJbTzHdNUws9HYgDsTEhb0Tdz1b6VBkxLgvFRd1+l57K25yi+
	 YXS9TsBCDyOg8fvKeNnI7WJesvO8eRpRQDF/hfwQzlmdAXbVrWh0u7ogNbTTWGtsbY
	 7nu0jBAewV6Soz6ps0Rjz8yUu29KbKslnIe3C5LyVsocLHq6t6feGs88eT6AdVvy6I
	 lujNPqTO7kwDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSXenWVi
  ywfU5phYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bF2T+ZCpZzVRz8c4WtgfE7RxcjF4eQwBNG
  iTmHZjNBONeZJM5OuMfexcgJ5OxhlJj0LxTEZhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rB6YQEfiaX958BqWARUJX6/eMsCYvMKOEk8ePacCcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWG1SvmsTVc5uYJzDyz0LSPgtJ+wJGplWMpsWpRWWpRbqmeklFmek
  ZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZhSrNS3g7Fr2R+9
  Q4ySHExKorwM4mHJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4a7SAcoJFqempFWmZOcC4gElLc
  PAoifDOMgJK8xYXJOYWZ6ZDpE4xKkqJ86qZACUEQBIZpXlwbbBYvMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmNfPFGgKT2ZeCdz0V0CLmYAWX1oRBLK4JBEhJdXAVMx+3Nj/++FnM/5enmf
  R+37KHJ9796QaPnzkiJqk+k3YwclIsf+I5ElFSfk1k4NfSx5W4SndcvZc1kdr8Q0mH9vYGmye
  fC/x3yjGYDvBbeHbGeeWFvouyxYV2h7FqDc7oeHOdc4lC/tWZ2/7euXx/17rhWJbL2d6fNTW2
  eZdm+ijw7q7YPnjuuPTs/bN22P/P/NkrT5Tq1Du3Z8c3xqDI7Pu6k7/+vTQkl0PFL3frM8+O+
  PXi/hst4j0gKmdZ45d4L1mtSfXkjkr1tNc8bOw6sb/msfzi7dWL3Y+wG5sOJnN7GDNZHVlY5n
  rs5149n9aaiNd+kv6pnrldR/hw9PCZAN6uPMd3JZ6dosl+HNKKLEUZyQaajEXFScCAAM5Y2FA
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1666594489!205775!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31122 invoked from network); 24 Oct 2022 06:54:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:54:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 937F91000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:54:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 857611000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:54:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:54:47 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.49.1 -> 1.50.0
Date: Mon, 24 Oct 2022 14:54:31 +0800
Message-ID: <1666594471-29168-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99281

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.49.1.bb => python3-grpcio_1.50.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.49.1.bb => python3-grpcio_1.50.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb
index 8efcfdc375..a562bfb30c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "d4725fc9ec8e8822906ae26bb26f5546891aa7fbc3443de970cc556d43a5c99f"
+SRC_URI[sha256sum] = "12b479839a5e753580b5e6053571de14006157f2ef9b71f38c56dc9b23b95ad6"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


