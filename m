Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27076C7EE45
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.11444.1685531595251556044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nK2EDfTV;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-568af2f6454so23650477b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531594; x=1688123594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf0IS7ZBhEnYmStv6QVogl6inV+KMG0Vshu4zrPiXx0=;
        b=nK2EDfTVJD6F901gw9TthLlgz4uwxpQb9ladH/UBvegt+4Db6+wDBGkFHOZH272qza
         NyK1snHYqLMEtyda+AAg4k1jZ1OePsIDeKCn6h9cJkPpQ5cw4QYBmZx6bWSo+ft/cQ/4
         DgTCMAeQZimZz3AJRXlq3A+LxHrJ1CXULcdlkDb5aN67ye90z/TMHtKKKEjfnnhya8i2
         JbadBqpP5zh0/z/pX9YaIo/LNBRq/B6Q09ndDTP0HcRIsOLDL2jcHLJ4Ld3erh4BMVb9
         eroLfnPE2NWrsfsI0R7oJ8LxxePPoceONvdNKACe01RNWw9D8z2szwBHlUKHaaFh15ge
         eMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531594; x=1688123594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf0IS7ZBhEnYmStv6QVogl6inV+KMG0Vshu4zrPiXx0=;
        b=VSqRZSvEBmpCV/hxCbrnGa7McyHbhYs0deGqpfflXdxniszi2UKohIGRy/v8eGLhvD
         1YeXQt0Kvw+0JqdcWhHeDCHL26nyHgxlmabZBVv9w5oJfZoJh9TxLx0nAJccfnxoecMk
         5FsKqHT9xq74kHC5AHGEN8TVoZnfhgKobxPezMlIlLJSJla/e2Eoz9ItRuTyvBzHVoIg
         cm/y9uGHxGpP/8KO4G+DlbHcgyBEk0vi1O0dTqdsB7sEf6+HagWlqsJk2NVMgesFvN1/
         5sec+wCs7kQJqu1VRSu88H07eeIE9psMN2cMU3yABg469sMP+LTwM87qss8GTlJA1vxi
         o7rw==
X-Gm-Message-State: AC+VfDz53b3Nnjvl637e0SCX4zAuqMiPVm7bH9X4Vka/y83Vvy7p02dI
	npA4fkQ7gfN3yoYbInvwCMZnLSrnhR0=
X-Google-Smtp-Source: ACHHUZ5AkvfG+x/dj4SKM7JxzJSjXMAlmoM3+WH4+lRLRM/j2UYu/Jd5D/becAM7AMGkfGCtBRCArg==
X-Received: by 2002:a81:6b08:0:b0:564:e951:a7cc with SMTP id g8-20020a816b08000000b00564e951a7ccmr5791194ywc.45.1685531594157;
        Wed, 31 May 2023 04:13:14 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 05/36] fftw: Remove hardcoded sysroot into binaries
Date: Wed, 31 May 2023 07:12:38 -0400
Message-Id: <20230531111309.2454603-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103034

From: Khem Raj <raj.khem@gmail.com>

FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
in OE containes --syroot compiler option which encodes buildpaths into
binary, therefore remove this option from FFTW_CC in config.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ef03326d31360abdfa3e4a34eb00b328a76de12c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index cb45e2b91f..1fead4d029 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -55,6 +55,7 @@ do_configure() {
 do_compile() {
     for lib in fftw fftwl fftwf; do
         cd ${WORKDIR}/build-$lib
+        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
         autotools_do_compile
     done
 }
-- 
2.25.1


