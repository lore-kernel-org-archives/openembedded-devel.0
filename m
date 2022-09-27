Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A1BC6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:38:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.8988.1664271476163559805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JaWM+6Ok;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664271474; i=@fujitsu.com;
	bh=RflKbB0IsoQ03AAm0KJjq9FI8WEi7lBR/16OUTNYkjk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JaWM+6Ok/yNxSBa8KZhlG1mDcuaAOPT88XGowUX4CoPvwqOLQsL6RFqzEapmTGZJB
	 y61FC9K17GTSXeaDE1KhlcoZo0S6AdQ2hoa0Q0EjIZW7NN1NnfoygfUMCWfzJvWwns
	 /iTvSZKYNBUzUUdKsG6+akT+51822QS5ApUtiY5r5bJOAX8k4OTuH284G+9/9CPMX0
	 b0Y8sp3LB8AEP189VJOVMF8vLHZEzhyhevM0wibTkgDYFkJBeLZpskE1rlhPOWk81+
	 YfSDHSiwkEcGYq+IwU5kgFK9UiRg/f7WKrUBKhgjp+1Oi3K6nVxkqljCPqwXc/Hf9v
	 0ClWZtYmdbN9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpFt4xCj
  ZYGq7qMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFp2T7mgmMcFdO2TWFuYPzE3sXIxSEk8JBR
  4u+feYxdjJxAzhUmicMPkyASBxgl1v4/ww6SYBPQlXjxYzELiC0ioC+xdPYeZhBbWMBL4vaU6
  2wgNouAqsSevcuAajg4eAXcJf7ukwQJSwgoSEx5+B6snFdAUOLkzCdgY5gFJCQOvnjBDFIuIa
  AoMXu6PER5hUTj9ENMELaaxNVzm5gnMPLNQtI9C0n3AkamVYy2SUWZ6RkluYmZObqGBga6hoa
  mQNpY19DEXC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw/FKK0yfvYLy0
  75feIUZJDiYlUV77RUbJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4kw8B5QSLUtNTK9Iyc4CxA
  JOW4OBREuHdAZLmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17YDzEIsefl5qVLivKZbgBoEQB
  oySvPgxsHi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4hkLU8mXklcFtfAR3EBHSQHZ8
  +yEEliQgpqQamxa07e4PMzPtcBHe8djndE/r8gOL82+Y9s808Wvi522wVrMwm39OR+Kt9tUPh
  SODr87EftGW+X98Uu8+eV42xwzuL98/caT88ferji8Ui0xwjjll4nFMXqrt/IHDxtLtzF348l
  ZK9yXf6pmy1OacVnrtue7fgnGWOb8XSDgHPxIUHp1f+O5dbf/pViWe5Ov8vl3dTDur/nfWyTb
  FzzlmG3z1pvvu/bjOs+b97OkcJ/xEZtwyOagf1c5ZTtSy3nPPgVDXqkz/2Nlthw+peE4EHCqv
  u/KhkbLe8JcSqxnGozpct58v/T6Yez+ta3hRcTC1qO1Twdmqx66ZVsYdl7ry5te3N7jL2z92X
  TtwwD32hxFKckWioxVxUnAgA9zO5UlIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1664271472!390860!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18184 invoked from network); 27 Sep 2022 09:37:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:37:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BFB961B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:52 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B45881B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:52 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:37:51 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.30.0 -> 5.31.0
Date: Tue, 27 Sep 2022 17:37:42 +0800
Message-ID: <1664271462-2714-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:38:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98990

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-web3_5.30.0.bb => python3-web3_5.31.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.30.0.bb => python3-web3_5.31.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.30.0.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.30.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.0.bb
index a35c05e065..435eb1d065 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "e141d90408fd9fe5156e2ef22884a160bef8bfd55e6cecd51181af3162ea84dd"
+SRC_URI[sha256sum] = "ef0ad5c62958fe18202bacfa1f216a57d97a8abdecc68f87946c02b38aaab34e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


