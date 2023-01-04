Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C4BC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:00:40 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.8497.1672826432289974154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Q8PFy+5p;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SM39SMK6JxJyk+jGUMmX628gNcujkMCW1YR5UI5SbRQ=; b=Q8PFy+5pFxFHFiRCq8yFK34pcl
	5nx+q2RcIa/8lZwjYOuMNthi292Hu0rXfCZ6qSGwRMdz8aG6Pjp4cVV1C1+kAFsY7i+2swt4aUSM7
	w+UqjE9SgN0rqFwHJSP3cxcDWwBxTIyrn78t6fGuXJ45RuDwiRTjJA5IhdhRBDvOKeLaA9FiN5JvZ
	jpEsQrnmyrZ/FaImJSRSrxP5RyX3841sV9AF8hc/ARg6R3D7yR1foUcjdJCN6oRbCfm6LjjRXSuT9
	/rv+YZwQyZHFimMeC1DsR7xr4/8muXa+AGWeXiiSSbS1Kwupsk3yWROPxJsSGodtGOlEKEyu0vYRN
	NM7x4Hjg==;
Received: from lan.nucleusys.com ([92.247.61.126]:35460 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pD0a9-000Cd7-U8;
	Wed, 04 Jan 2023 12:00:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-prompt-toolkit: Upgrade 3.0.31 -> 3.0.36
Date: Wed,  4 Jan 2023 12:00:15 +0200
Message-Id: <20230104100016.268755-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104100016.268755-1-leon.anavi@konsulko.com>
References: <20230104100016.268755-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 10:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100395

Upgrade to release 3.0.36:

- Another Python 3.6 fix for a bug that was introduced in 3.0.34.
- Fix bug introduced in 3.0.34 for Python 3.6. Use
  asynccontextmanager implementation from prompt_toolkit itself.
- Improve completion performance in various places.
- Improve renderer performance.
- Handle `KeyboardInterrupt` when the stacktrace of an unhandled
  error is displayed.
- Use correct event loop in `Application.create_background_task()`.
- Fix `show_cursor` attribute in `ScrollablePane`.
- Improve termination of `Application`. Don't suppress
  `CancelledError`. This fixes a race condition when an
  `Application` gets cancelled while we're waiting for the
  background tasks to complete.
- Fixed typehint for `OneStyleAndTextTuple`.
- Small bugfix in `CombinedRegistry`. Fixed missing `@property`.
- Use `DummyInput` by default in `create_input()` if `sys.stdin`
  does not have a valid file descriptor. This fixes errors when
  `sys.stdin` is patched in certain situations.
- Fix control-c key binding for `ProgressBar` when the progress
  bar was not created from the main thread. The current code would
  try to kill the main thread when control-c was pressed.
- Accept a `cancel_callback` in `ProgressBar` to specify the
  cancellation behavior for when `control-c` is pressed.
- Small performance improvement in the renderer.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.31.bb => python3-prompt-toolkit_3.0.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.31.bb => python3-prompt-toolkit_3.0.36.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb
index 0b8962ded..a5299318b 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.31.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.36.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148"
+SRC_URI[sha256sum] = "3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63"
 
 inherit pypi setuptools3
 
-- 
2.30.2


