Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5E9C6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:11:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.6949.1677928308192057402
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eoMUEQ1B;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928306; i=@fujitsu.com;
	bh=T1mU8OpNPTL6GopX21Lf7niq/e70MeQOoKbLCBCaeQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eoMUEQ1B7jo87LD2IZM2JrrykfROJ9Q5Oh3YY5lEhQH29uBVKDjMjl/BBGhkiPyKt
	 5uPnNTteWz2X2MeJ+0aRSiAhVaZ3riZJPhqJSMy9CunXMN6OEL/R3gDMyExXL5cgK4
	 CA1EcPyhW2KxsoGO8hfo7E7jZwXN8J9R/Kyhp7aFtJYqewL6ft5826UKb0oPLF/glh
	 P3g3TQiYUE0x+hj/7XbtQYFzdIT2gv7U+seZjlWDJUIBbajphwgsFFJA5JoGYZs9Rb
	 Ydn0OpzKGv/+ryCNvONo3snnI9eGoywNDiD8bt7Kq0l7vtb9NTjl/w9BXL731YzTng
	 QEAAv6ryNazCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORpFuozpx
  i8HWhisXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFp9QfWgjbuimNfihsYW7m6GDk5hAQeMkos
  u+DaxcgFZF9lkljXdpoNwtnDKHF+wk02kCo2ASmJG/f/g9kiAvoSS2fvYQaxmQVUJF787mHvY
  uTgEBYIkPj2XBMkzAIUPtnVyAJi8wo4SdyfexisVUJAQWLKw/fMEHFBiZMzn7BAjJGQOPjiBT
  NEjaLE7MvNLBB2pUTrh19QtprE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW65npJRZnpGSW
  5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGYUsz0bgfj8r6/eocY
  JTmYlER5J7EypAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4JVRZU4REixKTU+tSMvMAcYETFqCg
  0dJhHeLCFCat7ggMbc4Mx0idYpRUUqcV0AZKCEAksgozYNrg8XhJUZZKWFeRgYGBiGegtSi3M
  wSVPlXjOIcjErCvFtUgKbwZOaVwE1/BbSYCWixxmkGkMUliQgpqQYmEf/AtQWm66789jJN/OC
  34cOD23Mevrq/56RS+OPFE1fErr5zptgvfvL8X1mt1w6Gss2akVrAPTNL9Fft4dLZJfvPZsQo
  3TaN4/Fh+GgyQ7Bhbajzm5sFUwVzmAvbNVLM3qjLrg4/+ShzferBwr31JqcE5Zb2X11rfPzih
  U/fBPOXTDbObEhV2M7A+79cmjWtztpn07Vb/be0Pvotf2RoOem+7/XANS2nzvpZCJSwPvvCwF
  CafSRaz0KyvDQzuD+J98zprwv3HLHfdK1s2w8DwcJPduv0ZzurdUxzVJ/+8rrqt6OnP9Y4nS0
  +xlN416P1o9rMiU/fP+Q/euJ1x9TG0899N2ZfVxDikBdwMFfZqsRSnJFoqMVcVJwIADIsbiw+
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1677928305!150252!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31219 invoked from network); 4 Mar 2023 11:11:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:11:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 38FA41BA
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2D7901B3
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:11:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.168 -> 2.4.168.1
Date: Sat, 4 Mar 2023 19:11:32 +0800
Message-ID: <1677928294-23089-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New
-----
- [doc] added the Jupyter notebook used in a.7-rest-api-extensive-
  restsearch.

Fix
--
- Properly handle missing parameter in CSV importer.
- Undefined variable in event delegation.
- Remove reference to old pydeep.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.168.bb => python3-pymisp_2.4.168.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.168.bb => python3-pymisp_2.4.168.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb
index 2beff5c33..3d55f35c3 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "9a7adb2e0d60d2edee9f541db808652875bae20e"
+SRCREV = "5fa99aa55706321767576ea501ce08416d970ace"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


