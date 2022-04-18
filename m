Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970FDC64EB6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.38047.1650281362272997416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 04:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vt9JNuza;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650281360; i=@fujitsu.com;
	bh=P4CQFd1Om0/L/0/bdq9Rp/hF8gvOB87jOvECtb/wcNs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Vt9JNuza+bktjTDVOtV4do3pkx44tCAuOM1EJTb9+uOpAlu4V2W0op2rlBSr45tEu
	 b9OMxVFq4Ma8Starl3LNJ8JJhrpA190RvsVTq6cgZTfs0AKl0tcAZZvcOEK6OZpeFz
	 PGaoLCeqkFEVLTgIGLB49Ad7YFJf5xNT1ZeYDKUNtCCf6CQqUjPOcaK+Yqx2lN+cYL
	 tkKhNEcqv/e9UnQIxxeMV9LYAUPRzGslWr3VFQ1FG0vcx1E8fjExvIOMlUDoMJBsWX
	 XICUf+5kq0LiOjCPXbhLjHSxx1uWPUuSQsYZgsMFHWHRsWV8zU0rC4q9QuyXNyX2Tz
	 Ma3RHes+ODcGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRbffOzb
  JYGKPnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHjWhtrwRbRiq+3/7M0MK4W7mLk5BASmM0k
  MXFfShcjF5C9h1Hi9fV3LCAJNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQW8JR537
  wGrZxFQlZi24wgTiM0r4CSxcecFsHoJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixdQNYoSsy83s0
  DYFRKzZrUxTWDknYWkZRaSlgWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjYBME73EKt1EvdR
  S3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMAgSylWyNjB+H3lT71DjJIcTEqivCv+xCQJ
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCN94hNEhIsSk1PrUjLzAEGPExagoNHSYR3iTtQmre4I
  DG3ODMdInWKUVFKnHeCJ1BCACSRUZoH1waLskuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhH
  nNvICm8GTmlcBNfwW0mAlo8fb5kSCLSxIRUlINTKnHN/88NJfhjpPgMuk9J+9MkxOQ3DlJXo0
  h6r75J6nr1SJHM4tFGa5Jr0m12Kh+tZGtJviCrGTolT3Ja+IKvz/wtDkmeK7mmI3sSUY9RfF5
  EUdTDm+6IfhSaHe7Z8rmf0rKM6abBDL+TX0XwdU8c89yG2+1yytb3h/lP1N3Qrbt2pJ5QqYXV
  cpr22Z2vfV50bNlVfARK1v94LmnLJfvsLjy5aW9uvn22bYWRyT2tsz7d22Lofu1HfHSPaETdk
  5vUhfo+15d+Pn4td9tDftfXl0S178rLdGk1u1TaZq7dxHLeicbsXDv7xdiXniXHNzwrvjK1Ir
  zc6S62Lj/7lf89u28npz07Gu9EoVtbrP2z1ZiKc5INNRiLipOBACy/7JGLQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1650281359!199998!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30633 invoked from network); 18 Apr 2022 11:29:19 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 11:29:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23IBTDbV020593
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 12:29:19 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 12:29:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v3] python3-cppy: upgrade 1.2.0 -> 1.2.1
Date: Mon, 18 Apr 2022 19:28:56 +0800
Message-ID: <1650281336-16196-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96683

Add patch 0001-Fix-build-error-as-following.patch to fix build bug.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-error-as-following.patch   | 28 +++++++++++++++++++
 ...n3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} |  9 ++++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-error-as-following.patch
 rename meta-python/recipes-devtools/python/{python3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-error-as-following.patch b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-error-as-following.patch
new file mode 100644
index 0000000000..5a613c827a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-error-as-following.patch
@@ -0,0 +1,28 @@
+From a6ba15048bbb660abfa094b581862b4936ac4005 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Mon, 18 Apr 2022 12:19:35 +0900
+Subject: [PATCH] Fix build error as following:
+
+flit_core.config.ConfigError: description must be specified under [project] or listed as a dynamic field.
+
+Upstream-Status: Pending
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ pyproject.toml | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 2d2ac74..66fcee0 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,6 +8,7 @@
+ 
+ [project]
+ name = "cppy"
++description = "A small C++ header library"
+ readme = "README.rst"
+ requires-python = ">=3.7"
+ license = {file = "LICENSE"}
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
index f86f571938..57ef3b2776 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
+SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
 
 RDEPENDS:${PN} += "python3-setuptools python3-distutils"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core 
+
+SRC_URI += " file://0001-Fix-build-error-as-following.patch \
+           "
+
+DEPENDS += "python3-setuptools-native"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


