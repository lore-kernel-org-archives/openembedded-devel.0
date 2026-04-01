Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD1BD3516B
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:03:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9513.1775037773776302563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y5yjKtOd;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so3267704f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037772; x=1775642572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TSehGYX2RTbARo3sOn0gjA3oZWbC2emmrNExmEesyc=;
        b=Y5yjKtOdV+dDq+UFJgJ1zeYE6fhGrR2hxwleCuqvZhk63BCJ6IAwg2yYtSVDMUj2ZM
         kBIc/RET4l7GVV2dqUvVwXNGIn+IhzFdZiHs+dLuL6iEImZ8EUkwWdhdgdZ95MBGfdjo
         pQ1iCKJxtgvSqhpg8gHVOmmO5deyXL6dO8GNaeKx5o0Ss+qH7yrMrXAhexYt9xxD4Ewx
         qHr8PmBmcSM4bYT3JQ5pKNitKVG3LZOg8oTkMdQjojqhOsDm4rPaGOSir/m3bbkkLHMr
         9+UURf/AuP5/kCpPTmyc63e9A+p0uCGiyOGw/4PAbkYcyu58yX1+pYVu4hr9Zep2ZmZn
         A9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037772; x=1775642572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TSehGYX2RTbARo3sOn0gjA3oZWbC2emmrNExmEesyc=;
        b=ECeSrdB0/t4UJkx5eBCxjWESZ+hqYmfOawDPpjY6iBgbiIzLkNLldF9t5O70S0Al5C
         wj0AtmIDPCAhACVZkwfpbuVuuqsWJOuC1UkGnEfc0dTn4iR8McYbzUgTAJjiyAv8TBBu
         r/yhShqY5y646O3bMjSX1+nyrRTt/7QyrzjAelcIZ9idvXbL9nDMNwL5Bx9I/ur4OQVq
         LQ5SPxpb7R88G1dWorNQipuiS9TdbcpSg1kqNNQli60Vv65qex5p+OLb3fRR0uVHIn5E
         OgiEX06ozCNQNfTUpZ+DQBWD897l4PomICIjgM/byyTPmrx359CRyW6Yrsboj7xbi4K9
         b2EQ==
X-Gm-Message-State: AOJu0YxUJX3KIgXJs0PmYgnYyre1N3jLUNHw/RQZoA9hKM6Cv/zgMgs+
	qvD+SzX47xS4KnZytOWCoiU5qgJ6y8Alr+vxUCgrQW8ZKgJ97e8h2/lL5BkoiQ==
X-Gm-Gg: ATEYQzzdcaUQm1ghSjw4W4ShONbe2IxW1V4Gyw7IUniWa4G/uwQAOdlBLQlXVJho4Hg
	YF11sjUJEOz6Tu98eMbdC2Aue3Z967Aqe/F1SapSSLZ+RKGK9TebH3xyyoXcobHGLiAGBMgfWXg
	v4CAXBfyt3/dmkG91SlNELjHJHBQyTNjCB6gZI9Hb2eQWwMdVX1tT8RPSQRCJkU4jSDovcDLNjJ
	qRZzqWexcUZ2yBaJEKc2S9RFoS6rGRn3MEAG2swWsEWJw1SsW4du2h5v89WXJHmxYQEEwxUE4rj
	KPRDIuIGrUyarfunFv0or9Pa3sVbdY2c0DWQAynAmA29dqWuFMdwU5HyK0tPfILTKr20xC4dx6j
	+QBmNEkrL/qp6HLd3TqT8u3wbvhORu3aXqoQOpAagLspPus2aOQS4NerLJzdFHKAXBBgijVtcor
	L4WOCbXeWhlsE6Tr4jGlOH
X-Received: by 2002:a05:6000:184d:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-43d150ea521mr5398379f8f.39.1775037771445;
        Wed, 01 Apr 2026 03:02:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm34546357f8f.14.2026.04.01.03.02.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:02:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: remove (another) obsolete CLAGS extension
Date: Wed,  1 Apr 2026 12:02:50 +0200
Message-ID: <20260401100250.2063116-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 10:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125906

The incompatible pointer warning/error has been fixed upstream[1],
no need for custom CFLAGS for this anymore.

[1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/43bcfbcdf5e255544adee3d02d0e98efa088c5d3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../networkmanager/networkmanager_1.56.0.bb                | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index 85dc51e163..f9fc9f3966 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -48,7 +48,6 @@ SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
 
 SRCREV = "56b51b98fbb8627c4c09a483702e18fd8aee7ce1"
 
-
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 
@@ -72,12 +71,6 @@ EXTRA_OEMESON = "\
     -Dman=false \
 "
 
-# networkmanager-1.52.0/src/nmcli/agent.c:88:29: error: incompatible function pointer types assigning to 'rl_hook_func_t *' (aka 'int (*)(void)') from 'int (const char *, int)' [-Wincompatible-function-pointer-types]
-#   88 |             rl_startup_hook = set_deftext;
-#      |                             ^ ~~~~~~~~~~~
-
-CFLAGS:append:toolchain-clang = " -Wno-error=incompatible-function-pointer-types"
-
 PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \

