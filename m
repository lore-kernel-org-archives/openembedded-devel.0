Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A8EFD22B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41954.1772012292787453987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i+eC6YZz;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012293; x=1803548293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AK7FKli2A5nkrEyuFtchucFWUbMjNyeI9Ky2kYZDbzE=;
  b=i+eC6YZz9k6Yj5UbgJ75Nfdn9qmWC9/9eKJV1FKzVXQ8Em8QvdIQVfjb
   LdQFXkDIlgB2o17eb/DS2Qwa9kZbs9mcSaLmo8zBj/clJrzSOLpNTPZv2
   LqK1RymV+qgCfjDE53M0QuOgr1zY9Fp8JOz0qz21veMhpx6GM9ADg5w7p
   kPEoYz3pYvHmLdee9eHtir7JPwExNWFYBF35ZGXs41nhjSGjDjPEL5uwy
   KmKjIw2auRJtLSA92qqkAOUiEWcjxdLcTuFXoY/e+koOTeaEdYm2z8vr2
   Q+AtoGqLakT7JMTyBO/IJcI3jSp+/ikYXvO8vZ/7hwh8KYc23iCf6z22m
   w==;
X-CSE-ConnectionGUID: YElgXAC+QsOo5hFpISN+Vg==
X-CSE-MsgGUID: MI8stNbLSHm6y5oh8dtAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209984580"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209984580"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 5DE131C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 005301801FF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 213B6101BB7D;
	Wed, 25 Feb 2026 09:38:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/33] libspdm: upgrade 3.8.1 -> 3.8.2
Date: Wed, 25 Feb 2026 17:37:12 +0800
Message-ID: <20260225093727.1284-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124630

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- os_stub/openssllib: Allow building with older OpenSSL versions
- Ignore MSVC warning when compiling OpenSSL
- Bring fixes from main to 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspdm/{libspdm_3.8.1.bb => libspdm_3.8.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.1.bb => libspdm_3.8.2.bb} (96%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
similarity index 96%
rename from meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
index 431eb8fd40..75c51b92d9 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https"
-SRCREV = "d7c8c8247b4d0bd8ed75d9f35a558a4df173a4c7"
+SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https;tag=${PV}"
+SRCREV = "5cf0acb87b2f36f8d70a89e5da8476d85db59f46"
 
 inherit cmake
 
-- 
2.43.0


