Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web08.36851.1629799252822153345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 03:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pHGBCl6s;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629799250; i=@fujitsu.com;
	bh=VP/HLe8gdA7Spdol+xAJrmAMEqKK9+Q8+PhTay36LGk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pHGBCl6spj29GLj5OW02ir6V5HzmDS3xR8jPFlhD9NTnXYLgszifdss15iviJmtdp
	 o+fZ3DWV0A5/4+vu1UV4TNTf2ngGsNAwpkiLG+GeW+ADXePsteSF29bogEDwIpOAL6
	 jbF9bpyCO/7VFDs3BQulXxfl1MGfAHq9YJqmcuKyKNEJ4asP0XwLh0f5zkiRh3Sc8r
	 J7y7+c/YkCFZMgUfHWrc2WiBn1lyls1EBVUfStAdwOc5/rS3nU3tnk2SR6Kwi2dWsw
	 8d8xKwwe7KgzgB+o395/KSMyY8FVAqFNpO+APNaGOG7Y8R0AiraJj43KoqsNm8CS1g
	 22uBiHLwUZ+uA==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id D8/3E-29858-253C4216; Tue, 24 Aug 2021 10:00:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1f2zTyX
  RYP0FEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePTjGtMBVOFKk61n2ZpYJwl0MXIxSEkMJtJ
  Ysu2PuYuRk4gZw+jxJW13CA2m4CuxLnHa9lBbBEBfYmls/eA1QgLeEusPfOXqYuRg4NFQFWi9
  VslSJhXwENix883bCC2hICCxJSH75kh4oISJ2c+YQGxmQUkJA6+eMEM0iohoCgxe7o8RHmFxO
  vDl5gnMPLMQtIxC0nHAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWZrpGpqZ6iVW6SXqppbr
  lqcUluoZ6ieXFesWVuck5KXp5qSWbGIEhlFJw5P8OxuVvPugdYpTkYFIS5S3ZppIoxJeUn1KZ
  kVicEV9UmpNafIhRhoNDSYL3yU6gnGBRanpqRVpmDjCcYdISHDxKIrwT9wKleYsLEnOLM9MhU
  qcYFaXEeX9vAkoIgCQySvPg2mAxdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8MkPE8mX
  klcNNfAS1mAlp8X1IRZHFJIkJKqoFpi5bKujPTK1V8fPefFr3W/JmJN/z0rJf2NzYfsVv1zf7
  cH4vt+8yiJjaV32J7qjv5sUX60UOrLO92lh9kdD3V0VMnFv/ITcro1MO03W9VPp6Pav0rFnrM
  hfV00GJ2ZaWdThEhIhNu3vd5bBwu4+43+8bV/PjV87KOzGKSVGjzrV1q0DJRQobzqcy1nVWNi
  kedF2/csXoi46rzv55flGLd3sQzt2BPad5DZbXVpc3SJr5NgfG3/l+30ij7e2m3lQz3tSdLru
  5r2hH6eteeJS3i5lc+f2t/uDUjJLLQInX2yooV7ExSAebKqyqb+21Um04Z79vBck3wqGPKKom
  AJBfD1p0m3xdlXj382fhGZtN6JZbijERDLeai4kQAQES2thwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-287.messagelabs.com!1629798140!130448!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23549 invoked from network); 24 Aug 2021 09:42:20 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Aug 2021 09:42:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17O9gJG1029808
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 10:42:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 24 Aug 2021 10:42:18 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 22.1.0 -> 22.2.1
Date: Mon, 23 Aug 2021 14:52:24 +0800
Message-ID: <1629701544-89431-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

22.2.1
Fix bundling of wepoll on Windows.

22.2.0
New features:

IPC support on Windows: where available (64bit Windows wheels and bundled libzmq when compiling from source, via wepoll), IPC should work on appropriate Windows versions.
Nicer reprs of contexts and sockets
Memory allocated by recv(copy=False) is no longer read-only
asyncio: Always reference current loop instead of attaching to the current loop at instantiation time. This fixes e.g. contexts and/or sockets instantiated prior to a call to asyncio.run.
ssh: $PYZMQ_PARAMIKO_HOST_KEY_POLICY can be used to set the missing host key policy, e.g. AutoAdd.
Fixes:

Fix memory corruption in gevent integration
Fix memoryview(zmq.Frame) with cffi backend
Fix threadsafety issue when closing sockets
Changes:

pypy Windows wheels are 64b-only, following an update in cibuildwheel 2.0
deprecate zmq.utils.jsonapi and remove support for non-stdlib json implementations in send/recv_json. Custom serialization methods should be used instead.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pyzmq_22.1.0.bb => python3-pyzmq_22.2.1.bb}   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_22.1.0.bb => python3-pyzmq_22.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyzmq_22.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb
index 9e418f04b5..f58074a9a9 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.2.1.bb
@@ -8,11 +8,14 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "7040d6dd85ea65703904d023d7f57fab793d7ffee9ba9e14f3b897f34ff2415d"
+SRC_URI[sha256sum] = "6d18c76676771fd891ca8e0e68da0bbfb88e30129835c0ade748016adb3b6242"
 
 inherit pypi pkgconfig setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-multiprocessing"
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-multiprocessing \
+	${PYTHON_PN}-json \
+"
 
 FILES:${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
 
-- 
2.25.1

