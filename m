Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E0BC3DA64
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.33824.1721034176768112774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qBI4IpxT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A+AdP1mMJgYG/h0EB5bymP/Xq9SW0c4gZeyT/5WkuvY=;
  b=qBI4IpxTpCtrW1+0ElEKl1eUWSbOY5gSne8W80e/QokYgIeImGJehqaT
   bZUoXSr069OFhY0mDiGhjURgKwupV87/u3WqUsijtwC17Re3FCFMa2nuw
   yB4kCiTEQyAQbQ5CdPiV1pKpZyftuEtn/8b3f7gRTL9z1vSxPdrwXIed3
   Cdx+XTEO1orRNIorbvT7/yt6RFuPxCpVdz2ZaQiKtTFNhSV5ZXzNsytN6
   GuH1YnXeYr4q9HxgvxzGC9+gYtJxJxh0QQBV4yD13YrL9FgiimYa7Zw1z
   Crh1P8M91OsvqKd/iPMNWbK31+naTNlULVnzG08Ep6YrprUWHkv2wv9HW
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145974557"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145974557"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FE0FD64BE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5649AD7731
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E140920071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 921831A000E;
	Mon, 15 Jul 2024 17:02:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/38] python3-tomlkit: upgrade 0.12.5 -> 0.13.0
Date: Mon, 15 Jul 2024 17:02:21 +0800
Message-Id: <1721034151-540-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--3.124900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytM+b8yxBqvAymU
	P9th0lnV42lsRAtqWPXy10cXPx8YNydSjsDalRtxN2BkxNbZkKNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw7TfU1/F+PbMxCE2NlBjIjcd/uZ0PziYWdhnk
	FzKZlWqOLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAUp62Kh8JfR0l6Gl/v2Ezs9tsm3
	5TwpvZ8COg9Ecj5/erAjZHv+n6y6ZA37Qlzibk2eQu713zt59pOZuHSmEUHnAziN3d2zxIc7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111348

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- fix: Test failures with Python 3.13.0a4: test_dates_behave_like_dates and test_times_behave_like_times
- [pre-commit.ci] pre-commit autoupdate
- fix: Revert "fix: Construction of OutOfOrderTableProxy can cause newlines to be inserted (#347)"
- Update tests action
- fix: tomlkit 0.12.5 : Encoder contract interferes with external TypeErrors raised in encoders
- chore(deps-dev): bump certifi from 2024.2.2 to 2024.7.4
- chore(deps-dev): bump urllib3 from 2.0.7 to 2.2.2
- chore(deps-dev): bump requests from 2.31.0 to 2.32.2
- chore(deps-dev): bump zipp from 3.15.0 to 3.19.1
- fix: keep the nested out of order table

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.12.5.bb => python3-tomlkit_0.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.12.5.bb => python3-tomlkit_0.13.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb
index f5612a18d..761bab273 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "eef34fba39834d4d6b73c9ba7f3e4d1c417a4e56f89a7e96e090dd0d24b8fb3c"
+SRC_URI[sha256sum] = "08ad192699734149f5b97b45f1f18dad7eb1b6d16bc72ad0c2335772650d7b72"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


