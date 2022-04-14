Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4CAC47092
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.6846.1649901402849283052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=sGE8KK2I;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649901400; i=@fujitsu.com;
	bh=mM9FQdGFsLwGLCux1q38gnqyhcc2upOY/LlJmcz5wl8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=sGE8KK2Irmz3z6khkEKYcaAbAPk3qzT0/Zd9tDtiiGMCCJCmssPfhOGYYwbasOkU5
	 GHwXX7t/S8hBvS/xljfeKrA/6++GFag2DfabfaFkltqS+n+JXjJk4WFNFW/BJVkTkm
	 qlneYveTj5B8N12+6cr+3x1SnoTBsU3GZzUhn/cw31AbEEcDHH0MNDrdWbJcscP63X
	 JFx39XZ8Z6RESXA/AJ23rlx8jx/VELY8d/3ZfiUY2QfzPrU/DaPhZMSLDZUAbYroOK
	 O5SgSok2OSjrV7a+Zxbrrdp8Z/IJ5GJzsgia0RbetbdHlwGFLR09IHJfRvvYykAZZq
	 tLfeCBqXBAU0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSTe8Pjz
  J4P5hWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ0yaWgnviFasftDM2MHaJdjFycQgJPGGU
  +PG9mRXCucAkMbn1OROEc4BR4v+PO8xdjJwcbAK6Ei9+LGYBsUUE9CWWzt4DFhcW8JO4O3E/k
  M3BwSKgKvH3kjZImFfAQ+Lii3XsILaEgILElIfvmSHighInZz4BG8MMVN595CkThC0v0bx1Nt
  gYCQFFidnT5SFaKyReH77EDGGrSVw9t4l5AiP/LCSTZiGZNAvJpAWMzKsYrZOKMtMzSnITM3N
  0DQ0MdA0NTXWNLXWNDI31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECgzWl
  WP3qDsbNq37qHWKU5GBSEuXNMgxPEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBm1IHlBMsSk1Pr
  UjLzAFGDkxagoNHSYS3qQYozVtckJhbnJkOkTrFqCglzusA0icAksgozYNrg0XrJUZZKWFeRg
  YGBiGegtSi3MwSVPlXjOIcjErCvNNBpvBk5pXATX8FtJgJaPG3VaEgi0sSEVJSDUz21a7X+qz
  OsbGYmj9/dJb1n5HRmv2l1TLK5nLLrhxetDx6u1nossylBsvtmlw2cPm+Erpwn+Fnwn+3j3xO
  QRuLpvDuMRLeveaxtOUUCeXtyUd+bXS2KXS9FPTcqZBnwmuGwtRumyUv9/TNDAi2dzr83j6kZ
  7Zv+8sjYm5CDj/ZLXrbzhV/c1yTILErUn9dksPMeUkL1W+JbDjzLPzya55Nt1Xz1b91MMybJj
  z9fcrs9ReCanvTlpSv2h45e8XsRqHm8u7sY1J7e5+sSM882Jl5Z+EHI+nFXScyve5ry9r5FDQ
  z86yRZL4hHn3IYcWK2befC0Vq7FDc5vWrd1Wx/Bv2m+87BSMkcnmk+u+aiSqxFGckGmoxFxUn
  AgBQeN3MUQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1649901399!70737!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30879 invoked from network); 14 Apr 2022 01:56:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:56:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 20CF310046F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:56:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0B26C100467
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:56:39 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:56:35 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nocaselist: upgrade 1.0.4 -> 1.0.5
Date: Thu, 14 Apr 2022 09:56:28 +0800
Message-ID: <1649901388-13842-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96628

License-Update: type of file changed
 "ASCII text, with CRLF line terminators" -> "ASCII text"

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Bug fixes:
----------
Mitigated the coveralls HTTP status 422 by pinning coveralls-python to <3.0.0 (issue #55).
Fixed a dependency error that caused importlib-metadata to be installed on Python 3.8, while it is included in the Python base.
Fixed new issues raised by Pylint 2.10.
Disabled new Pylint issue =E2=80=98consider-using-f-string=E2=80=99, since f-strings were introduced only in Python 3.6.
Fixed install error of wrapt 1.13.0 on Python 2.7 on Windows due to lack of MS Visual C++ 9.0 on GitHub Actions, by pinning it to <1.13.
Fixed TypeError when running Sphinx due to using docutils 0.18 on Python 2.7.
Fixed error when installing virtualenv in install test on Python 2.7.
Fixed that the added setup.py commands (test, leaktest, installtest) were not displayed. They are now displayed at verbosity level 1 (using =E2=80=98-v=E2=80=99).

Enhancements:
------------
Enhanced test matrix on GitHub Actions to always include Python 2.7 and Python 3.4 on Ubuntu and Windows, and Python 2.7 and Python 3.5 on macOS.
Support for Python 3.10: Added Python 3.10 in GitHub Actions tests, and in package metadata.

Cleanup:
-----------
Removed old tools that were needed on Travis and Appveyor but no longer on GitHub Actions: remove_duplicate_setuptools.py, retry.bat

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-nocaselist_1.0.4.bb   | 8 --------
 .../recipes-devtools/python/python3-nocaselist_1.0.5.bb   | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
deleted file mode 100644
index 60c79c22a8..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY =3D "A case-insensitive list for Python"
-HOMEPAGE =3D "https://nocaselist.readthedocs.io/en/latest/"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd229da563da18fe5d58cd95a6467d584"
-
-SRC_URI[sha256sum] =3D "73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
new file mode 100644
index 0000000000..22b8825801
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
@@ -0,0 +1,8 @@
+SUMMARY =3D "A case-insensitive list for Python"
+HOMEPAGE =3D "https://nocaselist.readthedocs.io/en/latest/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] =3D "e1c12ca2ae9d345b34948f2c8f60e3894619e2be2ed28b4ecc5e7f1dea117d1d"
+
+inherit pypi setuptools3
-- 
2.25.1


