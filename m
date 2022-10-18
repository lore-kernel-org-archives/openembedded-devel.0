Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAF2C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:11:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.1849.1666055509598327461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FxGG+g07;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055508; i=@fujitsu.com;
	bh=fKsVdajJaZuEBwBL3Xf7nX+gBtv5qQlq7jVUXhHlcNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FxGG+g07p96c9Jx5iWXk7ENkFB457LQMUdI1hIJOdYNkCFSRIHYfL1NgI+TumraKD
	 0iXozQ0sQQNx+NGWf8nsaqc5r9yXaAZBMPm8mjuomq5sZrXZYkEjhaKFEtLiD6Vcvf
	 PfHfUnPscWOtW9Aew+AvITKGaQN5NlVam8FvYjzIL1tb/5Xtve/ybDvUz6ufxaU8px
	 nU6w16BH2ldzB5uoGoh1KfskCx3mxUGj+/lJcwLHd4pzMD9JlSOw+D512Ni/rNIlMn
	 L7P1OjxxeYJ1EuEX5ZVn2za4h7hu5icsGWMNHE/nEt2pZR7tL889+nw+0l/Iw64Emw
	 flm+hwITsRz9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSTfor2+
  ywcvZRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bPo9+MBf84KlY8fMDYwLiSo4uRi0NI4Amj
  xNV3axkhnOtMEqtuvmKBcPYwSkycsJiti5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBQInZB16ygNgsAqoSq/4uZwKxeQUcJWZO/c0IYksIKEhMefgerJdTwEmif0EDWFwIqO
  bt6/9Q9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0DS30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDN6VY/eQOxg3L/ugdYpTkYFIS5e2Y4ZssxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YJX6w9QTrAoNT21Ii0zBxhLMGkJDh4lEd6oM0Bp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpU
  qJ86aBzBAAKcoozYMbAYvrS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeTlApvBk5pXAbXo
  FdAQT0BEZ+71AjihJREhJNTCF7Z3tr7THYsZxs7tGgXb2aRNm/Wa9ffyw/FYbn7kORW/fq69b
  ZT3v17+lzdlivKF80VqxyfzVkSuipneueJ2keNdBe2rlm4Ib7hoe59yUSgqC/2WflJx88q5Cx
  XntLpffX8v01A88qmzK8wz71ShwlFGlMLZe5//hxIl5h0KU7CdK2M2ZKSvw4OvC4HsxodwnHd
  3tJt0RLL1gZ7ShpejdVv2wp6YufF+3LeZm5VLcr7i4bLFADdviZ98zdJgveU8ou6Jx58wBxmD
  fFn0Vo/w9fx0awo9+Wnlac3bapPp7RS9dflc+jItuWxv1pGX5ys2z1lmqKc1y+7JixybhAwJZ
  NiK9j1cuikzQtBcwvqPEUpyRaKjFXFScCADIMDBeZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1666055506!11579!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4149 invoked from network); 18 Oct 2022 01:11:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:11:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8920E1000CD
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7C2D7100078
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:11:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.11.1 -> 2.12.0
Date: Tue, 18 Oct 2022 09:11:21 +0800
Message-ID: <1666055483-8143-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99223

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.11.1.bb => python3-google-auth_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.11.1.bb => python3-google-auth_2.12.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
index 747a57e814..53c1d00ccb 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "516e6623038b81430dd062a1a25ecd24f173d7c15cdf4e48a9e78bc87e97aeec"
+SRC_URI[sha256sum] = "f12d86502ce0f2c0174e2e70ecc8d36c69593817e67e1d9c5e34489120422e4b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


