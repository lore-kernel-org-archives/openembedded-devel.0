Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC5C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:24:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.191105.1673940285559517933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vg1qWuB6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940283; i=@fujitsu.com;
	bh=lzLxTZtyY6iQEAZ35Of9hZoTZz3O5QG/uDRPvA0kHqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Vg1qWuB6RKYineExpuBDNF8+58CqNoyExNwPTMyEYr9jLmy3P6vEYoC7faVq4h+aV
	 sa9S1jKnN3I4f13x0y6VssWNaqZzU3vw6wDanhMyhHUcauZeHc+13o+ajgvrzRPAFL
	 2BvCigUqy7cc3K9TLIo490OwVirmD3uhWVWi4A/xW3FPYerJp1DLttiv1Fa41rccjx
	 VmA8fkPYYNrChQSk6Ie7HCUovzw55jZQAlD+0qsdXvRx8jOnMSuOjofooR4Bk2LA04
	 ZKuTpfaT50APJcinot4GlA9I4XdxJFj4ZaI92a4Ytj6/XPWS7JDhdmE7y2itDlaag8
	 1SRSuFBMMrFLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSdfa91i
  ywcHpYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRs1kFK0Urvj1+ztrAeEyoi5GLQ0jgCaPE
  z2tLmSCcG0wSj2edY4dw9jJK9H17xNrFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC3xPnOJWA2i4CqxJTJx8HqeQWcJE7OmQNWLyGgIDHl4Xswm1PAWeLgrl1MILYQUM2fu6
  eZIeoFJU7OfMICMV9C4uCLF1C9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuma6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWW
  bGIEhm5KsarnDsY/S//oHWKU5GBSEuU9aXosWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7ykvo
  JxgUWp6akVaZg4wjmDSEhw8SiK84ZZAad7igsTc4sx0iNQpRkUpcd7D3kAJAZBERmkeXBssdi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ1BJnCk5lXAjf9FdBiJqDFHiVHQRaXJCKkpBq
  YKuu7a/2XzQ17yH3whNwM1+m/ZOz/+76TeHbw1Rzu/7unVUv82XFwesy1eRNb1s/zf5KXtv1J
  qNKM4NzE9Pdqq5/3bazbKXtHf+6DH9vYZ1TeS31e+JlN2uvIxd9/s3jOv80vfRFpcMKque199
  m+h3pXqtQ+dRL7GNXJeVkn4F2x38UK7EsPqJp/88xMLd11+fE2qw21b4oJtC3MlY3ytSue9nH
  b5YFPOk8SydC+e6esk7yw5+dKuLmSe56/Dhg8mHu0vEJqxSzdF54DT6S/3pmsz3nBruzj5xcK
  nQatKnH8ld5WLy/7imTd9Ufb1n2eFbzFfTNAXENm/dZL+Ny2hjARm98ki/43iFL+pHVh4+Z8S
  S3FGoqEWc1FxIgBm2jflWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1673940283!21662!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27262 invoked from network); 17 Jan 2023 07:24:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:24:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 15D081000FE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 076321000FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:24:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 24.0.1 -> 25.0.0
Date: Tue, 17 Jan 2023 15:24:22 +0800
Message-ID: <1673940264-20487-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
References: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100622

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New:
------
- Added socket_class argument to zmq.Context.socket()
- Support shadowing sockets with socket objects, not just via address,
  e.g. zmq.asyncio.Socket(other_socket). Shadowing an object preserves a
  reference to the original, unlike shadowing via address.
- in zmq.auth, CredentialsProvider callbacks may now be async.
- ZMQStream callbacks may now be async.
- Add zmq.ReconnectStop draft constants.
- Add manylinux_2_28 wheels for x86_64 CPython 3.10, 3.11, and PyPy 3.9
  (these are in addition to not instead of the manylinux_2014 wheels).

Fixed:
-------
- When ZMQStream is given an async socket, it now warns and hooks up events
  correctly with the underlying socket, so the callback gets the received
  message, instead of sending the callback the incorrect arguments.
- Fixed toml parse error in pyproject.toml, when installing from source with
  very old pip.
- Removed expressed dependency on py when running with pypy, which hasn't
  been used in some time.

Deprecated:
----------
- zmq.auth.ioloop.IOLoopAuthenticator is deprecated in favor of
  zmq.auth.asyncio.AsyncioAuthenticator
- As part of migrating toward modern pytest, zmq.tests.BaseZMQTestCase
  is deprecated and should not be used outside pyzmq.
- python setup.py test is deprecated as a way to launch the tests.
  Just use pytest.

Removed:
----------
- Bundled subset of tornado's IOLoop (deprecated since pyzmq 17) is
  removed, so ZMQStream cannot be used without an actual install of tornado.
- Remove support for tornado 4, meaning tornado is always assumed to run on asyncio.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_24.0.1.bb => python3-pyzmq_25.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_24.0.1.bb => python3-pyzmq_25.0.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb
index b3b0aefe1..39a7614fc 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77"
+SRC_URI[sha256sum] = "f330a1a2c7f89fd4b0aa4dcb7bf50243bf1c8da9a2f1efc31daf57a2046b31f2"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.25.1


