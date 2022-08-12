Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05E1C25B06
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 01:06:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.5663.1660266408968238957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 18:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pexKdTpa;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so6696785pjk.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 18:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zkZ/ok9AdKxcdl55Bcfg6QsJCBCgt+c8TVNYu6s4leQ=;
        b=pexKdTpaJ4YWfowQArj18IF+p5whVSaIqgigQvYuNICJn61RkrrEzJxS65Vjzm6+eg
         dhs9o4XkbS1IHpdGoMUtI8+YSr5TXl2REvPbdXvmKzp46JQkCmeBN9nooc7fsi9dJxmt
         YV48JX0eXZ7dRyykjya4NLxeR9I7f0VJgeNYc/NIcgMRwVses3GXogqYOdu87/Ev0QK1
         C8f1e8UH1hoYjQB+Jk6wMvR/j13DlZsPkjqtUNa+1Kf564jjrB8uo5ewuQ13whBRasNX
         mFbIYR/I5qSs6ZHVy1yGYz26CzmaI1SXyN17kaH4QQ7vL4KFgC7ZwEiUBa6QFcHScXEk
         h9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zkZ/ok9AdKxcdl55Bcfg6QsJCBCgt+c8TVNYu6s4leQ=;
        b=IAsoGvww2vFw4hDdSFqnwbHAMOWdtqNg4gwtuYk6pAhPDuoUVe6H9LMHURltuXaS1a
         g9xtALMBgZTMTP2/BvmG6hx6/JqbX/gi3EigwPbQYOEEHBU4nq8DBJa34KnFYQviVJEb
         b/U3/goV09H5SmQWkY+SzyBcknVsm0ZTkGxo0rN+NjUnyOrVZ9AfoPbmJnEcKPXB2uno
         T92BmT6SIq99GSZlsN8ZjjZhK5Zp4ZT2Tg/dQA49cxX6wiKhsmmmGC5Bk4Y1H/iSVpzu
         RYr/kII5UCcR+xnbI2gnWCQ8uxxr22Ui1HMPdaHfErCvhXNdvltvQdq4zCXoS66Csler
         37eA==
X-Gm-Message-State: ACgBeo2DN98vXyIbpVOLvf+dPXtvqTU3kob89r8GYMFGE/mhDKv5vhkX
	iNM9eZoF4xaZ7yG/yrUXlYxmvwgqxD4=
X-Google-Smtp-Source: 
 AA6agR6VH8nIomf0niLO0sNSMFUvgkfjoKkG7kSlbGreUbwOmBr4tJcO5m087RIFXh0glU3anAFTLw==
X-Received: by 2002:a17:902:d58b:b0:16d:c9ff:3c26 with SMTP id
 k11-20020a170902d58b00b0016dc9ff3c26mr1712226plh.10.1660266407717;
        Thu, 11 Aug 2022 18:06:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z13-20020a170902d54d00b0016d9d6d05f7sm282938plf.273.2022.08.11.18.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 18:06:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] openipmi: Enable largefile cflags
Date: Thu, 11 Aug 2022 18:06:45 -0700
Message-Id: <20220812010645.2318921-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 01:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98199

When largefile distro feature is enabled the relevant flags are needed
to be passed, otherwise large file support wont work, since we are cross
compiling and runtime checks will fail.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index 8625afaa74..eca5865f68 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -41,6 +41,8 @@ SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
                 --with-python='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
-- 
2.37.1


