Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF28D4401E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G4UPoPu+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922216; x=1763458216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VnGBDoNzvM/vrXZGyyLP4Y/BCIYEhnXuDkkP6YYcYrw=;
  b=G4UPoPu+N5DWRZ4FNyLnjIgoOkY/YeLALdAVde2/JB33ZAbTMsjvnA/c
   njfNEwECLELZOAR0qmFn1z4yeYDFNQLIjn2yADwmuIfEvfwc/845WIY50
   pt0ZjeCa9zPsH6ZWb+vaF+ifAi1iLIiYV6Ta8gZMpXvBRiLjroHzUSc6W
   KN2Xqtb5ScEGCN4f6wxuVsv7PF/NNTLxT21Lrbtx2Um4rBWylnyKs9JXo
   I9iwASjajnoUrCJu8WINFvjiFKuaFbcMsRyk43ZG//bYTUkZsopdBV0Rq
   P6HQREkmTDJXgXZ0+m/OSyosHuwjeJaMNCMrLvTd1+mJBhFEjGWwos+F8
   Q==;
X-CSE-ConnectionGUID: 1vRSVqfTTN2NVPHhjnX+lw==
X-CSE-MsgGUID: VddZxNAJSzeBFY9Llfol7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136718"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136718"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 210BDD4C31
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FC45BF4BA
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34918E368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D92071A000B;
	Mon, 18 Nov 2024 17:30:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/32] python3-google-auth: upgrade 2.35.0 -> 2.36.0
Date: Mon, 18 Nov 2024 17:29:41 +0800
Message-Id: <1731922195-5266-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--4.836400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mruJpeHGRhXLHXFJ7W3lIp40gg
	yp8I0akOlxb/ChZteM9lzszbQmswpq88naeSWWBZEhGH3CRdKUUCtGYG0znilKlOQjQcrzOlizZ
	3A/XUVNDgr0WZ6u+ypf6R+Oj6fHkEbRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMoin+TbHeO+REAhIuZPp0MQfE8yM4pjsDwtuKBGekqUpnH7sbImOEBTQ5SRDHefzwsAED
	jDMXk2STZLNGO+PtQEJQBuxomxS0o65UqjRkJFv01W/+tKuPMR46t1b/g59JkCH6E7kWgGs4qJL
	IKvn5JLsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113883

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Features
---------
- IAM signblob retries
- Making iam endpoint universe-aware
- Support External Account Authorized User as a Source Credential
  for impersonated credentials in ADC

Bug Fixes
----------
- Adding default parameters to updated interfaces
- Change universe_domain to universe-domain
- Remove base class to avoid type conflict
- Revert templates for iam endpoints
- Update secret

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.35.0.bb => python3-google-auth_2.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.35.0.bb => python3-google-auth_2.36.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
index f0ef3c677..19f2c6cb2 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "f4c64ed4e01e8e8b646ef34c018f8bf3338df0c8e37d8b3bba40e7f574a3278a"
+SRC_URI[sha256sum] = "545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.34.1


