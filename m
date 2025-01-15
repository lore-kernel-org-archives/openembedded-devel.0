Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99226C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 19:07:45 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.30141.1736968056543357484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 11:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WLNQKf1L;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e573136107bso170943276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 11:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736968055; x=1737572855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khXXeVkr8LkiX+CG+ts0hfTvs+kPeZN024zcITkk3MU=;
        b=WLNQKf1LdfFes/cRqKgxWPInnJaaeybfaVxYEDi/0939USuKZaP6I8aAJJMCXOelAr
         5/PS2IEA/htpcKPEHFznALPssJABOzAhACjHZJQ7xayn2mG2tmRoqFonYDeuufSfanVJ
         NGhh8RebfLfrcMCYB2KA3reVJ5tcCKv57z74A7Eh3g8EIs9HgXIAgOw3B+G3cPkkjDvH
         6XM2w3Q4czXzdIALJUzX6BAXVv4uXcic0TZEFClSeTK0Ss8CWFnfjriFrTDc8MO8WGUx
         Qv+/+501gBNVzYGKVKqX7nJhSZzSUw5C2S2kdFLcB85Q+jxZmGKlRE2Gb5GHX3pjwB17
         3tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968055; x=1737572855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khXXeVkr8LkiX+CG+ts0hfTvs+kPeZN024zcITkk3MU=;
        b=VKvLU/BBnbZYv6NS6Xr9zaB49PSF94oPy/x0LquotE+noahTuX1n8Kp3KPBBgaT228
         znUg88Qd/yrmIkbzFK3BZyUGR9C4gFVx2VvmlyVApSCsF3rPZAAuDUD/zzvXOXeFWQws
         dys5ZH0EhGdBMLvfbrNmtTO4Dk7O6dN0d9djn+kjLhk6LWXVMtN3WSqDc3YZlYJ9I6Sf
         pcJJNSMkJkmYEQMt6/t7JOhJ6nPDYp47iBaH7WvIant6B12fJ7FqF5dE0wEezgqser+h
         T6kM76H3I1yDcgLCCKxgYx9K8IN8Hji2+AaPjt4VvvsOaq7Q+nyCd0ET/9E4ogXvgCKH
         bY9w==
X-Gm-Message-State: AOJu0YxdM29S+YL4JMAXGODmCzdoQYXnMms99yP2joYVP0O7b6U3sLVu
	bf9CWVYwRGggwDe8I14OfWwdGtH4GqOCz7Sd8q8SNinTL9u/pYrNaSxjbS9I
X-Gm-Gg: ASbGncuM/sOivzY0M1hyjwu7y3ej0sVt5U6DYH2y4vdJ/F6dhPKtLxwqHz2pGOLqe8z
	3zzEDZf+DoQtmmMzlw02BwPq6Zvno+yEjfHCyd5cju+0H2n7fbH04MOy9gvEocz9xJUfis8JHd/
	TdVDVdYF2GZseFzK6A0NOT2owT1eO/FodZTmqVrSNMufG/ksn97uEW7YpwMw45TkFz3JdDatosn
	zQSFqAJojkHN6r6UXDyFJyrKl8fgM3Cj8Z88i9VFjO0SnUd90cC4SrsVQl3sCR4I+6Mu+b70/np
	3ydwfJKFBPQ9ieY=
X-Google-Smtp-Source: AGHT+IGpfr/6811DvIm6rZoU03ZpDaLZTYBiC40b++kat75Dq6vWJTXdv8c0710Fe8Gr3Bt5TkEUgg==
X-Received: by 2002:a05:690c:62ca:b0:6ef:7d51:eba6 with SMTP id 00721157ae682-6f5312a8384mr242959277b3.28.1736968054883;
        Wed, 15 Jan 2025 11:07:34 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546dd7074sm26278917b3.80.2025.01.15.11.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:07:34 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.31.0 -> 1.32.0
Date: Wed, 15 Jan 2025 14:07:24 -0500
Message-ID: <20250115190724.34354-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 19:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114903

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.32.0

Features:

    Add support for DNS 0x20 to help prevent cache poisoning attacks, enabled
    by specifying ARES_FLAG_DNS0x20. Disabled by default. PR #800
    Rework query timeout logic to automatically adjust timeouts based on network
    conditions. The timeout specified now is only used as a hint until there
    is enough history to calculate a more valid timeout. PR #794

Changes:

    DNS RR TXT strings should not be automatically concatenated as there are use
    cases outside of RFC 7208. In order to maintain ABI compliance, the ability
    to retrieve TXT strings concatenated is retained as well as a new API to
    retrieve the individual strings. This restores behavior from c-ares 1.20.0.
    PR #801
    Clean up header inclusion logic to make hacking on code easier. PR #797
    GCC/Clang: Enable even more strict warnings to catch more coding flaws. 253bdee
    MSVC: Enable /W4 warning level. PR #792

Bugfixes:

    Tests: Fix thread race condition in test cases for EventThread. PR #803
    Windows: Fix building with UNICODE. PR #802
    Thread Saftey: ares_timeout() was missing lock. 74a64e4
    Fix building with DJGPP (32bit protected mode DOS). PR #789

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.31.0.bb => c-ares_1.32.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.31.0.bb => c-ares_1.32.0.bb} (83%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb
similarity index 83%
rename from meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb
index 98f6dbb63..acabe49d6 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
-SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v1.31.0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "0167a33dba96ca8de29f3f598b1e6cabe531799269fd63d0153aa0e6f5efeabd"
+SRC_URI[sha256sum] = "5ab3fad06edb98fe8081febe1e41a027cfa3199fc525a59c851376414fe24c5b"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


