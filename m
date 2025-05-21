Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D05C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6740.1747817996379290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n9j7blGl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818003; x=1779354003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0SHwNfN33QfBzOrMLKvVIQDEjQ4+2JJaQ2QkSP0Tj3o=;
  b=n9j7blGlCa5lgmBtlKdlgvicXlzow0ISv4r/TtT64Vahf+dVOoPrihlu
   BRDCU9YKN/NuxqyXd80PJZz8llFmAtqbe8FYNjz5i1poYjL5/WnnuYZNw
   diFQMtlBNJOcAZkoqd5D/DGhIpazCn8zo3ez20BI3e49nCDyLF9yRbWrb
   IcxeUIS9sPGz4udQ5uIKW4ojsDiHFI8v0Yg+3bIoGfXuClQRzYLqgEOKO
   wKvU0+D3cKL7BEt1b/B6mtGSQ19FU4treJ6glLVwThaIKrbZqyeXWq8BT
   EDjjdElREtbw6N2MeguPWbu5IngQXSilxz5JGoNbPvjozsTB13r1KyOvs
   A==;
X-CSE-ConnectionGUID: 91boFrn3Q8uM+O4JBRn4+A==
X-CSE-MsgGUID: TtQv+DvlRym+1/ULotF/SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200161120"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200161120"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38E17D8E67
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED8ABD8C1F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D4241A009A;
	Wed, 21 May 2025 16:59:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/43] python3-sqlalchemy: upgrade 2.0.40 -> 2.0.41
Date: Wed, 21 May 2025 16:59:23 +0800
Message-Id: <1747817972-28874-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117559

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.41

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.40.bb => python3-sqlalchemy_2.0.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.40.bb => python3-sqlalchemy_2.0.41.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb
index c86a2d29d9..c9f337946a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "d827099289c64589418ebbcaead0145cd19f4e3e8a93919a0100247af245fa00"
+SRC_URI[sha256sum] = "edba70118c4be3c2b1f90754d308d0b79c6fe2c0fdc52d8ddf603916f83f4db9"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


