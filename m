Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FA1C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:02:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.16354.1666591317162430763
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kqNLo8GZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666591314; i=@fujitsu.com;
	bh=+5DcugbGzB4dUFLrwJ6VxCATEmMdChacv74wcBLeboI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kqNLo8GZWAir+ZQf22X0s5h2pq503crWCG4tWvJgypZ0oJydrsitMC6rsYeLbAnFv
	 LbuX46ULQnRvrpaYl9T8v/nzH5rGfduGq3d03t/vv9vh1r3MtZ65AXYgzY2a/6B6W/
	 dbfbfi5O9rbhJyi/xWdEs8bPcxe64B49CwrPWqDFilGA0BnQz7ULB06EeNX9uhpYBb
	 +nT8X1EjAuhyXzWFikna5IsawAn5kUPrcQJptqU+RLpB+sXYibMNvf22fkdvb2Vc/b
	 oUMak9l+XlxFXkCP+/ItLhC/pKNscuI0ag8XckkDB7Zj1W9tG9p1NAIxc/VxeXxE9J
	 QnnOdCmi5PDtg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWTdIKyz
  ZYO4iIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPvv4/MBQv4KtY1fGVrYHzE08XIxSEk8IBR
  4vnZK8wQzhUmib3TelggnD2MEref3WPqYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV+LSnFVAzRwcLAKqEldP+YOEeQWcJP6/X8MIYksIKEhMefieGSIuKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRvDi1qCy1SNfQXC+
  pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAcU4pTX+9g
  PLbsj94hRkkOJiVRXgbxsGQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryv1IFygkWp6akVaZk5w
  NiASUtw8CiJ8PaDpHmLCxJzizPTIVKnGBWlxHnfgSQEQBIZpXlwbbB4vMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmDdZA2gKT2ZeCdz0V0CLmYAWX1oRBLK4JBEhJdXAVH5AP2HavxZz53+
  t6Ynd7GsfGc3pWOewadmvghSVJ7ec16YvXVw9b+eiAv35nGZNalZz22xXbp4nXKqTbGXAslKy
  XTLxujDfJH5dJQ7d9U8vxh55cNG5cZXK040bDy3LtGrxDv8cEHTe8vff+Zt9ljC072kK95q+f
  dFOznmqWVuD4sV8nq3S9Oh0W8rNe+n9i00PsrZsYYtxip2zOV30vmnu1QKrubuEuf8J/YnKap
  oa9kg9fQmvVFeCSF2R599y54/bQm0CyxUeS8iVMvyP2GVjNjdpY2O1/sE0znDunQ83ue0+yiJ
  5/2nxf/lP6XnZ3JN+nJ8dZmW68l5MTM+RTyZCOzYJ3C9pZJgiytWoxFKckWioxVxUnAgAMHBL
  q0IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1666591313!192950!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16839 invoked from network); 24 Oct 2022 06:01:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:01:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BFD947B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:01:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ADC4F150
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:01:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:01:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-core: upgrade 2.3.1 -> 2.4.0
Date: Mon, 24 Oct 2022 14:01:31 +0800
Message-ID: <1666591295-28140-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99267

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2022.

Changelog:
===========

    Drop support for Python 3.6
    Switch to implicit namespace package configuration
    Add support for variable-width GPIO ports on FT23xx chips
    Use time.perf_counter_ns() to avoid loss of precision
    Remove cmdline.make_serial (deprecated since 1.17.1)
    Pillow 9.2.0 or newer is required now

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-luma-core_2.3.1.bb => python3-luma-core_2.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.3.1.bb => python3-luma-core_2.4.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb
index 1d5b146fa9..8a7be0a30c 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=3b1d500f5911ec7522f1f790d616e0ee"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=71cded473ab60fdbe20edc519217f521"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90180a385da9f7d003"
+SRC_URI[sha256sum] = "cf5fdf3563d5ec56e2f792f3a2f432abaeac517a0b05a10a757a4c5a26bb2e5d"
 
 PYPI_PACKAGE = "luma.core"
 
-- 
2.25.1


