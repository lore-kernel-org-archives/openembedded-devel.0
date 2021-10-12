Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C09C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:29:52 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.9736.1634016591595812279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=clWqG3PS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016589; i=@fujitsu.com;
	bh=LGLEl4ffRaQjg5y/gVYNSJ1lS7VP+yjH2Uusn5UBn9I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=clWqG3PSNvahaFiPXlo5BfuDniyx48t2CNi66inpXdxTrLzIKHQ3/Ai7pTjhYPi2B
	 ft/vXpYsEGxLReJNTNEyr6DI7uiZPrVsMMzX4kidIGa+Z9GuBABJ6FehgYH28RTt6n
	 tiwvWfbJ0/PSV1AVp8SrO2IihQ+e1ijCObSmi4Uyt0TAc6tBGx5xb4Zu54YvBUFM+c
	 m/ZO7qTWfc1rZUtpjyGJi6nd1cGUr9FpzGBsI0gNr3CpSfBJqZwVPpKs4OZbwldVPH
	 UVIafhMBkC8Xjp9dv1iZb0wQJpX4ZM+Vh51Sb/kDbDj6raaMlly5fbkv0sk5xvtz6B
	 y79Y/uo14qsfw==
Received: from [100.113.4.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id D2/A2-01506-D4D15616;
 Tue, 12 Oct 2021 05:29:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0fWRTU0
  0WH/fwOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTg48SRrwVbuim03axsYt3B1MXJxCAnMZpLo
  v7WTFcI5wSix99dP9i5GTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBH4m9DS2sIDaLgKrE9eWvm
  EBsXgF3iYMbLzGC2BICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+YIWoUJbbvPMMCYVdIvD58iX
  kCI88sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa65rZGqkl1ilm6SXWqqbnJpXUpQ
  IlNVLLC/WK67MTc5J0ctLLdnECAyklEL2PzsYr7/+oHeIUZKDSUmUN+hUSqIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd5OvtREIcGi1PTUirTMHGBQw6QlOHiURHhnygCleYsLEnOLM9MhUqcYF
  aXEeX8IASUEQBIZpXlwbbBIusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcOyHiezLwSuO
  mvgBYzAS0OjEoBWVySiJCSamBaNN159ZpPT9Zp7jq3I2R+h54Zp9P7JcvSpm++VnDwUpSTSu3
  aXe2HfwvU8fkmbV3Ufvfq4QVdJb/Xbdh59+WjP6xffi6qU3jENCGsrOJL2cTTRsvmPn4VYdge
  5/ptmY52YIKOkHp5tsJERQPdrpaaQ55e0Uf2Fpw/e42rK+KDQm3LXX95E+PNa9/HNNf9uTpBb
  +ESVqcjMx261cN7H8St7Daa9vrdFd7fVuJO2o+/1KvJbbgTP8kn9djVZ4IGInx5awJDjfbaX1
  p62jWhY4mB/453HJs+X5msubfVvLL5h5hJXnRQ6PoH3/r0vD9lP5pu13bVfEL5vyuTory3T+U
  PUVzdfL/B9MOnhAnZ9emXlFiKMxINtZiLihMBz2h14x8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-238.messagelabs.com!1634016588!496978!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9615 invoked from network); 12 Oct 2021 05:29:48 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:29:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5Tmps032100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:29:48 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:29:47 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.0.8 -> 3.0.9
Date: Tue, 12 Oct 2021 13:29:41 +0800
Message-ID: <1634016581-17241-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:29:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93249

Bugfixes
Ignore blank ignored in existing Data Validations
Add support for cell protection for merged cell ranges
Timezone-aware datetimes raise an Exception
Improved normalisation of chart series
Catch OverflowError for out of range datetimes
Alignment.relativeIndent can be negative
Incorrect default value groupBy attribute

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-openpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
index 3d1f46e50b..4dfd4490ab 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4f2770348c029ce9433316ced8f91ed37d2a605e654f8bfdc93a3524561a8ce2"
+SRC_URI[sha256sum] = "40f568b9829bf9e446acfffce30250ac1fa39035124d55fc024025c41481c90f"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.25.1


