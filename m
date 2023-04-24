Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2412FC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:30:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.42910.1682307037876566308
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=ECtKzdlF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307036; i=@fujitsu.com;
	bh=M/yWavfc4NBTGW4uUeqMVlhFj/DmpWhsa8hx64V76T4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=ECtKzdlFWjYxGe58lsF2Jdu0XJ570cNFr9fpkcBM0SBUGHqvJ1CO8mH68yqrrYOzK
	 bnUkbgXLsM9fEEJOUvxBaA6TVaNJ1SqTol78q/w+4OsiQgrjiRK0tv+q6LQ1bf9M2D
	 /Qk8VkSxzJb18HXwCHtzvwRt2j/nmieelPFn2AFJwHlmOezlsZC4A499wFKAb40GyH
	 PXt9bPxXTGnPuWjNUc8FncqP8uxVzYaEC+vWHUXuhNB6lqQCk8ih6qdbcDz6Nd8prU
	 6G4YdQYI4u0OPiqKEQPekt2ztwagl+BufPZlApxUAQmerX+x/+RfdYGQdsIwml8cL2
	 /9Usxz0pab/0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqHv7u2u
  KwaJjGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bf3xa2giM8FY9W3GFuYJzH3cXIxSEk8IRR
  YlP3O7YuRk4g5waTxLFvnhCJvYwSs5+sAUuwCUhJ3Lj/H8wWEdCXWDp7DzOIzSygIvHidw87i
  C0sECAx4fNVsDiLgKpE7+oWRhCbV8BJYsXNnywgtoSAgsSUh+/BajgFnCWO7T/MArHYSaL9y0
  cWiHpBiZMzn7BAzNeUaN3+mx3Clpdo3jqbGWKOosTsy81QMyslWj/8grLVJK6e28Q8gVFoFpJ
  Rs5CMmoVk1AJG5lWMpsWpRWWpRbqmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnF
  xXrFlbnJOSl6eaklmxiBoZ5SrGi0g/HJzr96hxglOZiURHmXbHBJEeJLyk+pzEgszogvKs1JL
  T7EKMPBoSTBW/TJNUVIsCg1PbUiLTMHGHcwaQkOHiUR3mVfgNK8xQWJucWZ6RCpU4yKUuK8ts
  BoFRIASWSU5sG1wWL9EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXskPQFN4MvNK4Ka/Alr
  MBLR4F7cLyOKSRISUVAOTA7eEJY9L5ecW46TLz9cWG1ud7Jz6+tLGLQomiQ4bJLc/02KQWvD5
  Rt/6PRoT1zr8tjA5ZTNp9foJqodEC1ZI7s/1mOFoEdv8okNpdUF7aMMagR+3jVSkb+89NEXE5
  LKf1o/puyuNv0+UYk7u16mxzapXN9Rb1R40YdHaqZHO6xftkWtRu7VD8KGD1y0DO+45V7apTQ
  kWezinQtR5hmDBB1avauVNd8PWmn9oWlxz0PWI/SPuyV9eukWlpa63a/e4XvhfZX/wpRP/tX8
  eK0vOFrxby1a3ycVGgG+qy9+4DquEEwdbtL6/9wxMKEtZ5WNvOKvcMcWIl7U1d23Sd5lLTyU7
  5nPKbbqSo/6yQkWJpTgj0VCLuag4EQDja6ZmcAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1682307035!122890!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15145 invoked from network); 24 Apr 2023 03:30:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:30:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5A48A1001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:35 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4E21E10019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:30:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.19.1 -> 1.20.0
Date: Mon, 24 Apr 2023 11:30:10 +0800
Message-ID: <1682307012-11984-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
References: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102171

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Send all events to /envelope endpoint when tracing is enabled
 Note: If you=E2=80=99re self-hosting Sentry 9, you need to stay in the previous version of the SDK or update your self-hosted to at least 20.6.0
 Profiling: Remove profile context from SDK
 Profiling: Additionl performance improvements to the profiler
 Fix: Celery Beat monitoring without restarting the Beat process
 Fix: Using the Codecov uploader instead of deprecated python package
 Fix: Support for Quart

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.19.1.bb =3D> python3-sentry-sdk_1.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.19.1.bb =3D> python3-sentry-sdk_1.20.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb
index 0eb29c71b..174545dd2 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} +=3D "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] =3D "7ae78bd921981a5010ab540d6bdf3b793659a4db8cccf7f16180702d48a80d84"
+SRC_URI[sha256sum] =3D "a3410381ae769a436c0852cce140a5e5e49f566a07fb7c2ab445af1302f6ad89"
 
 PYPI_PACKAGE =3D "sentry-sdk"
 
-- 
2.34.1


