Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C07FA0C42
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:16 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13245.1776237551717596289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nv11n3x5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237551; x=1807773551;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NwDqhVFo4UP4LhiZu1zSkZWHFVaH8UgQxAlVcD5QQ3M=;
  b=nv11n3x5xNXmuau5sbNgZNDFUHyhO4u1MVNa8CKFyzabU/GA09m82BHf
   /0+dSJ2owkOcaSlcQ6CYSa0wqOGcKT6fYAeH8Nljz1rzXxfU6rxqbKIe6
   qjsGob6vuXkMeezHFiFkzJk4v1H65LTSGuBKkmt3aCGSSHJAtWcfaVMQa
   ULaFFGZogBVDK8acSHgVWWMZNpZw3M7S8DsXx+n/WQLkweLpuwtbm2FAo
   My22Y8rP3DoisDZAgNqY9TPMs7bHIhF+csCyunvymyjAEglbmEHEUPygu
   Uxw+2hr3ZCCnVfhwvw5X45ZaWQj29rqb5J0YQiHpTp1DgFxul1OfV0VDg
   A==;
X-CSE-ConnectionGUID: amj+Gix5RmOOe/cH31H3Lw==
X-CSE-MsgGUID: 7IrqaSAfRC6rJ5x9qcIM2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="224960087"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224960087"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E55E38203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9D78C140036F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:09 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5341818005F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:07 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] leancrypto: upgrade 1.7.1 -> 1.7.2
Date: Wed, 15 Apr 2026 15:18:58 +0800
Message-ID: <20260415071900.6767-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
References: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126348

ChangeLog:
  https://github.com/smuellerDD/leancrypto/releases/tag/v1.7.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../leancrypto/{leancrypto_1.7.1.bb => leancrypto_1.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/leancrypto/{leancrypto_1.7.1.bb => leancrypto_1.7.2.bb} (97%)

diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
similarity index 97%
rename from meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb
rename to meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
index 9e7883ad3c..4c42b77490 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            "
-SRCREV = "e7fa8c87a46c5787174c18fac385aa08eecdedd1"
+SRCREV = "8a3e942baa3388ec9597c35005264ef9aefbf97c"
 
 inherit pkgconfig meson
 
-- 
2.43.0


