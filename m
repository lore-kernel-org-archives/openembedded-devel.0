Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32254C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:43:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.3776.1672803832049953415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X5VwH5TO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803830; i=@fujitsu.com;
	bh=0sw99/r0J+7ExPyyu4kcHeDRcqdc3WtBx5jFXlK0ImU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=X5VwH5TO5xCmlqbX9o+/ZhyhwHCBBA92zwMZUE0M5iB+gE8Sn3loKMwbn/vf7YVma
	 Sp7e0DEDjLiCp0baw0a6vNz2r0Zs/BvH0pjiBpwQXstKdf7+5tsaLU0ge3G2Cdf8we
	 HgY/RKxwNMcli2QJQR5Cz8UQnbjafq38IKgSm18NyMqvL2STiJ9d+978X7qiOedec8
	 dLH3PbGSs4Ts8SvZfCVjnFBFMQrSmS7/hXKfVaKBf4z0UdSeKLkDUpXXaQTrlrpgnc
	 YMWWxxOwvshuybwldxEGWqi2Vbx66UAgGtIkQK7aiqGo0LxLRBt9BYmR8PYfopFlZd
	 DYYd02cuvWiEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWffb1y3
  JBh1rWCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owrzddYC17IVLy+eJW9gbFZsouRk0NI4CGj
  xKHnPl2MXED2FSaJOc3bmSCc3YwSm372s4FUsQlISdy4/x/MFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAh8artLFicRUBV4vfTA2BxXgEnid3dPWBxCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXUD
  WKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxmhWnFpWlFukaGuolFWWmZ5T
  kJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBAZjSrFawA7Gj8v+6B1i
  lORgUhLlLfm8JVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/6J6CcYFFqempFWmYOMDJg0hIcP
  EoivFkgrbzFBYm5xZnpEKlTjLocdxfu3cssxJKXn5cqJc576wtQkQBIUUZpHtwIWJReYpSVEu
  ZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxpkFU9mXgncpldARzABHZG0ZiPIESWJCCmpBqaIg/d
  Fqo+5P0xhbqk5bMzIIfPmXuYhXeOpjcvizl/QmdfG/u/eyZ2Mp06fYRaffT3hVsq37inHVAx1
  NuQeY7i3UVH36MUrq6sZbjIx5JwzWvPa45xp8WIuhyTNzoo762w0WY90zX+nvPGF0cH5G5OX6
  SW8Uy6Olohcdp/lbZAy42UXh4qjUb0/xQ09fZdWSf0SDPrp39R38YvT07P7JhcbBpU8evQrRC
  ZOc82lzLTV13q/zmn68mKXGdPPsPTjlj0nUg5vmlS4c12ct+dmJqOouUFXBVQ/Ccw615wey57
  7+WHKHsa/a5Je3wraN8filFdyD69An1a9l87LhdEVVUy+D34cjXXzapXa8Kt/ZqcSS3FGoqEW
  c1FxIgCp/7v1TQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1672803829!363414!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23721 invoked from network); 4 Jan 2023 03:43:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:43:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C56BB153
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B8CE0152
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:43:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mock: upgrade 4.0.3 -> 5.0.0
Date: Fri, 30 Dec 2022 13:00:20 +0800
Message-ID: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-gh-98624: Add a mutex to unittest.mock.NonCallableMock to protect concurrent
 access to mock attributes.
-bpo-43478: Mocks can no longer be used as the specs for other Mocks. As a
 result, an already-mocked object cannot have an attribute mocked using
 autospec=True or be the subject of a create_autospec call. This can uncover
 bugs in tests since these Mock-derived Mocks will always pass certain tests
 (e.g. isinstance) and builtin assert functions (e.g. assert_called_once_with)
 will unconditionally pass.
-bpo-45156: Fixes infinite loop on unittest.mock.seal() of mocks created by
 create_autospec().
-bpo-41403: Make mock.patch() raise a TypeError with a relevant error message
 on invalid arg. Previously it allowed a cryptic AttributeError to escape.
-gh-91803: Fix an error when using a method of objects mocked with
 unittest.mock.create_autospec() after it was sealed with unittest.mock.seal() function.
-bpo-41877: AttributeError for suspected misspellings of assertions on mocks are
 now pointing out that the cause are misspelled assertions and also what to do
 if the misspelling is actually an intended attribute name. The unittest.mock
 document is also updated to reflect the current set of recognised misspellings.
-bpo-43478: Mocks can no longer be provided as the specs for other Mocks.
 As a result, an already-mocked object cannot be passed to mock.Mock().
 This can uncover bugs in tests since these Mock-derived Mocks will always pass
 certain tests (e.g. isinstance) and builtin assert functions
 (e.g. assert_called_once_with) will unconditionally pass.
-bpo-45010: Remove support of special method __div__ in unittest.mock.
 It is not used in Python 3.
-gh-84753: inspect.iscoroutinefunction() now properly returns True when an
 instance of unittest.mock.AsyncMock is passed to it. This makes it consistent
 with behavior of asyncio.iscoroutinefunction(). Patch by Mehdi ABAAKOUK.
-bpo-46852: Remove the undocumented private float.__set_format__() method,
 previously known as float.__setformat__() in Python 3.7. Its docstring
 said: "You probably don't want to use this function. It exists mainly to be
 used in Python's test suite." Patch by Victor Stinner.
-gh-98086: Make sure patch.dict() can be applied on async functions.
-gh-100287: Fix the interaction of unittest.mock.seal() with unittest.mock.AsyncMock.
-gh-83076: Instantiation of Mock() and AsyncMock() is now 3.8x faster.
-bpo-41877: A check is added against misspellings of autospect, auto_spec and
 set_spec being passed as arguments to patch, patch.object and create_autospec.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mock_4.0.3.bb => python3-mock_5.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.3.bb => python3-mock_5.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb b/meta-python/recipes-devtools/python/python3-mock_5.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.0.0.bb
index 8f2305b50..dcc57c22b 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.0.0.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[sha256sum] = "7d3fbbde18228f4ff2f1f119a45cdffa458b4c0dee32eb4d2bb2f82554bac7bc"
+SRC_URI[sha256sum] = "fd552787228eb2ab8352f270470fa93c9ad8b9cbc565c5558ee3faed8edb3853"
-- 
2.25.1


