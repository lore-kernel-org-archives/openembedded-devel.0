Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307C9C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 05:49:50 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5533.1737697782983889432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 21:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBOpmtcy;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21619108a6bso28495715ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737697782; x=1738302582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYL7sCe1wTLr7iJNWCoxE3+gr97xRlHxPY/2IUl8J5c=;
        b=FBOpmtcyrV+YVxmHV5TcV6FUz3ZX68ZTE0j6ASkGf498u88vYp9SKO3zctDRfQfrio
         gLstDHbkl46mx/0Zyu6GO0vCTBUcg63jYb6gGEAsnDDgxw2YaOo55mr5k3VnJhK+vRKU
         cxa6ONO6mAE1EUejdzC7Zj3GYBgjLton8qCldAAiWSU+ne0vch6EamHxFl7FAEmUAfEq
         Ah5qDPPjJN4sWR1NGhLKNXMnEnbtyTVy2lmn7aDQwZZ7D3VQH4TSvZb/Ad4t7xDSifj7
         pP+Mm+ZSdYIy49xlb+RzcRtJpfIxyn9p+ThvqF4Tx5URkLZN1VjAxiVbQvQzkSrFD65R
         i2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737697782; x=1738302582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYL7sCe1wTLr7iJNWCoxE3+gr97xRlHxPY/2IUl8J5c=;
        b=pOP+gA79RjuKFZFqX+0tRJo8Wx8KeAQNui7axDONKYCH3tQvNffHU0z7vlstlUkSUw
         YilvWitwZ990VDcUg/bnZ4PDtK1GZpmxoHzh8cE3TtJEQyTWKrHcmuBcSYSYyUXdHX/c
         j6WnCbKyDDlBPDgy1sLcKZOwP9KTILy41DsKNobC/D49gpNkrjjDiaJblSbhgs/MkrWg
         JNwj8RKqV1jxJWS7nyFRT9edePWZK5iNNscuMlg2ge01Dc7di9rxky7++/q/t6XbVuLT
         zkdG+ngcl1CrIK2gXZFkUUsqjZbydXCwGRcx+5+bDdC+s2Gy4S3yCVibWXUU+tpL4Qr5
         CstQ==
X-Gm-Message-State: AOJu0Yy0O171mTU2zm3pc5UvbyMyu1ndUe4ubMdJG9a9J/sflMqStxNN
	B9k6NMcoUcIlG2vj3H2bThLQXYxY3DybSmiO48lLtBmDR9//lhP9X0rMaLX4
X-Gm-Gg: ASbGncvhT93A+6hnxXPcTv6HCdc0EIi9R6OBi6pkXfLcvyP6sB1sCD0DTA0Yc8RWaBX
	xQZV95Q7zeDl0MNEEuLwD53DvGVlS3FYlGFOR4QKx0q7sMvVmGJE5yt8eK/CIeP2JB42sKxgOHE
	2skYOvOty0b8+0OpY3mBcOvhVNcILzT6Py1DOTg6kmDKEYf+daYFyNLwqJcdtH/hNYWBycHPuRw
	Vk7wM2zKj4JHFUqiU/K+6SJhWvn/Y918ALU1OToPOt9UqXs6QPajQNnfs8C0UhqCXZkFZcj
X-Google-Smtp-Source: AGHT+IHz0EFyXLjs3/vc301Soi1PS+8sYFX7ZL5Wg3P0A/R0bCc8ZJrB1cSRRRIofw2tafA1uFzSJw==
X-Received: by 2002:a17:902:e745:b0:215:5a53:edee with SMTP id d9443c01a7336-21c352d704amr381516385ad.9.1737697781977;
        Thu, 23 Jan 2025 21:49:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da41413e4sm8185535ad.158.2025.01.23.21.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 21:49:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pylint: Upgrade 3.3.1 -> 3.3.3
Date: Thu, 23 Jan 2025 21:49:38 -0800
Message-ID: <20250124054938.789436-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 05:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115050

3.3.3
=====

False Positives Fixed
Fix false positives for undefined-variable for classes using Python 3.12
generic type syntax.

Closes #9335

Fix a false positive for use-implicit-booleaness-not-len. No lint should be emitted for
generators (len is not defined for generators).

Refs #10100

Other Bug Fixes
Fix Unable to import 'collections.abc' (import-error) on Python 3.13.1.

Closes #10112

3.3.2
=====

False Positives Fixed
Fix a false positive for potential-index-error when an indexed iterable
contains a starred element that evaluates to more than one item.

Closes #10076

Other Bug Fixes
Fixes the issue with --source-root option not working when the source files are in a subdirectory of the source root (e.g. when using a /src layout).

Closes #10026

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pylint_3.3.1.bb => python3-pylint_3.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.1.bb => python3-pylint_3.3.3.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
index 1b2e033f11..8709d8596f 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "76bce72bc57cc8089e439cc9d22fed5806341ed4"
+SRCREV = "c28580be76fe1ec55a6cac41833c0bd68070d2f7"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
             file://0001-Adjust-test-expectations-for-ptest.patch \
             file://run-ptest \

