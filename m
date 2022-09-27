Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A76C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:20:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.8576.1664266805197757029
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iv1lH4+M;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266803; i=@fujitsu.com;
	bh=Oqt9CEqsvL74EwM5WfI8JcgXeh0uk7RvXVFHeWXtAfg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iv1lH4+MBFASRnwOKnHwTMaw6kyNMV/Q6AgW3gApVDs0OlH5HEaru5HM/2suWhY/h
	 WaG9GsnCPsNcRT96va96zig5g0pfsyUD09h4QYzZvVYYMAo5METP8pG7tqVjdDxLoM
	 7/Mfqxk+AY0lCuQArjSsy5kCEyZf/kXBOKZEhlK81gkV0Z7d2uAdVaFY5GCqdxsoTy
	 n4vFsMxKgzhzwyA1/5L5HkPNcvoo1QZb8k3xu9VJ1ZrPIVmMSbGIQWCdryA2FTDCbb
	 AppivtcMjSKUSu4WzX90btD1z0gJEMUfq4sRwH52QNnw1uLDJIxg8FekJaZJ4cr3zK
	 0taK4dQhEKVrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWddok1G
  ywY1flhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5ntssBes5Ku5u2cnWwHiTvYuRk0NI4CGj
  xPqL+l2MXED2FSaJRStXMkM4exgl1s7bwApSxSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi989Y
  JOEBdwkzn94zAJiswioSuw6vY4NxOYVcJTYt/0/WI2EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJxumHmCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZOKMtMzSnITM3N0DQ0
  MdA0NTXWNTXUNTSz1Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECwzKlWHnq
  DsbTq37qHWKU5GBSEuW1X2SULMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCl2k9UE6wKDU9tSItM
  wcYIzBpCQ4eJRHedUuA0rzFBYm5xZnpEKlTjIpS4rwzNwIlBEASGaV5cG2wuLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZh36VqgKTyZeSVw018BLWYCWmzHpw+yuCQRISXVwHRFpHv6w3e
  d7pY6z/ffm37+0YMnpkd+Zj8VOa1xdHHyJ029Bxff7fvge+P+1BPThBgS6v5f9/ge8JrRdM0T
  2RMs8/zqtt3bZ7fK4M6By6ava7ONHtenBneUep37+H3NRLmzzJJHn83rkdeUcC1dsyuihmWRw
  XP/X61Pfl7+X+y+5EH7YfOKc8uO7717R6M5q/3uCb3fulH8z8UzuI45TVPZ+ZmtwfGm5tNTye
  4qU2eZWLCs4W+r0fQ4q/k149C2ZvOMAu2GWLcADReehrIEK6kraY5bhcKuzbpcHDynjueChqj
  YuY6/QZq9p/46xb56V7qJUyrw27oLPft/+i66q/TEefWPz++X2b8+VnCEyX+7EktxRqKhFnNR
  cSIAtvWzTUYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1664266802!8921!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3008 invoked from network); 27 Sep 2022 08:20:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:20:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A5204155
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:02 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 96446156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:20:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cairomm-1.16: upgrade 1.16.1 -> 1.16.2
Date: Tue, 27 Sep 2022 16:19:47 +0800
Message-ID: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98959

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cairo/{cairomm-1.16_1.16.1.bb => cairomm-1.16_1.16.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm-1.16_1.16.1.bb => cairomm-1.16_1.16.2.bb} (82%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb
similarity index 82%
rename from meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb
rename to meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb
index 61892d3679..c1e271ffa1 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.2.bb
@@ -9,7 +9,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-3"
 
 SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6"
+SRC_URI[sha256sum] = "6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f"
 
 S = "${WORKDIR}/cairomm-${PV}"
 
-- 
2.25.1


