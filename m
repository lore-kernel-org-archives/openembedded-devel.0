Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0271C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.3831.1675844064108218800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IQfppCLs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675844062; i=@fujitsu.com;
	bh=rgAO5kTKQK5UssHbR21qy9WZrkM2xpPCRICT2F6eUks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IQfppCLsYKQ1wI4/rhcOhc7FgPtns6ujCB3YH/AKlM8gjzOpqv649P1Gj1V1ESkqG
	 Kii587D6hJ2jRiu1ghlelkpJStYp3HZqV0NcaTwdcIg4+m0A9q26lyCV+254L79+Ns
	 g4ZHtcqc07mx4tApb/wTBzXRlcu4DxRGmog84u6phBIpz/3PQt/3ERKpHJ5XMxOnPt
	 kS1+Fa0u1divFfbW+SPXAQCQY9M5e6DSdDPV5/4sNHb/TwcwlLX/sfn0WZxU4jYCis
	 6DqlG45Xp5A1U15ih/wmELFXWRfoR2MpjdQmunBLN7RNWB0NqvrZgSF+MeMzEl7BZG
	 cEbjRCGzcG4fQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8OxWfde5ON
  kgwm/GC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyL11rYC7rFK85c2c7WwPhZpIuRi0NI4CGj
  xO5DMxghnCtMEp83HGOHcPYwShz6eh3I4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAXeJb38awWwWoPjkT0sYQWxeASeJ57MXgNVLCChITHn4nhkiLihxcuYTFog5EhIHX7yAql
  GUmH25mQXCrpRo/fALylaTuHpuE/MERv5ZSNpnIWlfwMi0itGsOLWoLLVI19BIL6koMz2jJDc
  xM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwHFOKmV/sYPzR91fvEKMk
  B5OSKK+n2ONkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8EeFAOcGi1PTUirTMHGBswKQlOHiUR
  HgjgfEhxFtckJhbnJkOkTrFqMtx9cqVvcxCLHn5ealS4rwHIoCKBECKMkrz4EbA4vQSo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWHegDCgKTyZeSVwm14BHcEEdESI6kOQI0oSEVJSDUxz1cM
  +mAecOnz11fmrZT5pex9n2n/cIsz3ZUMC55HkAqvf+Vc4+FNMo46e1dFfFb19y+eaF8F8upFp
  E45P7EyOi0h/mn3uQRiv/cEybiFp3xIXn0mV990W1h6M+13I9iUmXeDcsYRwRg0bNim3JxPUj
  osfeTeB/8B2sbrtvO9O+X5TiNp6uGLH94g7Kl1/9vW923yrXykkt+GueLle2vmwC28nBp334S
  q7Oyvg5d/Z+ldmzavze8/1Q4rHqOurT+DPCR1LzkVvj+34lujv3rn6QMnsWRMqzG62v5NUnRz
  4unSL4XdPs7bm1JMNXu1bP3/fojmxKeNfo+o8i+YzySGvd4gELva9P7tRMCBc4pASS3FGoqEW
  c1FxIgAtbOShTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1675844061!175242!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2981 invoked from network); 8 Feb 2023 08:14:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:14:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9F7D2142
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 936D073
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:14:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-meh: upgrade 0.50.1 -> 0.51
Date: Wed, 8 Feb 2023 16:14:08 +0800
Message-ID: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100988

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setup.py-switch-from-distutils-to-setuptools.patch
removed since it's included in 0.51.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-switch-from-distutils-to-setuptools.patch | 31 -------------------
 ...hon3-meh_0.50.1.bb => python3-meh_0.51.bb} |  7 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.50.1.bb => python3-meh_0.51.bb} (73%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
deleted file mode 100644
index 2eb6be5a1..000000000
--- a/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 034ac41561409ffc7836683331b6b94a641436e4 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Mon, 28 Feb 2022 09:41:02 -0800
-Subject: [PATCH] setup.py: switch from distutils to setuptools
-
-In Python 3.10 'distutils' is deprecated with removal slated for Python
-3.12. Switch from 'distutils.core' to 'setuptools'.
-
-This also allows for a 'wheel' binary archive format to be built with
-'setup.py bdist_wheel'.
-
-Upstream-Status: Backport [cf9eafdd165347f86bb4a2534c41fd805db52322]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
-
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 9c12180..3ba5195 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,6 +1,6 @@
- #!/usr/bin/python3
- 
--from distutils.core import setup
-+from setuptools import setup
- 
- setup(name='python-meh', version='0.50.1',
-       description='Python module for handling exceptions',
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.51.bb
similarity index 73%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.51.bb
index 1d9af438d..e83514af1 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.51.bb
@@ -9,9 +9,8 @@ inherit setuptools3_legacy
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=rhel9-branch \
-           file://0001-setup.py-switch-from-distutils-to-setuptools.patch \
-          "
-SRCREV = "c321ce22950aff76611a3c6beffa02b5ea3adbed"
+SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master"
+
+SRCREV = "eb5d4adc3b838704b6a68f0f77ada2063a11ab1b"
 
 FILES:${PN} += "${datadir}/python-meh"
-- 
2.34.1


