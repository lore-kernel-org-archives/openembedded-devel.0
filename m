Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8FBC3525B
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2476.1649801000448394960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iR2q10WU;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d15so225618pll.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NW/2CIBreGlzvdGWyXz9X6F5DfpJ2N+wigkjA9T4Sqw=;
        b=iR2q10WUqz+4gAkzFG91I87KRd0SVmDDR1dbvfggm7ndp+4ZEnkBJbhcR2YVkdQL9m
         i+635rlJ6FxFnCrtt0RvZPSsGefPtUA6OfNnkqnnnh/y0hLMTAf/GPFN3mcBhHeKEqcM
         eaSTcphFGCcAfwJAPQJI0rOC0+O0bTxNQNatoWr/vWXvmB1qosAkCxjndEApNcLfBz1W
         Vygt497j1JJThBMconesP3fA4zV8cdGQV053QDlbQQY5+kug2He8EDLAs5TKAJuo8Wmx
         /yQYJEtAA62JpTyy6ld4k5dGwcSxho1LfuJTJZTpC31TudHGVafX4tGXpVeI1tuXNLI9
         ZpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NW/2CIBreGlzvdGWyXz9X6F5DfpJ2N+wigkjA9T4Sqw=;
        b=Q5enA+Ugo11tQV4eemH7Sdeh4GoQ/jDOWBbJjtB2z/Vwo0VuqSkfUqXWHw+hleb7C9
         6VoB4E67fNrKlbaOmqVIGsQyT6gS5ch9BYkRp6uSoGhYgKhuS7TK3lce3xHViA6sWJnr
         EeGhmVdJfIe/0S4+wH/2u7G/GkJFBw2WY+z2hu+L+fUX/YkHdrc59OrMQOvcbjyXCYrW
         +MNqKjQHo5COV9icdgy5vYQo6uXG7FcmadU9zix3qMDJ3OOoP54QrCxLmpuhBHa5uJpd
         lJcUobxKd5drJwrZopmV5eZGBtt7UCEBBi/1pWKEEVuknQtWqwXa2yVu707dBJXzSswH
         AaBg==
X-Gm-Message-State: AOAM533UiOfshTlzBfozFU9ftN7EgaFS/3ERhB8W/3UybhzDewuMLwyE
	pdilIPTarIqVSxdJ3wt6LIC1jqw7sfj/vQ==
X-Google-Smtp-Source: 
 ABdhPJy6NF7AXGTK4pK5ec1sa0yjOWWKzoKZskcfCnYAOnlZ8kGlD/hBEwuwFCPtDD7UFl+DP9nr1A==
X-Received: by 2002:a17:902:cccf:b0:156:31a:736e with SMTP id
 z15-20020a170902cccf00b00156031a736emr39369530ple.76.1649800999734;
        Tue, 12 Apr 2022 15:03:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] libpfm4: Remove -Werror from compiler flags
Date: Tue, 12 Apr 2022 15:03:11 -0700
Message-Id: <20220412220316.3876985-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96595

Newer versions of compilers get stricter and add new diagnostics which
cause build failures that upstream should address not distros

Fixes
| In function 'perf_table_alloc_umask',
|     inlined from 'gen_tracepoint_table' at pfmlib_perf_event_pmu.c:434:10:
| pfmlib_perf_event_pmu.c:304:47: error: pointer may be used after 'realloc' [-Werror=use-after-free]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
index e476370e05..d2d2512b2c 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedba
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 
-EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
+EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\" DBG='-g -Wall -Wextra -Wno-unused-parameter'"
 EXTRA_OEMAKE:append:powerpc = " ARCH=\"powerpc\""
 EXTRA_OEMAKE:append:powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
 EXTRA_OEMAKE:append:powerpc64le = " ARCH=\"powerpc\" BITMODE=\"64\""
-- 
2.35.1


