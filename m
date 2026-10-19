Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B2CCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33883.1792414586632019461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NuHbLsUp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1543170f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414585; x=1793019385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYJK546ySlYK8XuVChdGfGjsqZ13d80J5LC4Ex+Lv4g=;
        b=NuHbLsUpVA4FyAr59bduM3zSGfX/bFd1h3dYsDy2YqK402woaI6zeElwYuZkLRZ0yk
         AbSPqnNz+n3DQKCgOsyG3dqbF2VDcml7rNxiSbHh6tyfv6+vL42cyUwuoL2c7sFhXgp8
         Lwhhl4VtsH5ND2Q9sQwedRqaWygNhCPl3hNps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414585; x=1793019385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYJK546ySlYK8XuVChdGfGjsqZ13d80J5LC4Ex+Lv4g=;
        b=Z9wf1D1X8RiPa0CBlP71sYrF9DDaDFynlNXk23MOLh/XG5M//zCBZ96Jf7gO0ZfOk7
         /B6CTQpkasXEwmccej+hf3TPdqlByJHiOpUPdRyz3ALt9l0gtrlaRmqU+2ue+7Ve5zFl
         E0fGfKxQfilkNNKSrmFhoGEdYywpT30g94JHEQtnBPOQ2tDkho0bjxuy0eQoddLFDj7D
         mFfzGEtL/KfuMPpy1OtPGYvlYc90/cAxMmKabGadqGfNlCmtr5cT796A1x53eZfaNARj
         Vu4WD6Kh/pHILEJPEtIKdlC4NYOqfAjcPFkmRQGmCy98vOdiNs11luarzYbfwPBwj5v3
         Cm+w==
X-Gm-Message-State: AFq9FYLlbyUmo9Z0GSkcHELPj4ui+/NJKcZVmhbqV2VDsdSFtoeGjpxe
	YAm9Ob+vqVW5fpk+sxhEdRBQiE0LAImjADHSwSkEvixOubiCzWGuW5Gk8RLp7QCheK+G1BRZeq9
	KS+jV
X-Gm-Gg: AYBFou2sEA9BAB2zC2nf5NhDTMP0bGZohquj7CkrRjh1kMlT2E4vWorE9pMd1+t6PP4
	xJPI4PO9HqycVShTjNHbkbLLa88L0JsntEJPAOYyAwdn9mDEP0R4LcWz1psjHX+jkWNYHQZgr7T
	EQITVrlQ3ICQIoSlR9Dju25zr2ZCFmCaknxAMH4y9L5grVb45hjZY3rSmh5mlbddsf/XeQC6p6P
	ksvZIPMjuyjFx7Lx8YahpTkGy8P81/hYSnooJrLjjqQH99eypez3u76qkIURM+cNoiQaOztkb4r
	h29fEVSY0scC2S9nmRTOkF33qoRBkGi2zBZwxmivYl5hdpRPUGFkHWwia5pf1f+qwG+46tx4W78
	7oxKTANzWWOFeB2bGgk+dB4/INnQqMx/zJO1NMtCEfEfTRIoLfgf1uG+lWqtagH0zsJbAkG+pA8
	3fqAbvbroroWzDEiCKhAzZtxVftKtN9mgYw0T6rlKLDH2Ll5aaQUyUxZZUE9AHxgkHOgFPbsrXW
	RIqdnidPLGn+x+91n3E3UmqvB8G+aWn3pX+CyW/Il5Go0swx1sPNQunRF9WTA05+yAkMBWwxCa6
	XpQTCc/XoR4Xsmr8hlKl8UA=
X-Received: by 2002:a05:6000:4904:b0:48e:1646:b39f with SMTP id ffacd0b85a97d-48e1646b493mr5684607f8f.9.1792414584275;
        Mon, 19 Oct 2026 05:56:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-bumble: Upgrade 0.0.235 -> 0.0.236
Date: Mon, 19 Oct 2026 15:56:11 +0300
Message-ID: <20261019125616.3888504-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131120

Upgrade to release 0.0.236:

- Use signed values for the AICS gain setting fields
- Fix record offsets when parsing a list of PAC records
- serial: add an option to resynchronize with the controller on open
- Reject public keys that are not on the curve in the builtin ECDH
- gatt: enforce value size and queue limits on server long writes
- usb: support Bluetooth controllers that are not interface 0 of a
  composite device
- Disconnect LE credit-based channels on invalid SDU lengths
- smp: save pairing keys to keystore before draining connection
- Stop calling the deprecated Host.send_command_sync()
- Fix - remove BIG Sync handles on BigSync.terminate to prevent
  resync failures
- ci: pin GitHub Actions to commit SHAs to resolve zizmor issues
- remove support for python 3.10 and add 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-bumble_0.0.235.bb => python3-bumble_0.0.236.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.235.bb => python3-bumble_0.0.236.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.236.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.236.bb
index abc77317b4..fb3af67025 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.236.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "f6b55ae688806c7ac41e8c0f63df912e106f49050c9250c226a95ccea69d79ec"
+SRC_URI[sha256sum] = "cea9fbd8b8a9ff78567bc4a97b35d54c72fcf10109476a24518d01394fbbd982"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
@@ -37,3 +37,9 @@ RDEPENDS:${PN}-ptest += "\
 # runtime dependencies to the bitbake packages which include them:
 #    libusb-package
 #    pyee
+
+do_install_ptest:append() {
+    ln -sf ${PYTHON_SITEPACKAGES_DIR}/bumble/apps ${D}${PTEST_PATH}/apps
+    ln -sf ${PYTHON_SITEPACKAGES_DIR}/bumble/tools ${D}${PTEST_PATH}/tools
+    printf '[pytest]\nasyncio_mode = auto\npythonpath = .\n' > ${D}${PTEST_PATH}/pytest.ini
+}
-- 
2.47.3


