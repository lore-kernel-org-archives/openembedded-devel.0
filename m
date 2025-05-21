Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87314C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6719.1747818003969484889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FAsFJswX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818004; x=1779354004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TyoFmeXVRIbf3aoFmcSNzQpoi9sA7/F46qE8KX2tMQo=;
  b=FAsFJswXe2mSWnPgKVm0+qU2yA8xleAIFh1GCHRPTyEDKAOD6SeqtcAl
   omV1CSAVOUx3W+xtuA7H5XXlxi1MltJsnXXZjWJdveEBXWus8HqLxflvo
   q962ybVg46pP2BPnKABC7v9I0makUICVBjCH4tJyeAIMEqswDAgO3xYHQ
   ezUTfqkOj9yomKOrOinxUrOZGekRe3OBhWdoBLEdJ4plixmx8z4bjQvJq
   MDqjE2Mo5jHl9BMchCDye05RjI+hHboSMyitk5NmbV3GtUh0mwJCFMK2Z
   NCffoWONqfagt7w8nW1EiZRIn0BCdlMSF0R5fa9LW49N+7qC5IjewSHio
   w==;
X-CSE-ConnectionGUID: GlEOKP5rTa65N0GUX/fYyg==
X-CSE-MsgGUID: ruwYSGnuT4+HyMh0ovnipQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200212714"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200212714"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C5C37E8FF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DF54D8BCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BCCD1A00A0;
	Wed, 21 May 2025 16:59:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/43] python3-spidev: upgrade 3.6 -> 3.7
Date: Wed, 21 May 2025 16:59:22 +0800
Message-Id: <1747817972-28874-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117561

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed deprecation warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-spidev_3.6.bb => python3-spidev_3.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-spidev_3.6.bb => python3-spidev_3.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-spidev_3.6.bb
rename to meta-python/recipes-devtools/python/python3-spidev_3.7.bb
index 4c2d94630c..287d612448 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.7.bb
@@ -10,6 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2077511c543a7c85245a516c47f4de78"
 SRCNAME = "spidev"
 
-SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
+SRC_URI[sha256sum] = "ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


