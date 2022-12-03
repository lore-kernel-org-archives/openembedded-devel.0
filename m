Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EF9C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.101883.1670066160216830104
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Nf/pmO6y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066158; i=@fujitsu.com;
	bh=+eGa5XAIEKQCcdm2r35zWTw0H+9ZnD1Gu/LB2vxivhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Nf/pmO6yhErPJUnsp1M7gw994i2y6b16zT4iOg9rS8ttdjaSrM2K/jkHTiDb+GcYx
	 /fkhzU82VZt1npWeF+7LsW0HBJw5R7r5BhkzQB9NfBZNhesTA7PivCHHFW/sY8i2ud
	 iOAg4UEO+f7s3aqmTZpcPc30Xx03w6fvmVxm4SvJKZvwqzwOe/5vxCcx9mAXAX6g2k
	 kpTjqYqD2QYB3u4DCcXEc+tTFMcsrop6QcNmiGgYAnrYHUTadTjWGBK62wDvxsaN25
	 0MEGFyeQbnVXyhuQ2Fi8FHj6012MexYLcmGtlJj71fOFFiOolxdbajjfRfXFLrvUrr
	 NsxU4eEhaR/0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpPtWvzv
  Z4FiLvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGtKbdgKVfFzfflDYxfOboYuTiEBB4ySkxo
  +coK4Vxmkjja84cFwtnNKPH10yEgh5ODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972EFsY
  QEfiflrT4HFWYDiO778A+vlFXCS+LLtGiOILSGgIDHl4XuwGk4BZ4nvU2aDzRQCqtny/CszRL
  2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASPTKka
  z4tSistQiXUMzvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSS
  TYzA0E0pZnq+g/Hssj96hxglOZiURHmPhXUlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgjdbuT
  hYSLEpNT61Iy8wBxhFMWoKDR0mEt0sVKM1bXJCYW5yZDpE6xagoJc4rpweUEABJZJTmwbXBYv
  cSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeMZApPJl5JXDTXwEtZgJavJG/C2RxSSJCSqq
  BKWGF0tuJ8TUMz+sPP1iXWsfGFv4++dHUl76Xc67x/chv3jd9ceyUxinds5a923/TVdN1z82n
  x0tXf7DmE9A4nchveHTKrFePj01fyvB9Q3vYhBm/Z7c8Nufjd+ANLwkOn/rX5HeygweT7quEz
  ENLnFf3hh3SvFLH+/lA3/RJP/fvmV88mTH9/c7Pfj52WV239c7++GCh2xFkrCqh3rxJ88nDbE
  2xnKcvene43jke4Fcivi3ufsyXlNebnGvXmLHM/pMY+jdI6r7yC4XZDTXJnHt9zl45xCQy087
  t9Nspzqzn/TU3/H0a+9O6/Xyzx62b/67NsPO+M799Ua3nlusKsz65fv/fenStzJNSxzPn1v5T
  YinOSDTUYi4qTgQA0jwmhVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1670066157!42220!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2392 invoked from network); 3 Dec 2022 11:15:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:15:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 675C71AC
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5C7D37B
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:15:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.51.0 -> 1.51.1
Date: Sat, 3 Dec 2022 19:15:13 +0800
Message-ID: <1670066113-24646-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
References: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99925

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.51.0.bb => python3-grpcio_1.51.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.51.0.bb => python3-grpcio_1.51.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
index bd4fcc805..9a3c3734a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "a103811a4b318abc9b1592cd6cc9187d34bfb2e192eb0fe113dfabb38a162284"
+SRC_URI[sha256sum] = "e6dfc2b6567b1c261739b43d9c59d201c1b89e017afd9e684d85aa7a186c9f7a"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


