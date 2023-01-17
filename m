Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A79C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:26:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.191120.1673940399128580342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nZTLyp+v;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940397; i=@fujitsu.com;
	bh=83ufGQcFaHOfHD3Wve7ucotChPhQwjvqCwm9IY8nJGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nZTLyp+vvw09/e+TN+YHYamJLw14k/NB2S1Nkb8GOEj0hJK9fU7iyKr2GLq1vcXPM
	 K19lnhy73poxU/So6TMjgiZKXVYtXGVGlm7JMS60kRNbr6X0Ddzei2DH4AzVCbU0Cz
	 mOU9ZByNsaoUE7vbRIU4njaKzp2/+TCFwTm/UTd2yIrwKhhdGCSpkIju8JeEm33N9n
	 PII1vr3T/2MhaCjanoudm2IbJPl+nisFa8m+KoQXplo9zWomPNpiam6rcCy0hKQTs5
	 Otzo5OBQSzB+1rtcumqOOx+tLWtajc8mg42/hsvRXXSr5qrcuh8+B4FiGVEeGQ9J4w
	 QsgM72ubVs5Ng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWXeN77F
  kg/0PFC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxFM+ayF8znrJh2di1LA+Muji5GLg4hgYeM
  Er8/XGXsYuQEcq4wSTQvsoNI7GWUuH92DViCTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFPib9T3zKB2CwCqhK7998Cs3kFnCT2Ne8CsyUEFCSmPHwP1ssp4CzRNPccM8RiJ4llU1
  8zQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQvTi0qSy3SNTTTSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN+U4lTmHYyXl/3RO8QoycGkJMp70vRYshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  lNeQDnBotT01Iq0zBxgLMGkJTh4lER4wy2B0rzFBYm5xZnpEKlTjIpS4ryOPkAJAZBERmkeXB
  ssfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ19AaawpOZVwI3/RXQYiagxR4lR0EWlyQ
  ipKQamATOXu/eJXfwPeOx7Vf/+JcJ7TLZcPhKwcVVS1yDGHLkyzYdE/tx8FvB/n8Pt3hky8zI
  1o60ZJvgodNZFSP09aI7xwv9yA+MIVsP38meMKXC0b6NS6LdbgNj0QyhSQtmSwesbjtpVfl+P
  uv35Y97Hs3u55rtWPH26XuTZJP/rAFrDtz5/9Bm5csa3bXXDrMeO3tnZZJ4BtsWeRMtdYf9nG
  kZ7Baqq3xOzcvYtS94B/u1U1FFIQVTqhYnXk//c8Y41t17S3mKtOk5BtWpPpETVFr+Cnzgsr+
  3pkY10P0Jd/bSTXlpLjVvVnn0C6o+OH7pQ4Dum7bO9k1Hq5ks9Pj/80vPlGh3lQjbMF0oQe/p
  MSWW4oxEQy3mouJEAJSNhHNaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1673940396!379313!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26155 invoked from network); 17 Jan 2023 07:26:36 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:26:36 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 066D0150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:36 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EEBAE73
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:26:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.17.0 -> 1.17.1
Date: Tue, 17 Jan 2023 15:26:15 +0800
Message-ID: <1673940378-20528-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
References: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100626

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.17.0.bb => unbound_1.17.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.17.0.bb => unbound_1.17.1.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.0.bb b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.17.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.17.1.bb
index 0dd0ce882..caa1bb339 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "d25e0cd9b0545ff13120430c94326ceaf14b074f"
+SRCREV = "90831af981221bbce1cd7b15055562336760e484"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


