Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5100CC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:47:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.17482.1707209233742828804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d2TzgNs+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707209233; x=1738745233;
  h=from:to:cc:subject:date:message-id;
  bh=KjCudtNyZ072oDAEnggkxOTmZC433xxL1xNBsCa7eeY=;
  b=d2TzgNs+xWoa9/YtiDpahfUCt6bxBg6mFtlJIOZXg9Zz6JSUTwGT02Nt
   rZN16C8Nk96CA8YRMiIr8Lm7HPrLhuzjppLIETi3CJ1NBgx9r8VCMHaUg
   qVFQNFO3E0tsYH1xQtgmCwF+SXlrqNzurnoMu0nPpHy2g8JWdl3tLXByV
   Ljw1vkTwltFQjblgs5f//Y2Tf9MunVxX8sG3Eyc0FS7AYVA3sI1GOoEXZ
   MlII3wLC6lFjzB461nsK7bncdaHAJ9Y1+daka1kaFO3+cD9aEgxJ4ez0U
   IHHixPvxKxyqdWoaui+736qzBKBgAHmZNU7nh+lCMxkHq4mWzcSKtnait
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136180292"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136180292"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:47:11 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20983C1FBC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62261CFA58
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F003E1EA8AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:47:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C8AA1A006A;
	Tue,  6 Feb 2024 16:47:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-path: upgrade 16.9.0 -> 16.10.0
Date: Tue,  6 Feb 2024 16:46:18 +0800
Message-Id: <1707209178-5977-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.050600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRu0oMqkY991yQIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAdTT09C8IRR5LoXqKmilnqevc
	Z31cVI02M1ysBUZ6EFtL4FfDAbjauBTbthxa+e7nymNNb5+AHa78fi4K/HBwDQWaFqYy6U7ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108618

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Added .with_name and .with_stem.
-Prefer .suffix to .ext and deprecate .ext.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_16.9.0.bb => python3-path_16.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.9.0.bb => python3-path_16.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.9.0.bb b/meta-python/recipes-devtools/python/python3-path_16.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-path_16.9.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.10.0.bb
index 19bf11b6c..f95fce3b0 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "dfd31c2af60e8889a13538bef302ade7adacdb5351836be22638e2349ddd5d7b"
+SRC_URI[sha256sum] = "b32b22b76fe810a8ded6d136268cc8b6698ae7c47c29b94a9ea12623f3051e46"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.34.1


