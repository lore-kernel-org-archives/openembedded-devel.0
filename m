Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D194AC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.3052.1663064258784334139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OuBED8f/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064257; i=@fujitsu.com;
	bh=4fdVr7ImM5BRGdh1QL4SbM+qNpjxLiY3vR4UUAv0Jo8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OuBED8f/UzYdcsiTqbe512Gnl3aeT7AQ5c6COOsg0Ae3ecdewBPGBgzGkwl6Ei0r1
	 WvNMUefAVP3IwowVO60UZHYkq1Y+tk6wfBto0Bz11kA8/jvYTePzx0ezvO1M5rJWhl
	 5NI7vNNMkqGv6n5Pkp6F2OggWG/1XJh/vfjOV6s1UtkjLaEn1P8ZXEz1zqkHx6q0xn
	 56RWimeMaGOtbhNgabNnx6joh/6c0AfzBIl8U4dDM3imPqchsf2rj+TtHjmohQ5qYm
	 cPbOEZFoZCB1WS0j0PiWcOYKdkrttBFuhZfvWKafb4+yyyIw6OCE1I2WlXt4diQ/TC
	 IDLqCJYldfFhg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpHsgQiH
  Z4NkrQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNr/nrGgnMcFR1r7rM1MP5m72Lk5BASeMgo
  sfGIAoR9hUli/8KyLkYuIHsPo8TWHX+ZQBJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DN
  khYwEfiz7nrLCA2i4CqxKdX88FqeAUcJZqOLwGbIyGgIDHl4XuwOKeAk8T65wtZIBY7Sizcsh
  eqXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0h0Tj9ENRMNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YLZOKMtMzSnITM3N0DQ0MdA0NTXWNdQ0t9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM4pZhZaAfj+r6feocYJTmYlER5I70UkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  MaHAOUEi1LTUyvSMnOA0QSTluDgURLh5QkGSvMWFyTmFmemQ6ROMSpKifPO9AZKCIAkMkrz4N
  pgEXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvRBjQFJ7MvBK46a+AFjMBLTaylgdZXJK
  IkJJqYGLn3ztrg0Hf5qyLCx6Je3XwFEa8rfssJM0ck2qT9uD2qob4Yz96NPcmOSwR7rrpK58Z
  pfi9/+y//392ZXgKNK830m9m+y55dU23vFYc+7uUpMVcH6wbHjPJlIiYfLIK1BZ1y5eMfFQ7X
  e/U8V2njO8ue5B6ymDLml8HknX85m/2vaDpx2pwdObp5tUrfvc5TXi8dxrXM3mjFyqTu/fMUz
  nyNHZ5SlVgDTOP2VaPDQwr299OSHyrNd822veqNm/+6XL5+cuOzVxnylnVP5PlV1/j8p9p4UU
  66W3RLA8X8BlPP5jYYnVoobnG3wTLR/HhG3kCReLfn40/KvIlcd3Wlz5cMotWyh+8w5bCrdI3
  UYmlOCPRUIu5qDgRAKn5sJBbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1663064256!145206!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22461 invoked from network); 13 Sep 2022 10:17:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6E4BD1B5
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:36 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 62C5B1B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:34 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.5 -> 1.3.7
Date: Tue, 13 Sep 2022 18:17:13 +0800
Message-ID: <1663064233-3236-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
References: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98772

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.3.5.bb => python3-croniter_1.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.5.bb => python3-croniter_1.3.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
index 92962c0f45..c84affa851 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "7592fc0e8a00d82af98dfa2768b75983b6fb4c2adc8f6d0d7c931a715b7cefee"
+SRC_URI[sha256sum] = "72ef78d0f8337eb35393b8893ebfbfbeb340f2d2ae47e0d2d78130e34b0dd8b9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


