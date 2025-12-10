Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D124D3C546
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:25:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15608.1765373143459657738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+mU/E6q;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b80fed1505so7105529b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373143; x=1765977943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Owo+3rH9SM31cIZNW/81gR5l6ZWmeI+R/ro1rIKy8hA=;
        b=i+mU/E6qM2YL/QZDg1gHuKptxfKTLoFNv6wWZd+rXLhs5SIuLzTktAdVS0laH3GG4U
         0LuIHMEJpkWZfVpxmit1etAYADSF6Z7LdJ/1hDPbUoG2IwMzAYZozPo2wYGr1+zT29R7
         3NtWo2EL/amqlI7UWLqhafobaehR2bf2v763Wb+Ka9R7J9DqmSYx32RJsv33beOJ5cC9
         nQVzbuXdHg09lNZjSH4AeLT+cz080qvSdGzh16Jdd3MpsX2B7eGpSO2afILw7F27Qgr5
         9MDfZKrRm7b1tvrTjRaEaISN/ZmlCkiygwydvmaWA6jOAPi2TX3pirzqu4PDZQ5ibQL6
         RZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373143; x=1765977943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Owo+3rH9SM31cIZNW/81gR5l6ZWmeI+R/ro1rIKy8hA=;
        b=w3Yhu/acK9EGdc0AwmSs1oK5bK+tvCHewE+Y4K13nVaKxOGiLhT9NsfhH5RXZPfkex
         EWR7GDllibfTPwiC2O12cmeC4O8Gw9nlZr5njjJhl10F9K/JtuuJr6NcIuJMzB+IxCiM
         1sEHVDcdzPnjCO511DK1nlCHi8rlYop9hvuLL6CITiXrg/8nT5PfJ8CzyBryeqjEFW02
         Q9vm2v4GAqFZVX0R9BzaaP1q8lwUPmG7338lQtsiTLH/65vt2w7hy0yOXtaSYc/bIgOB
         IOkBUIe2yOfOlm/0SmYqFVmxVwA5z2ZQlvqkPHpU5GnMijK6svf44bm4KpbQonkQvTax
         l8tQ==
X-Gm-Message-State: AOJu0YzLKegLV4iG4MXB+WYCA7bADLaukvWl2aU8J4iQ8cJNlW6V3xS6
	KyQUia1La9MqyhOlpoEReunB55ctGF1fOj3ex5nplAUfTC4+3q87pg1Cxw4FpA==
X-Gm-Gg: ASbGncvCpsYxAp+qIJwEv2tRyCnaG6Td7JliZ+1zGkixe9uejxlVJwa8nn1Zhq3VtaJ
	jdsc36ewzMbaXyrHwSwSINohyPhPOSzhy+irikThm1JVMTOJs9Y04RJ16F70ypAOcQkQ6734MBI
	0gnHiG8rBSIy2U4NO5uZbRklLlu2MJxaIwPMbCFnRCcwDfSy9OpHkgGyeWMTQYH9tVEtdNMBHbt
	0mPetBv6XSOJ5wm7P/7pLqSVuQ4QpFH4srkg1s29T7dI5AJFVqwDjror93DDf4ZTPwMMWwkgu46
	NUhPh86pB6hxNo9DMHLouXaN4nia1u+36KMQlQxGhdD3ukMfRfUVUPBXWQ18HEiiKjOBqcdvpzJ
	kYX1NlPDqYsG+m+RkdevfEp0nRnnEb/iwCpPtL9amrxzKnKMocmVfUZDNXEa4pttYKxEvTYez9V
	pmTx4m0031XklbewpQ9/aP3iI=
X-Google-Smtp-Source: AGHT+IH23+5IVo9e0idwYIUwe3PDmADqY5Wj1NVqxEihLCMSC7w/YX8IRaI3PWa6azpmAgqxjp0Akg==
X-Received: by 2002:a05:6a20:939e:b0:350:7238:7e30 with SMTP id adf61e73a8af0-366e140589cmr2309295637.35.1765373142586;
        Wed, 10 Dec 2025 05:25:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm184283485ad.79.2025.12.10.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:25:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 18/43] hdf5: fix do_package failure when multilib enabled
Date: Wed, 10 Dec 2025 18:55:28 +0530
Message-ID: <20251210132530.306506-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
References: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122522

From: Changqing Li <changqing.li@windriver.com>

After upgrading hdf5 to 2.0.0, h5cc and h5hlcc will only be generated
when pkg-config is found. With current default config, it will not be
generated, remove related configs to fix do_package failure

| DEBUG: Executing shell function multilibscript_rename
| mv: cannot stat '/tmp/work/cortexa72-wrs-linux/hdf5/2.0.0/package/usr/bin/h5cc': No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 39ccbba725d3652e5691162a3b0302966a9247e7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 79ce8a018d..798ca1b83f 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
-inherit cmake siteinfo qemu multilib_header multilib_script
+inherit cmake siteinfo qemu multilib_header
 
 DEPENDS += "qemu-native zlib"
 
@@ -40,10 +40,6 @@ gen_emu:class-native = ""
 
 do_unpack[postfuncs] += "gen_emu"
 
-MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
-                     ${PN}:${bindir}/h5hlcc \
-"
-
 do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/src/libhdf5.settings
     sed -i -e 's|${WORKDIR}||g' ${B}/src/H5build_settings.c

