Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F0FC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:24:17 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.7754.1635312256834471595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oTGWd3BM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312247; i=@fujitsu.com;
	bh=gYbwcVl5GPNmHWRpaGA+jO5mMUmtXEfirchHCuFh1a0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oTGWd3BM2hox7dHzau+qZUdbqpoCXStwuWUK5U/uwH3p5pE0ZuOTLnAAkRNGwFF3i
	 OMNy/LL1wDd152Eomm+m1ufiOOTzXNm4wpWsca/7O+t8IZ/HCb+erUb4KDg7CnKqRn
	 /YuCyAfJ7qyYlisjPheNHGHnjyGU+7wiL7oQt8coggcGkAnf0CHQs1ijUhmQ5VsEuf
	 NOYW0ItjzUSSXrrCbZudSEbpRfAvSwPmDK+hOJQFiCoMx0v9d9IqaMoTodf9JhJNO7
	 euCbXjiPc8+6sTyx2PM+d2zyB1i6wbkSKkZvOkGBZAR+FcMSVZDuby7YvXm9LKqlgP
	 jBlwrUNj3DhQw==
Received: from [100.113.7.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 5F/DA-01506-772E8716;
 Wed, 27 Oct 2021 05:24:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8ORqFv+qCL
  RYMMGcYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ/XuMBf8UK571rGdpYLwr18XIySEk8IRR
  4uEmIJsLyL7AJLHy2AoWCOcEo8SfeauZQarYBHQkOl50s4DYIgL6Ektn7wGLCwt4SSzddA3MZ
  hFQldj98xRYDa+Ah8Syw9PZQGwJAQWJKQ/fM0PEBSVOznwCVsMsICFx8MULZogaRYntO8+wQN
  gVEq8PX4KKq0lcPbeJeQIj3ywk7bOQtC9gZFrFaJFUlJmeUZKbmJmja2hgoGtoaKxrBmTpJVb
  pJumlluomp+aVFCUCJfUSy4v1iitzk3NS9PJSSzYxAgMvpZCNawfj09cf9A4xSnIwKYny+m6r
  SBTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZt0DygnWJSanlqRlpkDjAKYtAQHj5IIr8EDoDRvc
  UFibnFmOkTqFKOilDjvvZtACQGQREZpHlwbLPIuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVB
  Lm/QcyniczrwRu+iugxUxAi5mVwBaXJCKkpBqYsmd9vp4fq3NnqVBV1DOROakJ85ZfX+jsWmT
  QPV3x3J3OCTILe7fn6KxjSlrC2+m03rLX+mv4TlmD1Z6bv97OF7pu/vuFl2TCfG8zzdNHo8+W
  7d/78+XSjzOEC3965q1fWLRT5NVU4z/Vx+cEHzF9z3N+DefD2N7WdxfLdDNdqi7nnViYsq30l
  cTviclVRrd0Al4HRBWEKLZInF7L+bf2f+Pk4Pr/bycr2JUwTXkUv0csN/+posFlg+1Lc4Rfbc
  jt/x4pZ6K8asnBifsmz3upnNGtcX/x7w+NXTt9rpVdUddXr7syuS7qSxuv9997B0uO+1ZO+b+
  kWv72uaoSq52J6l+f9Ef9+jJlbVJaTIR7rRJLcUaioRZzUXEiAFXIrDY3AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1635312247!77269!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 546 invoked from network); 27 Oct 2021 05:24:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:24:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E47D510023F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:24:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D9041100232
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:24:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:23:56 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.3.3 -> 1.3.4
Date: Thu, 28 Oct 2021 01:23:52 +0800
Message-ID: <1635355432-112005-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93615

What's new in 1.3.4 (October 17, 2021)
--------------------------------------
These are the changes in pandas 1.3.4. See :ref:`release` for a full changelog
including other versions of pandas.
{{ header }}
.. ---------------------------------------------------------------------------
.. _whatsnew_134.regressions:
Fixed regressions
~~~~~~~~~~~~~~~~~
- Fixed regression in :meth:`DataFrame.convert_dtypes` incorrectly converts byte strings to strings (:issue:`43183`)
- Fixed regression in :meth:`.GroupBy.agg` where it was failing silently with mixed data types along ``axis=1`` and :class:`MultiIndex` (:issue:`43209`)
- Fixed regression in :func:`merge` with integer and ``NaN`` keys failing with ``outer`` merge (:issue:`43550`)
- Fixed regression in :meth:`DataFrame.corr` raising ``ValueError`` with ``method="spearman"`` on 32-bit platforms (:issue:`43588`)
- Fixed performance regression in :meth:`MultiIndex.equals` (:issue:`43549`)
- Fixed performance regression in :meth:`.GroupBy.first` and :meth:`.GroupBy.last` with :class:`StringDtype` (:issue:`41596`)
- Fixed regression in :meth:`Series.cat.reorder_categories` failing to update the categories on the ``Series`` (:issue:`43232`)
- Fixed regression in :meth:`Series.cat.categories` setter failing to update the categories on the ``Series`` (:issue:`43334`)
- Fixed regression in :func:`read_csv` raising ``UnicodeDecodeError`` exception when ``memory_map=True`` (:issue:`43540`)
- Fixed regression in :meth:`DataFrame.explode` raising ``AssertionError`` when ``column`` is any scalar which is not a string (:issue:`43314`)
- Fixed regression in :meth:`Series.aggregate` attempting to pass ``args`` and ``kwargs`` multiple times to the user supplied ``func`` in certain cases (:issue:`43357`)
- Fixed regression when iterating over a :class:`DataFrame.groupby.rolling` object causing the resulting DataFrames to have an incorrect index if the input groupings were not sorted (:issue:`43386`)
- Fixed regression in :meth:`DataFrame.groupby.rolling.cov` and :meth:`DataFrame.groupby.rolling.corr` computing incorrect results if the input groupings were not sorted (:issue:`43386`)
.. ---------------------------------------------------------------------------
.. _whatsnew_134.bug_fixes:
Bug fixes
~~~~~~~~~
- Fixed bug in :meth:`pandas.DataFrame.groupby.rolling` and :class:`pandas.api.indexers.FixedForwardWindowIndexer` leading to segfaults and window endpoints being mixed across groups (:issue:`43267`)
- Fixed bug in :meth:`.GroupBy.mean` with datetimelike values including ``NaT`` values returning incorrect results (:issue:`43132`)
- Fixed bug in :meth:`Series.aggregate` not passing the first ``args`` to the user supplied ``func`` in certain cases (:issue:`43357`)
- Fixed memory leaks in :meth:`Series.rolling.quantile` and :meth:`Series.rolling.median` (:issue:`43339`)
.. ---------------------------------------------------------------------------
.. _whatsnew_134.other:
Other
~~~~~
- The minimum version of Cython needed to compile pandas is now ``0.29.24`` (:issue:`43729`)
.. ---------------------------------------------------------------------------
.. _whatsnew_134.contributors:
Contributors
~~~~~~~~~~~~
.. contributors:: v1.3.3..v1.3.4|HEAD

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pandas_1.3.3.bb => python3-pandas_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.3.bb => python3-pandas_1.3.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb
index 6e557ed7b..cde43184b 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "272c8cb14aa9793eada6b1ebe81994616e647b5892a370c7135efb2924b701df"
+SRC_URI[sha256sum] = "a2aa18d3f0b7d538e21932f637fbfe8518d085238b429e4790a35e1e44a96ffc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


