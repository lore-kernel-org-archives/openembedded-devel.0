Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED55C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6756.1649901559453259884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mto9+OJx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649901557; i=@fujitsu.com;
	bh=Jpnt2wXV45ktghdYrIFEtHOTOqMkswpphfjSX7RsSdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mto9+OJx0jjj2dxu6A51hZQ1Rvw6aKAWjCjNLVcteTWy61KK5H/1Bzn229U9+FHCc
	 cmfoVuru96tG/pazf99+QGiRd41PjNB8vmQ07LByL/gAbyvwcVlNZR4sxkamVjEMkM
	 B+J2Q0JDcjtp6KVjEoyuFFpTsdlF1UXXJes1/lslQh4x3nDuoUe1h4wnQU1DoW0PHo
	 vyczWiqMPhHgnw3InajPLnidsOXaEnuOlRmKbTTI/uCY/q4/bCl8rnn/tlWzUQpr3O
	 c5UmOpl7QU2m2HDXt6lSHPbnV/b+GLUolunrgWwLBaTbAxTXWDeTN1DKbCxLmwCY1d
	 cIiFR5v6jtuuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRWlGSWpSXmKPExsViZ8MRovulPjz
  JYMMBEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePd9Gamgi+cFetevmVpYJzP2cXIxSEkMJtJ
  YuHtV+wQzgFGibZrR1m7GDk52AT0JTau+8QEYosA2Utn72EGsYUF4iTePF0HFmcRUJXoPv2TE
  cTmFfCQmH7oExuILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRLqkoMz2jJDcxM0fX0MBA19DQVNccSJmZ6SVW6SbqpZbqJqfmlRQ
  lAqX1EsuL9VKLi/WKK3OTc1L08lJLNjECQyql2G3ZDsZ9fT/1DjFKcjApifJmGYYnCfEl5adU
  ZiQWZ8QXleakFh9ilOHgUJLgTakDygkWpaanVqRl5gDDGyYtwcGjJMLbVAOU5i0uSMwtzkyHS
  J1iVJQS590J0icAksgozYNrg8XUJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNNBpvBk5p
  XATX8FtJgJaPG3VaEgi0sSEVJSDUwWr/LLRT69NX88p0o3wSGW8Yi9zP1VzoUFBWuP7lv8UeZ
  R4OVJj2Rfbf9350fv/+Tkele38huh2VeWxTwx67qYdKoni/s6e+UJ1agT3BKvvux/z1Tawro8
  ceqBzS83Kk+VWy26QaTqR8ur1VVqR9RuP8lJ+p6sUvTpOIP1lB/3alsUXjx7tJ3Xbl3x2pMTt
  XNMHsn9jyoPNd1RFFjeupiD9caMZJsC9uXam34/uplRc+he+YUreTG/JjMe6t3qP3//8U9+b6
  3v/XDq/LUv+ekChV2/OfdcK9mXOOWi4QY7hthzHbqnfe+2XW92uPRWbk7AqxWrTn4q/+01Rf3
  FxCuyyWs3vhZ3mOwU+1hb76zDRyWW4oxEQy3mouJEAKy4SFMkAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-532.messagelabs.com!1649901556!18735!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32413 invoked from network); 14 Apr 2022 01:59:16 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:59:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E1x8kb012146
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:59:15 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:59:07 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade
 1.54.0 -> 1.56.0
Date: Thu, 14 Apr 2022 09:59:00 +0800
Message-ID: <1649901540-13915-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96630

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tos_1.54.0.bb => python3-googleapis-common-protos_1.56.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.54.0.bb => python3-googleapis-common-protos_1.56.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
index afc6dcbfe9..0a3547ee97 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a4031d6ec6c2b1b6dc3e0be7e10a1bd72fb0b18b07ef9be7b51f2c1004ce2437"
+SRC_URI[sha256sum] = "4007500795bcfc269d279f0f7d253ae18d6dc1ff5d5a73613ffe452038b1ec5f"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


