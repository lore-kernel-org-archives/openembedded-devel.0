Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B510C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:42:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.9048.1648460536599773208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ag0ZIy/n;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460534; i=@fujitsu.com;
	bh=Llb+1FNnv0/ZfSaVk3C63Uicu+sviUJZupf2RUWFgWk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ag0ZIy/nqmWUMytT6zVuRQaxFP1o8wVJ4V1tQFuh+s/ABOfm6f64AD/pywMlTQpUb
	 YnD6DUbodoshgXi04fWKUyLj0Cz+GyeoxJwqOc2u09fDygRVCUQ2YNMQ1U74jzDI5t
	 wYAMF1qEkyPa6IeZyPYKQuydEnCF8emdQ2D1o5A9FjQklyOD4f93kG1C6yepwPvPvk
	 Bj5cAWnCjL6Dx/VR0+O5jnbSyL7BKXOlLTI18KXCJwYYSWHlTvnLaQAIsfqsKgkZes
	 dTpZLbqA6YnqdC9dh1KEfPVz2Xt4EIpBoi/+PCNrnJzAEg8HHSf21wUWiG3fF4zXcV
	 LAE3iisjNO0kA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqPutyTH
  JYPsHZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePi1qeMBas4KprvrGJvYNzA3sXIxSEk8IRR
  4vDdbSwQzgUmiUfPuoEcTiBnD6PErBY1EJtNQE1i+q0brCC2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAXuJNfdeANkcHCwCqhJb5nKBhHkFnCS23ZoC1iohoCAx5eF7Zoi4oMTJmU9YIMZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGy6SizPSMktzEzBxdQwM
  DXUNDU11DXVNLvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwIBMKWa03sHY
  0fdT7xCjJAeTkiivUaZjkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3ooGoJxgUWp6akVaZg4wO
  mDSEhw8SiK8E2qA0rzFBYm5xZnpEKlTjIpS4rxrG4ESAiCJjNI8uDZYRF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMxrBjKFJzOvBG76K6DFTECL176zBVlckoiQkmpgMrkXdD3qX+5t9ef
  uHlFvjQ+U5XKafLph/m9WfGe3/281Zf+Pa75bbZ+hPr3Wr1rF/vOOt78leva/yJTqbzu0wcCh
  It5r9S1WxZlfvjHY731psJjpDNPWZaslT/Kf+xdcfzrJmC1N29X105yzjoy1TNkem/8z5Siwp
  MgYa58+PWeKk/iVsNfqXGKWs1eqOM7PCdJV+mm99O5j/X4eLd0FK5al6nB+/CJe473zBUPrGT
  3nP8HmFa1N7U9nO7xc1q78bZd7yMpXE0wr+gNj3iTY7eO2np/sVtbz3/Qj7+zSp7t/Kkcf7H8
  1996F2A9fpupnXJV1mzHhg6bBqYU8l3YGRtwX+bFg917hWXIxfpnySizFGYmGWsxFxYkAAYes
  o0MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-33.tower-587.messagelabs.com!1648460534!25229!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26331 invoked from network); 28 Mar 2022 09:42:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-33.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:42:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D1FAF1001A9
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7EC4A100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:41:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.7 -> 0.3.8
Date: Mon, 28 Mar 2022 17:41:40 +0800
Message-ID: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96231

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.7.bb => libxmlb_0.3.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.7.bb => libxmlb_0.3.8.bb} (91%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb
similarity index 91%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb
index d65e043ecd..38704f8b93 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "dc96ba2327bb1f408909b2cd7fb4ecc318e8165a"
+SRCREV = "4782df2cec808f71762aa9f69c11759b4e127b61"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
-- 
2.25.1


