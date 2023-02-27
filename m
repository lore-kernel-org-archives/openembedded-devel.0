Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44307C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.85575.1677485541641282227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IpwHsNNm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485539; i=@fujitsu.com;
	bh=qznHrlYxG32HEjJCpUZ0CP5jr/xIwRiVKHl1WUeCx3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IpwHsNNmI2JNNpsfQkPbCjrJEIrb5VtfTn9fEx+Nsvc+gup5HbhUwt5WYzCbzBgLz
	 XgRCkjWVU/FzkbM5f4jK12lZzMfbybQh/kP+ulNXOqEFDTQjpjVu14tGrn+TdK+k79
	 kQXQyy82U2bTCy8NM54sNQjmxRO6H09mbHX2jn7LzUBQexXgX8NIWIQpqwysWat3Ro
	 fvnF/CVJAc0sCp53kHGZtznmp+3CRLCYyJv6l5ZzzeDtpHqlnQQzHWs8Hb7S0HQjuO
	 1OIS/ErADGUNu+OuGYTlsG3FhuEpEldskUpH0u0/oYbEj3nJs5ccBN8c8Hk2Vb+VeK
	 ogrq/J/ZQXGXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWfdx6p9
  kg0vfRS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozPbx+yFyyVqnj7cRJbA+Nm8S5GLg4hgQeM
  EjMvn2HuYuQEcq4wSTQfg0rsZZTYereFFSTBJiAlceP+fzYQW0RAX2Lp7D1gDcwCKhIvfvewg
  9jCAgESbR+WgdksAqoSPz73gtXzCjhJLJzezAhiSwgoSEx5+B6ol4ODU8BZYtN7Roi9ThJ32z
  eyQpQLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQtTi0qSy3SNdVLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzclGIWsx2M7X1/9Q4xSnIwKYnyLnL6kyzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvdgE
  lBOsCg1PbUiLTMHGEUwaQkOHiURXmYjoDRvcUFibnFmOkTqFKMux6Z9XQeYhVjy8vNSpcR5+R
  KBigRAijJK8+BGwCL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3qgEoCk8mXklcJteAR3
  BBHTE9oc/QI4oSURISTUw6c7vvN6721lt5/+3H6Y/OFso6fZtx9G0yXvifc4snp2zd+4l69J9
  3quOyAm9uyezdnnJmXmuK7edPT+Nx9fu8t7PBX16T4w1pooo/Oec2NTLdbm877/mlU/5Oao8H
  ps5Fl5JvXH6fv35/3rRdqaBaWFr/m+01ZBTLd6yakX9VxN1F155Jn/NMjffw2+eyCTtOVjZFH
  2mRv5QaImL/tlJf/+0rWaJXDj3C29yS8WUdM5/9/Yvs1U8ckNf9nWKsGxRwe8ulpDlp35lfdw
  8hduVd97ahbwedVa5MptYjm2t8TPfI/7v9mYNwWtaE4Nuyh7ZK7C/Tu5IQN+B3cs/N3656vDm
  6z4Vmc3CSn7Bch0PI5VYijMSDbWYi4oTAZIIYqpjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1677485539!213723!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13264 invoked from network); 27 Feb 2023 08:12:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:12:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EE67D73
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:18 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E28FC7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:12:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-simpleeval: upgrade 0.9.12 -> 0.9.13
Date: Mon, 27 Feb 2023 16:12:02 +0800
Message-ID: <1677485523-11699-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
References: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101286

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Better handling of empty strings passed as input.
 Fix the shift safe number issue from 0.9.12
 More minor pylint / etc fixes / cleanups (general code quality)
 separate .parse from #115
 Allow setting up completely empty {} operators / functions ( #75 via #123 )
 Add extra bit-ops from #87
 Add @daxamin to contributors ?
 Version bump stuff.
 other readme tweaks
 star expressions, eg x = {"a": 1, "b": 2, **c}

no-build.patch
removed since it's included in 0.9.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-simpleeval/no-build.patch  | 24 -------------------
 ...0.9.12.bb => python3-simpleeval_0.9.13.bb} |  7 ++----
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/no-build.patch
 rename meta-python/recipes-devtools/python/{python3-simpleeval_0.9.12.bb => python3-simpleeval_0.9.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/no-build.patch b/meta-python/recipes-devtools/python/python3-simpleeval/no-build.patch
deleted file mode 100644
index 8302c3b29..000000000
--- a/meta-python/recipes-devtools/python/python3-simpleeval/no-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/pull/119]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 08bc99211aec32882d5f1c83896eb5d72b9fb125 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 23 May 2022 11:35:00 +0100
-Subject: [PATCH] pyproject.toml: remove build as a build-dependency
-
-pypa/build is one possible build tool, but not the only build tool.  Forcing build to be present as a build dependency is meaningless: either the user is using build so obviously have build, or are using something else so having build is irrelevant.
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 052a55a..416482b 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=30.3.0", "wheel", "build"]
-+requires = ["setuptools>=30.3.0", "wheel"]
- build-backend = "setuptools.build_meta"
- 
- [tool.black]
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
index c9cf33d02..35cd19ffe 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
@@ -3,16 +3,13 @@ HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=dc9277482effe59b734b004cbcc1fee7"
 
-SRC_URI[sha256sum] = "3e0be507486d4e21cf9d08847c7e57dd61a1603950399985f7c5a0be7fd33e36"
+SRC_URI[sha256sum] = "4a30f9cc01825fe4c719c785e3762623e350c4840d5e6855c2a8496baaa65fac"
 
 inherit pypi python_setuptools_build_meta ptest
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://no-build.patch \
-	file://run-ptest \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN} += " \
 	${PYTHON_PN}-math \
-- 
2.34.1


