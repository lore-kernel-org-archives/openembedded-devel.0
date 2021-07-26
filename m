Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.24833.1627264043325217358
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o4p5oqnV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264031; i=@fujitsu.com;
	bh=9Z3bA1KMkcHsLtDHBRELC0zEFr83rvF/wfORw6sxaOA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o4p5oqnVfYkYaF6XYD1pHPOrwMAT8TSdl5bizijK6LrPiCUg/xX4hfCed/d8HKzrx
	 ke7e4Qd9G/KCedEUcIa/yT96Mfc7w8Te6bJbIyb1iYd7dqDUELN+xpz0ff4H09SJcD
	 feP3vY98d03xRPYTg/yLQ+vYiPR1tbKzasszT/Gtsqp2IdyUuEuLyvOkb+zXGcw4nV
	 I/nOgA15mjuPipd2K9FB2DDbsWSK5QQulAwXk0pBEEj1o7jnHFatAczJB2QhRjJASx
	 2Dq5d4vdG/V7zGKONwOM+VpAFMUXqTTB3XuRCvonG0xY0jpYTLQZkQcj9lSTKPqc8U
	 Q6sSiBFHHVe8w==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id CD/15-07821-E141EF06; Mon, 26 Jul 2021 01:47:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVVdO5F+
  CwcEGEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPH53mMBR2CFTfmPWdqYFzK38XIxSEkMJtJ
  Yu+PI8wQzh5GiUc7rjN2MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAjMfXAbyYQm0VAVeL5q
  +msIDavgLvEion3WUBsCQEFiSkP3zNDxAUlTs58AhZnFpCQOPjiBVCcA6hGUWL2dHmI8gqJ14
  cvMU9g5JmFpGMWko4FjEyrGM2TijLTM0pyEzNzdA0NDHQNDY10DS3NdM1M9BKrdJP0Ukt1y1O
  LS3QN9RLLi/WKK3OTc1L08lJLNjECgyil4IjDDsb7rz/oHWKU5GBSEuXtW/snQYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IEr6XQvwQhwaLU9NSKtMwcYEDDpCU4eJREeCN4gdK8xQWJucWZ6RCpU
  4y6HO9+Ll7ELMSSl5+XKiXOmy8MVCQAUpRRmgc3AhZdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMY
  pzMCoJ87qBTOHJzCuB2/QK6AgmoCOC6/+CHFGSiJCSamDaUy/mvzeCzWOi6oa68qz+sv1xlel
  n9H8WWWuXH1jz7fND8Ws39qx/fkZ/WgT/97WPKjJvT1cN//xLLulVwvRpe73/nD99oDcn37NU
  dPXSZNHXR25Nfry2JOP2n6yF3xfnPH4stv3YCzNfyWXNz4u0M5vn2zDOOj9jwoVk4ZUS/AuSD
  A8EpOVoZ03S1e05npwj6vZ9q9EyF4GzE5k9y6sKvPOmaWht2LbH+kzJp2qZ8D8bd+ixTdL5Mv
  1p+RvTw9qXL0ksfde08ZV9x+RX4pkCKmLrv0rfX11pf27KtInNtw1nNKb/+LSlq3tddfr3PzJ
  hpxYeLlCa/8U7R0F3lp/Qu7ADUw4eOH8520rPcuH+RUosxRmJhlrMRcWJAIdsg28pAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-287.messagelabs.com!1627264030!489610!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6009 invoked from network); 26 Jul 2021 01:47:10 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:47:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1l9TX032025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:47:09 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:47:08 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pybind11: upgrade 2.6.2 -> 2.7.0
Date: Mon, 26 Jul 2021 18:47:03 +0800
Message-ID: <1627296423-3781-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

v2.7.0 (Jul 16, 2021)
---------------------

New features:

* Enable ``py::implicitly_convertible<py::none, ...>`` for
  ``py::class_``-wrapped types.
  `#3059 <https://github.com/pybind/pybind11/pull/3059>`_

* Allow function pointer extraction from overloaded functions.
  `#2944 <https://github.com/pybind/pybind11/pull/2944>`_

* NumPy: added ``.char_()`` to type which gives the NumPy public ``char``
  result, which also distinguishes types by bit length (unlike ``.kind()``).
  `#2864 <https://github.com/pybind/pybind11/pull/2864>`_

* Add ``pybind11::bytearray`` to manipulate ``bytearray`` similar to ``bytes``.
  `#2799 <https://github.com/pybind/pybind11/pull/2799>`_

* ``pybind11/stl/filesystem.h`` registers a type caster that, on C++17/Python
  3.6+, converts ``std::filesystem::path`` to ``pathlib.Path`` and any
  ``os.PathLike`` to ``std::filesystem::path``.
  `#2730 <https://github.com/pybind/pybind11/pull/2730>`_

* A ``PYBIND11_VERSION_HEX`` define was added, similar to ``PY_VERSION_HEX``.
  `#3120 <https://github.com/pybind/pybind11/pull/3120>`_

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pybind11_2.6.2.bb => python3-pybind11_2.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.6.2.bb => python3-pybind11_2.7.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
index bd16a6d0dc..348af6ec9f 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/pybind/pybind11.git \
            file://0001-Do-not-strip-binaries.patch \
            file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
 "
-SRCREV = "8de7772cc72daca8e947b79b83fea46214931604"
+SRCREV = "65e95ea8675ea34bdd566d6461330f25c651e5a8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

