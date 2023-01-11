Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C06EC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:24:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.16655.1673414666935544646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L9fURak+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414664; i=@fujitsu.com;
	bh=4mKy+dL3gEomi51D8IqfOtQNqkOgrhtmW1GhTq98IIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L9fURak+szWZKBcNUZGzKJBfaT+ZZM5hKgRokUc79KVzxEVrFmd7SqrVlrkkRDl+s
	 Ni+ViRFiaNSPCPfSP5pjfBD4ebmhFs1accgqqrO9baAMg50DURdPlLyRiqrQRgNc+c
	 i8Yyri4G3Yc2mD6W57EIHdlpisqK/Ga97HpBQNIfUdykSrqaPMlRk/GM0z/iMr47mQ
	 0IxCJ2lztqj1NP/RkklTsvaRBqUep3W7Wf/U6jktjcv3PaMdCoJTlEMvtLUSw53N6b
	 4AMHZ7v2I3xfBseXWfaCooN32QvZgNZtP2M892iph8okaQtz2FTHelHoivg1EsA4oP
	 iqaQaA2HGx9CA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpMvusS/
  Z4OBjY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePLt4MsBa/4K3YunczewLiCr4uRi0NI4CGj
  xLtpJxkhnKtMEjN/z2OBcPYySjSe2crWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECoxNb9V4HiHBwsAqoSh66bg4R5BZwkDr5YA9YqIaAgMeXhe7BWTgFniTVd68FsIaCaA7
  suskHUC0qcnPmEBWK8BFDvC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0jfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6U4OWwHY+/SP3qHGCU5mJREefMk9iUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBVc
  QXKCRalpqdWpGXmACMJJi3BwaMkwlvrCJTmLS5IzC3OTIdInWJUlBLndXYHSgiAJDJK8+DaYN
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL7Mz0BSezLwSuOmvgBYzAS0+3LUXZHFJIkJ
  KqoHJ4dOkqMW+PvwLXvw0kjF5U6y1SKtEreS0fEUa1+bt6Q+6ElWkzT+GfPhd03W8epveu0rl
  r1Vy+0PWHmaqbNY4UqVqKKD87VDHPq7iLTVl+9kcNy4KZVsXHXUi4nV7w0WuF15TX4Y0XfSf4
  TlPR1vmWKXYFjFulZhLn5145mfsN/w69yZ3xv9qts1Re402f/n0sEP1ZJGrlPnZb5Pu7Zrfuu
  yD+5I9rAf235pf8q2E/bZIxZ7CqufSSU1RfjU60i1n2efvcTvv3O+17qtw72bp+EY317vFXCY
  HG/2eXj4X4z7Z90mA7nfLuNVXW3ofzLJwk/53haX9ZFJZ52KzXeu2zjZJYbliqvRstfkt2/lK
  LMUZiYZazEXFiQCtEq61WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1673414663!497817!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25204 invoked from network); 11 Jan 2023 05:24:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:24:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B9701B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:23 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3F2891AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:24:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lazy-object-proxy: upgrade 1.8.0 -> 1.9.0
Date: Wed, 11 Jan 2023 13:24:03 +0800
Message-ID: <1673414646-13721-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
References: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100524

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
- Added support for matrix multiplication operator (@).
- Should have all the wheels now (including the manylinux ones).
- Bumped minimum version requirements for setuptools and setuptools-scm.
- Switched the default pure python fallback implementation to the "simple" one
  (when you from lazy_object_proxy import Proxy and the C extension is not
  available). Previously the "slots" implementation was used but as it turns
  out it is slower on Python 3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ject-proxy_1.8.0.bb => python3-lazy-object-proxy_1.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.8.0.bb => python3-lazy-object-proxy_1.9.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb
index 46ef296262..74c5e9b520 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7d2e9d24c2b5bad57ca894da972e22e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
 
-SRC_URI[sha256sum] = "c219a00245af0f6fa4e95901ed28044544f50152840c5b6a3e7b2568db34d156"
+SRC_URI[sha256sum] = "659fb5809fa4629b8a1ac5106f669cfc7bef26fbb389dda53b3e010d1ac4ebae"
 
 inherit pypi setuptools3
-- 
2.25.1


