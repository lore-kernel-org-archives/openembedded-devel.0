Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D895C2D0D0
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2491.1718161125267143248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TKkBQuKM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161129; x=1749697129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yBu5T0uZBT5yKqMF2dHc5MM5UL8yLTCH+aMikBQAFuk=;
  b=TKkBQuKMNQba63liki/83GaL3lyR56KkBgdnriirWsemaQy7PBF/4yWT
   J7OzWR17yekRSGQfS8fbIyz9cqAUNNKhARxG5GUQprrBXPTP6kJBNgGnX
   5bnrjdEegHriEJLwprmfSezv415Z05U/UOkCHDXg/J/xX5NKFKvUi3Pry
   /HAzJMX7SjCAUT/PnE9Bpw7ujmz5knZcnM/QJSZL4G5+EzIhZsNtEjgUE
   h2CqcEj6NoGygMtjaT3PJnvbiZVmEz0VKS6dQCo9D8XDrRg5Z9AnF3uEu
   NeZqbEU+jipNVca3gdZ8i+KMEauBlaN8uvMrzHNQ7s+9JEI14tLzv7HIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162818320"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162818320"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FB81E8521
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5219AD50E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DDB922007CAA3
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9546D1A000C;
	Wed, 12 Jun 2024 10:58:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/43] python3-rich: upgrade 13.7.0 -> 13.7.1
Date: Wed, 12 Jun 2024 10:58:01 +0800
Message-Id: <1718161096-29710-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.557700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTlvKpAGRBjcb76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Hf7mdD84mFnYZ5
	BcymZVqji8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFIc1oAXmflniDadazLiKT+20aC
	UPwuTmYqbq2aiMYAqKj4RzHRtBgRoACxYNCmN/KIqdT56Az2C3c3FnwxcAebf2C/WV2D638ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110860

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated the widths of some characters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.7.0.bb => python3-rich_13.7.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.7.0.bb => python3-rich_13.7.1.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb
index 959f0d51a..27bc95428 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.7.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "5cb5123b5cf9ee70584244246816e9114227e0b98ad9176eede6ad54bf5403fa"
+SRC_URI[sha256sum] = "9be308cb1fe2f1f57d67ce99e95af38a1e2bc71ad9813b0e247cf7ffbcc3a432"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


