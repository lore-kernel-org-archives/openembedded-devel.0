Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2596DC28B2F
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 09:04:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6178.1741424671346365610
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 01:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nBfO87Nf;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234e4b079cso48478525ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 01:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741424670; x=1742029470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXo9sDoWRQUgf37Ji+Ak6pRtigYvectjR27UIx/olmg=;
        b=nBfO87Nf6eNkFoNKLx6CXG02AwrlQ+ZoxVBGXYtDdSd3efsTDoOyBKBrDKDvUIhu/n
         EtSigVer2JLsclYvO0h2rxQQ3VX9r4PnSXV/ie6aNcqEpTcTpu0XhdYnEcwKgV2yAxpE
         Ir92TjD6Eyqq/AhIQBPBBn6JGT2C91BAaIdt7Lj5tVN+N69SMGOwacSzdpgZMJOyIJ2e
         lNSL4QTGY6FhzZsnGe/84MBwz5HruHK6mf51pEa+xATHx2nQjoi232nadgSrTmHCvqEX
         k/qggXwU2z8MN3F8lsmE8pi2mgZqz2Q98XRhmE2lwKn2FUNgylrICsJg4qox8LZpkpqP
         fjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741424670; x=1742029470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXo9sDoWRQUgf37Ji+Ak6pRtigYvectjR27UIx/olmg=;
        b=oRi6nIuH5JaWpcnDJACj3u4Rweq1aTltMY99dN6izRDwjgEmnrH6N47phQxctuAw3a
         k7jYF764FgWmQupW1nWSsE6ppc/34skh3RDExscmtXo0+xf88Qcfz0ci/6YIXUKVbxhO
         ny9JAzh4DEUMmDCEL2DyDDO5GkHX9/qN5u9Gq+USZ+riWQIqSGBxnV2MQ/TNHJtXlSHf
         48255siGEbtR69YUYUabqjlrVM9Zm0PYEm6i7MK4ihGtLujMWPOzt2h5VAXPtX4xqJ8K
         PWxh42Cnr9ZKGdeRs5mejmpkm/WgZXA6cVCbvqwrH5GglcyquJ3AKFdv7miBjkCDqkc6
         mcjw==
X-Gm-Message-State: AOJu0YzUIFnD0hwMaPc5XYQOEXZh+6pMxcfx2LipQTpAdZy1lh5f7FJG
	SH5/dceRP68jie2jLkO/Uh4lbuKoLp+fhOSLPeIhWv+RjrYYknn3XHJX+g==
X-Gm-Gg: ASbGncumqMh0nRixHJqtdkK1AeVfmXTJCIMiMu2K3AqLi1INw7vVBrfRRjzbJT1LT3k
	1E6RcnOUBKEdc6Jj0itJgV5fTnkAdZsbjZRsAAdnBjVPFk3jc+DJJsWsnfaG2nBzUsRFu/MVr84
	bniuBXuW2kIKfCsZF6zpOBhPKfmhdjyhBSmTIpC/Qy8B5CcemSkhAlpdCMxdcBlgBTJYlZ0nXNg
	Sfkhw89+aik75spKZpFRKDRZ19pqqAX+IHj/o43zENp6vsjp1joVENNBPsjoRJoZiNbxgKhcsNH
	VDPrdKgfdJgRpPThN7rMyvUkf2bO2JdiFTqUKnO2fqPCgIBt28Tyfs0+kT+kyQiy
X-Google-Smtp-Source: AGHT+IGnm5tbS5dfCmaxxIqY0iQ7z6FLrsHXw87o172hU93NeS0ju0A1OJsIWPNDy0eg/8iWaqpUmQ==
X-Received: by 2002:a05:6a21:2d08:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-1f544c35f78mr13287913637.32.1741424669871;
        Sat, 08 Mar 2025 01:04:29 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.57.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af50bc9b28fsm2124984a12.60.2025.03.08.01.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 01:04:29 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [oe][meta-oe][scarthgap][PATCH 1/3] lcov: include UPSTREAM_CHECK_* to fix UNKNOWN_BROKEN status
Date: Sat,  8 Mar 2025 14:34:03 +0530
Message-Id: <20250308090405.345593-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 09:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115804

From: Alexandre Truong <alexandre.truong@smile.fr>

Adding UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX fix
UNKNOWN_BROKEN status from running devtool check-upgrade-status.

The next version of the package can be found from upstream
sources.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
(cherry picked from commit e71a678f4d769da2f7f465bfcaa1ab614f9d0d1a)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 22d68814ee..4f35eff90f 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -50,6 +50,9 @@ SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/l
 SRC_URI[md5sum] = "bfee0cef50d7b7bd1df03bfadf68dcef"
 SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
 
+UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 do_install() {
     oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
 }
-- 
2.25.1


