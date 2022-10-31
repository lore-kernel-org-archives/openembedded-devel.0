Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AE7FA3746
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7050.1667205753078613807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hKGpJSwz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205751; i=@fujitsu.com;
	bh=6TApxRxY7u/JMKg6dYDK8NWHFdWvL59H5Dp/ZImdrvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hKGpJSwzGD/kqAzHeLZFwx5LEZxmvLigTdV7b9TlGSdzwOKTJCU7BqFB8uEerIINi
	 wiMj14fA00cRgzy4rcEYP+BjnnC0hN1K0/+avv+6zmhhRufqi0hCGn5Sa+F7JnQYrJ
	 82rYOZxFvQw6gTv1men9yr+fYxlzeAxgJUJRYhNiTtOA4Ftaww7dqHhe9ur8q+tQ4d
	 ogpww2I1MvvKjt/jRsb6G0ETyFYeWop3SFBbyiEL6fkjownh7uPwmQPE5FeMcXWwIy
	 nejZ2Ca5QP/e/r41dinaZh47dN0bMg0upwsXiXPwgT0r15v3oa7pAE5C3MV8YJr66U
	 StV38rOmJYj4g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWbesKz7
  ZYOoTA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN/9TfGgtPcFVc63jM3MH7m6mLk4hASeMgo
  cfrndyYI5wqTxIzmtawQzh5GiVtdP9i6GDk52ASkJG7c/w9miwjoSyydvYcZxGYWUJF48buHH
  cQWFnCXuHK/iRHEZhFQlTh08z1YDa+Ao8TBqWfBaiQEFCSmPISIcwo4SVw4dYMJxBYCqrl77z
  QrRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbz4tSistQiXUMTvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwABOKU6P2cH4e9kfvUOMkhxMSqK871rik4X4kvJTKjMSizPii0pzUosPMcpwcChJ8
  DK2A+UEi1LTUyvSMnOA0QSTluDgURLh7W0FSvMWFyTmFmemQ6ROMSpKifOWdQIlBEASGaV5cG
  2wCL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3K8h2nsy8Erjpr4AWMwEtZmuPA1lckoi
  Qkmpgqv3Ey5AsPn/R286Z7/n9r0YeNToses3/VY9z4VpR54Kzi9Qk199Ju7oqcZuX66G7j+dL
  pVRJXt/JskJMTZutuP50yp43l660Ttr1+f7mzYyLHnqb8/032b7sSPMjtk+2BSU/3Pd8j+2fv
  fla60oW8+tSCdO1beJFxe9GP3sU/F3ky0EHBfko++OhGz/GljZyrZhWm6Cw3XmhV3a1cekD+V
  Ilffb39dMjOoub+vn5b/5/5XbAao7dFIZn856I2r1s1f2ckXUu72eG2a19nqsdS6RfHWDtyjd
  7cOzeH6nkaVbfbz9ffuZlyDyHf+e33nwmvdjm8ba1sTse/4j4ZPVk0roq0w1btV66nTzle8ju
  aLsSS3FGoqEWc1FxIgDLZ74wWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1667205750!393153!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13134 invoked from network); 31 Oct 2022 08:42:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:42:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4AA63159
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3DCD0155
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:42:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 3.1 -> 3.2
Date: Mon, 31 Oct 2022 16:42:11 +0800
Message-ID: <1667205733-3829-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
References: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99372

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{thingsboard-gateway_3.1.bb => thingsboard-gateway_3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.1.bb => thingsboard-gateway_3.2.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb
index ec2830d37c..7c3197778f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "1a563e062ba734d1cc6e6cbaf8016af5cfb8c2921cb06e1e7af98153af1d121c"
+SRC_URI[sha256sum] = "06fdb1000cb3f25ff78a2441c0e0f9e5bb2abec3eff907d57f58c1709c110217"
 
 inherit pypi setuptools3
 
-- 
2.25.1


