Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60EAC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:22:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.191327.1673940167857059785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jFzDeT+V;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940166; i=@fujitsu.com;
	bh=ap0yz+1MQdjrIoTjUY3hGgjXBYXC2P200/3rFII/apM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jFzDeT+VrJBkfu4k/fuV2EF8pKm/E7BDSu0mlO0nIfERfF2HAIuTx2sRUmYEg9a84
	 hgtu9xNfNifQvJ/Z/ZxMC+LCIuILB/qx52309Sg/JAVneNZKgTyyRqV/JTIgaXAYiC
	 ZCo7QdqsPupuguVG+LuFroEWiMckAQGBgjOoiemiuys6L5KypYskVoBHv7X9UnrhhX
	 yp2QCpbLxBiNUdNt/HmyWpDiJcp4gC9y3bxGWdZW+qyLKbUx/dcXWVdfrZHfi+ZKVO
	 OyZwfUcNKqzvbKSt/hiCiNlvy9GSObUE1TgGebFN+jq96/Oae3Nv5aBWf+Kiuj4Z/V
	 0eUJZlwIkkX5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfeoz7F
  kg5P7DC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oynq84wF0zkrpg7JauBcTtXFyMXh5DAA0aJ
  X10TWCCcq0wSS97vYIRw9jJKLL18nK2LkZODTUBK4sb9/2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhgTiJS6fOMHUxcnCwCKhK9PTxg4R5BZwklj9bxwJiSwgoSEx5+B6slVPAWWLG4eesILYQUM
  2/4y9ZIOoFJU7OfMICMV5C4uCLF8wQvYoSsy83Q82plGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FAvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4rVAnYwflz2R+8QoyQHk5Io70nTY8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HhPeQHlBItS01Mr0jJzgHEEk5bg4FES4Q23BErzFhck5hZnpkOkTjEqSonzHvYGSgiAJDJK8+
  DaYLF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwryPIFJ7MvBK46a+AFjMBLfYoOQqyuCQ
  RISXVwJT65lf930Ubjl/9bXa5//iDV59vPZ9zeFu/wuvO7/659aVV30qe7nm/ksF0Vl6u4RpH
  lenCFQqz/38qLmt6qTqRm7Fi/9T/Ot43UqUYrCa1lMmaBzMmyevUTrjT4cBVej3coCo6TH695
  Jn3rjzMbC82b6tqW/b0uukPzXx2qcdcPVwnvv7Q1/GdozGb4brAgd6VU6p93nKwKZeXXlFL80
  zlXK505dXJlB9Ox9mNNcI6Mu73iVm98TAzXfvkufoiuTsTm3VYNp70eHtm47r4+w++OZ+Junv
  ev9jkqsx9lmwBqXD9DQ+LpLglX398/PrIqm2mj/Vm/tAO9slu81F8uIlvpt5fSa/IineVp133
  rlZiKc5INNRiLipOBABaC+KJWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1673940165!405066!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13497 invoked from network); 17 Jan 2023 07:22:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:22:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 85EFA73
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6CA8E152
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:22:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.71.0 -> 2.72.0
Date: Tue, 17 Jan 2023 15:22:03 +0800
Message-ID: <1673940124-20377-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
References: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100617

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.71.0.bb => python3-google-api-python-client_2.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.71.0.bb => python3-google-api-python-client_2.72.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb
index 6cfec6f71..d0e94d8fb 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9412ad3445518fa9d24d02c673a70b07c9d124990f44763cdf4f5304ca5b4d08"
+SRC_URI[sha256sum] = "0ddf4a44256d4516635578b93a9ac0dfba7d8bd357cd896e68ef9c549a840b2f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


