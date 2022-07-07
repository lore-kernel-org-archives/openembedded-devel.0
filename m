Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E411EC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:04:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.2757.1657177436573873120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KfB+cJpS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177434; i=@fujitsu.com;
	bh=B/YNaZ91v44t6tLFgrzyfB8yN0pzwMPbHIpDiXHJrrE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KfB+cJpSH9Ni1ItRC9Rc2oeN0CTxh7NzBSiOKtasc+fXyLL2OGwT4q2qBXbrDPYRt
	 zXlXNRx0xoXFugd8F/StrSHZ5t5HxaM7N6tLhdcioo1AMDBDHLUU+rZXDdZsSWlwGM
	 E63qHXtNP0wIemgNV+RF3eqC22DaGY/RzQkstvIE6p8GnXNyHfqc7nPl30X+6xCAXx
	 og/98fBXRJsCgUM4KBhUrv0AEJbiPa6T4wBqsoz1M3vuJLMsEgDqWpCDjpWSqS/v+U
	 82h/UYKE9qDKlWIRdy/uLlwwmVl5Gls6NO2fWhcD5MdDXUWe3PaS7Trs+2dPUsa2Df
	 VDun5Wy2IeINw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpBvVeiz
  JYNsOMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8i3msBXt4Ko7PvMDYwPiAq4uRi0NI4CGj
  xIef15kgnMtMEi/u9bFBOLsZJQ4+W83YxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAs8S3Q/eYQGwWoPiR9ldsIDavgJPEqgkQtoSAgsSUh+/BejmB6s9dfgg2XwioZuOXFY
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztkHNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0SqpKDM9oyQ3MTNH19DAQNfQ0FTXRNfI2FIvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwjFOKWd7vYGzq+6l3iFGSg0lJlNer/liSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QnexS1AOcGi1PTUirTMHGBMwaQlOHiURHgZm4HSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5
  US570HUiQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ824EuYQnM68EbtM
  roCOYgI5Yln8E5IiSRISUVANT243tmuWnVxka7TT/6HjAc73FNLuqG4qyJq6BCwxPaMmsVdy1
  yO2VcHfVyauaVy8qdWVvOvd8waWNkhpipjVvP+6YO+mLnIL+PcFPP1/wlTntDTeLWmTwrfBiW
  fnKpvm5p+8I+u4PY1Xe7W3MdNQj3H3ZlNiU3XN38u2N4hYOtdCMffrNVcNk96v2yqtVJxiiF3
  m2dPSFlDeueTR146zvH34tfx5zpXz75aly91WvKKlmfTYQ/hu7qEetuX/CS+2qFhmnS37f5m4
  M7P/w7rLNr+qJj1KyhV/cLt/ZFcn4MGfXC7d6mYv3V37WU9+tY6nkUNMa2qr/qUwvTT18Q+6F
  5R4Xfmxu3XVUlXGat9l/JZbijERDLeai4kQAqDu6ymoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1657177434!5347!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17766 invoked from network); 7 Jul 2022 07:03:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:03:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 05F491B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EEFFD7C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:03:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.06.0 -> 22.07.0
Date: Thu, 7 Jul 2022 15:03:23 +0800
Message-ID: <1657177403-28456-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177403-28456-1-git-send-email-wangmy@fujitsu.com>
References: <1657177403-28456-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97749

Changelog:
==========
 core:
  * Fix crash when filling in forms in some files. Issue #1258
  * Fix first lines of Annotations sometimes being cut off. Issue #1246
  * Signatures: Don't crash if the signature doesn't have a common name
  * CairoFontEngine: increment font_face reference when retrieving from the cache
  * Add ToUnicode support for lessorequalslant and greaterorequalslant

 glib:
  * Add support for stamp annotation

 build system:
  * Tweaks on how gperf is run

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.06.0.bb => poppler_22.07.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.06.0.bb => poppler_22.07.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.06.0.bb b/meta-oe/recipes-support/poppler/poppler_22.07.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.06.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.07.0.bb
index 989b35a5b..33723a560 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.06.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.07.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "a0f9aaa3918bad781039fc307a635652a14d1b391cd559b66edec4bedba3c5d7"
+SRC_URI[sha256sum] = "420230c5c43782e2151259b3e523e632f4861342aad70e7e20b8773d9eaf3428"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


