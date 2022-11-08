Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A99C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:11:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.3843.1667877064571196914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JGASqf1h;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667877062; i=@fujitsu.com;
	bh=Y6+qRnOleug+h0QGQRdyIdZ8YErIa+vYU8Ks/bWEkEo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JGASqf1hasHeo7SIzOZxkUj8nKRxv6YZhaKTTw4CppFBTixlkZlfApaaTistO1Ruj
	 uQ35yd8liOxrmeQrzqq10Fc2b7jsR7E/FNOw0AaxbmnzAQMlNsod5EKUz7nKkkabNc
	 AYBkOogdSJX/yYOQiHrfM8i1zs6ZA0IWC7Q+7dC9zWEOa0MqCyrUxTez6bQbbsyxQ3
	 oYSKFznxvNqXX5ifyZnmIigNUBRLL8WCnlBkXMBZg/LhEctCV8pvpipdsZT6qOksVE
	 EJwmGmCAXLiFb7qooXVNJryjvL+GGfHqKWJdH82Nj+UBt8CGHWHnZRa18NHig2/hBr
	 1Rk8RckaoKWnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRWlGSWpSXmKPExsViZ8ORpHv0RGa
  ywbyPZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b8P5fZCr5xVlzsWsfcwDifs4uRk0NI4CGj
  xPcj4RD2FSaJxj45CHs/o8S0N+wgNpuAgsTCrWdYQWwRAX2JpbP3MHcxcnAICwRIXJiXBBJmE
  VCR2N3fwwRi8wp4SCxZ+pEFxJYAap3y8D0zRFxQ4uTMJ2BxZgEJiYMvXoCNkRBQlJg9XR6ivE
  Ji1qw2JghbTeLquU3MExj5ZiHpnoWkewEj0ypGs+LUorLUIl1DA72kosz0jJLcxMwcvcQq3US
  91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBLKWaJ38H4cNkfvUOMkhxMSqK8WbaZ
  yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLWPAeUEi1LTUyvSMnOAgQ+TluDgURLhfX8cKM1bX
  JCYW5yZDpE6xagoJc57CKRPACSRUZoH1waLtkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhH
  kPgYznycwrgZv+CmgxE9Di6oI0kMUliQgpqQYml13enw978k9kvrxF8+b/DhVRNl3HfU/1S42
  5f6Vc+7Rvn3nBkx/XLpxUcMnj3/bHe44742ahfdsLxIwS18bcvHdnm0OZaIP68bcqhuxrOUpF
  ZjVP59J2Ssr67nms++Yj3U3b48TN19/p8k9T+rnnvHqXz8SjSwStGzqd1Pof212x3aE+94z2x
  7VufH9VjaLnRbhxGuU3tO1w2MDf8Mzkw8Y/qc5SDvccjv4SjpJadDxfJzDY6rCigb5ZqONzv4
  M+vp8UX19x/6weuJfZ8Ysg15e0iyz2E+Y76pewMRul/+5It3i/IbAh5u9Gp4KrrbkxCttLZMJ
  /PIuPPVjGsF1iUcwOa6tX12YETu8K+a3EUpyRaKjFXFScCAA0WEH/MQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1667877061!405293!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16311 invoked from network); 8 Nov 2022 03:11:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2022 03:11:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 83CE91AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 790001AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:01 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 8 Nov 2022 03:11:00 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.42 -> 1.4.43
Date: Tue, 8 Nov 2022 11:10:50 +0800
Message-ID: <1667877050-29047-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 03:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99483

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_14.html#change-1.4.43

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.42.bb => python3-sqlalchemy_1.4.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.42.bb => python3-sqlalchemy_1.4.43.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb
index 6999554b8..46132cfba 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363"
+SRC_URI[sha256sum] = "c628697aad7a141da8fc3fd81b4874a711cc84af172e1b1e7bbfadf760446496"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


