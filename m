Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1189CC44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4731.1783503968500992396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EexjZt9k;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503969; x=1815039969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qT+Oo/LJKios2Weh90P4ljKvuA9dkvCpN5XWboeQ1s=;
  b=EexjZt9kvOEglAxLTwiRXgEqC2DD5EGmE5Z7ZuaDeVmVLC9Kt5LeqSJi
   nefBdgrvi9KQhRbaRzBcqf5Twiqvt9WFyv2FmiBpcs+yMKgISR0l6JYOZ
   vLeDIZ680M87ZgEc8Ro2sTD+YkwXceXEgYLJREriMFxbFULqSFYYpYeCO
   4BSYnBsg3g+b7KXjuVCiKC78Mckaou3Tbykqwt3Cc/qoHHbviBsbftTF9
   9Z6V6773PsyplXdmWOXhFy5R6Po6VLSahHxdmJ4+TzzdMgNBIFu1Ic+wJ
   trNBoyJbSh+e994RY3av0VCbdKybgM56P0jeEPXRZCf3Cr/4P89m1PveL
   w==;
X-CSE-ConnectionGUID: yQiCaWvUQ3S+mRbL/evxuw==
X-CSE-MsgGUID: z6IcVtjYQN6pKc0Nga29wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246626114"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246626114"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C207D1C01687
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:06 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 785B6C2BA97
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A99801800C26;
	Wed,  8 Jul 2026 09:46:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/37] ssh-audit: upgrade 3.3.0 -> 3.9.0
Date: Wed,  8 Jul 2026 17:44:43 +0800
Message-ID: <20260708094508.2060-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128104

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ssh-audit/{ssh-audit_3.3.0.bb => ssh-audit_3.9.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/ssh-audit/{ssh-audit_3.3.0.bb => ssh-audit_3.9.0.bb} (61%)

diff --git a/meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb b/meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
similarity index 61%
rename from meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb
rename to meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
index 634b7e0823..de0642a93a 100644
--- a/meta-oe/recipes-security/ssh-audit/ssh-audit_3.3.0.bb
+++ b/meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "An SSH server and client configuration auditing tool"
 HOMEPAGE = "https://github.com/jtesta/ssh-audit"
 BUGTRACKER = "https://github.com/jtesta/ssh-audit/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8745b0cfd015df0e3199253390de8935"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2638d424730ffece235019c6a623c6fa"
 
-SRC_URI[sha256sum] = "b76e36ac9844f45d64986c9f293a4b46766a10412dc29fb43bd52d0f6661a5b0"
+SRC_URI[sha256sum] = "f1225d0364b3cb61c7dfb1f5065a6958dbb814d98b2c1dd2a779ba2cdef41f61"
 
 PYPI_PACKAGE = "ssh_audit"
 
-- 
2.43.0


