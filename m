Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73211CD3425
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17450.1777546208953946453
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oz37tLkR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546209; x=1809082209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nggR8GyODo5YRv55BV57g3mZpmJLhl3FSlwli9p9q0k=;
  b=Oz37tLkRI1HTmwU45Ik3IIXm+TqwEyvhXI7hNmNjiZnn4V3kl4z8pXzO
   JBwxUd2I6ZHJd3d/oq2A7iJy/EVQaxIbN8RRyu58C3r3yxMwm6pIvK8Yi
   WQbvFBloIojyM1F6B0ZX6MjUtUuCMs7Lf6VJttSQZSRDzY1UnQ3/R5UER
   9SuowhrTa+1+XWhAjno9owvQjWZR2gblE70O+qO5EvrLkKTsLg9P0wxP4
   mFe9qBFqGVgZZREpcB3RexwNuJPudhXo7k7VYOZ8FpnGhUF4InXtRwtmv
   v8Dw/mtK7oZnnKEGkZNEA3qC2sugrurFsNB3y9VGQPZrFYyduuZ3WsXdX
   w==;
X-CSE-ConnectionGUID: nt/DF221RFK0mpCrAF51fg==
X-CSE-MsgGUID: nHMB8KuLRXmAGws7QI7bVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226540704"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226540704"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:07 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 480F642A338
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E67271801EA8
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6CC06180113E;
	Thu, 30 Apr 2026 10:49:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/64] md4c: upgrade 0.5.2 -> 0.5.3
Date: Thu, 30 Apr 2026 18:48:40 +0800
Message-ID: <20260430104924.1106-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126689

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
==========
- Avoid repeated prefix language- in code block language specification if the
  input already explicitly includes the prefix.
- Permissive autolink extensions (MD_FLAG_PERMISSIVExxxAUTOLINKS) are now tiny
  bit more permissive, allowing + and - characters to be anywhere in the path
  portion of the URL. This also improves compatibility with GFM.
- Make Unicode-specific code compliant to Unicode 18.0.

Fixes: ===========
- #236: Fix quadratic time behavior caused by one-by-one walking over block
  lines instead of calling md_lookup_line().
- #238: Fix quadratic time and output size behavior caused by malicious misuse
  of link reference definitions.
- #242: The strike-through extension (with flag MD_FLAG_STRIKETHROUGH) now
  follows same logic as other emphasis spans in respect to punctuation
  character and word boundaries.
- #248: Fix handling tab when removing trailing whitespace, especially in
  connection with ATX headers.
- #266: We now correctly abort the parser when a callback returns non-zero.
  (Previously it worked correctly only for negative values, values greater than
  zero were causing strange and inconsistent behavior.)
- #271: Fix handling a code span whose closer is on the next line and yet
  another text follows. In the case we erroneously outputted the closer code
  span mark as part of the text.
- #275: Fix md_decode_utf16le_before__(). (Only affected MD4C builds built with
  -MD4C_USE_UTF16 on Windows.)
- #278, #294: Do not try to interpret characters in a link URL as Markdown
  syntax characters.
- #292: Fix detection of closing code block fence if it has a trailing
  tabulator.
- #299: Fix invalid free() in an error path.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/md4c/{md4c_0.5.2.bb => md4c_0.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/md4c/{md4c_0.5.2.bb => md4c_0.5.3.bb} (80%)

diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb b/meta-oe/recipes-support/md4c/md4c_0.5.3.bb
similarity index 80%
rename from meta-oe/recipes-support/md4c/md4c_0.5.2.bb
rename to meta-oe/recipes-support/md4c/md4c_0.5.3.bb
index 59f2e430aa..12bcf15a87 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.5.3.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=383f39920f391605af6e8e46e60e2378"
 
 
 SRC_URI = " \
-        git://github.com/mity/md4c.git;protocol=https;branch=master \
+        git://github.com/mity/md4c.git;protocol=https;branch=master;tag=release-${PV} \
 "
 
-SRCREV = "729e6b8b320caa96328968ab27d7db2235e4fb47"
+SRCREV = "472c417005c2c71b8617de4f7b8d6b30411d78f4"
 
 inherit cmake
-- 
2.43.0


