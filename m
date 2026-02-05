Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB67E91283
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15346.1770274811338904882
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OS74S9C1;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so3031815e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274810; x=1770879610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sehdoiJ7P5jimvkRprYKayZzeo1gLX5SewNfZpH6w0=;
        b=OS74S9C15J9hn2i8oDfpC9yoc2crzdfNUsDBMQY1d3kqeKFFsnjPrDmBmqtg/DlE8+
         vGq+udwD5cELnQWV5luIGUjhRRAsfN3SISKr7XvesvdDA1qjybTWj0yGK79bnwFvIMw4
         1TuTwsRZWDa3QagO+cBT1jcHzCcwNhfdCEmtCdhI3EIUTgG4ftiOYHizOkk04YDs/fy2
         npagC2Z8v6pBg7QZTAxdXbOm+kwy+QD7MbPOG7JuTyckeFNHYGehfILAaGpD6wFDIvHa
         bbTLZpR8+4MvMT+HMd/6iH9Wmj4PZn+GOraxsTzqAwcr7ELhy1zlDUWOOFaF4yrcUoc2
         OLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274810; x=1770879610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sehdoiJ7P5jimvkRprYKayZzeo1gLX5SewNfZpH6w0=;
        b=XfPb2OyMFw/jLrLPBJW+ggySPQAjLSKRA8PcpbF0oTIH1hMKTgj0kT2ml3GAB+rY7Y
         p/HzoKJirpuuOBDZ/u1MCnVr3iPr56Y6vkXughF0X8tuORITCYOQ+BzK79lcpPX04Sk/
         ikACq+sPTsT5SAmYOqNdTrqZJhNwi00zkmKqE0l3vmP/f4+SY//jXt1uPJiiNCVbOf/w
         wQLUQHVypl3iA8UevztMCakXdpQpnVV5+7WAo3GERuabA6fc9LEOP2MGl21AbUDuH0p3
         LlN6G5FWugnFMrjB2pJ2imMlLKObwaBLwgQaA3Zpv4/3w2fJbPpg5s4hivHFoBbmLGpt
         +iOA==
X-Gm-Message-State: AOJu0YwFSCVBSkQigRA9CC4dYIztI/84GMdIJMxrrVwXgkMF3NgVWWgy
	jcbqLPF8hITBhsL6P9sYB5yRpVyau8RWTHADgx2j3Mad9O4mCXB2x5vAC7R6FQ==
X-Gm-Gg: AZuq6aLzy0YOtfFku5J/zNWK4FUKfBFdlEf1skbrevZj4gcgbsh0pQvTpEoVyKEjGlo
	LnzhJr5aIxO9PExgKTX+UrgR6RnQqjk+nwAg3gRqbVqMOGEgOnVZK3BQPFmGfVj5rChamoi5qI5
	5/L0Stktz9ABNZ1fbvxaIZQWROT6K72Zm2CAvBhBhNPT5HX/+uRM61Jp37kbqIk62NA2fgiceU/
	vxPuwgtetbaBU00BVc7i59NVIkV2augbwT9MXK4QJlLWIDFiYr1T5YWEGZGB2ovRVS8ZSBEVGTx
	ggZHKquVCENho2DQAV8JLITaBTDG741/trQNFRPkMkeu8tviVrP7Aqs8ETAjtyxw4t00AgpSeTc
	+FwjtNU/EkOWOHpTJOTxpI7/txt8wGEuhDPVXmRuTzdoGv3ToLcE5W3he4Drk0s/PKsoDAfGYiY
	3aLFzB3d+D
X-Received: by 2002:a05:600c:6290:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-4830e98f6camr67427685e9.34.1770274809069;
        Wed, 04 Feb 2026 23:00:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 18/20] python3-werkzeug: upgrade 3.1.4 -> 3.1.5
Date: Thu,  5 Feb 2026 07:59:53 +0100
Message-ID: <20260205065955.1267785-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124194

Contains fix for CVE-2026-21860

Changelog:
- safe_join on Windows does not allow more special device names,
  regardless of extension or surrounding spaces.
- The multipart form parser handles a \r\n sequence at a chunk boundary.
  This fixes the previous attempt, which caused incorrect content lengths.
- Fix AttributeError when initializing DebuggedApplication with pin_security=False.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ecf359d2562795ca8de18f12f117cd654c30965e)

From the release notes:
This is the Werkzeug 3.1.5 security fix release, which fixes security issues
and bugs but does not otherwise change behavior and should not result in
breaking changes compared to the latest feature release.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-werkzeug_3.1.4.bb => python3-werkzeug_3.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.4.bb => python3-werkzeug_3.1.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
index 2cfb5864b1..b92711ea04 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e"
+SRC_URI[sha256sum] = "6a548b0e88955dd07ccb25539d7d0cc97417ee9e179677d22c7041c8f078ce67"
 
 inherit pypi python_flit_core
 

