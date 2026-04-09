Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DACFEA3C51
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129549.1775733748695707876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lR+iwN5D;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82d03827316so355392b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733748; x=1776338548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z0x8yNmeR6ktb2X4EuzKfg0riD1hi7p/c9EuKxfNWA=;
        b=lR+iwN5DmHwoom/uDOb0GdPRnFL4zXF9QoToXVtzTLQfb7aqiAQPAcTmRXcRQdIJC7
         KVjbE6RAmJENhIwLw63LP2zPfQ4E+dgZ97vYnyNqJrcjiBq50CmSkmStnPf7LMGNx3Dp
         xDhftLS1Qds6qR+2HRwlovhiV7x6UAGEXeWOwICCaoQMeailW9oKBQe/3CkULebGSl8y
         dLgwSkUyNHccli9PeLwHa6rBiVoZ7pA4CDSoQ0dotSYLN2bwG5U/xbmI9C3mPh4MSNKL
         HhBgLZd8SvFbBU5JRAnr/b8q0P/0slCS7T8mrPWqWFMl62WU4McwqHJ2nW0i5thpya9x
         cxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733748; x=1776338548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9z0x8yNmeR6ktb2X4EuzKfg0riD1hi7p/c9EuKxfNWA=;
        b=fU1hBLhutnkcsbTw0CxTRADLVL8CB4jvspcURUA7hfoy/9/GzmPbhmPq1+SuVlelbI
         aY7PmIQ8sZdcOxBdQ8heMis4LYONJ/3aVPfgrBxz+ZoaNX/E1HGYzlYOTmCJ1kSJX/mG
         4A1IB/NYsERemRVPOTG6SoiNnDlEBokVeQuXXqmTF152CI+RFWTxh3tbbqxYsZlV6o3L
         34QlPwyIjZc+F3nFHxi0+Kq29suohnQR9/intzYTcrqbbDYg5x1dce8Q4ZLzMSotgLGO
         im94GmTCY6eJ6sEpyylGRmUtR/rsQ1aHOnfo+6Hfavi52PNzs7Wc3+KczZbbV/NZjcgW
         iXZg==
X-Gm-Message-State: AOJu0YzbwFmEpbUlj6k7grYYQihIXXikXnBaCEw37ljENSHR2i5zNutK
	PgJL8K5Zv7dSEWfPW9EpcdWONdmRB2/a2cYXNbiDd6Jq3DFyXmRFAnqzs4qzXOoH
X-Gm-Gg: AeBDieuNEBodjlhlBbv6eu+1TTEDmpm6y1KbetmitZtIpQPWByD3QjBsHibEGTP2Syw
	3L1x7CH3stM+ZkjpRrFU92GITn6GvskUk/PevBI0ClhUL7DjTDM3gEV+sHa/yxEdsdVO8Sl3mdt
	F+RYJKKbwODqdlU4w4WXoA9JRgGRtspL/jkuA2aPryZ1qiyp/MSZRbUQAPN6m0UaAwTXlic6CF6
	X0DdD8O1iOXcrEnWExQg+eYHiKsn86eNjkrlF90KEkkoiO8sU0HIxR1r1h8jIDN+9pYvCrM+JaI
	yfE7+6Q99BV/0zbtxii4DK2mDIZakkxQRtbnkLvfbEoa2JL/ws4vh0wj2UKq9ZkHqbBksmCPKQu
	LpddVtKUjT2Wi3V6BAD3bFS0zo0Z2cIaQgGqKU7Pw08N1xYQXNgNJqDxdQZNiBojFITfBROqoYC
	OKw/+CGbl7SIRH2558WG9D6vxL+hzREa5XRCE=
X-Received: by 2002:a05:6a00:4615:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82dd8b1bb87mr2991075b3a.20.1775733747870;
        Thu, 09 Apr 2026 04:22:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/8] nodejs: upgrade 20.20.0 -> 20.20.2
Date: Thu,  9 Apr 2026 23:22:04 +1200
Message-ID: <20260409112208.1119823-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126191

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License Update: Update minimatch to the Blue Oak Model License[1]

nodejs LTS releases containing security and bugfixes.

https://nodejs.org/en/blog/release/v20.20.1
https://nodejs.org/en/blog/release/v20.20.2

[1] https://github.com/nodejs/node/commit/f0ef221b0d458d9358c6e6e49094da475e86c229

Ptests passed:

root@qemux86:~# ptest-runner nodejs
START: ptest-runner
2026-04-09T10:37
BEGIN: /usr/lib/nodejs/ptest
Running main() from /usr/src/debug/nodejs/20.20.2/deps/googletest/src/gtest_main.cc
[==========] Running 152 tests from 23 test suites.
[----------] Global test environment set-up.
...
...
[----------] Global test environment tear-down
[==========] 152 tests from 23 test suites ran. (30533 ms total)
[  PASSED  ] 152 tests.
PASS: nodejs
DURATION: 31
END: /usr/lib/nodejs/ptest
2026-04-09T10:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nodejs/{nodejs_20.20.0.bb => nodejs_20.20.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.20.0.bb => nodejs_20.20.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
index 5882319804..aa6189da60 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ac91fab5dbaf757274d2b29888f943ef"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8b1791ae7a2ae99e12e2caf6218c890"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "5294d9d2915620e819e6892fd7e545b98d650bad36dae54e6527eaac482add98"
+SRC_URI[sha256sum] = "7aeeacdb858299e09a3e0510d4bb8b266923894a9e3ac0058ba89d4ecf4a4cca"
 
 S = "${WORKDIR}/node-v${PV}"
 

