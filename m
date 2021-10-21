Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FB1C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:37 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.6742.1634807433747686704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GDcEtlT7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807423; i=@fujitsu.com;
	bh=XLjhpajgbd4qphptiav32L5UBD7tzHMWydm7zYMLNyg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GDcEtlT7IGLRArapUT6Yv1gxb/oTbFs+OJ4X5wKgEHO8B/3Kwv9j1SJ1QYvtijR+V
	 wAxTvnmxbkO4x4TRfdpBCgj1rwsrN806nH8LJ9GyYtwtxQI7qtq/K4cTO6+JnQruHY
	 addEgVgIEmVJaTDJ3+NyphOW7iQcn3dD6R34xTO7mTtZQfuDU2XRtOO+z4FEI5fqgG
	 zMfETgpX25O9Lss23KZM+w2jnt3Zeft9Hjqk+eoERT9L8fr8ZPb7aJlwP/JcD6OuqY
	 mumYwj7IzRuER7ZewotTC8BLJ70LQSPsjX5pbRJ9PktjDdjgM6RdvkOQQ2kI1LIER3
	 io6gZxSZv4Nmw==
Received: from [100.113.1.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 63/42-09980-F7E21716;
 Thu, 21 Oct 2021 09:10:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRqlurV5h
  osHuqucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH3737mgtWCFX9mTmFpYJzB38XIxSEkMJtJ
  Yvek8ywQzglGif0TvrJ3MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hKvFmxggnEZhFQlZj+7
  AtYnFfATWJj4zOwXgkBBYkpD99DxQUlTs58AjaHWUBC4uCLF8wQNYoS23eeYYGwKyReH77EPI
  GRZxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNYFkqaGeolVuol6qaW6yal5JUWJQFm
  9xPJiveLK3OScFL281JJNjMBQSilkmL6Dcc2bD3qHGCU5mJREeXV+FSQK8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuDdqV6YKCRYlJqeWpGWmQMMa5i0BAePkgivvzJQmre4IDG3ODMdInWKUZeje
  dLy7cxCLHn5ealS4rzv5IGKBECKMkrz4EbAYuwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  HeLl2gKTyZeSVwm14BHcEEdESBRQHIESWJCCmpBqZQ518el/OsUpSVXTvNdYqCHlXM+ix7OvF
  Ta0Huh5fp+cvbKrkDdsdf3+58ps/tn6+ChHGU2cdvJ/SPr4uUadPQdUlYJCsTPUmo+nBiZeek
  H5ulZmSeSTqyU/Ke05fFktYSq8qXXlnx+nvlfIUfsx4dy2vL5ne/2yF/vcRNf8eNNfKb7DJL3
  dT9C5rORcfO5JxyXqri93KWnWzdYotkcm5aZpSJHQlbdbx1yTfXWVnfjDdIbS1OK3p4K3euao
  hu3KYrWWsezJ66cadIl8/36U4f7u7wqC8V7RMOfR/swLmimo95juHP45E72N4zZ00wFA+J1W7
  s38Qe6Jd2RIJffoXRspuLC1bOeXZbfp5xhxJLcUaioRZzUXEiANdt5b8sAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-226.messagelabs.com!1634807419!80430!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20139 invoked from network); 21 Oct 2021 09:10:21 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:10:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19L9AJFN028838
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:10:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:10:17 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 2.0.1 -> 2.0.2
Date: Fri, 22 Oct 2021 05:10:12 +0800
Message-ID: <1634850612-4692-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93514

Version 2.0.2
-------------
Released 2021-10-04
-   Fix type annotation for ``teardown_*`` methods. :issue:`4093`
-   Fix type annotation for ``before_request`` and ``before_app_request``
    decorators. :issue:`4104`
-   Fixed the issue where typing requires template global
    decorators to accept functions with no arguments. :issue:`4098`
-   Support View and MethodView instances with async handlers. :issue:`4112`
-   Enhance typing of ``app.errorhandler`` decorator. :issue:`4095`
-   Fix registering a blueprint twice with differing names. :issue:`4124`
-   Fix the type of ``static_folder`` to accept ``pathlib.Path``.
    :issue:`4150`
-   ``jsonify`` handles ``decimal.Decimal`` by encoding to ``str``.
    :issue:`4157`
-   Correctly handle raising deferred errors in CLI lazy loading.
    :issue:`4096`
-   The CLI loader handles ``**kwargs`` in a ``create_app`` function.
    :issue:`4170`
-   Fix the order of ``before_request`` and other callbacks that trigger
    before the view returns. They are called from the app down to the
    closest nested blueprint. :issue:`4229`

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-flask_2.0.1.bb => python3-flask_2.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.0.1.bb => python3-flask_2.0.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb b/meta-python/recipes-devtools/python/python3-flask_2.0.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.0.2.bb
index f1c046147..e3f1df356 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.0.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "1c4c257b1892aec1398784c63791cbaa43062f1f7aeb555c4da961b20ee68f55"
+SRC_URI[sha256sum] = "7b2fb8e934ddd50731893bdcdb00fc8c0315916f9fcd50d22c7cc1a95ab634e2"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


