Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563CEC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:46:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.24264.1641192392871468279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cOy+gUUJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641192390; i=@fujitsu.com;
	bh=gxQcwkFpYVb66y1ivpw9qXcaJpjb6MLmjcTj01oNZ38=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cOy+gUUJSSMxhPmhRGyJ7P92btXrFm4hs4/MyOQM4YihqhZ5KEMN0oPSdfPSNfjYF
	 xahCcdkHtGQ7K9FnglneGt3NSINBBSJ4dmiAtto8IesviDLj+mBVEaGnALbN7PHqmc
	 yXt7b0e1ejfVErkBz12Sl8j34bnkFA7s2udeOzuO6SNhB2NeP5YYpM6cpMHaVnfW/E
	 DdZSWmuTy8JpxIW9VCEdgvO5/cOP7ETXcQ6W1ngUReSj8An8DcTcGkPPpmMwx0mtn1
	 P6IjRJ53HMmIVoMX+PJo0HeYUSJjjV+UQKlmRLwg9fmJKyQfJQ/h2o/gTgZ8pQ2Hb6
	 MMxmBNzrI0rPg==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 51/D0-06990-5CB92D16; Mon, 03 Jan 2022 06:46:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MRont09qV
  Eg8aZKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8afq5NZCo4IVfz58pG1gfGGQBcjF4eQwAwm
  idYNR5khnOOMEkcnXGfqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAT+Ji5
  39GEJsFKP7/3nygGg4OXgEnib0rMkDCEgIKElMevgdr5RUQlDg58wkLxBgJiYMvXjBD1ChKzL
  7czAJhV0jMmtXGNIGRdxaSlllIWhYwMq1itEsqykzPKMlNzMzRNTQw0DU0NNU1s9Q1NDXTS6z
  STdRLLdVNTs0rKUoESusllhfrpRYX6xVX5ibnpOjlpZZsYgSGWkqx65wdjBf6fuodYpTkYFIS
  5a1UupgoxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3w6xLiUKCRanpqRVpmTnAsIdJS3DwKInw7
  pwClOYtLkjMLc5Mh0idYtTleN3ycwezEEtefl6qlDjvXZAZAiBFGaV5cCNgMXiJUVZKmJeRgY
  FBiKcgtSg3swRV/hWjOAejkjDvC5ApPJl5JXCbXgEdwQR0BK/WeZAjShIRUlINTDlNxhePnVv
  aWv391ISs/uSnd63vmkbI1jtU3lk7w1xp8gnOeMc9X3qOrimINi6QmXnISS+Ff8YTy5DZVxnv
  Vs6SuHC2+dg65+df8xyPnp2msntL1z4R+RmqMj4SvpUlqYf22k3Y9PAjl6P38pIaRx+LZIm5w
  hOEP37pzn/L/fT5cVVbj7UZ0fIKj4J38hy8FXd3k1/DrS/S/vHXPy4IzXJ5Hp2t0LvM+HPhrf
  S1KyaznFm97XDZpYW754fcdJLWf/dCnj1zjmvOwU0ro5UmHLzLt0ZFvytE8W9ks+yGOX3u4sL
  vN94NuNC+c9bxCHtrJs24Q82VfFK+jMyL3ri4cWUG8LDed1240Utot4ZyvxJLcUaioRZzUXEi
  ALkyULM8AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-545.messagelabs.com!1641192389!249774!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17543 invoked from network); 3 Jan 2022 06:46:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:46:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2036kNNI016180
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jan 2022 06:46:29 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:46:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyhamcrest: upgrade 2.0.2 -> 2.0.3
Date: Mon, 3 Jan 2022 14:46:09 +0800
Message-ID: <1641192369-41756-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 06:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94647

Changelog:
=========
  Features
-------------
 - * Adds the tests to the sdist. Fixed by #150

 #141 <https://github.com/hamcrest/PyHamcrest/issues/141>
 - * Update the CI to test Python 3.10

 #160 <https://github.com/hamcrest/PyHamcrest/issues/160>
 - * Add pretty string representation for matchers objects

 #170 <https://github.com/hamcrest/PyHamcrest/issues/170>

 Bugfixes
------------
 - * Test coverage is now submitted to codecov.io.

 Fixed by #150

 #135 <https://github.com/hamcrest/PyHamcrest/issues/135>
 - Change to the ``has_entry()`` matcher - if exactly one key matches,
   but the value does not, report only the mismatching value.

 Fixed by #157

 #156 <https://github.com/hamcrest/PyHamcrest/issues/156>
 - * Fix is_() type annotations

 #180 <https://github.com/hamcrest/PyHamcrest/issues/180>

 Misc
-------------
 - #150 <https://github.com/hamcrest/PyHamcrest/issues/150>
   #159 <https://github.com/hamcrest/PyHamcrest/issues/159>
   #162 <https://github.com/hamcrest/PyHamcrest/issues/162>
   #163 <https://github.com/hamcrest/PyHamcrest/issues/163>
   #166 <https://github.com/hamcrest/PyHamcrest/issues/166>
   #175 <https://github.com/hamcrest/PyHamcrest/issues/175>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-pyhamcrest_2.0.2.bb => python3-pyhamcrest_2.0.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyhamcrest_2.0.2.bb => python3-pyhamcrest_2.0.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
index 056ecb549..7c0824c2d 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612"
 
 PYPI_PACKAGE = "PyHamcrest"
 
-SRC_URI[md5sum] = "7a086f0b067f8d38958ec32f054559b4"
-SRC_URI[sha256sum] = "412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316"
+SRC_URI[sha256sum] = "dfb19cf6d71743e086fbb761ed7faea5aacbc8ec10c17a08b93ecde39192a3db"
 
 inherit pypi setuptools3
 
-- 
2.25.1


