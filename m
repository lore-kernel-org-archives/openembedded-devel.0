Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FD0C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:40:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.8968.1648460416267700859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XuNS55ld;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460414; i=@fujitsu.com;
	bh=wQDtB1Oh+6yVs71kv/pld0xIK4teWnfu/bT1ViXy/CU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XuNS55ldOQNyNvMHbaDaqO0rcrmxO1y45DvJZeNMx7HcZbYEhxkFgbKJGQDQASH+n
	 vlxuSIDVVMxyreltaiS/i9K4tgZX8btVuw/0m3tGpNHGHft8hqs20yMVS6TzYfUu+C
	 XT+2M7c6x4RPV368slGacCY0oiqxMpGwKvJbZ7Jv5HBe4xXdSXxQKoDgChgWd9eePX
	 6+xaxr9bvDCSTouauFwdel4u3Cy8fHquETWwKLg8M0uUCLDZKcWM+z2a5jSbccONBC
	 Qy2BQGqyYHpF74z+qcS4mADGSczVwFw/JngoqI7uftA6EnZ2EDrfKWofJr783J91kA
	 dxTc1qIPvL3Kw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbe2yTH
  JYNIcK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePyhlssBXc4Kja9UWxg/MnexcjFISTwhFGi
  ceYpJgjnApPEz3nnmSGcPYwSE298BcpwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw/QK
  A4OYQFXiTfT/UDCLAKqEvs/LWMDsXkFnCS2rrsBZksIKEhMefgerJVTwFmi+8EbdhBbCKjm8I
  m7rBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWBpJGxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYAinFDNU72D83/tT7xCjJAeTkiivUaZjkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3ooGoJxgUWp6akVaZg4wnmDSEhw8SiK8E2qA0rzFBYm5xZnpEKlTjIpS4rynQPoEQBIZpX
  lwbbAYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNesEWgKT2ZeCdz0V0CLmYAWr31nC7K
  4JBEhJdXApLFJbpXCN32mqWGbUxadjp4Qs+XUouMJ1rGFX98+55v8904BE0chm6szd8AVhaCa
  h1eT+t6YJLh3yR7wLAnlPXKTs9Bx7eSehYV9Oecu370Yop78ceb9a2ucZy397vaqvmfaxorDS
  Yukig+Gl3u9WT5tcjtrkpJZTpOEoFWDYqq6C5f946Xrq48d+9Na2s1gXx2SLJIw8aari/09g1
  TJmecUcs83Ob1NnDvJwFbS6ukB3qf1/dsLJ+kdfLS9pq8r67SIvzifvtqSmFOfVvSlT8pyYOJ
  YnqChe9L4ufG/CQf65nptKYjx2P4nNPgpW/i98N3qgalL9F/O3K5x98bHHWctVme+NXxkv+dq
  4vtnSizFGYmGWsxFxYkA29zF01wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1648460413!163868!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8130 invoked from network); 28 Mar 2022 09:40:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:40:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7B668100446
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6E8EE100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:40:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libgsf: upgrade 1.14.48 -> 1.14.49
Date: Mon, 28 Mar 2022 17:39:39 +0800
Message-ID: <1648460382-15591-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/96226

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgsf/{libgsf_1.14.48.bb => libgsf_1.14.49.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.48.bb => libgsf_1.14.49.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
index 22599f599e..f663141bd5 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
@@ -9,7 +9,7 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "ff86d7f1d46dd0ebefb7bd830a74a41db64362b987bf8853fff6ab4c1132b837"
+SRC_URI[archive.sha256sum] = "e9ebe36688f010c9e6e40c8903f3732948deb8aca032578d07d0751bd82cf857"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.25.1


