Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC6CC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:06:51 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.30207.1652713601054051943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RnU49NJ4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713599; i=@fujitsu.com;
	bh=86Ecm6hby/yc4r0nkpfdvO5HpbxstBi7kpK2xUfrgSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RnU49NJ42pD4G8mhSboVIWrRQSbhNr5rL9yvuGxEuwBlUwIQP8hBmOPocGC7JNrnh
	 rxtaCktp5PTAMTEZTn3lo4Vh1fR178asXdi7ed8d5QIGcSnLDacLtV5G0AxTgeLtXp
	 6mehBgS4Bn0aZYyR+ULOPIKAAzRaJ8RjxsDiu1PvKSqmCGpvXhW4gJbhVnEw8PlZG+
	 ZyNQ3bZjN29S4x7/4I3ZCCLBe3Bp1meo7dxW/D9BRTfMKjWx3TSNF+1MqDdgOSUu2G
	 IVIsZqb92/2In63uT2zxLwJgJq8bs/RTPOUugvRLuUz2NfqZ/m3fGjI+dDTRe6waw4
	 NomCwVnz0jfLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MRoluX0ZR
  k0NqoZnHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZjxoeMVesI6j4vab6gbGW+xdjJwcQgKzmSQ2
  /LbpYuQCsvcwSsw5vRgswSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfPWA1wgL+Er86loHVs
  ADFz0/eAVbDK+Ak8WXHVbC4hICCxJSH76HighInZz5hgZgjIXHwxQtmiBpFidmXm1kg7AqJGT
  O2sU1g5J2FpGUWkpYFjEyrGO2SijLTM0pyEzNzdA0NDHQNDU11zcx1Dc3M9BKrdBP1Ukt1k1P
  zSooSgdJ6ieXFeqnFxXrFlbnJOSl6eaklmxiBgZZS7LxsB+O7vp96hxglOZiURHnXJDclCfEl
  5adUZiQWZ8QXleakFh9ilOHgUJLgbUgDygkWpaanVqRl5gCDHiYtwcGjJMJ7PB4ozVtckJhbn
  JkOkTrFqMtxd+HevcxCLHn5ealS4rwnE4CKBECKMkrz4EbAIvASo6yUMC8jAwODEE9BalFuZg
  mq/CtGcQ5GJWFe03SgKTyZeSVwm14BHcEEdISIfiPIESWJCCmpBqaUZ5kfMoQeJLw53NfIwWS
  vnHi5+1P/9mkr50UaxhSeOnM4s70jILP0z5326X47avdZ+Bw8Vx6a/fnz+8bp+WdKShPLN9cL
  LVvVP/9Spux3lZ71snfXp1z4nr28Snxtk+KGpReXZL69we5rueC645ObUR5zd1ZdLdRsC3frD
  HwpMsX00uVU0QnVj6d782oyv3q/u1XrfW7TYrZg9oKHtVvSI7iU1kQs5ww32Ci97px1ltL2jU
  H/b3jlv3VZIlL58K1NW/+SElmxHm+nqg+ab/ZOcPf9/TP6F7v6ec//UVvO76pmklM7+UpfRlR
  jX+oVyRzWSNXMz9xhZS9Z3q+xOqvxRmLjZQ7pop+rt326l67EUpyRaKjFXFScCADfEy7iOwMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-528.messagelabs.com!1652713598!16943!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15560 invoked from network); 16 May 2022 15:06:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:06:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 24GF6I1I008900
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:38 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:06:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220501.0 ->
 5.9.20220508.0
Date: Fri, 6 May 2022 22:48:27 +0800
Message-ID: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:06:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97127

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220501.0.bb => ctags_5.9.20220508.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220501.0.bb => ctags_5.9.20220508.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb
index dd8a163b0..02f01cc60 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220501.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "364032bec335e92ccb25b8b2bfee25012609688f"
+SRCREV = "3f9e162a2a2d49920550bddb6de9da46a8340a41"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


