Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.8565.1631784023000013874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=WK17rP4F;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784020; i=@fujitsu.com;
	bh=oBEKRJpcv1vcHTaUtN14EYC4s5pID4V0tM++qWpAM2M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=WK17rP4FJ+ll/4CGpT01YqT4nGQx9sJ8rceps4g18iy6KmkvohO0ZY/h4xp9q+nf3
	 rAKw8IImK8H7c7MdteeumX/HbrQgY0lT34Z5FIgvy71zXVjtrA/7dXRwUsJ9GvAK2B
	 nHcFLW3fw9+iYeCKY5OHUaCFi9KykJESGW6MmH71EDkUGCCmsedPXMOsDfR5mjnMpu
	 RCJWIiWh8qcD76QvB7ixExAnQ5hAkTalw2k7cay8lSwVPy6Qtht1tLuFPkjV3X998h
	 oKSeFfgeLoMGfKPqEA09hPfWdK4O7PlVO28QTHbgP7sKPoWdMEJKFh9j0JegW2w/VO
	 WnI/EkvGH9pvQ==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 01/44-15923-45C03416; Thu, 16 Sep 2021 09:20:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxVTeExzn
  R4PVzAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJqfWMBdskK67+WsfWwLhbrIuRk0NIYDaT
  xKqvEl2MXED2HkaJJaf6GEESbAK6Eucer2UHsUUE9CWWzt7D3MXIwSEs4CXxco8zSJhFQFXi7
  Ny1YGFeAQ+JHZPlQMISAgoSUx6+ZwaxeQUEJU7OfMICYjMDlXcfecoEYctLNG+dDdYqIaAoMX
  u6PERrhcTrw5eYJzDyzkLSPQtJ9ywk3QsYmVcxWiYVZaZnlOQmZuboGhoY6BoaGuua6xoZG+o
  lVukm6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECQy6lkP35DsZVbz7oHWKU5GBSEuU9
  eNMpUYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7wMu50QhwaLU9NSKtMwcYPjDpCU4eJREeAtA0
  rzFBYm5xZnpEKlTjIpS4rwG3EAJAZBERmkeXBss5i4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52
  BUEuZ1BRnPk5lXAjf9FdBiJqDFR/Y7gCwuSURISTUwmdY1vHqkUnH66hHGCytlfG50PV3Cvll
  thdP3Z5I5X244eaW0v6lk6+58sNJJ696X11qap+zWvdLwjX5woFck9NffOJfa7zXZq3ICjSpr
  9DdfeFM3YfPPyQxr/56fqX3IVbnQIzD8SMZvpjCRZ5blx+bMe/ivKW92zv3YQ8oXwsuLNt48F
  Wke8Oh7rivH3S13zIzVZ4fNf3OzN3NNYYSdjc0O642XLWPOZV09/eBEgfqRix/P5NbzeP+yPr
  XhwpcCL5+p+9en2yuF7vOq1f5uvPvoo5PbnBaK8D6V7nA3PcLwbsf7eSrR85f+TLIwC/s8v3C
  9VfNvxkWs8nZLQ8xkC+dF+ex+nHX6/J8ZIh6mb5VYijMSDbWYi4oTASvUDqo0AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-245.messagelabs.com!1631784019!168202!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15326 invoked from network); 16 Sep 2021 09:20:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:20:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9KJXg024042
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:20:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:20:18 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.3.2 -> 1.3.3
Date: Wed, 15 Sep 2021 14:30:50 +0800
Message-ID: <1631687450-89297-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Fixed regressions
Fixed regression in DataFrame constructor failing to broadcast for defined Index and len one list of Timestamp 
Fixed regression in GroupBy.agg() incorrectly raising in some cases 
Fixed regression in GroupBy.apply() where nan values were dropped even with dropna=3DFalse 
Fixed regression in GroupBy.quantile() which was failing with pandas.NA 
Fixed regression in merge() where on columns with ExtensionDtype or bool data types were cast to object in right and outer merge 
Fixed regression in RangeIndex.where() and RangeIndex.putmask() raising AssertionError when result did not represent a RangeIndex 
Fixed regression in read_parquet() where the fastparquet engine would not work properly with fastparquet 0.7.0 
Fixed regression in DataFrame.loc.__setitem__() raising ValueError when setting array as cell value 
Fixed regression in is_list_like() where objects with __iter__ set to None would be identified as iterable
Fixed regression in DataFrame.__getitem__() raising error for slice of DatetimeIndex when index is non monotonic
Fixed regression in Resampler.aggregate() when used after column selection would raise if func is a list of aggregation functions 
Fixed regression in DataFrame.corr() where Kendall correlation would produce incorrect results for columns with repeated values 
Fixed regression in DataFrame.groupby() where aggregation on columns with object types dropped results on those columns 
Fixed regression in Series.fillna() raising TypeError when filling float Series with list-like fill value having a dtype which couldn=E2=80=99t cast lostlessly (like float32 filled with float64) 
Fixed regression in read_csv() raising AttributeError when the file handle is an tempfile.SpooledTemporaryFile object
Fixed performance regression in core.window.ewm.ExponentialMovingWindow.mean() 

Performance improvements
Performance improvement for DataFrame.__setitem__() when the key or value is not a DataFrame, or key is not list-like

Bug fixes
Fixed bug in DataFrameGroupBy.agg() and DataFrameGroupBy.transform() with engine=3D"numba" where index data was not being correctly passed into func 

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pandas_1.3.2.bb =3D> python3-pandas_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.2.bb =3D> python3-pandas_1.3.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb
index 55700b51cf..6e557ed7bc 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE =3D "http://pandas.pydata.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] =3D "cbcb84d63867af3411fa063af3de64902665bb5b3d40b25b2059e40603594e87"
+SRC_URI[sha256sum] =3D "272c8cb14aa9793eada6b1ebe81994616e647b5892a370c7135efb2924b701df"
 
 inherit pypi setuptools3
 
-- 
2.25.1

