Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00CBC4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:18:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.101789.1670066323848455136
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NNOG8tGm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066322; i=@fujitsu.com;
	bh=VuKQzQI3tdJW7IUOMTrG5P5u/S4SkziCqyvzdoMBMQk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NNOG8tGmXSt7e3iRhoWiWQCoV0mpMSQoBUYw9Kc09TgMlTn3nsC4dYB8f+DDn6hs8
	 dikX7Li0OgcNH/g7/j2fKeqW+RYKN/rvrRQAeh8QxUFG1GBL3RY5ZcA5YBh5XhKM5V
	 mAi3cVnhX6vL9ocK7tIAXzpruRB3M6/e2/V2TbpSf8hAjX16iAlY+i0OSXiaE+grZJ
	 KmbHza0QRjQsyYFDHsv0KcaWzsTAa4VbBLCMejBkVUmVVkQqkSHqhlug7RDywer5bv
	 bFtOjGBIj9hCzBPNDTtvCKBn3ZnLdGEUv3XIPFjFgJ1IBjWXRV8lH9O3SsjdUoFjp3
	 3c1CKN4vzjaJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqDvRoDv
  Z4PQzTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePyvpqC1xwVd140MjUwTuXoYuTiEBJ4wijR
  dOk4M4RznUni/LotjBDObkaJe4v7mboYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCVWDX1HVgNC1B86eqtrCA2r4CTxLo/p8DmSAgoSEx5+J4ZIi4ocXLmExaIORISB1+8YI
  aoUZSYfbmZBcKukJg1qw2qV03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdI72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwFBMKWaZvYOxZ+kfvUOM
  khxMSqK8x8K6koX4kvJTKjMSizPii0pzUosPMcpwcChJ8AbqdycLCRalpqdWpGXmAOMCJi3Bw
  aMkwtulCpTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ4rxLIDAGQoozSPLgRsBi9xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV0wPaApPZl4J3KZXQEcwAR2xkb8L5IiSRISUVAOT+eX
  3s6sYNE/MDGuerdD88NGNU/abqhWF705nuvyqR9fvYkf5z9IImaVfj3v/v7dnzm/dzR+rjvhb
  vGHS3c6R9DvB0fVe0OvlMVcLz/zdOHPRQQmDnMfX9e/37517lCFeJvegn5PQnEflD+d8ECzcF
  /Py7QzFIt9a9q2Pbf9bn8vm2v8pMWKVb3zS9HX7PuzQe8RWNtktc96s5lWx9SatGn+E6nP3NU
  kp/1rv3h7CNlGz5+Wu/dz/Y9Q9NtZcm7go+P7jG1u32MkzhMpriFzOmHaq78hE7zv2hp231Fc
  1M5a+m+Fo+3aP+9ZtDvfTrrBEf/hxwKByucHVbH+Zm80GTOv8Dxl7yij13dpeeHH5AyWW4oxE
  Qy3mouJEAOONz9BMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1670066320!42320!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1348 invoked from network); 3 Dec 2022 11:18:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:18:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C6A36100191
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BAD51100182
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:18:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asttokens: upgrade 2.1.0 -> 2.2.0
Date: Sat, 3 Dec 2022 19:18:11 +0800
Message-ID: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99931

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asttokens_2.1.0.bb => python3-asttokens_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.1.0.bb => python3-asttokens_2.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb
index e4a21ae3e..847f164fe 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.2.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4aa76401a151c8cc572d906aad7aea2a841780834a19d780f4321c0fe1b54635"
+SRC_URI[sha256sum] = "e27b1f115daebfafd4d1826fc75f9a72f0b74bd3ae4ee4d9380406d74d35e52c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


