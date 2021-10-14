Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9272EC43217
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 07:23:31 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6306.1634196210114830768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 00:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=LTxGfzJc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634196207; i=@fujitsu.com;
	bh=xyFU0lDIcKREUiG5ZIS0eUEJIMrmDm3F3DiqfFScVz8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=LTxGfzJctj7q3Qs+1hqOOWLdW1EaolqEH4uBqQfH1qvFqn81bCviDNf2L/vURi592
	 A7N5l1C93r7JvFTRI5YmLGwbaCIZ3Bd09TUAGRoiBC8Ok4Zx0vxpQJMgOlIS8/ZTme
	 u42vpdjIQ2jbPp27Bi2UKeV8PQ+Sn+XgyaGnWL7OqC/FUngXr8pO2ASIzO9ij5Ztx9
	 XIKDT60CU6LyrfueahfxnFwmT8H9SfK5hwTE2MpN5M5X5td7o41ADHI08pw6TIjy4s
	 r+mLIO2Z9kuu/MySSffq/8fqTp+MT/cGDnqXpEkAVN3T4zcLIqeK/EjyF/bzpqx5Di
	 DUIBfNhCkt9gw==
Received: from [100.113.6.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id A3/1F-14220-FEAD7616;
 Thu, 14 Oct 2021 07:23:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqPv+Vnq
  iwYYXchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bDGedZC27wVWxecoelgXEnbxcjJ4eQwBNG
  ieYJwV2MXED2BSaJ6a1NTBCJPYwSrVt0QWw2AV2Jc4/XsoPYIgL6Ektn72EGsYUFfCR+LXzFC
  GKzCKhKNB67wQJi8wp4SLTc/glmSwgoSEx5+J4ZIi4ocXLmE7A4M1B995GnTBC2vETz1tlANR
  xA9YoSs6fLQ7RWSLw+fIkZwlaTuHpuE/MERv5ZSCbNQjJpFpJJCxiZVzFaJhVlpmeU5CZm5ug
  aGhjoGhoa65roGhmY6iVW6SbppZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQLDNKWQ5ewO
  xi+vP+gdYpTkYFIS5d13Lj1RiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv5Q2gnGBRanpqRVpmD
  jBmYNISHDxKIrwKN4HSvMUFibnFmekQqVOMuhzvfi5exCzEkpeflyolzrsVpEgApCijNA9uBC
  x+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0NMoUnM68EbtMroCOYgI4IjEoBOaIkESE
  l1cC0ReOiQvEaj3Pntdy6qq/wrnz+47lWb8f/d46inL1MpZ8X6knkezCFPdoh+iRsb0Cd4NIl
  dhlC1e2WzT6uy+q/1Xq/36IoLFQ475+vKfNkHVWZaUenGRsflTJdejNm8+FN6dYX511dvZ3DP
  HiSzkn1+LtOsj78f2VXNfy2SJ5u3c/qEr5QrHB3j6qb3veqT2eWLQuckRh8qETodtf+PapH/H
  9F/j149Rivf+oe29xnHzaWNshHb2PnrxDMyC+R+f3BKST/mK/7FzFXnnerjqd923l2Unb3r7m
  NLNlLd/+SeCWVLPkw6p/qoYAPP/6WPK5ScY2eYHTcb0fn4xM1f08fiuSeEB/8J3ap8Vw9k91K
  LMUZiYZazEXFiQDvKaqaWgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-245.messagelabs.com!1634196207!133248!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17724 invoked from network); 14 Oct 2021 07:23:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 07:23:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E2277106EFF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:23:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 92DA0106F11
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:23:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 08:23:15 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.1.5 -> 2.1.6
Date: Fri, 15 Oct 2021 00:23:08 +0800
Message-ID: <1634228588-12494-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 07:23:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93288

2.1.6
~~~~~
2021-10-01 =E2=80=A2 `full history <https://github.com/gorakhargosh/watchdog/compare/v2.1.5...v2.1.6>`__

- [bsd] Fixed returned paths in ``kqueue.py`` and restored the overall results of the test suite. (`#842 <https://github.com/gorakhargosh/watchdog/pull/842>`_)
- [bsd] Updated FreeBSD CI support .(`#841 <https://github.com/gorakhargosh/watchdog/pull/841>`_)
- [watchmedo] Removed the ``argh`` dependency in favor of the builtin ``argparse`` module. (`#836 <https://github.com/gorakhargosh/watchdog/pull/836>`_)
- [watchmedo] Removed unexistant ``WindowsApiAsyncObserver`` references and ``--debug-force-winapi-async`` arguments.
- [watchmedo] Improved the help output.
- Thanks to our beloved contributors: @knobix, @AndreaRe9, @BoboTiG

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-watchdog_2.1.5.bb =3D> python3-watchdog_2.1.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.5.bb =3D> python3-watchdog_2.1.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb
index 55b966a90f..2bb110049f 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb
@@ -4,7 +4,7 @@ DEPENDS =3D "${PYTHON_PN}-argh"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] =3D "5563b005907613430ef3d4aaac9c78600dd5704e84764cb6deda4b3d72807f09"
+SRC_URI[sha256sum] =3D "a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


