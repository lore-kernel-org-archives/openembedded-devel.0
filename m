Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA2CC77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:05:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.66296.1680516337241754033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KsUMSutC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516341; i=@fujitsu.com;
	bh=BI2Lk9XyYZYdrQBLYJEHLsL/PsDBMqSFmuOQJEY5oj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KsUMSutCcuUwjIg5BQj8Fv9eu/XmGVSeEsOP4RnW4qO9tZp0/2uFrg26Vx8gKDGgA
	 XM8x/m/w5THZGMpt28a4gYC3OmoaT+FlotIbtYbjjcMqZrBAG0P1RVMVbPTfx7yiZn
	 v1zHsU+WeM+w2EV6lG2Y5fm26cWnilaSrqVqCLesEac28uuTGwOo+P8c3j3i4lMOK4
	 I8aVYzQWSMjmu3c+oXT5BeZ6KSzVoH0wpkeGRgbJ75aLdPXJT2S7cRWgEZXr6ACOiZ
	 O9v/JDprbS1sV9y1GZRpWl+mHtmEBCeT92KQ4NHjLrR4Fi5mQVxPbZFKwgz0O6h5mF
	 A87QZxzSUyhpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWffLEq0
  Ugzc/TSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz+Wc9ZCro4K749uMnewLiWo4uRi0NI4CGj
  xPyF69ghnMtMEtNmXmGFcHYzSmz6dJSpi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBX4kdr6YygtgsQPFPSx6BxXkFnCTe9b0FmyMhoCAx5eF7sF5OAWeJY7uaWUBsIaCaji
  utUPWCEidnPmGBmC8hcfDFC2aIXkWJ2Zch6iUEKiQapx+CmqkmcfXcJuYJjIKzkLTPQtK+gJF
  pFaNpcWpRWWqRroleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5e
  askmRmDwphSzvt3B+L/3r94hRkkOJiVRXsF6rRQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzzF
  gHlBItS01Mr0jJzgJEEk5bg4FES4VVcAJTmLS5IzC3OTIdInWJUlBLnvbMYKCEAksgozYNrg0
  XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGIgU3gy80rgpr8CWswEtLg1SgNkcUkiQkq
  qgYnZW23DmvAbDzRe816ZrxMTxn3ua6ymyBVZm5gVURVnHvDn75tQ9LU5TvWKpeHav+HG8jKR
  itr10teTNm+/6vlJ+6Pb8o9ffTh4JCcWLt569VikK8+iqe0b2N98e6a+8rPfgl4WUdYJqXPcn
  TrTjh2YdvWazDsd3ve5LG4dFgoV6Z9jb7QvUNoq0mKZojKl7h5X0a7Pwmfmh3dNYKw5vUnuvv
  PCcGWu6VN2n+68/119wxVN3dU/ul/95MtKa49kzM97z2HWtb9hXw+/cHV9k9Lv3DdSkle+3F/
  0b4IS+0O21dHtjq2GrqIJbyyuzAzSOPo3/3mbdvOnCXV20z/Z5Cl75F+Mmx0577zv6ydHg5VY
  ijMSDbWYi4oTAZYhumxZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1680516340!1459908!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1695 invoked from network); 3 Apr 2023 10:05:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:05:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7869F162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 756207C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:05:39 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.11.0 -> 8.12.0
Date: Mon, 3 Apr 2023 18:05:21 +0800
Message-ID: <1680516324-30996-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
References: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101920

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.11.0.bb => python3-ipython_8.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.11.0.bb => python3-ipython_8.12.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
index 875e89abe..0cfc80ec9 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "735cede4099dbc903ee540307b9171fbfef4aa75cfcacc5a273b2cda2f02be04"
+SRC_URI[sha256sum] = "a950236df04ad75b5bc7f816f9af3d74dc118fd42f2ff7e80e8e60ca1f182e2d"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


