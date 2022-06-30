Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7A4C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:16:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.19849.1656555404673075725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SafaJFg9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555402; i=@fujitsu.com;
	bh=8Fb/J4X1I+9An+QRtcOL9TnRxSxQe9JNn6YlptkBkpM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SafaJFg9AgctCqTb7hpKOTXGAW/okRmNqP2AJUi9N9PRWEj3ponhZj/+CxTzFuwmW
	 Kp9xZg9ondUSsQZuSTlpelhKZ39rOfWKvNnth6++shhQf9/uSZYJMjc3iohHdCSXho
	 /Z5OdFidpLtIJdH/Q5zjoMvtcblYRH5im3XcsPOihrkU6ET9lJz0yryxLLxuIs2sal
	 OtILQM516DbWxt+QVhcgg+S47Srjhq8T3CF+wAnPu+RAE5Q+AZjudlv0MoJQo1oz5a
	 1Omm9qsFED/NNGlmy2lwN+3EVAG91NJ/Au9s4h8mkGMeepJlhTcUTUoG02z2hlO7vl
	 FyixZbwNdiPmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8OxWbeLfW+
  SwZpL8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9p51sBS+4K3ourGVtYLzL1cXIxSEk8IBR
  YkffY6YuRk4g5wqTxLOn7hD2AUaJ1ffNQGw2AV2JFz8Ws4DYIgL6Ektn72EGsYUFAiRubJsE1
  ssioCrx9sM9sBpeAXeJBztvgtkSAgoSUx6+Z4aIC0qcnPkELM4sICFx8MULoDgHUI2ixOzp8h
  DlFRKvD19ihrDVJK6e28Q8gZFvFpLuWUi6FzAyrWK0SSrKTM8oyU3MzNE1NDDQNTQ01bU01zU
  0ttRLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDL6U4sTuHYyr9/3SO8Qo
  ycGkJMr7dNqeJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvOsZ9iYJCRalpqdWpGXmACMBJi3Bw
  aMkwnvjO1Arb3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEeVeyAM0QACnKKM2DGwGLykuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkZ2ICm8GTmlcBtegV0BBPQETungR1RkoiQkmpgShb
  x+6eVXSqxjGlTUNHcrXJzVx095OoqUTih0u+Uya2VS9d3xi55luP+cOs6Kalq35YHL5Z33agp
  TmkrORj9YmWYbJ6D34UlHQnywRbWUvqblSNzAhhDCmaUmh5yvSodc+rCzODlv/qXfih88IwlY
  kH3KR4n11Lun17prvJXFe59udww/VT77D6lwyWROk/6b5VefrqucA6fs/RMJoGoLPsAFe6FW1
  +KL76VqHL05rXqs3OfrWk3u5jzUTW5tffalLblvhG/qnZ/M529OEWrR/m1UZRd0YuIvIkM63r
  qLsj27mA2vb/87VUp5VWCE2xb3K/dfzTz3jmhVxmPlH76u03gYxX/bCuf+PxTWn6LEktxRqKh
  FnNRcSIAr+JPvkUDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1656555402!238742!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7315 invoked from network); 30 Jun 2022 02:16:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:16:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EA1EB73
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D45E614C
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:41 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:16:40 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.37 ->
 1.4.39
Date: Thu, 30 Jun 2022 10:16:31 +0800
Message-ID: <1656555391-9794-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:16:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97629

Changelog:
==========
Fixed regression caused by #8133 where the pickle format for mutable attributes
was changed, without a fallback to recognize the old format, causing in-place
upgrades of SQLAlchemy to no longer be able to read pickled data from previous
versions. A check plus a fallback for the old format is now in place.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.37.bb => python3-sqlalchemy_1.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.37.bb => python3-sqlalchemy_1.4.39.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb
index 9e50a8ee7..0690a8b4a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "3688f92c62db6c5df268e2264891078f17ecb91e3141b400f2e28d0f75796dea"
+SRC_URI[sha256sum] = "8194896038753b46b08a0b0ae89a5d80c897fb601dd51e243ed5720f1f155d27"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


