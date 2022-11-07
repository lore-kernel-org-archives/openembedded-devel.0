Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4B9C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:36:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.1191.1667810200427187182
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u/nlSp62;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810198; i=@fujitsu.com;
	bh=QOLKM3w778H7FZm+IYlmDcgWZq1IXSjysbCT0ezCf1w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=u/nlSp628goFO4ey+pX8sQz7UuyTsC89eVyJTrlg8FIWvI2AjiNvI4FU2uXfEz+FB
	 WF3OOpbcIoXOdr9tilCKrgfuybYHz4/8IQKE+9tZAyCRshLnLZiy8m47SCFGxApvds
	 D6I4eUTFMby2GR9sIuhVb9BJgkqSYLMEQbbTcSYBRjdBb7oCFPRnCHfLNgAYhEZaOY
	 5Mgah3f2ylc9LHBjqZnu3Ov+cBHP2ZfiHbMsY/1+X9kVGJhAixw2mg+sVd3rVBsaXw
	 2Ngqm4nKvYaZSLjSPFFXENu5xf3LNWK4tuZJpqHCEXqOCHUIG69EkoyoKjah9BceB/
	 vsFvZRzxJED7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWXfa4Yx
  kg+M3OSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ow9Hc0sBct5Kl60nmFvYGzn7mLk5BASeMgo
  8eeBbxcjF5B9hUli58mLjBCJ3YwSXQsSQWw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBfwkuk9fAIuzAMX7Wk6xgNi8Ak4SFx98AJspIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRvPi1KKy1CJdQ2O9pKLM9Iy
  S3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAYEwpTpXYwdiw/I/e
  IUZJDiYlUd7fyzOShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw3tgIlBMsSk1PrUjLzAFGBkxag
  oNHSYSXHRgdQrzFBYm5xZnpEKlTjIpS4rzXdgMlBEASGaV5cG2waLzEKCslzMvIwMAgxFOQWp
  SbWYIq/4pRnINRSZg38hDQFJ7MvBK46a+AFjMBLa4uSANZXJKIkJJqYDo+b95kjdxPcy1KjWa
  t7ZS5M/lfr8o0Zma1Cc9PfK+ePXv/8ydHe0MrHt+vDTY7KeS+ys1OXC1Yf4uz9evj5osqytz4
  xES/PFSQX/PqTYS1tad3/eQJ93dNi+Hx4lDunlLDOFs0zUJpj+7a+zx1XIfkjr360v1c3FGNZ
  bZNaKzwBVaz0++2/7dgKVkWnz8/plzhmOs3nhP/NY8Ucu96Kfn7kbye48+jm5OcJpRlHOuWtb
  KdelzssFFhzpej/5ptj79UX3pg7v+Z8xfePnzyKJt4pbF4zeqtVjOT3DOmcu0/8tDhlwUrz/G
  3HRV27BN/MOq9dCiPyi3m+LdW6sAdzwXssStUEvtCum6ffmv9e4oSS3FGoqEWc1FxIgD9kA3d
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1667810197!220370!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25828 invoked from network); 7 Nov 2022 08:36:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:36:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9DD17154
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 91A34152
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:36:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gevent: upgrade 22.10.1 -> 22.10.2
Date: Mon, 7 Nov 2022 16:36:15 +0800
Message-ID: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99462

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes
--------
 Update to greenlet 2.0. This fixes a deallocation issue that required a change
 in greenlet's ABI. The design of greenlet 2.0 is intended to prevent future
 fixes and enhancements from requiring an ABI change, making it easier to
 update gevent and greenlet independently.
 greenlet 2.0 requires a modern-ish C++ compiler.
 This may mean certain older platforms are no longer supported. See :issue:`1909`.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_22.10.1.bb => python3-gevent_22.10.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_22.10.1.bb => python3-gevent_22.10.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb b/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
index 9319dad89..b9bf9130d 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "df3042349c9a4460eeaec8d0e56d737cb183eed055e75a6af9dbda94aaddaf4d"
+SRC_URI[sha256sum] = "1ca01da176ee37b3527a2702f7d40dbc9ffb8cfc7be5a03bfa4f9eec45e55c46"
 
 inherit pypi setuptools3
 
-- 
2.25.1


