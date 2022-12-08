Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5867C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:12:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.7000.1670479961556443960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E8/8uL1+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479959; i=@fujitsu.com;
	bh=/CnCnAMiZofYjj7kKYf9QU0fMiUt2MQD+uGQ3/VKJog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=E8/8uL1+huK+Bz7AbjcekOyTbIkbmBcUiguDY3GUxVMEhUTwQWwe96/2X96Cfh1Hb
	 /mIXQdPdqtRUtKNKNRgc7qEjSKo4Do0FybL3Bzfuq1h1GDyfTWH4QQOuB+PnC0NF0S
	 BMjGSiyqR6R5SXl2F/YsQRz0ei1ZCVbI/CitRdNbUhyOwig3uwqEf/DPMrQrEc3B8K
	 /Ojq1MlBejEZzizHF0gJoj39MNa6GK8tmncyrx+Boo55MRluINDDvtN/Cf7GAgUnae
	 0gPBLqaksSsp5QUm+CYtLpxGOXlfSGM4Nirp1vchFmeUpF0ErSUfeWWpB158EMR4my
	 A1QGWoZzjGeaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqBveMDH
  ZYM8bTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNl522WgiecFVu2TGBtYPzH0cXIxSEk8IRR
  ovXSeRYI5zqTxP3enVDObkaJPQtOsnUxcnKwCUhJ3Lj/H8wWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CnRvPwMUDMHBwtQfOUqAZAwr4CjxPnTz8FKJAQUJKY8fA/WyingJHHy+CGwkUJANW+3nG
  OBqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhenFpUllqka2iml1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxanMOxgvL/ujd4hRkoNJSZT3RXV/shBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  guVE5OFBItS01Mr0jJzgLEEk5bg4FES4fWtBUrzFhck5hZnpkOkTjFackyd/W8/M8dyMDnza9
  sBZiGWvPy8VClx3nV1QA0CIA0ZpXlw42DxfolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8
  dyBSezLwSuK2vgA5iAjro3v9ekINKEhFSUg1M5U75mj2bNRMmiqXW6RVJaajPfXx2rrp1ufm5
  zpf9+zQFuGc0XzR7lKCovvsuu2vMxb1BpzwFYu+E3si9sc1+lfnDwokeT7co1ZZtl7w78bfe/
  8ee/y48s5K/y9Iqeswsvs7IPOHW5P0GizM+mVm7LTIod8hvVw089H76Q0PVmfo7Vh+ss7zSKd
  xxMcXYOb5Dx0Uh/4HW5ru53ZKvnpt8kLe7MCmK58rMs8kccnN3R22VMN3NJvE7K7Bs6+QP6w/
  33w4w+BoxvSVK4yqz0pRbc1/nqugWvZi3Q8O6bierDB/PKyuehQwni9zCr9Q9i5+v6Vo+92/q
  9TCtrz+E//4re7o2hrl4U2XhrLoNGjuVWIozEg21mIuKEwF9v/lRcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1670479958!142055!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10668 invoked from network); 8 Dec 2022 06:12:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:12:39 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9D77A10019F
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9198910019C
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:12:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twine: upgrade 4.0.1 -> 4.0.2
Date: Thu, 8 Dec 2022 14:12:05 +0800
Message-ID: <1670479927-1286-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
References: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 06:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99988

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Remove deprecated function to fix twine check with pkginfo 1.9.0. (#941)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
index 0178dde73..161b4b221 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "96b1cf12f7ae611a4a40b6ae8e9570215daff0611828f5fe1f37a16255ab24a0"
+SRC_URI[sha256sum] = "9e102ef5fdd5a20661eb88fad46338806c3bd32cf1db729603fe3697b1bc83c8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


