Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E5EC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 09:57:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.6774.1641463037825135853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 01:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dcx54Owx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641463035; i=@fujitsu.com;
	bh=V5m3ruh4D59NnTH+BvcoxtNBq0hBWjxVNz6RYQG2B48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Dcx54OwxL/o7Ubrpy3ZK6dH5PR4Y+zt7PH8YOYulTPWeDcdNhqeoBgKSFVhN/fBJX
	 jULUPWBEFdEkxBPJI2+USatAqefJeRqPvi1GLQ8JUeoaRkfKxJ9sxNrKftkp8419wV
	 0xz7wISQrDEVBw2PAn6co+puq3SJVF7tMguaAsAxOxcZoMSmCNmXShYp5PEq5siOTH
	 wijVWmAeay0gUMa9ZYeefMvIvhxizfuS+9YtKS6t2pKZiNDMfZ1yP7svzAlS4/JV9F
	 CqLqdFUkR6goI6Dm5Nzb8RlDBpMv2OfI4QbdlajhIiYKROefWcYQzt5NimVNiGinOU
	 MJfYLL7z7FjPg==
Received: from [100.115.32.243] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id AE/D4-27579-BFCB6D16;
 Thu, 06 Jan 2022 09:57:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSff97mu
  JBse+iltcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBn/Dz1lLtgkWHH1nGAD4w3+LkZODiGBJ4wS
  7y7XdjFyAdkXmCQO397ICuGcYJRYe/khM0gVm4C6xOObrxlBbBEBfYmls/eAxZkFVCW6L65hB
  7GFBbwk/l08CWazCKhIdB3ZDWbzCrhL/Or6DWZLCChITHn4HqyXU8BDor+/jRXiCneJk9M/sk
  LUC0qcnPmEBWK+hMTBFy+YIXqVJE6s+MgEYVdIvD58CSquJnH13CbmCYyCs5C0z0LSvoCRaRW
  jdVJRZnpGSW5iZo6uoYGBrqGhqa6xha6RoZFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yT
  opeXWrKJERjEKcVqV3Yw7ln1U+8QoyQHk5Iob5fWtUQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rx1O4BygkWp6akVaZk5wIiCSUtw8CiJ8P7aCJTmLS5IzC3OTIdInWJUlBLn7QfpEwBJZJTmwb
  XBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeWSBTeDLzSuCmvwJazAS0+JzcZZDFJYk
  IKakGJpspj+TlNb9GhW3iuBJ1x2nert9+mvxa9rMuNgtNf/f9067FRf7H5ZyCL/m3F0uvlVGQ
  Ss3dkaL/vOpD9N0eDS8pwSoRg0aOhQ+5mls/MDufvKs6w/EXh56pWnD0o5DZk5fLKZSevZsh3
  VjF11a3VERSapf989vHpsfOffh6/eITZcV7GLMTa120q7d/cG0+fdFNv9H3xYtnPGxadz60Vr
  5hvf436H3F1J+Nv8R6RZzcFbi1BM8nfDw7Pet6SOKVOzf++1+tvmvaIMYqMme+Y6VSpo5E/i2
  NmZ8mpSSm70xsO/wm/MNqIzmtjT8mP7OMa5Fzkq6X6X78/eihF2tZT5VMlzSInKLxedNL5V/q
  SizFGYmGWsxFxYkAZkN7gV0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1641462764!109095!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6043 invoked from network); 6 Jan 2022 09:52:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jan 2022 09:52:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 26887100445
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0CF3F10033B
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 6 Jan 2022 09:52:38 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.3.4 -> 1.3.5
Date: Thu, 6 Jan 2022 17:52:23 +0800
Message-ID: <1641462745-19071-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 09:57:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94670

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================

-Fixed regression in Series.equals() when comparing floats with dtype object to
None (GH44190)
-Fixed regression in merge_asof() raising error when array was supplied as join
key (GH42844)
-Fixed regression when resampling DataFrame with DateTimeIndex with empty groups
and uint8, uint16 or uint32 columns incorrectly raising RuntimeError (GH43329)
-Fixed regression in creating a DataFrame from a timezone-aware Timestamp scalar
near a Daylight Savings Time transition (GH42505)
-Fixed performance regression in read_csv() (GH44106)
-Fixed regression in Series.duplicated() and Series.drop_duplicates() when Series
has Categorical dtype with boolean categories (GH44351)
-Fixed regression in GroupBy.sum() with timedelta64[ns] dtype containing NaT
failing to treat that value as NA (GH42659)
-Fixed regression in RollingGroupby.cov() and RollingGroupby.corr() when other
had the same shape as each group would incorrectly return superfluous groups
in the result (GH42915)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-pandas_1.3.4.bb => python3-pandas_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.4.bb => python3-pandas_1.3.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb
index cde43184bb..2547875395 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "a2aa18d3f0b7d538e21932f637fbfe8518d085238b429e4790a35e1e44a96ffc"
+SRC_URI[sha256sum] = "1e4285f5de1012de20ca46b188ccf33521bff61ba5c5ebd78b4fb28e5416a9f1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


