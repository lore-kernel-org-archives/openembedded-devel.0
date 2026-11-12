Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6075.1794517673531277756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kwL5+Pb+;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so128342b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517673; x=1795122473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7Rm/Agn/X6dTDgb5yUuYfdsmKkzVUaEvurhG37ogu8=;
        b=kwL5+Pb+0/pfAT0Sm9eIjscvg6vd0lXshpx0KaovBAL7PJeLo4zfUmxXk2FKiKBG2O
         zh8E4+TscgdmluyQ6n6TAojuvbRlBCo8tpe6fCF+NQBYbxiNoLtwWCEakQo2NQl+5CVv
         YAlE5Y/BOuuSveKD1NmNii4zR0WEOl0fXxWYmMOQ/xlNrldUxMmEPuHLPFPodzy6GCW/
         Oqs2dHbLrlC1cUiaUYJeeCAcsi8X2uc37YCRLItJEPqh4EvrVEk/gHDYXmP8/iTkpvfE
         wnMHrUjBR/qL+0g2lwkd09uqFGdDg6B+SbL5BpfF5b7qEz9fCznRvFBg4k+JMC5e5V2E
         b32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517673; x=1795122473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7Rm/Agn/X6dTDgb5yUuYfdsmKkzVUaEvurhG37ogu8=;
        b=o9ej5sYnt5onMVHE6Kiujuokmk/MpMhG66fdJN6zCp/3VMcCcoLxoj+hmtYWTpR4YG
         c//de0vs5qayULFo1MwELYoR7wiFmBSKUimHDVFGv4mX1TvU2DRrgdZdNsEvTlnF8rQB
         Q8XA+H0jmzto7+75sJi+kg9pNC3zwCCaTDWJnev+wNO8xb126uSoHwXVyIqc1fvMA0b0
         lM5YJYLsC3fFi9qiQMK3sQ5x7pXTBxqPEKgs3+Q2ie6Bl7f3q/ZdEkDqP+2JcII1zmia
         eI4GXmJXBoWE0K6JU8RAhhgVv0RCv/ycpUqBWb3jOnGsHF6UMeBXfuPbI1yd1TLd/x06
         LkDg==
X-Gm-Message-State: APuU4Z8RiXz5WL4zkcy7JKWxgper4YhX9PtY/nHVq7oLyzLFPtQpdjWg
	RfW+CDGRaGBkx2btVhsDLJIPE7dVxp8ibFWS9iOcUhXmS7eiNd1eSIfs4tnuXABouvY=
X-Gm-Gg: AYBFou3R8O7bRYvAUNGj0K0A03C7+GLjfZ6pzZ/ncy2RHZbVt5UYgsBjIbnsjp1QFOP
	3a02PcSEwzQrbP18GPSU6V2kBC65Q3du5U7bJYeQ4dM8KN6RNhWGa8gXV7iZt+GaTXAHhuucIyu
	4bpnFnKddqomsesHGa0zDteIT0h6W1EwkgJrB5ki9oVT+UXKKw2Ohb/6dIMB9KU1+Lx84P8YG17
	m3UqntKc9RxHkdMHwQ7Wy/MR36GbNcsSCogzfkJa3ASDQ4Xh4tEFoXPE8GcV2fOSyCL1iv8qOoC
	BsodJxUiIB2BAGr/7QJOYz73+LpoJaU9sSr5V4pbEbGfQWUFk9BOeo0uPHosqt4TmaW3dKLPYUV
	iEcGj+B2ITEj96tDqFvbWVEW1qGr/CdFIg17vRFwI2PikffsPe1BauF1Cq0OYLUDu7Ag31QXRn6
	/x4fh/1I2G/ez3L9JPtnXWEK9yOVPeARcf6B3yRNyN5ZbW+69h9etsMVRro+0eXgkYDNLf7l8w5
	WO5M8T7MLz4xaBY/yBk5M4g5z4ZUgbRZPYQJYPbPziNR7kaleUTH6NokrL4+KJE8rdmgJdJSlXv
	9WkCzGTLwZbi43qmViFpv8zFkwq5IKc1ub0wzh3YmpSOYNiPPUPAfXJqm+qUUw9vO5puKrhYakM
	9SzPcsoa/X0Yih1Jf48bqdmRVqCFIwc42xbfAsU9cTCCX3PeGGnbpYAXvb5EGCyGgyWxwyLV+LO
	VyQSVzuD9flCc88tx0l8dokYb8jdw3qLfAcF8oCSr6QusA5xm511nHRb57OOnlejo2rAk9BwMS5
	D5kZsZ088uByr6uQ3H3O+hQzIyVUgGZjuyrE8998U3PIUpUXPPwtimGFN3KLEbPgvSR0AYje2vH
	wJqD+rHz8dIZHL2Ibm3lhMANsQ==
X-Received: by 2002:a05:701b:4512:20b0:1b4:fecf:4ec5 with SMTP id a92af1059eb24-1b5031737a5mr596394c88.18.1794517672647;
        Thu, 12 Nov 2026 13:07:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm1800274c88.5.2026.11.12.13.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:07:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 1/3] tcmu-runner: Use an SPDX identifier for the LGPL license
Date: Thu, 12 Nov 2026 13:07:47 -0800
Message-ID: <20261112210749.875657-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132214
Content-Type: text/plain; charset="utf-8"

LGPLv2.1 is a legacy name that is only accepted through SPDXLICENSEMAP,
which maps it to LGPL-2.1-only. The sources are licensed under "the GNU
Lesser General Public License, version 2.1 or any later version", so use
LGPL-2.1-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
index 0256a433cb..e165a905e2 100644
--- a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A daemon that handles the userspace side of the LIO TCM-User backstore"
-LICENSE = "Apache-2.0 OR LGPLv2.1"
+LICENSE = "Apache-2.0 OR LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
 	file://LICENSE.LGPLv2.1;md5=a7ef827a98fa240d37910ac4e8ce3f53 \
 	file://LICENSE.Apache2;md5=6c4db32a2fa8717faffa1d4f10136f47 \
