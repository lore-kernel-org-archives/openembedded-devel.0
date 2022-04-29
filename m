Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC6BC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:22:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.29558.1652084557953208325
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h7clO3LA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084556; i=@fujitsu.com;
	bh=j/WWZk5BrYOBd4Kt2iOIm/PREuMEtXtVQGByL0lRM7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h7clO3LAMjWp3suujwLqhV82+Zom/7gKmvEKb8xEY596lvidpV/pPe21bUikx5qoh
	 4TsQNOPQ6Gc1CkmZ+064V2O8FFBYmUUPk332dOR+fjnF4Uhdn6eonas39cfN7Qk7to
	 InQ3+JFd9pgDtkmIRANS4cSWWD9yUH1AYGkAtx4ufMSwAEWB/8Xk2RiVzqN5MUec0L
	 AKwAAVEBriaoyQDFl+CvIyz0pmvEt/fmiWRzUFJo0XolmRmgmhAo257z/8AX1ixKws
	 sPxil0lAYhKK4Iy9rf84upXmAwsi/Pwf8q7wpVxSD3NLzqT0I6bEhGxrhZZRnA7Qlx
	 e3TgP9aklbBeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqOt9viL
  JoPGOosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFozmb2gg88FRs2czUwnuXuYuTiEBJ4wijx
  qvUeSxcjJ5BzgUmia2kMRGI3o8TPaTMYQRJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hK7J5zCyzOIqAqsathIlg9r4CTRP/UmWC2hICCxJSH78FqOAWcJdZP/MUGsdhJ4sePW2
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGO2SijLTM0pyEzNzdA0NDHQNDU11zYGUgYVeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCUU4rdcnYwfuz7qXeIUZKDSUmUt7KpIkmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBK/DKaCcYFFqempFWmYOMK5g0hIcPEoivHdPAKV5iwsSc4sz0yFSpxh1Oe4u3LuXWYglLz
  8vVUqc9/tZoCIBkKKM0jy4EbAYv8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcOZApPZl4
  J3KZXQEcwAR3xMaAU5IiSRISUVAPT8b9z21N9pd8E1q6QWP3p2QLNejv7B7kV3tYH0nhjTk6d
  ZB+wtv7ba+OLV8o2f6uLMHsssZD7MIdF30kzS2tFpmOs1c7hM4+e/bOzdc2ZIsM3jFPu/9kQw
  P6es0Ryzk6X/GbvR1qXOHscPX7ued/Mt+PXF1sLjxPL8tws5jp+vOP898wF7gqO6ojymdENb/
  vuuQqefeq4RurCnnnfNGZfXMv24Hgq48XvounMFpcs7v0Lfij8QP1XYvSDq/eX5wplaLxf7PK
  kZLHs+TkibBFqUWo7+o+Ur7xUt21Kz+zWLULbLKr0nbyFfSarn161V8vuQMaXk7EFuydtlmJI
  37/o9q1u8Vd+B6de2PtQiP3keiWW4oxEQy3mouJEAHFEncxsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1652084555!134440!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27168 invoked from network); 9 May 2022 08:22:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:22:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02F7610018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BA113100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:22:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.9.6 -> 2.9.7
Date: Fri, 29 Apr 2022 16:03:00 +0800
Message-ID: <1651219381-27379-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
References: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:22:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96994

Changelog:
==========
Fix for saving keyboard layouts in --rewrite-preferences.
Faster and more reliable restart of icewmbg.
Add themable preference ColorKeyboardLayoutText.
Add KeySysKeyboardNext to switch to next keyboard layout.
Document alternative keypad handling in icewm-keys(1).
Handle right-to-left languages in icewm-menu-fdo.
Add -g,--generic option to icewm-menu-fdo for GenericName in menus.
Updated translations: Czech, Danish, Finnish, Turkish, German, French.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.9.6.bb => icewm_2.9.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.9.6.bb => icewm_2.9.7.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.6.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.7.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.9.6.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.9.7.bb
index 2112b6276..00377bc1b 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.6.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "f8f453fc1f0009e3e7f113fd128638770894d004a3b60202922e2c7347c30607"
+SRC_URI[sha256sum] = "c25f78e3f3ad49fbebc715691689d0ad1fda46b2e2537ad69e3332a54b81c72a"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


