Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12E1D3F09D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12597.1769685428930888238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ik8r0O0X;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso3565565e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685427; x=1770290227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNYCGv7JTRl4aknslKzPdB6EpHRpLAOuwu1K5YhP77o=;
        b=ik8r0O0XkbWnsXJ+5BLmDmqzlJ1h9LivZgpxR7TQGxKo045tgXKRq4DIC3mcHGykga
         5kzFZqUBsFNuLqUQeqS+t9ZU9Xo5kTHD6moDYcGH6hRn/MKh7GChePCQVuVhdkQGi5dH
         ZGkYNXLsZY1f+sEsJGWr9pjbEejf927DQZv042hm3jYOdNOtSGB9fQR6ZPW6Op2cl1Bk
         lt9PTMCzOgPzzGRYgJV4Q8thkiuIiwqfbdaMnLulvIr52I20xp8fdUvidMsVLSQEmcrj
         UknbFZMSiOiAHyARIYyJet026ey2hUQKeiwa1r3pouy4P4s09b58ZrfVn05CDQCDisgh
         QoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685427; x=1770290227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNYCGv7JTRl4aknslKzPdB6EpHRpLAOuwu1K5YhP77o=;
        b=QpbXW5FOx9EQAOdQHevgELj7GKwjARlaD65A+Xbx8OoYtXvu/vilHOLOTq1IwNzI1w
         w0h3EAd3ZlzUQA52az+Sdeun6OJZ4iAL1+WJKIIyuMBNUUCjfgehNQE2Lomn1C/77u/t
         wxIuysRplvG3g8t0GTW9PsAI8PCNITE+I/LEm6pqIO5cKkQ5r8xJqPxduQbt5gDfoYyG
         snlHkk7vak6hHhKEq3U7osxZfE4QNlblxuttfs7fFyCsBI/eh/EM8kZajn1uIsk3YMMZ
         Rb+tanuMdz+5wKMJhDbAe9yJ+dSkKomhuzioASkdUHqrTGdyDrhkWbyUiV9r88tytUlF
         oSOw==
X-Gm-Message-State: AOJu0YxLMSvrMTPoEZl/7/F7ByrWE4sE68oY+IwOfafah9ezqK43pg49
	3a4BwHqMk3WrBGfOCYMHd5XXV1ePJV0h3nJSQQTCHTyqIv11uh+sdT9SYB7LaQ==
X-Gm-Gg: AZuq6aJRgxI3V1uppwNTuUnIz9Ud9ndT5mxSpdCd3MtmnweUKMl37K2D4TK1Zhr4HrD
	KF2ST2Z9GuVQDpXRAiPPR9oky/iKJI3+O7YalpBgyAHfBl3mkZgKVJdSgFBRMGvjrGYVOSY6i0A
	o/CB8r3AWw/7wEfx0a5AAF88SB8lPBFrvsHcXWj0I1gXvwu/3pbbTqLOA7+I99o92YejbVlFZLS
	wIBZsarSjxztVkKhK5OrM1Yt87pK/biNM//xzW8wSptZ4eiTMyNpifaixNJZcGaX1nUCofw1zvP
	h0SnxFYQ7tq7ot4F56IJ4R1Re9NJpC1vVhK1idXIzVRpQZXc0RCOIk0Z0zXebawND/pzCEMxYhu
	Pk6LgqfVzlhpCkFb9V+Vbi3OIBy0fIsIFMmLsqEZeegjcW55Kvb/v37MEHWZ/EBR1Ix+bDGquhn
	FJRqQ+pK0p
X-Received: by 2002:a05:600c:3113:b0:480:1c75:407c with SMTP id 5b1f17b1804b1-48069bfaaf6mr105235075e9.2.1769685427086;
        Thu, 29 Jan 2026 03:17:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] fio: upgrade 3.39 -> 3.41
Date: Thu, 29 Jan 2026 12:17:00 +0100
Message-ID: <20260129111706.903623-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123987

Changelog:
3.41:
- engines/io_uring: remove unnecessary SQ full check
- io_uring: ensure accurate real_file_size setup for full device access with PI enabled
- Fix: parse.c opt_len() to use minimal distance to delimiter to determine option length
- io_u: fix offset calculation in randtrimwrite
- engines/http: fix file name
- engines/http: Add S3 security token support
- io_u: get io_u from io_u_freelist when TD_FSYNCING
- io_uring CQ reap cleanup
- Add 'filetype' option
- handle out-of-order write completions in verify state (Issue #1950)
- engines/http: Add support for range reads
- Makefile: fix man and share install paths on MacOS
- Sprandom
- Fix mandoc warnings
- fio: fix formats under MIPS64/PPC
- sprandom: Fix several issues found in the sprandom implementation
- t/verify-state.c fixes/improvements

3.40:
- t/read-to-pipe-async: fix -DNDEBUG support
- docs: update docs for verify_mode=compare of io_uring_cmd
- dfs: fix fail to load dfs engine
- Fix spelling error in IO uring engine.
- Fix hang on Windows when multiple --client args are present
- Add important info about http_host and file formatting to s3 example
- oslib: blkzoned: add missing blkzoned_move_zone_wp() stub

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.39.bb => fio_3.41.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.39.bb => fio_3.41.bb} (93%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.41.bb
similarity index 93%
rename from meta-oe/recipes-benchmark/fio/fio_3.39.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.41.bb
index 2ca52aaecf..494a4eb3d7 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.41.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
-SRCREV = "a6e474c9e896e4ba1eb40066a03402afb040710a"
+SRC_URI = "git://git.kernel.dk/fio.git;branch=master;tag=${BP}"
+SRCREV = "ed675d3477a70a42d2e757b713f6c7125a27cdca"
 
 SRC_URI += "file://CVE-2025-10823.patch"
 

