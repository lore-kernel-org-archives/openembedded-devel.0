Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE80C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 02:16:09 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.41191.1744596962625742737
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 19:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dG0UAUwb;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fda22908d9so27048797b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 19:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744596961; x=1745201761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLekrH71ppTfb7BgOFWbRq+O5lGb0VGzA48iRxv31SY=;
        b=dG0UAUwbFLAFQH7aLozKFFrsRXsN63C89lXJ9BtdNyAwajy38+9/16MkOQ8NkCejmc
         VpUWSQ/iqvGa5BRvbfvI+91P9aHBi3WSpVUyQ4EVSRE9FlQhgutH5fZC95kDXzR9VuRQ
         Tw+UPGl8tm9//ec8+vRquPsI2UPOTzbwaTaeuuv6BQyz/K67ib1odGKO7cHq4fTnVDC6
         JAdcmg2rL1zxxA0+IbvWI6+1MfXalTcimGIDqC6G7pMoXKoDi7zh+cX8VyhJ3XX0z87m
         Hg27fLYdFIN2qwso7xbruH4dxc99cu9uxEVPIO38H/6Q7omsC6c0cJoY49MEsvgSF6PQ
         VP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744596961; x=1745201761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLekrH71ppTfb7BgOFWbRq+O5lGb0VGzA48iRxv31SY=;
        b=AEq12jBu1o+nc/iOYzsAdlcVGKmmqsdr4ZRW3h32G1qHKTlsm0GRpwjKxM8A39jhHJ
         2v5Ex4m8z08ck5Vms7OrwHdBHjLZN9IpJXS7ESTBYCTr6vsUTpxPqsDlIi6Pk5I+LPwn
         gKaZl1+iUoBXUkbMNfMt/EYRlSu4iY+vBCrHmsmlJt4veSe+mZp7zJD4LKP9S3FJn2Ki
         3ftcZTMb7EWPbIyNW7tE/vgtDqAaTfgQIsXOrWWpzu6ni/0rO8Aew0MtWySErTjdYRhl
         BqjsfOKGf0eIxynDaNNV2Z8JDFg81XJZ6uUb5LsgAZ/24HXagCLPfKQOMcWx3pwZ6kS4
         PdLQ==
X-Gm-Message-State: AOJu0YykT4xfC7Wci7RawEmWvZjpLxfGAORZ8jTN8GSUESSndf1qcP2l
	ar7SHzck63f0/MTZ0GB6kROm1InvFfzV7YzDlO1jBLmxZ6b8iQxX8sQy61AF
X-Gm-Gg: ASbGncvDBlqT0rGiL6AuN4gJw8LMKdh6v30DBO1GTVX1AQ30bWd9MCvIOpdskFsZyAV
	lZnbximzJuCA0KwZbewM96UEKeTcXmcmndPhXZcDvE26js6A+d/8ktQjpGd6x3rAYONZowzyEW1
	BkMHGduDx0QW9gjoi7nmLJ0Z1wSf8wV6S1b4oGxG9XZN5j256B2ULEyGVOCurGABtSKSMeSnEWw
	lZxCk+5EvQsotKeoFSHn1tv9+D1w7yKPC+c+BMOAs5UjtSliuiRvyi+BqsHrgLOhKRuN0CGmbuE
	dquTPKT6ogRUBd09PH5alEKFkiw6fZEXRmKNeyGiuz1QnQ==
X-Google-Smtp-Source: AGHT+IF3WcSCZUWUEC/u3tJ0qwMbClBgmSQMFK3yAFR9fpulvHZspn/R2LEkYmXxmqq5cy3Zm/PUkQ==
X-Received: by 2002:a05:690c:6809:b0:6fd:a226:fb6c with SMTP id 00721157ae682-705599e2686mr187222927b3.17.1744596961104;
        Sun, 13 Apr 2025 19:16:01 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e11a44dsm28140567b3.33.2025.04.13.19.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 19:16:00 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.2 -> 1.34.3
Date: Sun, 13 Apr 2025 22:15:43 -0400
Message-ID: <20250414021543.10067-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 02:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116839

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.3

Changes:

    Build the release package in an automated way so we can provide provenance as per SLSA3. PR #906

Bugfixes:

    Some upstream servers are non-compliant with EDNS options, resend queries without EDNS. Issue #911
    Android: <=7 needs sys/system_properties.h a70637c
    Android: CMake needs -D_GNU_SOURCE and others. PR #915
    TSAN warns on missing lock, but lock isn't actually necessary. PR #915
    ares_getaddrinfo() for AF_UNSPEC should retry IPv4 if only IPv6 is received. 765d558
    ares_send() shouldn't return ARES_EBADRESP, its ARES_EBADQUERY. 91519e7
    Fix typos in man pages. PR #905

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.2.bb => c-ares_1.34.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.2.bb => c-ares_1.34.3.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
index 21a0e37e6c..c02bdbcc5c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a"
+SRC_URI[sha256sum] = "26e1f7771da23e42a18fdf1e58912a396629e53a2ac71b130af93bbcfb90adbe"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


