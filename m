Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA38CCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:15:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4582.1655968500353513030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wE5ldU4N;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968498; i=@fujitsu.com;
	bh=v9TgA6HJHXSfMwBtFLMBm50gdVR5co1ptk+x46u3LZk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wE5ldU4NC9QhIr3ifdtGLcl+jmNTvNl+Y/V4ATrfNuFPfMdcRhtdMulOpoe7wnL4C
	 dgeKrVsOr6djTs86Gqtb0tg6RKCUrQwHExRxpnxIi4pVTNOOYHdQ+xyKWd+TNw2HV/
	 Kn8D/eE4kRHG4uud1H28MMcktX35FljhmgILikAmEmL6/IoYkjNorFDgmWVUa02J4c
	 rCgMNvJfwG6I2Jk6Dnvb1ajn7OGq7oWqgwyWFOuMTapVh73Uo5U/k6NNGI3m7VNrNU
	 f6oqrX+pFNlCpqBBzvd0NymJtp0e5lpulD/c5MLRjdyuh/3sA3DD2Ij17WVUp+2yCP
	 aGnTWcgy9tlAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8OxWfej0JY
  kg+cftC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow3DyeyFFzkq7jzKLSBcTZvFyMXh5DAQ0aJ
  HwcXMUM4t5gk5tw8yA7h7GGUaNz0nrWLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAW+JbS8XgNWwCKhKTOrZwAZi8wo4Shy/3AEWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTIG2sa2hirpdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYminF6ZN3
  MF7a90vvEKMkB5OSKO9WgS1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4L/ED5QSLUtNTK9Iyc
  4BxApOW4OBREuGdA5LmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17YDzEIsefl5qVLivA1sQA
  0CIA0ZpXlw42CxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9HkIt5MvNK4La+AjqICei
  gJ8s3gBxUkoiQkmpgUv0iyShbpMKTKNXqG6H6ufLfoWuaM2K4NQPbSyYd4P/izRq22O11rbBt
  QON/49tdUrsa92flPru64NvL31e4j32VmDvLLGhT8tm5r/zqKsIuTu+rn3nhVNznb9OO2kfam
  d1Pe3P4iKXGZJsJ/Y+a0nxvFynk6T82+WO4akacVEup6fIrS4TVV85Y11wlV+AvF6qsVXxpYv
  qE7ZU6X2JzeY0nXonqD27s3Bj2ROTqnPVPbtVOW81kERkfHBj1of7mu8VTo736gzZHi63vMfV
  yNNV7U7/92rVll/Q0E0WaJuaaW75Xerhh2cVjs89O0j/5WklFgkmGx+A/e3Pu57jbtz3nbOQR
  eawrdridt6VeiaU4I9FQi7moOBEAIEu2lmADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1655968497!86581!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20578 invoked from network); 23 Jun 2022 07:14:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:14:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 16AB2150
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:14:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 09F4C153
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:14:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:14:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dill: upgrade 0.3.4 ->  0.3.5.1
Date: Thu, 23 Jun 2022 15:14:43 +0800
Message-ID: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97584

License-Update: Copyright year updated to 2022.

Add dependence python3-logging.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-dill_0.3.4.bb | 14 --------------
 .../python/python3-dill_0.3.5.1.bb                | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
deleted file mode 100644
index ff0104cc8..000000000
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Serialize all of python"
-HOMEPAGE = "https://pypi.org/project/dill/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41adceb584fdde8323ddf9ad23c07fe5"
-
-SRC_URI[sha256sum] = "9f9734205146b2b353ab3fec9af0070237b6ddae78452af83d2fca84d739e675"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "zip"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-multiprocessing \
-"
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb
new file mode 100644
index 000000000..d9110e3fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Serialize all of python"
+HOMEPAGE = "https://pypi.org/project/dill/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61f24e44fc855bde43ed5a1524a37bc4"
+
+SRC_URI[sha256sum] = "d75e41f3eff1eee599d738e76ba8f4ad98ea229db8b085318aa2b3333a208c86"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "tar.gz"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-logging \
+"
-- 
2.25.1


