Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.706.1794955426188872168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F02eGVLF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso4063295e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955424; x=1795560224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/tKjVVWocjPjzTT0tq2kgMU+oUaMmISGLo5vV4IFKg=;
        b=F02eGVLFahMqeVnHojHGODA+nlW/R3JK4Df8A8pDHH4hHbnrwMCCrMMLnP2VVqbQ3K
         2QXGu2NrCIg/yO4pAt5JOet+qkptB/6UhbLwFsEYz+SKqlqfCB4NDy3quxFP+ldu6LWB
         kCGQweTABl1WIyBtbu8cRTvtPxBvpD1EE28hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955424; x=1795560224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/tKjVVWocjPjzTT0tq2kgMU+oUaMmISGLo5vV4IFKg=;
        b=eFAZ7f6pHPBYSp3HnmThM1qFVD4S9j2CY0yCJgXCCQSfUYOATBTjkR6CU91Mig/8Dj
         GPfwTl8ML6OsI2tlagDRyzEVnwOFu77zih6GcLNIlMTeLiLvsDQoM32d7P+/yyVhN0Kh
         QXbVIQUnVatzp7TNCiUCoZ6u0H56Z8X1IGmEdlXqfq3PpNlHeAmJ8srfoEGlmnxc2HUy
         zNfyf7Mbf3LkmkveHI1rnHvV3O+yqTX6ftG2Smp0Zn5Nw8O3WWaCvzEv/wwPPega60hp
         O6cg5lEqg3EaA0W1nseP+a5n7tx4nT3IdlI0bSjlyPSy6hib7Bda4Vmm/2zFac3n0lu6
         5x5A==
X-Gm-Message-State: APuU4Z/mRRQ3G71y9lQ+jzz02i0fcTY1oBq1cHpgqpvbYet1bVOqzXbQ
	s5E2AV9T7LFhMDiJ4FYdE+awTEwihfBROfxBeMb+hWlknrGheA5pvIM68397lsWcgCVsHx4d2f1
	/8Ego
X-Gm-Gg: AYBFou19sAOqenTgdCfqibSqEzUDbqhBvFzaNyQoZ5pyRGgGD2LXt3BKAzGnEAf7ZHq
	J7GvhKC9i/RqswPyRjE9ne3c8xSYQdOKbAGSD7PP88jJwGXhveP0inRKGuttxl9wLAKmtAbErTd
	jSpCCQnMrIs8ZKQmtMQgd8ZP/Dc0TmMz83Vzg4hTmcXy6ZvXtXKvGxQPh2k4772MsbsE+Qbax2e
	Nc+HNL60XnDbstalzn52C1WL94StgrHmy7RzYppJXTG8GEmHPHQ6mKImSCgJ9hGQQN8dAurgnUX
	1VEkaepT8OO9rSBWYjymEgNJ6ET9y3yhNWGhRK+YadGFPymK9j3HQ8byaNAhE5LZwZKfR7ShE6m
	htegGJGhLofKfMg2UA6DoO2V12TXpMv+7K06nLnqkIHX9JeTeKMc1xpnaDXC5xosAVRDHIDJSLn
	hAUQtTjJDs6SYcFfKkPQuuKTLlU2PrDBBA5h0vJeM2cE/s4DbQScv9zyS5dNIyCAWXledPT3pWI
	NJv9FWL7Par3ICc6/kZjxv+AGoUjxjB99EfdkX+YQ1WMys8D9dB2Kt4r9BhQNQ3p50srIO3KX16
	gQUHsvWK8j+p8UOwv9qh5kmn15QZd7Y9+Ftl4owHWqxZXrPdb7p3OOeiQaI0soHhkQxKep3ed51
	eU6ACiFnwiZdP6Xs/V0KUmY0MWzFEs5VGHlb8CIpbAT5Bz6hm11D9CA==
X-Received: by 2002:a05:600c:4fc5:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb7da3d55cmr12074725e9.17.1794955424421;
        Tue, 17 Nov 2026 14:43:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 06/11] ostree: Upgrade 2026.6 -> 2026.7
Date: Wed, 18 Nov 2026 00:43:32 +0200
Message-ID: <20261117224337.4181772-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132596
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.7 which fixes two security issues:

- https://github.com/ostreedev/ostree/security/advisories/GHSA-phq3-47fg-9gvv
- https://github.com/ostreedev/ostree/security/advisories/GHSA-67f3-qw4m-mv3w

Additionally, there's a fix for an important negative interaction with
systemd-gpt-auto-generator and /boot on systems without a separate /boot
and using DDI partition types in
https://github.com/ostreedev/ostree/pull/3690

What's Changed:

- Release 2026.6
- tests: Cover static-delta pulls through direct-I/O FUSE
- bootconfig: reject newlines when writing loader entries
- lib/refs: Validate collection IDs read from summaries and repos
- sysroot: Finalize through the boot fd, not the /boot path

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ostree/{ostree_2026.6.bb => ostree_2026.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2026.6.bb => ostree_2026.7.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.6.bb b/meta-oe/recipes-extended/ostree/ostree_2026.7.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2026.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.7.bb
index 70f3c8ee13..f717e14280 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.7.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "164b8226aea6a0e6601036de02a5e3b62307bae25890ed557fb4e19020bd5974"
+SRC_URI[sha256sum] = "43e0295e869927edfd41e7cb9cdf5ca8f8515a6f1460af4b381f1f701168494c"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.47.3

