Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C674FC352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:15:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.101882.1670066157574253804
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sd0xIuQx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066155; i=@fujitsu.com;
	bh=kraXbO+h34/+M5+GR14Nj3F4M9nu8YyObcu0fNYznl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Sd0xIuQxqP0GLrZoR9buHie/56txxadPaUAUDgso5kilaYv7JKr0mEdVLNC78twFw
	 3da5jctaMY1dr1gkGlnpgP9IP4y2rkuM11W7McTxuSwZ1s/8nBvpuNFNO2lB5UcIm/
	 IyVzwCccySLEFS4qX1cAf3+sC94E6u21QdJkwQVW/YlpmIkfoJvdF6//+qtNGZCuwI
	 qbByUoQK4mfWz6TmBmbo5pwld4JpleMqpKbu/CVeCct02bBEW9vl1XHlxjBbGZWKOo
	 uCGxnAjZQXEuEHAODKZfF3wO/wT298OCuwvayCo3xkGXUIM1mFKS5xFx4qh3SpJnUJ
	 7E4H2bTOsyrAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWfeVfne
  ywez9BhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bLL73sBV1cFetmtLM2MM7m7GLk4hASeMgo
  MX11NyOEc4VJYtvpU8wQzm5Gidczb7J3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsECQxO0Fk8HiLEDx9a0XGEFsXgEniVlbW8B6JQQUJKY8fA9WwyngLPF9ymywuBBQzZbnX5
  kh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGhroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgSGb0qxSt8OxrfL/ugdYpTkYFIS5T0W1pUsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3E
  BgRQoJFqempFWmZOcBYgklLcPAoifB2qQKleYsLEnOLM9MhUqcYFaXEeTfpASUEQBIZpXlwbb
  D4vcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcMZApPZl4J3PRXQIuZgBZv5O8CWVySiJC
  SamCK/HjxeYSyyIR8lzOHmn60zC+xvGEwqWNegO6/uYcKiq6fOaNYY/5domuO/xmO23Osp3ef
  LHfhi0vxkKw9IBtgJr948Z/3vJNY/RffE1OffHLrBf3Ok3sduTQmHhFjvjjF/6PecQbV9Vd5z
  P0eVKSJh3vXBk1/K1HdMbXjV7zzD/XuSsv14Tr6ZxqvfE0MK40TEZZJ9Wts781m0Be+zjvruk
  6hkCWfqPKpL/3SRRN6DZ+f3DI94tgpl6eqpe/fyJv/uR6zWdP/yO2g88dEpVc92b9cLH67VtW
  UP3vWn1p+79nR/VtajrcIG9+5ccXgUvimXXVyYmdu8p7wXb9wak0K3/ZXXDM0d8Tq5R1ZW5aj
  xFKckWioxVxUnAgAqTV8tloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1670066154!64872!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2668 invoked from network); 3 Dec 2022 11:15:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:15:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 815E0150
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 752D6153
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:15:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.51.0 -> 1.51.1
Date: Sat, 3 Dec 2022 19:15:12 +0800
Message-ID: <1670066113-24646-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
References: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99924

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.51.0.bb => python3-grpcio-tools_1.51.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.51.0.bb => python3-grpcio-tools_1.51.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
index 1255fd765..c1dbde1c9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "264abafefc3240aacdc6e0c7765a8a20c284f1267ae0dd899084f07694b55095"
+SRC_URI[sha256sum] = "8e62d23d3fed9d4f81738f98dd193dbd2e21aed4a8f0dd715e75b5439e649727"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


