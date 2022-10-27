Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359CAFA373E
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 08:26:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.4190.1666859172112560616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=J1tIs+jk;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GlNsKCSTBLNOQiumpcKsVbH0Jg45DY0w8woW22Ycij0=; b=J1tIs+jkJkdpB/OMb6izvFLVLU
	f4hf4pB7LipF+bX1FjI5C5YzboHU9sCPfdyAWI63OL4o5OcVVlqdN8HjBlmfHV9X2cERWZWf5bLam
	tTRSdIZ1m5zLs815u+v/yMN63Qpcik8SatzbROwf4jKkLHkgbXP8/fSFcedGFyYu1W9X2kXywmyXm
	nPQ+DdoUy+nnFe64f6Vx3/wxvZHQyWc2+QKSgUdqwe+Tpke4nGmdx3otfednsT/UY+JzJUWhKQ9Bp
	pBcP424p7NHLDhPAoQ8mzs8c7WMsQa/zzaAlRkCdQZKlgYZDpYin7C5dqt3dKd8LhoR/tq1lYF0ku
	1W72uN0w==;
Received: from lan.nucleusys.com ([92.247.61.126]:45606 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onyEM-0006Ba-TE;
	Thu, 27 Oct 2022 11:26:10 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-traitlets: Upgrade 5.4.0 -> 5.5.0
Date: Thu, 27 Oct 2022 11:26:01 +0300
Message-Id: <20221027082602.602758-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 08:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99318

Upgrade to release 5.5.0:

- Update tests and docs to use non-deprecated functions
- Clean up version handling
- Prep for jupyter releaser
- Format the changelog
- Clean up application typing

License-Update: formating change, the license remains the same

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.4.0.bb => python3-traitlets_5.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.4.0.bb => python3-traitlets_5.5.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
index 84f9727dd..6ac17f5ec 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Traitlets Python config system"
 HOMEPAGE = "http://ipython.org"
 AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=9c125dfc5ff5364d40b5f56f02cd9de3"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "3f2c4e435e271592fe4390f1746ea56836e3a080f84e7833f0f801d9613fec39"
+SRC_URI[sha256sum] = "b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


