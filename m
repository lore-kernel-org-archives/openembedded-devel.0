Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98025C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 23:42:43 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4984.1636501361869668014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 15:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vgK81sms;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636501350; i=@fujitsu.com;
	bh=rPOriRFGUB5Ofc9cMhtrNw5pR1dYAZZnE4h6weGul5k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vgK81smsAmvV4BeINADRyh+L4weQclfxOPyd93TGqhnoLQKOTh1STrSblS6O386bL
	 2SIiumZZOeFOII+c7akkoFEsNtFLcbwMSxhzEDJgWxKcKecADIog/pdAQ3TLEHEk4N
	 KvmCHCARPFEjFtjGiweDnkK15Ay3v5OYMoF5+D7jzQVZDlimv+dTFteviOwNDY3hfe
	 KryJKn7XMF7OlUxjOQ4/ok8TOlhP733+jIR4Qy72DMRcqiDRnwCEo/Gg74LLnEbDsR
	 WO0kEeRUg4K4uNKJCOd/UdkZhylB9ROKrcdgUrjuWxyMQ9EO75QnlMUqfJF9EXnpEz
	 7zdVuMrBAxkGQ==
Received: from [100.112.197.16] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id B4/C8-17294-4670B816;
 Tue, 09 Nov 2021 23:42:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRopvC3p1
  osPCyqsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH5lVHBfY6K/7PvMzYwNnB0MXJxCAnMYJKY
  0H+NFcI5zijR/HweYxcjJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg9jCAu4SzU0dY
  DaLgKrEpl9TwOp5BZwk1p8/xgJiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YIaoUZSYfbkZqr
  5CYtasNqYJjLyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlua6hsbleYpVukl5
  qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmB4pRQc7dzB+OvVB71DjJIcTEqivJHTuhKF+JLy
  UyozEosz4otKc1KLDzHKcHAoSfCGfQPKCRalpqdWpGXmAEMdJi3BwaMkwmvF1p0oxFtckJhbn
  JkOkTrFqCglznuPFSghAJLIKM2Da4PF1yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwPQK
  bwZOaVwE1/BbSYCWjxwS/tIItLEhFSUg1MOu9ZFfrKFDpWOyv33pPtWBYRY14av6bO/KlboPl
  xQTZF2a8c7OEdHEtDn5zOU5xzqOS8zN5/ixrW/MrazXVIre/ffv/AppMtBmY2CjrMZbyTGndV
  +jwV71hts4NT1M6kmt0xKKr4gM2XPxF9mw3trdw0Ww16HCIuufE2GPK68ut+4mV2CNz7OenS6
  eB9za49guxhOfINLKukq8R6fcV08ir/p32O2rTLdGvkKpH5fCcDy70+9mwV65Cd8Tdz+uH1rx
  5kp9SGav1Ze21PtouZ30P7N+mbBP3W9JTNnrJhgUTrUsPQ7XWOcnViDwRdJOYtmpH04q6TUde
  SeIENq53/L1lrpVLH2Dr//p48JZbijERDLeai4kQA8JvauSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-287.messagelabs.com!1636501348!45027!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28407 invoked from network); 9 Nov 2021 23:42:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 23:42:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9NgMDT001659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Nov 2021 23:42:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 23:42:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.124 -> 1.0.126
Date: Wed, 10 Nov 2021 07:42:10 +0800
Message-ID: <1636501331-62287-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 23:42:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93893

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.124.bb => debootstrap_1.0.126.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.124.bb => debootstrap_1.0.126.bb} (84%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb
similarity index 84%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb
index 4fc59adfbe..38b015c401 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb
@@ -11,8 +11,7 @@ SRC_URI  = "\
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[md5sum] = "8a5e97f60236c3a63f715c056a5f0e29"
-SRC_URI[sha256sum] = "7700e9864b29f166b26c54153ed8c275b46f4b9a60468bb607e019a64c16cd8f"
+SRC_URI[sha256sum] = "bc48e1c500c33bed50bd00d201f338d3c92d6c0dcb1f202c3bc00ef01f96c618"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.25.1


