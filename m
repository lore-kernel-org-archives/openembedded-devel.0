Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C10D3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4110.1765274166950789681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UbT8qcfi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274166; x=1796810166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Utmlgyg4EXUpjifZadvMGK5WVwWIfIwwvNh4DZEZtMY=;
  b=UbT8qcfiO2lvQclXOE6nezJIa/qoRLfFpv1ZUcIZzsVtNK75QCFPRhFL
   Mr9e379UTaSMk5h5ykZNf5sTsEJuR6xY46eL8cqx+gMTmaCLh7XR7OqnJ
   K38ORYU+K43/zN0sHDoyBmDRyGsvObSX0l1MpvLp6co+3Qsk7xA8yNp+e
   Hu3lnLeoO5TJK5vvpsZz5PNfDy9wrYvEvF3+dHmNDPgU1d3MdE9fDrnVh
   2LiwwO5HVybeqUBlpla2Qrr9f/sm+ZP7GsoSAU6YAtwaLAOpZ8eIkLrnj
   sTcvTpMJloMR+rCPtTE9Y++SAb85RgwqjmrZWFRCEFtlmME1FZL6BY+Nc
   w==;
X-CSE-ConnectionGUID: C3a2c63eSPG3NOYw4Z7gFA==
X-CSE-MsgGUID: sugHexuUQBS/czxjwnxF3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209952187"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209952187"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:04 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 25A3B42A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id CD8D41800E90
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 662CF20002B7;
	Tue,  9 Dec 2025 09:56:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/38] freerdp3: upgrade 3.18.0 -> 3.19.0
Date: Tue,  9 Dec 2025 17:55:18 +0800
Message-ID: <20251209095552.690-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122408

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* [ci] add git-archive ignore list
* [client,common] fix retry counter
* [cmake] fix aarch64 neon detection
* Fix response body existence check when using RDP Gateway
* fix line clipping issue
* Clip coord fix
* [core,input] Add debug log to keyboard state sync
* Update command line usage for gateway option
* [codec,ffmpeg] 8.0 dropped AV_PROFILE_AAC_MAIN
* [channels,audin] fix pulse memory leak
* [channels,drive] Small performance improvements in drive channel
* [winpr,utils] fix command line error logging
* [common,test] Adjust AVC and H264 expectations.
* drdynvc: implement compressed packet
* [channels,rdpecam] improve log messages
* Fix remote credential guard channel loading
* Fix inverted ifdef
* [core,nego] disable all enabled modes except the one requested
* rdpear: handle basic NTLM commands and fix server-side
* [smartcardlogon] Fix off-by-one error in 'smartcard_hw_enumerateCerts'
* rdpecam: fix camera sample grabbing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.18.0.bb => freerdp3_3.19.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.18.0.bb => freerdp3_3.19.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
index 02590973f6..9b6df4e0cb 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "11ed2c65fe1f50f8714e51be5bcb2655cd8ba31f"
+SRCREV = "300a4e6d60aa072cb7201b6d32c0dc925092fb9a"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
-- 
2.43.0


