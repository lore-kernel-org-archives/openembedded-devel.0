Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.5602.1625450118123108274
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 18:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UqLT2YkT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625450115; i=@fujitsu.com;
	bh=NoAp/yr2at6uGfH9sniQkiPKzqnVnverW9yaxeJNzIY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UqLT2YkT+G2xJqtBx7cFLO/14X8LUnKcP3gTSjDr0vf4obMmqd1sb3yqEoAY9XsOM
	 FHnCJQj0rsjmwcTXUhnLj06eSn3aN2i2ExGN4aCsO66oZWJ25w8yjcuuBb6ppHLaDI
	 Z2LvuqGBxn7brF+tvzOf3vu4A6f93dfEko+jdFPF4zU7jmHSJVj33fKEn75CULyKMZ
	 QW9D41naUyaKQO9KLjGVahy4f1k2gsdnScnRukvZew2YV71b9EB6tE2PvIv7J9NfH2
	 rqpfOdJU1Or5TOTbBUHyBd2oB1w3XxxyawkzIeJEdUq/cjw2SbEoicJVrGpzhgS2c5
	 dCDc7O0SDLyag==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 7B/B8-07839-38662E06; Mon, 05 Jul 2021 01:55:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVbc57VG
  CQfcLNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNB8yeWgpniFRtOnmBrYPwr0sXIxSEkMItJ
  4trVTcwQznFGiQ0bOoAcTg42AR2JjhfdLCC2iIC+xNLZe8DiwgK+ErNazjKB2CwCKhITjlwGi
  nNw8Ap4SJzpMQEJSwgoSEx5+B6snFdAUOLkzCdgY5gFJCQOvnjBDFGjKLF95xkWCLtCYsaMbW
  wTGHlmIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLIDYx0Uus0k3USy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKOUggMTdjDuf/1B7xCjJAeTkijvJs1HCUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeKuSgXKCRanpqRVpmTnAkIZJS3DwKInwJscBpXmLCxJzizPTIVKnGHU53
  v1cvIhZiCUvPy9VSpyXJRWoSACkKKM0D24ELL4uMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVB
  LmvQsyhSczrwRu0yugI5iAjrh57iHIESWJCCmpBiY7scXKgfxuZlnPHxj8yX76TiXuz5L12nN
  7+vwMhGq9VmslfTEsNuQ23rZy29NZbMmFC5tsRLa/kKiJKetYb1eW/3+mz3aDW+p3GdgT5v0u
  eb4258bvR13HogRX73/SvjP4XOzsmm0Ohc8N/k6V/dmy1oA7XO1Kdov+ggUf0419yi7+6ee68
  T6w7xn31nmLJeZ2/pfuP9hTr/WyM0V05kZbq54TGimz/H/UFPmsCrMzCb+xyPC6lMoyaQv/WP
  tPJRmdzsemMrubqua/2hxcNHtG3kOuh37GKfv5mC+s7WF0u3pm71vLtY/6Hxg0HDc/EVeyqkJ
  H2KyErXlzyhz5YMmgX3ISz98u0/9zaM4BSyWW4oxEQy3mouJEACxZamIqAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-265.messagelabs.com!1625450114!230885!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24709 invoked from network); 5 Jul 2021 01:55:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 01:55:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1651tEBZ006620
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 02:55:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 02:55:13 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-haversine: upgrade 2.3.0 -> 2.3.1
Date: Mon, 5 Jul 2021 09:55:08 +0800
Message-ID: <1625450108-114889-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-setup.py-Correct-the-license-assignment.patch
Removed since this is included in 2.3.1

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...up.py-Correct-the-license-assignment.patch | 32 -------------------
 ...ne_2.3.0.bb => python3-haversine_2.3.1.bb} |  5 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch
 rename meta-python/recipes-devtools/python/{python3-haversine_2.3.0.bb => python3-haversine_2.3.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch b/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch
deleted file mode 100644
index bb5955a44e..0000000000
--- a/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 56b421a18ef8acb41ab9e4bde7e1f5452ec67da9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 May 2021 22:17:07 -0700
-Subject: [PATCH] setup.py: Correct the license assignment
-
-latest python/2.9 + setuptools bail out otherwise
-
-lines = header.split('\n')
-| AttributeError: 'list' object has no attribute 'split'
-
-Upstream-Status: Submitted [https://github.com/mapado/haversine/pull/38]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 549436d..9e7fb00 100755
---- a/setup.py
-+++ b/setup.py
-@@ -15,7 +15,7 @@ setup(
-     maintainer_email='julien.deniau@mapado.com',
-     url='https://github.com/mapado/haversine',
-     packages=['haversine'],
--    license=['MIT'],
-+    license='MIT',
-     classifiers=[
-         'Development Status :: 4 - Beta',
-         'Intended Audience :: Developers',
--- 
-2.31.1
-
diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb
index 624d30ca01..c3251624f5 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb
@@ -2,10 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI += "file://0001-setup.py-Correct-the-license-assignment.patch"
-
-SRC_URI[md5sum] = "ff2d43a74195ec00c42ccd5da2a3f3de"
-SRC_URI[sha256sum] = "72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f"
+SRC_URI[sha256sum] = "75a7f859b3fb6df746564ca66ad1fd5b4052cdbab3d74ff16e8f1a7c3d4a26a5"
 
 inherit pypi setuptools3
 
-- 
2.25.1

