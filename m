Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4FBD5B169
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 20:18:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12631.1765657106059495470
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 12:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nL0s4+Gw;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1411643f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765657104; x=1766261904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asDXPRAz/zE/sREpdcB0VQd3JxprpoO/1+hWEyGmcnI=;
        b=nL0s4+GwKMDRps720eePgq/s87hmjvjRudWigbaksQq+gD2V5xQJruibUkUm7WoCnP
         DoNZyM+T7HKmaExQJFt37XP/V2EYuH0bjdwAUc/KkM1RmFnSStT3O3hlVXkDh42l4AqT
         E9zXFJjx1VpeGOLftIzX3G+ED0gx1X/GapVwuIg3K8FK8gS0iL6vqjnDNr5LrhSD9JRP
         kNnU7tUIMAUV5Sx8nky+1KM+6KDMZRf62rCsrevp0utWK9f3oss6np686EkgQ5TA6peT
         GMh2XDnigPo8dXdcoTISvB9AXCIeiry+4cPnTW1mXzt/3fHJb4JcGf085Ksbg484MSoO
         I3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765657104; x=1766261904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asDXPRAz/zE/sREpdcB0VQd3JxprpoO/1+hWEyGmcnI=;
        b=KoNxVAl8z1BUOgu2xTJHGxlJMImkjtTURWdZvOefDzyeD2xVQBmHfnbldgn1MWydcE
         fhIx7mG/TxaRYIgrdrrudIQWvkZ43Cg+Xo26AVNpChNvVs8M94kUFyf4cu02CyvXY927
         oMLBihJv+1DGEiArL/VJHc4MixTXzp0JBDxukP56qgwPT8oaByA9rmpsuo/iBrYW8qXo
         nGntGQwditerT9x3LfZZWr8ARvHdcGvwFflJ+FH805s0ULD+kDufeJ1OxnD4OtT0jNAw
         DoaakrzLDUHsceLkjmFFOguTYrLT5HcpCRG8+XLuemsRnqRFetthHHhIiSw839LEDpZ+
         Nzwg==
X-Gm-Message-State: AOJu0YysFko+afA99+w+E5HOFCbfzELTyqYjnvuZ3V0S4zkB8mAvsHnr
	T8hK+ueOlztMfI1HqnDTSwkuT8vNLPMJwbywenafV1PPN2CyAUr4ZsMUAFhjZA==
X-Gm-Gg: AY/fxX7JDak4oBT4lAE/8u8fdHZhEI0l2qQaSyXfuEYs7nTzH/lzo097X0gra547XKE
	+Fs6mvdLTaGYIW5dqXbpn8X6NJTSoEShhf61y5KGWIppVEEacWlq14Bxh5DxDIOH/XBIck/ax5U
	dnSx03jPxrtEuIEemZmfNJEX0nHq3L+CVVRZ7r//R9kMLl2oSJnMx0UHKzt82QVE3ipPOwdHFwL
	k5fcQTYnOCoLZDkG0NZNhnGCYaZ38QXPFuSPaWH5eFSTAXdydVATXlz4+J5mtKQUHNDqh7lUQL1
	vTRhNIo4/esHgVF9jnbTu5jFtI/E22Q/pW1ACZF5X5zKu5LJh7JcF+uWy0Qm8q2hDAcfVL/GFdH
	pQLM3Pcp+DWo6tNU25V7LjF6nVRGo/dK3MLmbUKGR8So/NmMKA6HuM4x9aGue8Q089azfS22bL4
	QQgBx3iIYS
X-Google-Smtp-Source: AGHT+IFxEcKwIBCz3uOs8XjRmHrJpkn/d22eW4sbDZOPEZyJuv9YeAk4Yh0VUeFytaR+GaOQfNGdNQ==
X-Received: by 2002:a05:6000:4285:b0:429:b8e2:1064 with SMTP id ffacd0b85a97d-42fb490f769mr7018585f8f.47.1765657104263;
        Sat, 13 Dec 2025 12:18:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm4309160f8f.38.2025.12.13.12.18.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:18:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] gosu: set SRCREV_FORMAT variable
Date: Sat, 13 Dec 2025 21:18:20 +0100
Message-ID: <20251213201820.3214133-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213201820.3214133-1-skandigraun@gmail.com>
References: <20251213201820.3214133-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 20:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122645

The recipe fetches from multiple repositories, however the SRCREV_FORMAT
variable wasn't set. Due to this the recipe couldn't reuse sstate artifacts from
a mirror, only threw warnings:

WARNING: gosu-1.14-r0 do_package_qa_setscene: ExpansionError('SRCPV',
  '${@bb.fetch2.get_srcrev(d)}', FetchError('The SRCREV_FORMAT variable
  must be set when multiple SCMs are used.\nThe SCMs are:
  git://github.com/tianon/gosu.git;branch=master;protocol=https
  git://github.com/opencontainers/runc;name=runc;branch=main;protocol=https', None))
WARNING: Setscene task (/cocto/kirkstone-next/meta-openembedded/meta-oe/recipes-support/
  gosu/gosu_1.14.bb:do_package_qa_setscene) failed with exit code '1' - real task
  will be run instead

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/gosu/gosu_1.14.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.14.bb b/meta-oe/recipes-support/gosu/gosu_1.14.bb
index 624adf3099..f354f67194 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.14.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.14.bb
@@ -5,13 +5,15 @@ LICENSE = "Apache-2.0 "
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 GO_IMPORT = "github.com/tianon/gosu"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;name=core \
            git://github.com/opencontainers/runc;name=runc;destsuffix=${S}/src/github.com/opencontainers/runc;branch=main;protocol=https \
 "
-SRCREV = "9f7cd138a1ebc0684d43ef6046bf723978e8741f"
+SRCREV_core = "9f7cd138a1ebc0684d43ef6046bf723978e8741f"
 SRCREV_runc = "d7f7b22a85a2387557bdcda125710c2506f8d5c5"
 inherit go
 
+SRCREV_FORMAT = "core"
+
 do_compile:prepend() {
     # New Go versions has Go modules support enabled by default
     export GO111MODULE=off

