Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A44C6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:36:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.9007.1664271407971616709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=QuHBEzoO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664271406; i=@fujitsu.com;
	bh=knPU72IhZ065hiSrgzS2HeATJbS0rI6AsmxNPJVam+g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=QuHBEzoOrxiYEN4whdiXvg8h4ojOUNNwUZNY6wYXm2JNVM/ud0z0FJgeLMC87eJTk
	 2//oPGAhOtnFm8DU7ecTGtmM/Esv8k0B07gxoytF9C5rTnrjYq8G0TeBLgqbR7UMP2
	 y+RKiQbNbRGbQastLz1Tz5RjVFUjLx89GXcuX9o2CLHfAIPppzWRIvgPFMT9mF4YPp
	 znCVi9Lp7v/zrqgfEA1TvrwdEj2MFY4qgYZjg2kacoRb3e4RyUJqOz3URi13W3qkZs
	 4n4k1K3WgLP8hegNBO04uszTVVN3ORyM1fGhA/o+B94bz/5ru/9epqpE4sMtN+7W67
	 gOSAMi4kL3fGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWVf3iFG
  ywewGHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPx2W1sBbu4Kta8vMHWwLiPs4uRi0NI4CGj
  xKSeq8wQzhUmiXktN5ggnAOMEqeaVjN2MXJysAnoSrz4sZgFxBYR0JdYOnsPM4gtLOAt8WdVH
  zuIzSKgKvH41QKwGl4Bd4nG2UuZQGwJAQWJKQ/fM0PEBSVOznwCVsMsoCnRuv03O4QtL9G8dT
  ZQDQdQvaLE7OnyEK0VEo3TD0GNUZO4em4T8wRG/llIJs1CMmkWkkkLGJlXMVolFWWmZ5TkJmb
  m6BoaGOgaGprqAklTE73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBgTSlm
  mLWDcVbfT71DjJIcTEqivPaLjJKF+JLyUyozEosz4otKc1KLDzHKcHAoSfAmHwLKCRalpqdWp
  GXmACMHJi3BwaMkwrsDJM1bXJCYW5yZDpE6xagoJc5rugUoIQCSyCjNg2uDReslRlkpYV5GBg
  YGIZ6C1KLczBJU+VeM4hyMSsK8QiDjeTLzSuCmvwJazAS02I5PH2RxSSJCSqqBaU6LhJmtj41
  uG7/m9s09ybmJWa0t7+ruG6TL7HXd41Dslr954kn3HiOna8uqi0NC+lzX7Z7HurBV6MxDhreJ
  Wvb619577nrUFMLg0s0RwLzZu7Ja/t8c7ktLzuSzzGg1Y3b5lLhtpv0XDuEP/28oXG/7ddJwQ
  9m9FT6lGx8/4Yvme/ZR8dUP0/M/m6s6J1Vabv54cOl/zf8MSzhVBLZXqEnqP5Yor/n8WqTw7d
  R7URaBTtHNWfe7f8jeTJOr6rwY2PJE+sOyxVskj3iFpp41nF/G6yfz7HqYnJRnVVXmvbgNL9h
  OBOyu3pb8XYEzIajE8XpaxYYTE9e++yN/7N9S/e9XUp1C2ha0L55xn8VfiaU4I9FQi7moOBEA
  T8jqhFEDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1664271405!527555!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17885 invoked from network); 27 Sep 2022 09:36:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:36:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 560F8155
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:36:45 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 53082151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:36:45 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:36:44 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 24.0.0 -> 24.0.1
Date: Tue, 27 Sep 2022 17:36:35 +0800
Message-ID: <1664271395-2629-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98988

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Fix several possible resource warnings and deprecation warnings when cleaning
up contexts and sockets, especially in pyzmq=E2=80=99s own tests and when implicit
teardown of objects is happening during process teardown.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pyzmq_24.0.0.bb =3D> python3-pyzmq_24.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_24.0.0.bb =3D> python3-pyzmq_24.0.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb
index 33e3ba6602..b3b0aefe1f 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_24.0.1.bb
@@ -13,7 +13,7 @@ SRC_URI:append =3D " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] =3D "13b008bd142c9f6079ad75a30504eef2291502e9eac90e722b16fcf9ce856147"
+SRC_URI[sha256sum] =3D "216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.25.1


