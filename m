Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E83CCA476
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:03:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.17059.1759323707733491663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjzcuaNS;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e3ea0445fso31347875e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323706; x=1759928506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=fjzcuaNSybX8qosp6wyG97/2HEv+3BiPBYyL7TEL0PCyzn7n9wSQCnnHtB6Y1LYZEz
         3IqQLaymHdqZfbHI8mR6cSahEy3FimHt3ZfliRjG0RuWf8/3CVJZ3Ht6zOrirvFa2eU2
         3HG+N8LjD3igr8UNawNJfBzHDKkoiTCmF+6VMbharPaoaDiBWGCLV9lvb2nriqOyci9V
         KQHv5rqUSmWBLqjy1rHzKATjXLccGfFH+0ZWEekRZsMPeMm7si/5g9pKF2IM1n60u0Hg
         cSi0hSWo6XDdyb7W4r/q5SOWUrDhmUZvGXHX3zWMgfiLKb9zMk9kfVIfkoSs0gcUNKzQ
         5AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323706; x=1759928506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=RU9aHwryKbJeOa6i4RbPQwKpLk/mWbaNI0sctQ6NzG+PeI9ZVhqefJwgk1KXADItlN
         S0is9FWrk+INjd7zUAUsuhpOtPnGJBysINF2flcBB3BJdHsEwMx/xPqhBkQ+A23oJ+qU
         XmzalNH5mvdD53VmskSfsfrmlqm9IBJwvUrNsSn+eQH11Mwi8zu7BCkYGW8y7B4j1Zzl
         yUrxYacSp2z2tBXpE32qoZKbY1fsvsIu3JUgmBiPfEeBn60vjwqJ4PGAy4O8vK62ViFC
         38WExXgfQ3bPxxOmYZ2KoFu6jooMYpq+1w1CbU4cKU6bnvy+4LCXMApr1Qe6heAdkF6F
         BXaw==
X-Forwarded-Encrypted: i=1; AJvYcCW1WfVrqZAQyk3nZoskpEHOFcFwm6UPZ5c1erFOc1V/UsJOfeoGbGQ0dKAq8ICvr1ANjmgSj4t3b2V8nxYKtF+guSo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXUY0KCsTFOQwTMfgrEZQwhUUKyA5yf1N8F1jPhWhBy1fL66Jd
	qrZT+3FEHH4W9bPYFsCkfOBQqXCbWaWLvO2alN47vod4Bk8xJ0LMlt6gEyKGtrH8
X-Gm-Gg: ASbGnctesccRPID6qr3jXLeOqkLJyFBrQFegeLza1XAX7caipO36jyo35dfkPAgnFs8
	wDvOvTNekuo48qpWUCZkKEAWNKAyKoVfpFh0zU9ZM/fHaP7aA3FN6mtOTOlttg4o5bpltUn0edH
	79Y1x4sBWiwS//vYo1oqkAgUVL8d7TMpCwda5PBaiPfzr1Sg5GglpZmFPNLHHdbHyzp1bNDCoQw
	+rrooVjXAqthmGzP9sT7t1Jg4FAZiTCX0aMhkrSYBqWTDa9YWVEWWUO3UgjlOaPFMmoClMmMLU/
	+asi2KxPdYOAif3Mz/nxafXo/XMmRZ6VE5iH+n1C/MQOHjAYOPahGB1XuZMpQveyYv9BPXoioVo
	xue8hKstPisi1EsBrPmYn4to7C1YQebGXT+JI9WcS0Gdopl6SCI/n/tAyzrQY6iLhuu1cMRflFo
	eUDgIxt1bVpDWhK7HvFrvdO05Zjaqrdtqal1lfp7PxW8fuXuysVsbI6f5Y
X-Google-Smtp-Source: AGHT+IEdPAI1c3yJ4pDMUwwomcAqs56zjfPvEHFytcATxSfRcCn8ApZMu4Ow+mCIqRQJbOBjuMZvhw==
X-Received: by 2002:a05:600c:1908:b0:45b:7ce0:fb98 with SMTP id 5b1f17b1804b1-46e61202a91mr32936455e9.5.1759323705183;
        Wed, 01 Oct 2025 06:01:45 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b622f37sm36787325e9.1.2025.10.01.06.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:01:44 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 3/3] openocd: enable dmem and jimtcl
Date: Wed,  1 Oct 2025 14:01:41 +0100
Message-ID: <20251001130141.1768-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120106

From: Joao Lima <joao.lima@hbkworld.com>

Build configuration:
   - Enable dmem adapter driver (--enable-dmem)
   - Enable internal jimtcl (--enable-internal-jimtcl)
   - Add both features to default PACKAGECONFIG

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 846d2f62c5..b39ca5c244 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -55,7 +55,10 @@ FILES:${PN} = " \
 
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
-PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+PACKAGECONFIG[dmem] = "--enable-dmem"
+PACKAGECONFIG[jimtcl] = "--enable-internal-jimtcl"
+
+PACKAGECONFIG ??= "sysfsgpio remote-bitbang dmem jimtcl"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"

