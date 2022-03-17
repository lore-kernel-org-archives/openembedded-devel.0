Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE37C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:46:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.10366.1647524784515508421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=e1XDU254;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647524782; i=@fujitsu.com;
	bh=QVvpbcTbSjE53mLbZTeSFOOZQqlBpHvRivlpsvo4ao8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=e1XDU254FZ6yx4uNJmPWjJarYg5joDdLdSKKQNnxrgY1fagFG/sJpg7lKbWPXIKPX
	 oMKwAHuAvjXUoneH+eU9uitCgKM09Oty0EsGXwx6MnRAobQ5MaTScc/TrbL0v4KEJq
	 Dcl1LOqLNv5pSYKOcy+RqF5a0o56v28TsAVESMtJPDWAixO/aKitiY5xnSLiDgvhuu
	 3l9mFda8tZ+9O2o57tAkVc00Nhf50kQbPirt4WtkIl5dBkZo//IHGWzd4NCmHBpvTZ
	 PpQzERPFNdMeECLMmjL7iEXFWb1S/fCD8nTxXgEGrzycz8F+8hw2P+mgT3qN7UO5k1
	 uth9K2Ss9sctw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSXedtXG
  SwazP3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8baX2tYCjYLVtz+/YOpgfEgfxcjF4eQwBNG
  iadLO1ggnAtMEl++X2KEcE4ySlx99Ie9i5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  8BqhAXCJRZ3TmAFsVmA4lNvb2MBsXkF3CXmbf8CZksIKEhMefieGSIuKHFy5hMWiDmaEq3bf7
  ND2PISzVtnM0PUK0mcWPGRCcKukHh9+BJUXE3i6rlNzBMYBWYhGTULyahZSEYtYGRexWiVVJS
  ZnlGSm5iZo2toYKBraGiqawJkGeolVukm6qWW6panFpfoArnlxXqpxcV6xZW5yTkpenmpJZsY
  gWGcUsySuoOxr++n3iFGSQ4mJVHeo+rGSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeBktgXKCR
  anpqRVpmTnAmIJJS3DwKInwhusApXmLCxJzizPTIVKnGBWlxHk/WQElBEASGaV5cG2wOL7EKC
  slzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3DGQKT2ZeCdz0V0CLmYAWNwoYgSwuSURISTUwzdB
  XePX7R1Fzu1lJtPBeLYGKGKce34u96349LXhxeKP1XPubqdMOMeUETLac6Dlr47VP/xSjhL5L
  y8U0B7CEynE0x227Hvte7h+b0b4rUW6VTn6MN4vifds/eqZP3iNieVgphHd2xJQXqwt3Wf13/
  /Fy9evWP1nFYVvfSJ3MshbTYm1cxnv0zDb1xvP/vnDP77y17fXS3E89/p1SLZo3DPe+qjzXGc
  kStYPbJEPU5N8Ws4KLa0v2rMxKWehvFM1tVhBXYV6maLfdjPtA4ferHFb5nZbakVMXGW8vtVF
  iODP1QnQIl+8Mn+IFmxV72KMv8MzM3PnrgCf/hNVmpxb+uMT78yfD/tjDy4443VNWYinOSDTU
  Yi4qTgQAWK0+Zl4DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1647524781!6016!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28097 invoked from network); 17 Mar 2022 13:46:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Mar 2022 13:46:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B14AF100461
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 13:46:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A481B10034F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 13:46:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 17 Mar 2022 13:46:14 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/3] [oe] [meta-python] [PATCH] python3-wrapt: upgrade 1.13.3
 -> 1.14.0
Date: Thu, 17 Mar 2022 21:46:45 +0800
Message-ID: <1647524807-17685-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 13:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96034

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Bugs Fixed

Python 3.11 dropped inspect.formatargspec() which was used in creating
signature changing decorators. Now bundling a version of this function which
uses Parameter and Signature from inspect module when available. The
replacement function is exposed as wrapt.formatargspec() if need it for
your own code.

When using a decorator on a class, isinstance() checks wouldn=E2=80=99t previously
work as expected and you had to manually use Type.__wrapped__ to access the
real type when doing instance checks. The __instancecheck__ hook is now
implemented such that you don=E2=80=99t have to use Type.__wrapped__ instead of Type
as last argument to isinstance().
Eliminated deprecation warnings related to Python module import system, which
would have turned into broken code in Python 3.12. This was used by the post
import hook mechanism.

-New Features

Binary wheels provided on PyPi for aarch64 Linux systems and macOS native
silicon where supported by Python when using pypa/cibuildwheel.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-wrapt_1.13.3.bb =3D> python3-wrapt_1.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.13.3.bb =3D> python3-wrapt_1.14.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb
index 05ee4c6356..9dcab8101f 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfdfc019b57affbe1d7a32e3d34e83db4"
 
-SRC_URI[sha256sum] =3D "1fea9cd438686e6682271d36f3481a9f3636195578bab9ca3382e2f5f01fc185"
+SRC_URI[sha256sum] =3D "8323a43bd9c91f62bb7d4be74cc9ff10090e7ef820e27bfe8815c57e68261311"
 
 inherit pypi setuptools3 
 
-- 
2.25.1


