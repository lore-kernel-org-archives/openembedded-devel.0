Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ACDC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:15:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.4584.1655968505109009712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DAUrzzv9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968503; i=@fujitsu.com;
	bh=QAtp8niXrPsyBnXpgbb4K6b0dXXAlBLGpg11KCBXXOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DAUrzzv9NjpVuXsTPd96eS1kq5fhWnKG60Kq2t1MmdRmtUIiIQduZ9f0TgwRezZ41
	 OzlUpRQOdh2iOPFRL46s/UM0cvhB8Xy5Mgf6hy5pm06we/H++lBOO57YPh78EPI6Zy
	 ydAbWCf5Ey6Lj19U29mcbov16fTuAYevF+XOxYapKbhZmI+e2nIO/f6yUC3TV+KAMD
	 ePK+Qw62I68E0d8d+CN3IFCIpiVl7UAQ8ndZA86c8wRcQ/XI25l3CELAFBOY+xhMG0
	 dY/j6rM984BmLeYABdD2m5ycr7zIWQ66NygsUopNv82ZZVrrQEvzsrkCg3wQGM+E3i
	 14C/Bpale/jpg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxSfeb0JY
  kg42XTS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozXN56zFKyVqNjz8xtLA+Nb0S5GLg4hgSeM
  Euf3NrJAOHeZJJqW3mHtYuQEcvYwStxYEwpiswmoSUy/dQMsLiKgL7F09h5mEJtZQEXixe8ed
  hBbWMBTornpPJjNIqAq8XbhVbB6XgFHiQkT94HFJQQUJKY8fA/WyyngJNHy8ShTFyMH0C5Hid
  fv1CHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itEkqykzPKMlNzMzRNTQw0DU0NNW1NNc1NLbUS6zSTdRLLdXNyy8qydA11EssL9ZLLS7W
  K67MTc5J0ctLLdnECAzjlOLE7h2Mq/f90jvEKMnBpCTKu1VgS5IQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd5L/EA5waLU9NSKtMwcYEzBpCU4eJREeOeApHmLCxJzizPTIVKnGC05ps7+t5+ZYz
  mYnPm17QCzEEtefl6qlDhvAxtQgwBIQ0ZpHtw4WNxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7
  BqCTM+xHkYp7MvBK4ra+ADmICOujJ8g0gB5UkIqSkGphm23GUd53e8u7i4cp3tWK/bOKnno5+
  +H+y7YTdD10KmW3bvk5s3WB7TUYw4caVhQsrX+97POm8W5/MIekDfPU3L5ZX3/9xXvr0crmDg
  RLxN3uD5zx12sqac2rZxs3Hv25pWvdaKP3szPo9gTe2cy25nFhecKdgnuv29X+f/2dNOjL5Yf
  iSL4KOUlOOvjOL+cIUtGn5guSJSRlhLz3rYmbvcW+wOzh5zVyTvf+NopfrmN45mqpQN+Hdkks
  zXPn/LmQqW3+5bi/rvb0uL16cLs2bvJRhovLyLfN+PTi/X+pUg/m8HdOWiHBO+1mT7qhkLbLi
  SOJW5ZuqFVdS3sfULeracKNtQsW2nfvezF5ucmDH+r8HlFiKMxINtZiLihMBJrcIcXYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1655968502!41397!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26775 invoked from network); 23 Jun 2022 07:15:02 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:15:02 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 42E6C1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3329F1000E9
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:15:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.1.0 -> 5.3.0
Date: Thu, 23 Jun 2022 15:14:45 +0800
Message-ID: <1655968487-3652-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
References: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97586

0001-setup.py-Do-not-strip-debugging-symbols.patch
refreshed for new version.

License-Update:
 version updated to 5.3.0
 Build options added
 
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...up.py-Do-not-strip-debugging-symbols.patch | 20 ++++++++++++-------
 ...-ujson_5.1.0.bb => python3-ujson_5.3.0.bb} |  4 ++--
 2 files changed, 15 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.1.0.bb => python3-ujson_5.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
index 47da2b8cf..42cd99a89 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
+++ b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
@@ -8,22 +8,28 @@ bitbake build errors related to already-stripped.
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ setup.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 453dc31..962c507 100644
+index b98963b..d42f07a 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -6,7 +6,7 @@ from setuptools import Extension, setup
- dconv_source_files = glob("./deps/double-conversion/double-conversion/*.cc")
+@@ -19,13 +19,7 @@ if not dconv_libs:
+     dconv_source_files.extend(glob("./deps/double-conversion/double-conversion/*.cc"))
  dconv_source_files.append("./lib/dconv_wrapper.cc")
  
--strip_flags = ["-Wl,--strip-all"] if platform.system() == "Linux" else []
+-if platform.system() == "Linux" and environ.get("UJSON_BUILD_NO_STRIP", "0") not in (
+-    "1",
+-    "True",
+-):
+-    strip_flags = ["-Wl,--strip-all"]
+-else:
+-    strip_flags = []
 +strip_flags = []
  
  module1 = Extension(
      "ujson",
 -- 
-2.30.2
+2.25.1
 
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb
index 6c1bf7e82..4c3ef82c9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb
@@ -2,9 +2,9 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "a88944d2f99db71a3ca0c63d81f37e55b660edde0b07216fb65a3e46403ef004"
+SRC_URI[sha256sum] = "ab938777b3ac0372231ee654a7f6a13787e587b1ca268d8aa7e6fb6846e477d0"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


