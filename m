Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF8CE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 19:50:23 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.30270.1736365819374525570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 11:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSKmH0VI;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e46ebe19489so117808276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 11:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736365818; x=1736970618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLbNjUzLs0O7Nt+FCog7GB0A8VLckSBwO0NMfqfUA6A=;
        b=DSKmH0VIqjF8N7CcHJyf61rJSM1ZBdINiGmwgPX+n0JKHjkxfgEW4MR2kJ+SNKIJCq
         /mCt4Gmw6i5SoQZaQYZeNWOs/rTqh62HRUsZ02gyLjXvJFLTK/sx3C7+Idpws05Dp5wn
         4zPI3P3EWmb/SWe/QVawIayPLLp8Czehhyu4EgXAdmkQs7SvzATcm6iP1PkGrFAm8JsO
         Jwv2b2UyzHcnRTbepAtmF986LPBrTfV4BgfXU8YZ01KsFyrrDiFHP6ekknwOZT4Eq+Pu
         TzzA3v/biehoswuJjoonotkK/ouW/2OECKjpIQjprxpwgZYMht5pjbArmsWB2iRolbe7
         uxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736365818; x=1736970618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLbNjUzLs0O7Nt+FCog7GB0A8VLckSBwO0NMfqfUA6A=;
        b=naskKGnJG8IHyqYFh4X6GXc30yyXIaxw4g7w3O7hxFSF8HXSh1i02XnmXdtUsyu2g4
         QTaAd5NJwd6jPSAG7jZjNjyPaDB6KQ6YV+m4Z2cxkvXzEi19cDFlze9ZaJ7ZilS4fmtW
         EvQH8mXmk6wTtLcHHJowtDlStN/F4PNAjzSjWcGum89QadRYFCpb2oI4axBhSLhinvt0
         zG+SHJ9XzeJF8K+2s3EFhtwNjicojHaDnvVeVcdqFYdncm5FjeS5/99J6oVubm6dUyil
         ZnY7LC/CaRKxjXkptYPuUER35p1FCirqc4aeHxE5yvy5yPX8PlKfgvHgjyC+DIbZTrrJ
         6utw==
X-Gm-Message-State: AOJu0Yxjrj6A5P0vOfTmCe0aAtvK/yAGzq/S+snl1GRzEiZyprtYFKUB
	nBqEEyJDiwqpk30unJXeg1zaiO2UhLhTF9F0nhoPIH01AM8PcCPBWBse0qMF
X-Gm-Gg: ASbGncsX2mxO9WeSmjRmqJ1wv1cj+tDg7Bb9wdocqzrLp3XBPbZX+jPjrDTfd19/U9U
	vERwp3sQ3jy2KJWmLOKqPWVR1/fWc8VIHz+XS0iSirWcQ0Ej0QDpAfExcFA+6tico/3CyVI5Hza
	AJN3VELpJj37zNHzq5XWXCx8qsXCkdSsVd8l6MA1xNxVXGFbvjDtFRcngCZ3vjLHO5qFB6jCSvb
	zjvvSMqaW6Xf2maCUkFP+uSucux4BYd8T6pedpQQtAAVR33ZofUplJ7nqkmCCR0YmdZZzY+lsKu
	gkSF5CefmIyHN7Gtkw==
X-Google-Smtp-Source: AGHT+IGrbPMo67/6ECCONvFo5VmK6Or7E+xf9FLzZH1u+OxUNQJYAkN/fvdyii4Fl+IPiVGFCHvCuw==
X-Received: by 2002:a05:690c:9b0c:b0:6ef:4a57:fc89 with SMTP id 00721157ae682-6f53125e6e5mr31037207b3.19.1736365817950;
        Wed, 08 Jan 2025 11:50:17 -0800 (PST)
Received: from localhost.localdomain (71-208-27-252.ftmy.qwest.net. [71.208.27.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e74404e9sm93333927b3.34.2025.01.08.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:50:17 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.29.0 -> 1.30.0
Date: Wed,  8 Jan 2025 14:50:04 -0500
Message-ID: <20250108195004.20566-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 19:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114745

License-Update: Whitespace changes.

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.30.0

Features:

    Basic support for SIG RR record (RFC 2931 / RFC 2535) PR #773

Changes:

    Validation that DNS strings can only consist of printable ascii characters
    otherwise will trigger a parse failure. 75de16c and 40fb125
    Windows: use GetTickCount64() for a monotonic timer that does not wrap. 1dff8f6

Bugfixes:

    QueryCache: Fix issue where purging on server changes wasn't working. a6c8fe6
    Windows: Fix Y2K38 issue by creating our own ares_timeval_t datatype. PR #772
    Fix packaging issue affecting MacOS due to a missing header. 55afad6
    MacOS: Fix UBSAN warnings that are likely meaningless due to alignment issues
    in new MacOS config reader.
    Android: arm 32bit build failure due to missing symbol. d1722e6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.29.0.bb => c-ares_1.30.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.29.0.bb => c-ares_1.30.0.bb} (75%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb
similarity index 75%
rename from meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb
index 80a9a1b69..40dc5b09b 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb
@@ -3,11 +3,11 @@ SUMMARY = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "https://c-ares.org/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
-SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_29_0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v1.30.0/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "0b89fa425b825c4c7bc708494f374ae69340e4d1fdc64523bdbb2750bfc02ea7"
+SRC_URI[sha256sum] = "4fea312112021bcef081203b1ea020109842feb58cd8a36a3d3f7e0d8bc1138c"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


