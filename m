Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0862AFA3746
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:07:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.1665.1667268435228990555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k9rAWl5r;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268433; i=@fujitsu.com;
	bh=i2Boz9zJfygt8XtwwcTWFT+rIEG/qWhWm7t7ZqqD2ps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k9rAWl5rCwv5OvVZCxImsd4z2+CNpDKONu9F0CT8Pv2i9IeMqCL2/v+YaqekI68QN
	 bMSSCS/yHz4SlW/6GXixUbRVMKQE5Q3c8AXmMWurfBOA93GK9yPm1+gMSBsWBPQqik
	 t7jvZZF1+gsA8SvFp+RhSpuzo85JQaGtf25lNk+ddA0Uq7EiDczMOVHEaa7Iwn24+b
	 ddNXdjx0ibcKVfPTed15Nzqs81JULl1+3XS3LYtW3VTY7aZFNl6dgSseHqwHTdmm0r
	 qLNWYqP99jCrYEjKYFTITK10//4CBwtEim24Z0EOWaXRRuxMsOBWZgLbbtVD8nbHiS
	 jZME0d4kyE7dw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8ORqBtQn5B
  ssPy3rMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF+wxamgj+iFd9vTGZuYHwi3MXIxSEk8IRR
  4ub3CWwQznUmiUNvz0A5uxklnjz8B+RwcrAJSEncuP8fzBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SzgL7G08yIriM0CFF/27z5YDa+Ao8S8rv0sILaEgILElIfvgeIcHJwCThJLH+SDhIWASrpub4
  MqF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3Aw1pkJi1qw2JghbTeLquU3MExgFZyFpn4WkfQEj0yp
  G8+LUorLUIl1DI72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDwTSlOvruDsXP5H71DjJIcTEqivP8lEpKF+JLyUyozEosz4otKc1KLDzHKcHAoSfBG1
  gDlBItS01Mr0jJzgLEEk5bg4FES4f1VDZTmLS5IzC3OTIdInWK055g6+99+Zo7lYHLm17YDzB
  yb9nUdYBZiycvPS5US53WqBWoTAGnLKM2DGwqL/UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORi
  VhHkbQG7jycwrgdv9CugsJqCz2NrjQM4qSURISTUwabgKm5i2O39+O5318wSLxucVzZs0tmyd
  NFMl4YtEtLaACOeyu7PnGH25vWfH3nl3bsRUHzC6kP5VrsbpahJj/PYnvcntTnYSsicz/s95K
  r1or514MIfXkSuH1exi9mzZPcUhQyvtc1L7obc85dsVXtYVPNS6f1Wp0iEvRtCRV/B6+1rd0n
  NS1nZPc3cFqjw7uvdf3cvd2x0/vct4szomWqR38upXXln871kKuF++M/q28nguk3NJs72GPus
  NNQ41qTqFfxtPr+0JtFi6av0bp+6Gedzfs9/cbi482eGdXSO33FNaq8B2LWsfC/89hZxjSzSn
  htR3n5vloxiTc0z+k/5D7SfJHy0/XBBsqF6sxFKckWioxVxUnAgAlgpfGXgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1667268432!901104!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18573 invoked from network); 1 Nov 2022 02:07:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:07:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E92B4100192
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DCD1A100043
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:07:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-html: upgrade 3.1.1 -> 3.2.0
Date: Tue, 1 Nov 2022 10:06:47 +0800
Message-ID: <1667268408-9931-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
References: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99385

From: Wang Mingyu <wangmy@fujitsu.com>

no-pip.patch
removed since it's included in 3.2.0

Changelog:
chore: Deactivate broken test for now (#557)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pytest-html/no-pip.patch   | 24 -------------------
 ..._3.1.1.bb => python3-pytest-html_3.2.0.bb} |  4 +---
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-html/no-pip.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-html_3.1.1.bb => python3-pytest-html_3.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html/no-pip.patch b/meta-python/recipes-devtools/python/python3-pytest-html/no-pip.patch
deleted file mode 100644
index e120498846..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-html/no-pip.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Submitted [https://github.com/pytest-dev/pytest-html/pull/516]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From d7fbc79d428323c838ce68a51e1e1806c2096a76 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 23 May 2022 13:46:50 +0100
-Subject: [PATCH] pip isn't a build dependency
-
-It's possible, and even desirable, to build modern Python code without pip, for example by using the `build` and `installer` packages.
----
- pyproject.toml | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 2683f072..e3f25bf7 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,5 @@
- [build-system]
- requires = [
--  "pip >= 19.3.1",
-   "setuptools >= 42",
-   "setuptools_scm[toml] >= 3.5.0",
-   "setuptools_scm_git_archive >= 1.1",
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb
index 1bbdfb633b..713a84b416 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb
@@ -4,7 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "3ee1cf319c913d19fe53aeb0bc400e7b0bc2dbeb477553733db1dad12eb75ee3"
+SRC_URI[sha256sum] = "c4e2f4bb0bffc437f51ad2174a8a3e71df81bbc2f6894604e604af18fbe687c3"
 
 PYPI_PACKAGE = "pytest-html"
 
@@ -12,8 +12,6 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-git-archive-native"
 
-SRC_URI += "file://no-pip.patch"
-
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pytest \
 "
-- 
2.25.1


