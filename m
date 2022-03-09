Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9753C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:44:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.4235.1646822665293478608
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uNKJHwWw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822663; i=@fujitsu.com;
	bh=y4GoSOT4nhFsRBAXmApT53uoZAcw8XI3gimNNXvg0DU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uNKJHwWwtWFsCLGrSu7lZKr2xjLqL4AjbwY/Vfx9YZwUBAHxCrvtkWtE0LfQVLvkX
	 yc0NntuJm/udlZHud+SgyJolLDmNIbWCc0ErMySsiuoxlKK1kAwXkobAklpM7tdZp+
	 zO8oQNafN4/qpHbta8AdFtpwYc8BDQX1/fBr4fxnXvVsAEk82RtJU8/w4F9R180gOR
	 wBgwM1+OaiSizy63hz0z9F7xLTs1K3gLk6y63PY18d/S670xagwS7w293VFFkShecr
	 5BYb4fcvdwQwFXLhOVHDoYPF97YWJvnVrQXP/xiHSKp2J399Ut+lXvu1uR0O6sIK79
	 YltAnw312bejQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRosvWqpF
  kMLtV3+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzejZfYGt4CB3xYG/og2Mx7i6GLk4hARmMEms
  eDaVBcI5ziixe+s/xi5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBWIkLtzZw
  gRiswDFO7+9Zeti5ODgFXCSWDBJAiQsIaAgMeXhe7BWTgFniRenZ7KB2EJAJadP/wCL8woISp
  yc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYxWiUVZaZnlOQmZub
  oGhoY6Boamuqa6RoZGuglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGZEox
  26UdjHP7fuodYpTkYFIS5ZUJ1kgS4kvKT6nMSCzOiC8qzUktPsQow8GhJMHb2QSUEyxKTU+tS
  MvMAUYHTFqCg0dJhPdzDVCat7ggMbc4Mx0idYpRUUqc900zUEIAJJFRmgfXBovIS4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEeflagKbwZOaVwE1/BbSYCWixnZEayOKSRISUVANTYI3XFLa
  sqVsuKLinMp+MWbknLaqm6sZn65h7d26cty9bt10pSMn1iuLxaG7HA+oPE9mvJ9p/v3MpcNKt
  G+Z7D/k9LGhOFxPadP+BlrGi2txXqVr1a+Jv8xr8DuDecKaaZ+/sgF5fA58Ni1ZWTuHccsTW4
  qifN6elfv+MtWY3JZjjtL2j/Nb1Fk5SahN55Xybl4UhLMLFsbwn58GbNbYCQSolMaHNB3e3/i
  pwFkkWr1uT8uyY+v19Es82/prl6tv8ROXpZ8eNSh7n+h1s7mtcOHZJMn2lpviTqEtpG1+F/1j
  qrtoScoRVwnXHia+ex45UZiypm26Qwhfb+0ks5l+MxaH8y8sYjhz+env12RwlluKMREMt5qLi
  RAD0z0u7QwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1646822662!33188!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12708 invoked from network); 9 Mar 2022 10:44:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:44:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 229AiGV7008214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Mar 2022 10:44:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:44:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aws-iot-device-sdk-python: upgrade
 1.5.0-> 1.5.1
Date: Wed, 9 Mar 2022 18:44:01 +0800
Message-ID: <1646822643-61935-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
References: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95900

Changelog:
=========
change append to extend to fix bytestream error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon_1.5.0.bb => python3-aws-iot-device-sdk-python_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.5.0.bb => python3-aws-iot-device-sdk-python_1.5.1.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb
index 2f877487ac..0b2181e4fe 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
-SRCREV = "90d7b05749e2da7a13193024c720e3c8d9bf1157"
+SRCREV = "6ca6c73775c953114f83240a850a0d1ab49b68ac"
 SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol=https \
            file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
            "
-- 
2.25.1


