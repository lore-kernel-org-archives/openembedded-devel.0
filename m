Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.15528.1627875548650266707
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=mUFO2dwi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627875546; i=@fujitsu.com;
	bh=x+aehQH722zJJqm9GSjkY0SFMfApByIPPfrrXNN+jWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=mUFO2dwiidDRSPAVt0+neQTtwumZ6/nq1x/lotDM72cwMaFCvjtJZzHbfxLsG51Pr
	 UxOxULOICTYQwpxFo/shdNyjYrcTm12P6YzpIGuEJoHI9Nmb3d1MBhBX4ExAklg6ZB
	 zVG1oEYTJ8o3YxYjhGn6vI8N5sOyfBRbMnmX/J8yj2OYzuojUIfUd68pDskeJb+S6H
	 8Y44piCb6vl0FZqyccatUOIqrgWw7Yv84Xcbx4P223Ap92bu05BzgDWVjdE5Eu/ZJb
	 tfREZIDeEhLSQe2A5EggVoDsNGTAILEMKFkqm/OI26Cwn3TzJk1HN/qKCFgiLv1ns0
	 VCTQb/I+VrE2Q==
Received: from [100.113.7.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 2E/CC-00773-AD867016; Mon, 02 Aug 2021 03:39:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqnszgz3
  RoHmHtcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG3/wtjwRuJigUzz7A0MDaJdTFycQgJzGKS
  OLN5LksXIyeQc5xRYu7lUhCbTUBHouNFN1hcREBfYunsPcwgtrBAkMTxd0tZQWwWARWJp92PG
  EFsXgF3iTu3roLFJQQUJKY8fM8MEReUODnzCdgcZgFVie4jT5kgbHmJ5q2zmSHqFSW27zzDAm
  FXSLw+fIl5AiPvLCTts5C0z0LSvoCReRWjRVJRZnpGSW5iZo6uoYGBrqGhsa6ZroW5XmKVbpJ
  eaqlucmpeSVEiUFIvsbxYr7gyNzknRS8vtWQTIzDsUgrZwncwnnn9Qe8QoyQHk5Iob0gbS6IQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7zdPZEIcGi1PTUirTMHGAMwKQlOHiURHhnpgGleYsLE
  nOLM9MhUqcYFaXEeaeC9AmAJDJK8+DaYHF3iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73
  yQ8TyZeSVw018BLWYCWjw1gxVkcUkiQkqqgWl6BY84S64x1+aLOl/7EipXFr2SDb1ksU1+75m
  f3NoT3t6de3CVb7fN7iSxvIx9Z19nfHafe6M/Qj5gU4lUcLm/fmbo6RPTN+2+4blwTez2u+nM
  XMrZZkVH9iZZuej+X3j+459uK3OfDqHdWxIkT8480Sj4NG2vbdibm8u4MybvkPHyN9HlZGVfs
  jUwvYaJ0XmXqPelk0prLW6x22WZm8oIls41n3szZtcds2DHQwYtZgWmSXnmP1SypxuESEq/ec
  IaUiERfa5fPbJlTWHindqS2fPSuc1XL/q+zG/mItv4r1MYd8xoruvnNDrY4+FwV7XTQ+hfrb/
  0efkbp89uV8wJ7/y3plD7mbHNdGZvJZbijERDLeai4kQApNLpLzYDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1627875545!292417!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16047 invoked from network); 2 Aug 2021 03:39:05 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:39:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723d5MS031571
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:39:05 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:39:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.3.0 -> 1.3.1
Date: Mon, 2 Aug 2021 11:38:56 +0800
Message-ID: <1627875536-34323-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Fixed regressions
Pandas could not be built on PyPy (GH42355)
DataFrame constructed with an older version of pandas could not be unpickled (GH42345)
Performance regression in constructing a DataFrame from a dictionary of dictionaries (GH42248)
Fixed regression in DataFrame.agg() dropping values when the DataFrame had an Extension Array dtype, a duplicate index, and axis=3D1 (GH42380)
Fixed regression in DataFrame.astype() changing the order of noncontiguous data (GH42396)
Performance regression in DataFrame in reduction operations requiring casting such as DataFrame.mean() on integer data (GH38592)
Performance regression in DataFrame.to_dict() and Series.to_dict() when orient argument one of =E2=80=9Crecords=E2=80=9D, =E2=80=9Cdict=E2=80=9D, or =E2=80=9Csplit=E2=80=9D (GH42352)
Fixed regression in indexing with a list subclass incorrectly raising TypeError (GH42433, GH42461)
Fixed regression in DataFrame.isin() and Series.isin() raising TypeError with nullable data containing at least one missing value (GH42405)
Regression in concat() between objects with bool dtype and integer dtype casting to object instead of to integer (GH42092)
Bug in Series constructor not accepting a dask.Array (GH38645)
Fixed regression for SettingWithCopyWarning displaying incorrect stacklevel (GH42570)
Fixed regression for merge_asof() raising KeyError when one of the by columns is in the index (GH34488)
Fixed regression in to_datetime() returning pd.NaT for inputs that produce duplicated values, when cache=3DTrue (GH42259)
Fixed regression in SeriesGroupBy.value_counts() that resulted in an IndexError when called on a Series with one row (GH42618)

Bug fixes
Fixed bug in DataFrame.transpose() dropping values when the DataFrame had an Extension Array dtype and a duplicate index (GH42380)
Fixed bug in DataFrame.to_xml() raising KeyError when called with index=3DFalse and an offset index (GH42458)
Fixed bug in Styler.set_sticky() not handling index names correctly for single index columns case (GH42537)
Fixed bug in DataFrame.copy() failing to consolidate blocks in the result (GH42579)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pandas_1.3.0.bb =3D> python3-pandas_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.0.bb =3D> python3-pandas_1.3.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb
index b98e2865c7..02e21e4f83 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE =3D "http://pandas.pydata.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] =3D "c554e6c9cf2d5ea1aba5979cc837b3649539ced0e18ece186f055450c86622e2"
+SRC_URI[sha256sum] =3D "341935a594db24f3ff07d1b34d1d231786aa9adfa84b76eab10bf42907c8aed3"
 
 inherit pypi setuptools3
 
-- 
2.25.1

