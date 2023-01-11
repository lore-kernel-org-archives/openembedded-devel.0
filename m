Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2318AC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:24:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.16659.1673414672877487703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jDSKCDET;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414671; i=@fujitsu.com;
	bh=0nR95RALltdAk76mEIPWGb9wrjAtFJrzBO7GbyTHpT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jDSKCDETWPasFyEm7zQfVhtmgCJSf17c3BVH8U/AbqPxWbYK41CCzIdfsY/hGwZCW
	 glMtUaIxLkoNdPACNyBkFElgUQt5mmqZSB/zBQqAAF0uap/KqDSOrkGiuGum/zV/bh
	 mQ5YnOgur/IIohMgarf4XMj7Bspsye7Ju0/VyfWUye2r9rOmC00Dj5N7jaPXR+k6Hi
	 gPTyHzxbAPuLM261gL2HEht0tU6sdImgFC5Y+gVhwzbEAUfeg33mvoeaVmWll4sF7j
	 +jk0AeqWA6dMvwu4YATUeSz9NE2bzsMdbfDEgbOYxy9sMuwwnsWieosNHL69GKUA2Y
	 SyA3V0eOR76tA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpMvnsS/
  ZYO4RVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP7/SeMBct5K/6cD2tg/MDdxcjJISTwkFFi
  wS/fLkYuIPsqk8SVzpXMEM5eRomzj78xgVSxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAlcWLuRDCbRUBV4tb9j6wgNq+Ak8SKf1vB6iUEFCSmPHwPZnMKOEus6VrPDHGFk8SBXR
  fZIOoFJU7OfMICMV9C4uCLF1C9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuma6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEBm5KMZvPDsZ/S//oHWKU5GBSEuXNk9iXLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV8UVK
  CdYlJqeWpGWmQOMIpi0BAePkghvrSNQmre4IDG3ODMdInWKUVFKnNfZHSghAJLIKM2Da4NF7i
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzMzkBTeDLzSuCmvwJazAS0+HDXXpDFJYkIKak
  GJudHB91Lok332EqrbZhy7jy70qd5aaduaotXPSw6teyOY6BlnXHCljf1WW2lm6PqBDNPrtWe
  m5ef8TjRzTJx+6v/zMp9yy01BY1kHZu79l7RtA3tvM67uefMyweT5KomiUzbfK9VtEo7Q3022
  /taw1fZX+QT6rfL+lWf0er9yGGXfy87y6VQ3dcp46Fs/Owvvaa/1J6c+MRdUrs7+czZAg13Me
  +UpUv3v/RIbZ1RaXUg8aPHmx3LbvFEnPu0bpP2tYjtZSJTjwZ06P9uV2GbaROq9cPBKnrulcs
  LH86v/5Am6vvqbE6Qj0lcW9md+VseXym6aR/4cMKRSU8nziidnKA2Lb+ZMXV3jEfrpnIzJZbi
  jERDLeai4kQAWNcQ+1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1673414670!506711!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18975 invoked from network); 11 Jan 2023 05:24:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:24:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3C5A21B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 309811AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:24:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 4.5.0 -> 4.6.1
Date: Wed, 11 Jan 2023 13:24:06 +0800
Message-ID: <1673414646-13721-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
References: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100527

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Address changes of final V2 api release (#175)
 Use non-deprecated logging warn method (#174)
 Add support for smart_scene resource (#170)
 Add support for matter resource (#171)
 Fix: KeepAlive workaround causes Geofence to malfunction (#163)
 Fix: Missing repeated events for Philips Hue Tap Dial switch (#167)
 Fix error in log when an empty dict is received for an optional value (#164)
 Add sparkle effect to fix new Festavia lights (#165)
 Fix typo in discovery (#158)
 Pin github actions and add dependabot actions ecosystem (#151)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.5.0.bb => python3-aiohue_4.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.5.0.bb => python3-aiohue_4.6.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb
index 7507b8ffd..7e915fd3d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "9a5aaf2fa97a889746142093e74143d5e3e02209fae428d1e2dbcc34a5c36efd"
+SRC_URI[sha256sum] = "afe44307ff2453e20323009cb315de3896d551afd0635b57381a278bb2119d48"
 
 inherit pypi setuptools3
 
-- 
2.25.1


