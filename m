Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A99C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.3805.1640899889705534202
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AIqoReAZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m1so22270661pfk.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5e970nFKNI2LtRj0CfvZL0qwIj770z5txzWYI6Kbgks=;
        b=AIqoReAZ3VRBrn1fp6T5cs4rq3kCBfbZ4rlJVR0bMZPrDENNAyQVDfYD1V+1S/i0nO
         c86iaFi36eG9/cb77EbI0HaF+KCXk+iDNbrqPPIwF75DyOLl6G45uv1xxDBH0rvxs2Fs
         37m0Ynk0C6ssl7R6BIH7d1WJDLBR3YAYfiMIRD6SVAiQ5zIfx59GMnc3f4fr0ct/Ts8T
         PX9C5tNJboenB1RQVuzxXvzV1C0fSNFsaN7fNjhkdklMcDRiu2wjYILYiiDRpQ4jt3Kw
         bd6AuhM1sDuL7nTDC3xn1eW+GPZcbr5/TBfipKievM7gq5JGCHHRdvZQhHqPrn2d4ylT
         DfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5e970nFKNI2LtRj0CfvZL0qwIj770z5txzWYI6Kbgks=;
        b=fTOjamb1+XvyYYxyWlB53lfZFMIpEjYivLpwyMPQJit8jQ6BLatU4Bk8NSUlwrg4H5
         yWYnBps7MrhghKTSTYomZ3Mb/pt/KBrKGm2Cb1xgbt3YaWafkRoR/ux9gOqshteRN37Q
         9RlVACYwDhyFrYE56MTv2W63lZed8u6298LLIXYqdyKfZxlUP2cF0qvG6BR1x1g6gckd
         +za+w2n7Xn8FiBag2J4G/49iIgvpQyFam90cKj0RUpJGhJUhPe4dxfsVepT4aSxBiP1W
         VMISIUoMv/kFNe2crUVq5DeFyn+BNfJPUdbWlp4TqXRDtIZLKSHNASOgO7dHm7RhPW3H
         zEXw==
X-Gm-Message-State: AOAM531T8vpAA477UxyLre/Nvc72IV0IV1Q7g29qTuxaRM1W3bUWa8j2
	Q3kiH/JPvgkHa31Yd+N8hnJBtflCb2I=
X-Google-Smtp-Source: 
 ABdhPJxJgCNmrZA7eALWro2HcG6eG0YVM+LDkDcUebi56HJhds8kETfbKY2zVItuvESRTST8S8XQaQ==
X-Received: by 2002:a63:3f01:: with SMTP id m1mr7176231pga.446.1640899889010;
        Thu, 30 Dec 2021 13:31:29 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 3/7] openvpn: upgrade 2.5.4 -> 2.5.5
Date: Thu, 30 Dec 2021 13:31:19 -0800
Message-Id: 
 <678f72c3d3a8e79b8b829cab21283e005f6d0ed5.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640899794.git.akuster808@gmail.com>
References: <cover.1640899794.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94572

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Changelog:
=========
 Fix error in example firewall.sh script
 configure: remove useless -Wno-* from default CFLAGS
 Add argv_insert_head__empty_argv__head_only to argv tests
 Move deprecation of SWEET32/64bit block size ciphers to 2.7
 Include --push-remove in the output of --help.
 Move '--push-peer-info' documentation from 'server' to 'client options'
 add test case(s) to notice 'openvpn --show-cipher' crashing
 BUILD: enable CFG and Spectre mitigation for MSVC
 Fix loading PKCS12 files on Windows
 msvc: fix product version display
 msvc: add missing header to project file
 config-msvc.h: fix OpenSSL-related defines
 contrib/vcpkg-ports: remove openssl port
 GitHub Actions: use latest working lukka/run-vcpkg
 Use network address for emulated DHCP server as a default
 Load OpenSSL config on Windows from trusted location
 ring_buffer.h: fix GCC warning about unused function
 ssh_openssl.h: remove unused declaration
 vcpkg/pkcs11-helper: compatibility with latest vcpkg
 config-msvc.h: indicate key material export support
 Don't use BF-CBC in unit tests if we don't have it
 Define have_blowfish variable in ncp unit tests
 doc link-options.rst: Use free open-source dynamic-DNS provider URL
 Fix some more wrong defines in config-msvc.h
 Ensure the current common_name is in the environment for scripts
 Require EC key support in Windows builds
 resolvconf fails with -p
 Update IRC information in CONTRIBUTING.rst
 doc/man (vpn-network-options): fix foreign_option_{n} typo
 README.down-root: Fix plugin module name

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2867330535cd93067d1fc005f0cdf5984a4c43fb)
[2.5.x is a stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openvpn/{openvpn_2.5.4.bb => openvpn_2.5.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.4.bb => openvpn_2.5.5.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
index 6b588a5f50..2dc3af6bf9 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "f80f3c3df1b94a8892ae547df84f152583250684a24bd022ccc98ef56fa93d97"
+SRC_URI[sha256sum] = "7500df4734173bce2e95b5039079119dacaff121650b2b6ca76d2dc68bdac1c5"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


