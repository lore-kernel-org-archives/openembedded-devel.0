Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FFBF589C3
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:55 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18556.1776948592753741303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HY0aRlgK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adff872068so32693515ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948592; x=1777553392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kMo6Xh4FHlFIdRi5wD7IYMG1VgdrCt9/OxFD/VMsLM=;
        b=HY0aRlgKhT3yb/Vwnp0iaS3uapuCeNh2tT9R71B5eElD9c5fuhXs68rki9sna+MGbX
         cuI7DDwvS+EYC2fEz8/FUN2jFsJ4n5I8iPgMu5GRNbsj7MWHX5G1W5KRkyIlLNm36SKp
         jVPTI/bLVuROu3m4NWoZsY496k7bpFqyYq5vBUDPYcmPQmv409zRJ3rbL5KVWd9UMyrN
         0CPJX/ZHlFQHRyIc65oPTfs32PuDxKUbw1c3uC0dtILhd90rpybePXLkvedv+jTODlFF
         ctwdoT3FHzOy4lGLMjRCGDAgIzdA7EnEX0ffXe+DJGAdtPtda2fyA8WrsezNDDI0/wU+
         U6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948592; x=1777553392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3kMo6Xh4FHlFIdRi5wD7IYMG1VgdrCt9/OxFD/VMsLM=;
        b=KCmRmPY9Gpso2ZiUYNIf2VKxmScG4cAXUMYBps9WWwNPuvRDqt0taP823mkgqz+8ls
         DZzF/MjkLTq/DxsvKEA4mRJ5IQ78f4T/xROq/p6sDBAPnSS+J3QjHLGWA/iMgyRSB5zM
         OXPTJmR14fJfltqFCr0UEoc2+uLvKuF/LUCeCFKcHjbs/z2txXNtOgTyakbhEXSnNDJq
         Assav0o85TcA/tW5piG6MhLGD9yKiBqPw+RWP636Jl+ukLIp/++WpfJFiclc834FWhOI
         CFLSK25GeY9LcFyi9J2/mB7tRND+4zGpVaWfL2b87gk7Y+0MjZkCAJ9LrdtJNhvIhF0p
         QyZQ==
X-Gm-Message-State: AOJu0YxKW7CJqmIZ1K77RqMDygUoaY48z6B/o7YmlwOR7FAeEriU+BtO
	+RAHw1YHZSIpDxRnL2YNnmU6WeVG3JHTy1KOHALhjS+jwlm5eX7jvGoXjDYF0WGm
X-Gm-Gg: AeBDieuzWY0PlJO5C1gSO85d9lDZFigl3rBx4rocAHWvqqjT3TBYQkZO40fWZ7QcKUX
	72IaTukwsWPr+lYh/07S+Z/E/9Yas9Q+QEV3P9oowJgM/5/BY1oBdNUqF/0SLAv63Fl5e/ep9yU
	h8Ez2k+PCNaV0V7/fciheIHiFnvXEJ/nq7lHgtKirwh7V7qEr2Q3wTOqKJF3zRCSt+HSztdy8Zt
	7Imvm6mnMLGcB8FhDPJHWRUXZiQplQVKBwUm6KLBWxYprmTLMOtt6CHLzpIeKG7NCOVnZe9gV9g
	zuk0GB1do4oxL5SuxhDVIPSN2Ky5s6KtFeZ+AlGwERxNijEaVpxUtmAKeDEernwg3Mp1hrPUD+o
	TNiEF91IVGEPewkhGIZ8Sm9zZgYcYf384+qXkBBXUgxYB8Mgs7rTWbIwg0ejMUYKCN6gLA3zs9I
	zFduPhDimpM44BVbG4XIfzJmP70LcsNVYRby8NI/RxnFjXfYU=
X-Received: by 2002:a17:903:17cb:b0:2b4:6083:6c15 with SMTP id d9443c01a7336-2b5fa055a6bmr257063375ad.41.1776948591970;
        Thu, 23 Apr 2026 05:49:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 17/19] protobuf, python3-protobuf: ignore CVE-2026-6409
Date: Fri, 24 Apr 2026 00:48:15 +1200
Message-ID: <20260423124823.1983261-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126593

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-6409

The vulnerability impacts only the PHP library component, not the
cpp/python one. Ignore this CVE due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit aef8bc34225cd0a56057749d0db1dfac773b17cb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb           | 1 +
 meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
index 4356ebeecf..cce2ad11f4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
@@ -27,6 +27,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
 CVE_STATUS[CVE-2026-0994] = "cpe-incorrect: the vulnerability affects only python3-protobuf recipe"
+CVE_STATUS[CVE-2026-6409] = "cpe-incorrect: the vulnerability affects only the php library"
 
 inherit cmake pkgconfig ptest
 
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index af9ff85f20..3abee615d5 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -14,6 +14,7 @@ SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"
+CVE_STATUS[CVE-2026-6409] = "cpe-incorrect: the vulnerability affects only the php library"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto

