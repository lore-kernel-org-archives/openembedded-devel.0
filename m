Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26429C282CD
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2208.1740525902713691053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sevMhE3H;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525903; x=1772061903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i1KUN+OREXapJDtYwmD9nVTjfcAeoMG+zjHNxwrnZIY=;
  b=sevMhE3H66EuPwgbLVGrytWPjs8SkpzJccEGJftn6DlzlDRXePSIg0rk
   98DRvByNic/jtW2SVYni6YFtTcYHjQy7WwfgKj6UuCg4zVCK8a9d1r/EP
   C20U2luwwZEtnfctwfWu5peXyLvhlZTaC83myscv2/3rPun5pfh0buqI5
   Q0kM7TAo7kpRrPoJYVaqDDdpgSAaKigVqS01fhbF/Ogx/b6GBf6g5ggrb
   TiFVIY7b9OVyun3WOVIaT3RyG5WVpEWnt4FChpLkDUkJA/MpNFA4XblM3
   /j2FP3TUYfXfhivWRJOUoBSuSlpMoH5fftqNzvnLy2gCVQJq0i9wRl7qr
   w==;
X-CSE-ConnectionGUID: PPcwPnqmSMWFPF12aUTAtw==
X-CSE-MsgGUID: DnCpO0TsQ3uJRU5wJMc4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179538601"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179538601"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67CF2E8528
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F9F6C8BFA
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E83251A000B;
	Wed, 26 Feb 2025 07:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/51] python3-h5py: upgrade 3.12.1 -> 3.13.0
Date: Wed, 26 Feb 2025 07:24:20 +0800
Message-Id: <1740525881-21103-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115631

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-h5py_3.12.1.bb => python3-h5py_3.13.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.12.1.bb => python3-h5py_3.13.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb b/meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb
index 3a06fa88ef..eed44369a8 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.13.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "326d70b53d31baa61f00b8aa5f95c2fcb9621a3ee8365d770c551a13dbbcbfdf"
+SRC_URI[sha256sum] = "1870e46518720023da85d0895a1960ff2ce398c5671eac3b1a41ec696b7105c3"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.43.0


