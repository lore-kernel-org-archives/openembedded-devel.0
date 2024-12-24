Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66015C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.30372.1735032452922184084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WwssAf3N;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032454; x=1766568454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7aG/RN+lyFFzOUKop2TbY9VBfPudxjlxy7RCTYp/xc0=;
  b=WwssAf3NTVebbVrUe9m2TEQgwZa0nOrZtufNp5D+rOcJWr1rALNRqRcN
   u8ojF5ZhKPlmd/s5RDnm0bHqXW8lqhWbzbMMxiuSFCVqFUrBf2KJNhBDM
   qKgrY01pg75v2K9R609ESE/8QGkNsTDVSyxrd110QN6jAAtb5hqOxTWfm
   ZfI3qyMg4n973F+yA+MaZw0OFLg0gTKK10hLn40VQByGA3yceiYRabM7z
   Z6qk/6CAOqFYAWz3R6CYng05l/JwlXA5KzfVx5kJXXqKi2nC3VC/kgVBK
   3eBD1/KPzz30SzC81k5Nx1AohYdeCocXC04ds09reDaGE1lYIlgmfSbqw
   w==;
X-CSE-ConnectionGUID: IiUbfl0JSL+32Jev2I/iHw==
X-CSE-MsgGUID: 51T/sgC7TmGZtn3+lsS5KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248068"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248068"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BCFADE8523
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91AEAD3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25F056B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C33111A0071;
	Tue, 24 Dec 2024 17:27:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 61/67] python3-virtualenv: upgrade 20.26.6 -> 20.28.0
Date: Tue, 24 Dec 2024 17:26:55 +0800
Message-Id: <1735032421-13513-61-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.126400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvMB0kPsl40wyiQ
	L+IhWlyya6QK4zn2jRFiiTR0IIJsMXrSP9RtGZYoA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07aLm79W+wVodLsDLMhqiAZMhYUFp4Q1+Bq7h57WBubDEjlq9mQC147dYhFptZ3+iPzoYt
	oYso3T4rMFTvkONVni4D9xai3mUaBD76MHua+yS8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix: Update run_with_catch log flushing
- feat: Write CACHEDIR.TAG file
- Upgrade setuptools to 75.3
- Upgrade setuptools to 75.5 and wheel to 0.45
- No longer forcibly echo off during windows batch activation
- feat: Write CACHEDIR.TAG file
- Upgrade to pip 24.3
- docs: fix the documentation typo on Extend Functionality page.
- Fix broken Windows zipapp and drop 3.7 support
- Skip $PATH entries we cannot check rather than dying with PermissionError

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.6.bb => python3-virtualenv_20.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.6.bb => python3-virtualenv_20.28.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb
index e40561e8fa..4601ddaa29 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "280aede09a2a5c317e409a00102e7077c6432c5a38f0ef938e643805a7ad2c48"
+SRC_URI[sha256sum] = "2c9c3262bb8e7b87ea801d715fae4495e6032450c71d2309be9550e7364049aa"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


