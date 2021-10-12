Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E874C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:31:11 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.9652.1634016670261149686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V8F6oUyw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016668; i=@fujitsu.com;
	bh=hIHTLxIifUDsBEe00+Z6QZlug/WTIDyPfLeUZ7dVEko=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V8F6oUywf05lKRygy+AuF8S+xa/WyCYhwobSeYhn7lcm8xmteTA9m4CX+oWQxOtHx
	 SrkC10zakQbCjDx6F7O95C3yHks27HY9epBbKR1A1J27lnXvvZANoEbVPuYPQz06fT
	 vqhBuk+vwP1CagnTIrst1yn24gQDJbZwu9BSJq3UssqKyAr3mKa+DLqJDIgSebF3qq
	 MHLf23ZtSENFwQOgllM7uByI0DPCF4kZM1uDkv2Ph+725osKw5OrsGVPq3QyQR/JU9
	 W8U0Nk4Xk8/OsryBxPfgx/4tu0DSNHe06o9ZDfT3voCZInoVpcLKFcrJlFPvdNTIks
	 Sr9dxVSvsfiYA==
Received: from [100.112.194.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id CE/08-16630-C9D15616;
 Tue, 12 Oct 2021 05:31:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYojtHNjX
  RYPNVFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePftyWMBU/5Ku6+mszSwLiWt4uRi0NIYDaT
  xPIfF5ggnBOMEi+WzmPvYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFvCR2PrhLVCcg4NFQFVi+
  tRskDCvgLtE87QpbCC2hICCxJSH75kh4oISJ2c+ARvDLCAhcfDFC2aIGkWJ7TvPsEDYFRKvD1
  9insDIMwtJyywkLQsYmVYxmicVZaZnlOQmZuboGhoY6BoaGukaWhrpmpjoJVbpJuqlluqWpxa
  X6BrqJZYX6xVX5ibnpOjlpZZsYgQGUUrBAZ0djD9ffdA7xCjJwaQkyht0KiVRiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgRvJ19qopBgUWp6akVaZg4woGHSEhw8SiK8M2WA0rzFBYm5xZnpEKlTj
  IpS4rw/hIASAiCJjNI8uDZYFF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMw7B2Q8T2ZeCd
  z0V0CLmYAWB0algCwuSURISTUwqZTF1DEuOPZlXyT7R/sTU5UV46Z2RW1xcws98vT+DdPSK/t
  nlPN+ZF6RotO09LYe2wk1gxkN6YpHWC2LO15/eGyw4Unt9youRS31t1u1FUsyWBI37l/67kP1
  zIPSy1OrZm8tzfyScnPlsxOTrqXcn+hxaCPfFzPukwX/ZVZIRSqmn4m4P6UiK+JX3Os3v4PyO
  6znyVhffTZl92uzlboTzA5O2jbv+T9J5YfHz7/tijwRpLPr5ctY1//atdpRIi4S2WZ7znS8cw
  rokLd+bvg0vdjH+ODX9YX7KufU64W+tpkS8SNPKmlufoFixswdGvwuUwtZNwVcOzqVPWUPyxn
  ew0d8Iy9bdAvFzN69eVuSkxJLcUaioRZzUXEiAMViBdMdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1634016667!28078!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22564 invoked from network); 12 Oct 2021 05:31:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:31:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5V73T001334
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:31:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:31:06 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.0.2 -> 4.1
Date: Tue, 12 Oct 2021 13:31:00 +0800
Message-ID: <1634016660-17334-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:31:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93250

Version 4.1, 2021-09-22
-----------------------

- Added *linkcheck* task to ``tox.ini``, :pr:`456`
- Updated configuration for Sphinx and ReadTheDocs, :pr:`455`
- Note that templates and the generated boilerplate code is 0BSD-licensed, :pr:`461`
- Added 0BSD license template
- Added ``CONTRIBUTING.rst`` template, :issue:`376`
- Added PyScaffold badge to ``README`` template, :issue:`473`
- Updated Cirrus CI config and templates, including better ``coveralls`` integration, :issue:`449`
- Adopted global ``isolated_build`` for ``tox`` configuration, :issue:`483`, :pr:`491`
- Loop counter explicitly marked as unused in ``skeleton.py`` (``flake8-bugbear B007``), :pr:`495`
- Ensure update include added extensions in ``setup.cfg``, :pr:`496`

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...thon3-pyscaffold_4.0.2.bb => python3-pyscaffold_4.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.0.2.bb => python3-pyscaffold_4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb
index bba94f8a0f..61737c78c2 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb
@@ -12,6 +12,11 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "cfa719c2d97392ec3cd5f44d95ec0d40df2dd483d5ee05ea029896cfd7c04af8"
+SRC_URI[sha256sum] = "ff83ea4e585b29a746857c49a4dcba80795af130f62ff3f722d9f39aa4ff2a75"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+	python3-email \
+	python3-compression \
+"
-- 
2.25.1


