Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60F2C6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:23:42 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.8436.1664267017755931621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XqQMzK9j;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664267015; i=@fujitsu.com;
	bh=k+bw1bqXHa1z0YRxiHa+g7JZgbY5Oklt5gXZfQ32ng0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XqQMzK9jTdPWKNPWnIqNHuEDPUqsn17SSgnFUwY9w7yPmK6e6QQTzQcp5jCy1rjUh
	 AIHl8SaXDDLxWnYpnvEy3zO3fDHA0dfdWd304YQ+BoFh4pWM5ieVdEqHzSicyQ/5E9
	 GxFXRT9nJoOPnssdkMrerthcAuTBlcZv5Ch1YPB2D2RtNKp/mYJwyPdiyvE37fOboM
	 +81DQok2MLEUiykrIGwu3Ot7AvDYYi+G8pGLrZQULo6WjYjRmbM9p3o7YsbuElSZ1Z
	 dnx4OvpLVcfDzgu9xIG1JExUFQIjPsdBJ9V0XvMdOIQFGaImitQyhE6LEU2lrPiBEh
	 npLC2jPSXRvvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8OxWZd9s1G
  ywYvnYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKJRoFBzgrtvyfxtrAeI2ji5GLQ0jgIaPE
  umOt7BDOZSaJ6Y/vMEI4exgl1sx5wtbFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICnxJxN31lAbBYBVYm/69cwgdi8Ao4SHZ/ugc2REFCQmPLwPVgvp4CTxJkFc4HqOYCWOU
  psWCYKUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBU10TX0lgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwgFOKWWJ3MG7t+6l3iFGSg0lJlNd+kVGyEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQlepvVAOcGi1PTUirTMHGA0waQlOHiURHjXLQFK8xYXJOYWZ6ZDpE4xGnNcvXJlLzPHzK
  9tB5iFWPLy81KlxHmFNgGVCoCUZpTmwQ2CRfklRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK
  8MiBTeDLzSuD2vQI6hQnoFDs+fZBTShIRUlINTJJGkZ/ctKOeLV3B8kZ9U+2Xovm+N9z6fgVt
  dVlQOMuS2f9ADM+32jvCrbuUvFYcf6w/S9VpgcSlC/qn7CRT7kW/+OF+qWBJnvnfX2uaTnPE3
  ktJF4ledFV3xomLPxkEPS1O3NH0Ovi76tGRVaz2iWHPyqwOmVRcNLONes0o7/DyWt79w2f6An
  8/nCvtoepu2DmfY1n8St1nSSnzLr1WMPz5qH32gxVlCVu6YiSXVhyozQoy7NzfV6J5kXNG6cQ
  bu1a/X3zzV9GKoMbF3OJLDf1q1lbXnZuRU+5yuqLy1YR8rv/uhj0r/ZU+JSf8uR/keKl65aZ/
  r6pnXdtq2X7Cgd3K6cfnJHH++Qss+h9cnqXEUpyRaKjFXFScCADbiiHubQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1664267015!262865!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6375 invoked from network); 27 Sep 2022 08:23:35 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:23:35 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F1DA8152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E53D973
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:23:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.16.2 -> 1.16.3
Date: Tue, 27 Sep 2022 16:23:20 +0800
Message-ID: <1664267003-2293-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
References: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98970

Bug Fixes
- Patch for CVE-2022-3204 Non-Responsive Delegation Attack.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.16.2.bb => unbound_1.16.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.16.2.bb => unbound_1.16.3.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.16.2.bb b/meta-networking/recipes-support/unbound/unbound_1.16.3.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.16.2.bb
rename to meta-networking/recipes-support/unbound/unbound_1.16.3.bb
index 63036f6eb8..5e40d8c30c 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.16.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.16.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "cbed768b8ff9bfcf11089a5f1699b7e5707f1ea5"
+SRCREV = "137719522a8ea5b380fbb6206d2466f402f5b554"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


