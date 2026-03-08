Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DAF55130
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 04:27:13 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23308.1772944028047197455
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 20:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bs3rJlwA;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64aedd812baso9408726d50.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 20:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772944027; x=1773548827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQKQnvg93mDS1Ndr1XgG1y1tmosocdKfy3r9MyVDMII=;
        b=bs3rJlwAv8Cy1AEjfnkvZQMnZ2HFLf9fhjCTAbjRqsrkwQMFhq3WYN0h7X3C/3q73s
         iHZHDCSWu3STbrW4BGidQrpyMH2Am5RRaOmY94GdotEh76BLmZFYT66F+5gB95UsGHQX
         XZ+W2xYFworbPOmPfuB/0yBapEv58liA7sOpSwzOkd23ve74neLeyknd79Wv/lVhq9UW
         CqZyUAMBYOMblO/LeAxcUcB0v8MI7XZgFaOCZKWaowgJuj1A8UiufhjgBXY0yN3Iqz4a
         h5EWAo3RXhuknhVNbqWl8cnvWKImxKGEcWC3hpi5a24fPcKGT0DZwmD5YA/BXzvasE8e
         LsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772944027; x=1773548827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQKQnvg93mDS1Ndr1XgG1y1tmosocdKfy3r9MyVDMII=;
        b=tiLN+CwlEoSX61y50VoJulrPMGsza0s31RC9lcHX7cYGsRkzN7Y09kUuTPkZjah9xh
         HeeTfiFLtT031o2SKK5DJf40dE0hXd/pPIl7oKCbesbuoPwUsPuvWIX98VDpOyubP+r0
         3lcxkn/nDxO32ENLanhyieyXtIWL9f6oNRH/257IKVgTaDw7xmaSPMHP0a0XxjASwGCN
         9p6rgzIWD5SV3xvfpIfgIR1uTWfj/VG88NdqxL7i21NZ4X80djjuMIPmgqbVvEd33c0P
         X6gm4zxaLQ85BWMHWmFvkzxvpiYHWwFj0S8U48nSx/mqeTzV3ubZGL8mLpxi4Ip+sXst
         MFYQ==
X-Gm-Message-State: AOJu0YzhybNoOP3XHP0IUPE05e8YDs6ktzNZgc7Mn6VKRM9mRc3eNm9F
	Y2ElEEMl37bI3gMZaazx6y9K2ZmFGTy/nOKk9kOZBAYu2lfuScxa1TgqBUWA4ykH
X-Gm-Gg: ATEYQzw1aAAUwctOIJXuS16dWogtD6QgNFS2UOXdiMNRX6SNcs13Z2YHY9GgX8dwGQJ
	xs/C/hpaDbbmxt/xIoOnNyFE8Ms3FQJf1V0OpMIMJ6DtbKuWMfN//0/puFn7ApI9DrrBjHsjwuP
	NcxGOxVwCEx/dkHiXYeNeI1U9OBoTCjvn0oflofVENzxbS7apTLySCsGD8Io2KbG1E4VdY8zy+j
	XFr5HDiN0+dHDudSfSo71ujEB+oolLEKcw/zLO8Dzf4N5X8OibWFM/SALQ/O0US4OAkhoHoqot9
	RDfQpgK0S4VQUQcoUi4e7R+NbfSbEynrWPVsuyvzYAFMXX70P41QVaCCd7YoBUXokuMHlaQBVhH
	BiVEr8eJZnvz/kUlIuTJ97aRewwLj3Xlk2JfkDmAa4/fUOKo6My1rOOT/CwP6Zqm6u/Vy5fQSsA
	t6fztkRaZVzdgvH18Wy/lexO1QhPrGT3+hpYt5ygx7Tp1odoksn3mWwdXHNwHxW7omJ//AyqDWb
	3487J4N1qpWwcfsK5QNBJWeoKqDx0hMPfM0gRmDqYiVdtNN+Y0=
X-Received: by 2002:a05:690e:e0c:b0:64c:adfd:209d with SMTP id 956f58d0204a3-64d141a84d8mr5742768d50.35.1772944026646;
        Sat, 07 Mar 2026 20:27:06 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176c59dbsm2943681d50.11.2026.03.07.20.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 20:27:06 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.22.0 -> 22.22.1
Date: Sat,  7 Mar 2026 23:26:50 -0500
Message-ID: <20260308042650.20821-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 04:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124934

License Update: Add sorttable.js under the MIT license - https://github.com/nodejs/node/pull/61348/files
  Update minimatch to the Blue Oak Model License - https://github.com/nodejs/node/commit/e72da8c7544727f90b857ba86b8c7755e631fe96

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.22.0.bb => nodejs_22.22.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.0.bb => nodejs_22.22.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
index d08c5d8318..09d6b896b2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1fdf4f79da4006c3b5183fddc768f1c8"
+LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0 & BlueOak-1.0.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b195f4ea4368177a2fd84b879f09cba8"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -42,7 +42,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683"
+SRC_URI[sha256sum] = "87104b07e7acee748bcc5391e1bc69cf3571caa0fdfb8b1d6b5fd3f9599b7849"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


