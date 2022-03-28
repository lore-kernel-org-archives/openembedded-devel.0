Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624B0C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:40:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.9017.1648460416402484189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wIb6nrJx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460414; i=@fujitsu.com;
	bh=o54Brx+QK6JKcDtnPR2k850ICPowWZhUF/T1uBNP+8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wIb6nrJxxJ1NxWsBjp03NpOYByuEYXAaLgIs3DHAyUFv1Y255Zyl0Cg1TUArtdTSu
	 azk3PwAmEqAHtbka1PUSZZcylBzPRH1YWX5CeiXeUcb+WoeEisE5KH/N4dLFoawFxo
	 MECWldIrDPj3x28iUOINF0WOl64VfxSAPLD2COClrWP2lQeoPmEVaXgzgAu3WgMVLz
	 gzewXtBO2u2/ZzHHA4wFGzKJs/+731MlAcFeOqn/lYHWw1FO/M2Z8Ql4sIP0Asv68v
	 gWz/TmiyltW0Afbn+6zSh+nglPVZpIrIrw0mZh9BJX879bS9xbluAg7lqvzkDJXL0j
	 e4/OMXMGALsKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSbe2yTH
  JYP4WG4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePF48qCPRwVB6YfYmlgvMjexcjFISTwhFFi
  16RPrBDOBSaJTX+bGbsYOYGcPYwSd17FgdhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC1hKvJ32ggXEZhFQlfj1/Q5QnIODV8BJYvWpbJCwhICCxJSH78FaeQUEJU7OfMICMUZC4u
  CLF8wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjHaJRVlpmeU5CZm5ug
  aGhjoGhqa6ppZ6BqaGOslVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMz
  pdilfwfj/b6feocYJTmYlER5jTIdk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8FY0AOUEi1LTU
  yvSMnOAUQKTluDgURLhnVADlOYtLkjMLc5Mh0idYlSUEuc9BdInAJLIKM2Da4NF5iVGWSlhXk
  YGBgYhnoLUotzMElT5V4ziHIxKwrxmjUBTeDLzSuCmvwJazAS0eO07W5DFJYkIKakGpo0X2WO
  m1noqnZk21fv2iXsihcqxBkb7b5iHhf1h39mdMknMQ6DVq8T98LWWOzc3rVnGP2mFnryqcZNj
  YLj7ksq+N3c4VuSqKXH8ZPz3++/eBw/li5Zkb509Z/epBvfXt3/pRkp9nspg1XglzO3SDeO2m
  skuqpUF3459dF4wn8WjtLPRQdXgw+SJP7bv9Y8ONpt13NMkllc6rSK08Egk2+aD379b8Z2+5v
  yEfefeZ3tyEiJks6Wz3//h3z7daHr8j98MtfMP3O+7+3HOlXkX/z25lPCgMWW9jePxq8/Zitd
  3PV95c+bihwuOW7/is1xx7Xrrexc38WWfGRhFP3ye5MIuci7ofnW0u+iH5i6Lxa+UWIozEg21
  mIuKEwHdZiP5RwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-532.messagelabs.com!1648460413!31686!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15624 invoked from network); 28 Mar 2022 09:40:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:40:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 78115100445
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6B70B1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:39:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.25 -> 1.26
Date: Mon, 28 Mar 2022 17:39:38 +0800
Message-ID: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96227

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.25.bb => iwd_1.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.25.bb => iwd_1.26.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.25.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.25.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
index a89ac3d90f..6248850413 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.25.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760"
+SRC_URI[sha256sum] = "0ff4541c2b7f14ec010c3cbd1f02350f1b58cb0c103412db22550e90d8040d6b"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


