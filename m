Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FE4C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:01:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.29727.1652086859222872951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ORlDqnG+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086857; i=@fujitsu.com;
	bh=GLXuPtzhEIzdGQCqIK8h7AF3YFU51aTy1x9a8zVwus0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ORlDqnG+Lb8V3o2H+DPwnXkoxAZ1kcOfU1vA48sdUfDTpG8/1HGIiY5KELEYMPLM5
	 AkckNInzZzhuS1leOsxQdtTkpXMWZ3svjtpyftmG+Dt7e5wIxv4nF8LuDPc2rn8cXO
	 Xc+wMaOadc8EW+VvP39rKslqQByRfyWUtkp9PVWbojOAKIq6J+dnc7BiBbLvgVRgkn
	 MfBnW+OtgaVYvsAdziB9YZ5nYnMILTpOvi+uLb3IMfvQ6PKSpJnN01Cc3H5S8yA/5G
	 nMTTPK1uX/5wU+k2imhckv3egeAwGqQiTTfrB2ucVKSS/cOmztn0F1sutAkYeeR83L
	 kMSmmchOAtEFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxSdfjRkW
  SwZQvVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+42eZC9ZyVmz83svcwLiUo4uRi0NI4Amj
  ROPC44wQzgUmiWNLH7NBOPsZJRbfnQnkcHKwCehKvPixmAXEFhHQl1g6ew8ziC0sYCfRsvwZm
  M0ioCLRtOcQWA2vgLvE3X1fwXolBBQkpjx8zwwRF5Q4OfMJWA2zgITEwRcvgOIcQDWKErOny0
  OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdQ18j
  AWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzD4UooZT+9g3NT3U+8QoyQH
  k5Io7/qrFUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg/guQEi1LTUyvSMnOAkQCTluDgURLh7
  QJJ8xYXJOYWZ6ZDpE4xGnNcvXJlLzPHDRApxJKXn5cqJc6beB2oVACkNKM0D24QLEIvMcpKCf
  MyMjAwCPEUpBblZpagyr9iFOdgVBLmDQeZwpOZVwK37xXQKUxAp3wMKAU5pSQRISXVwLTktqX
  EZHsmpXuqwTI3Nf/xL0oSOs8w7XDzosbJP9JfFPnNPpq79uCMW4cEYsKUHnT3zuQ79JHFs/lY
  6Gb+zSrtihOfr1Z9bNi566frCWWjeYvKBfS8C507Og5cr7RcsdX/8gH7aXsMI97w/n6gsHP6Q
  4dLE1YUlJ6cIPBP69CndTfq9xZeEe+K3bJg1q8m3knXnZMSPh7jPqzoe/QJ+3oja4lunn17Xr
  D3be2PKp+9aBXzyZOyNtVhe5lat667eWZb9P1YWcc7VS8dv629fISt9++Jwts6HQm3X2buTij
  Q28S3T/DEMovPu1w0zzS9lc1Td71V41nAGT7tysP5X7aesGNMyvWacq8v2rZXt/O9EktxRqKh
  FnNRcSIAOri2zUsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1652086856!159488!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8264 invoked from network); 9 May 2022 09:00:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:00:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 58D4B100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:00:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4BF6610032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:00:56 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:00:35 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] apitrace: upgrade 10.0 -> 11.0
Date: Mon, 9 May 2022 17:00:11 +0800
Message-ID: <1652086811-2623-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97014

Changelog:
==========
appveyor: Update GitHub deployment token.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../apitrace/{apitrace_10.0.bb => apitrace_11.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/apitrace/{apitrace_10.0.bb => apitrace_11.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
rename to meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb
index d4d8d8eb4..1e5798de5 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRCREV = "d28a980802ad48568c87da02d630c8babfe163bb"
+SRCREV = "c54d99563414cd178abec7cf7d9663eb949a0f51"
 PV .= "+10.0.1+git${SRCPV}"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
           "
-- 
2.25.1


