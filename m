Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAAFC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:29:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.39462.1681115383806480428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BQ8Bu3PX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115382; i=@fujitsu.com;
	bh=88f2D/Hm/pBuuPzK1j9bIsxVT5xRmbJhY7Dsi4MuDDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BQ8Bu3PXCexUsaGejbsADmMgSe6duzU6pKLjHPymC5TDuEzoJ+NI/0NacBr3o5GuJ
	 P0IItJJJoQGLzKHNtujBss6Ugk8rLElrsneunE6FTgx1g2moYuwaBJ8X+gNcX8E6UN
	 sJ8DT3ev1D8T9Nf40M0Y1RD+pHg4P7KwamrwRL4DQ7hT8JUdiUfGRlBIuTXeAbrW17
	 j0rfrGLVuIahwmjdNyt1MsG9m4xZMkJXsdtdclFlioO2toleAP/2URuPqX4DqkxWax
	 cRf6LqoFc3/YfX1rssGBB3ZhJsV2yRlBS6lvfp14hnldsVmLY2sjHb1ABMQiN8Wmsp
	 qSd2qrHP5bPKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSffrCeM
  Ug6aJ5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+02eYC47zVHw48IC9gXEpdxcjJ4eQwBNG
  iSc7DLsYuYDs60wS6+b9YoFI7GGUWDaDC8RmE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBH4v6GNrBeFgFViS+X+sBqeAWcJH7s/AbWKyGgIDHl4XuwOKeAs8S565eYIXY5SWzZ8J
  ENol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrqGlXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg6KYUK63bwbik76/eIUZJDiYlUd4uLuMUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8C
  w8A5QSLUtNTK9Iyc4BxBJOW4OBREuGtOAaU5i0uSMwtzkyHSJ1iVJQS5609DpQQAElklObBtc
  Fi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5th4Gm8GTmlcBNfwW0mAloMZeLAcjikkS
  ElFQDU8XhyycmV7+yqztbuGqCRd3MvOv3pzH8n7lrnmpqWpSu/QTuecJZDfGP7c8/CVzY53k8
  Z634TmGWrd0OYnnfYqbwNOpVsBrcs3DyjUtSnzPlZ3X+5ulpL2tC2TM4smProjc5tZuEzYzaf
  n62dudd6eR/8Xu5RHZ+1OT+p7yUl+/l/p6ucwnf0xTCzDzOmFzL31rYXSQo8nbyw4o2sc+1Tk
  EMG6usOJkUVsxnzvv7/8C2W1+5pwcwz2qZs3ZHZEMhh1lE2QGh+zLzmTZq2ZV1da27eulIgrP
  R74W3zHh+L0vQj2RzPPrelvP7JRa249d+HjgbecorfLV4+Surmp2HRV4r/+48MlOuuDHEb9Nc
  JZbijERDLeai4kQAlaKrE1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1681115381!349883!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7232 invoked from network); 10 Apr 2023 08:29:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:29:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 942C9100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 878B61000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:29:40 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.2 -> 7.2.3
Date: Mon, 10 Apr 2023 16:29:21 +0800
Message-ID: <1681115363-24418-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
References: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix: the :ref:`config_run_sigterm` setting was meant to capture data if a
  process was terminated with a SIGTERM signal, but it didn't always.
- Performance: HTML reports with context information are now much more compact.
  File sizes are typically as small as one-third the previous size, but can be
  dramatically smaller.
- Development dependencies no longer use hashed pins, closing issue 1592.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.2.bb => python3-coverage_7.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.2.bb => python3-coverage_7.2.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb
index 58d0b46f6..057c119a2 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "36dd42da34fe94ed98c39887b86db9d06777b1c8f860520e21126a75507024f2"
+SRC_URI[sha256sum] = "d298c2815fa4891edd9abe5ad6e6cb4207104c7dd9fd13aea3fdebf6f9b91259"
 
 inherit pypi setuptools3
 
-- 
2.34.1


