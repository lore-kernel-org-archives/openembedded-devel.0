Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37963.1795594140168651303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o3mGig0d;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3863db981d4so7617227eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594139; x=1796198939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55Yzuj+Fxi1MY/XKibJsYKu6IjHIjD1EYr05vGi8rQ8=;
        b=o3mGig0dPU+kK7DyEif0AOJPb13xUOo560XO7fQx2RBGIX8GgUjX7CL071ygp1ehv0
         CBphbnkTiUHAbQDzPpLbc8xMwfozLzTHNwrU6Y243PoDHSwvbkSEaS1Gy6WlrdPiht1W
         TXA0kU1yKHeUlssbpCNdQ22HHtLLG2tDzPmPoa6cZQltogW8ovrJ2VU8iUov/ZMeFrtD
         UF687E20Ge3HtokWiAqyRR6/XALIm7pNpRjunujnw8msJezdU426L3viRP1KpCQzgbsM
         1aqBLB//NbzVesghjxO0cvrkF5Wb2YCmspeyAs2ccAO7ycpT9C57nPEtkEDL8I3EGn4m
         nPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594139; x=1796198939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55Yzuj+Fxi1MY/XKibJsYKu6IjHIjD1EYr05vGi8rQ8=;
        b=DH+yqeMpjl09TZGR4KdQW//gsm7Hq2QP4LsQGitE0Dc4D6bUFQKnpWDhUc5SmxzAfD
         jdRZQMzxN5qKAdMURBcLk6HX2y/y0tXTM/KgW4rrU+VQquN2Wq7lRnMLRKMe85yFOjVx
         uqW5Zo/xS4xQwOgPDHUUR8DN/6nSc1oUNgspcZ447xr6M8+eb3Rm7HK1FB1wtOwNTu5c
         T3CUvQKYWUefOCEzptRdTvYFI5FQwOhp8HFVnyDGeQVaR04riFm7kJ6LxwHCLZJK1Tdk
         YmxSRGhB977HpPY6pqkpr8hhHcAgxcyG2bxoStbzHnucZWjnY1Z/Lz5he0Tsm5N84thB
         mJVQ==
X-Gm-Message-State: APuU4Z9VDxvFi4uuJeTa1MeTMuT/kuyAlC1noj5uwYqI9duS4CwMBssP
	0VKZUPCEaWqHqLQ9TpgSfOwxU06C8PKpNJ5U0tDBvzWx/TdefZnuVAJsBd7D4c2K
X-Gm-Gg: AZFdTZc2fr/HdcINO1BNZcHk20LF6OKvDDNSHd1g0QhBv22cKcR0r9m0ZBS2WH4Gklm
	YLV0aad/035j2ChTsHYhdAetzKKu08H9kiyZAmSZpivx8uB35XrkGq3S9TMEBEd54I8Lk1iNDFB
	RupN+QBHt6jaoRBFyla2q9I5lj5OVeWPS46gphg+Kxe7tqLxFn+YuBzDEi9tyE9JhzonGMNXU8P
	LJ1pVziL2Bhup+2genBxouBxLkPgqdWrJoe50GH6zpsbRrQhklxnzzHRUl40jU2WOMKbj2cYkPZ
	0Hc0o6tqtpjO18dh3mPmXP+JkEFRZIUMI5fH3nt3Bl6UJFkQib1Z+BmQIQNN/rJDW6zZVjKQg3B
	3u9fL9sci/+tmE0qKISVNiY+oIq6nWLugX9VDEnNWH+SqZZshY2M9cyIIUxuP1tp84CE8QMmTah
	LszeogdILUydZVAri6XwR1FY0TdKhuJviDyeYI6f8QzT5M9Sg778guJo/oVQgSxkEYDZDYqxL+M
	s1080Pbl3VOGlw3WEpszDuAxIjnohG81FqpbiWNtWlv8OHMWFQ/h/aQMbVMTsu/xi8t/CmM0moh
	HO9rqaA3YapTQ+H2J3OWOXH5Zt2wrRBddhufsyRK2GfgqyRUXgTIfasR27ysz8BxDsFXrBUXfVk
	f+tmWDTodJMSb90RU7xWA2IZpalolmIQ2aTWoKqM1Pb6Xyi0PEtfirazqCtrJHYRdmoc5tMESy+
	WG0A8E6BQQHdJJlX1IAjlOvZFutokUMYmW2pTSaBETs2J/SWj7HmtCGGFGmQOeWofLAe+KDRTcp
	RbtF910QeZ0ZACoVqOnqpEJ9idisWPzAI2OR9ZQve5fm+kjxCcEO6PA7SvHVfD/U2yu8ZQH4rCR
	P4C/
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr16710245eec.16.1795594139505;
        Wed, 25 Nov 2026 00:08:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 07/14] python3-puremagic: Add recipe
Date: Wed, 25 Nov 2026 00:07:18 -0800
Message-ID: <20261125080732.2419614-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133065
Content-Type: text/plain; charset="utf-8"

puremagic identifies files by their magic numbers, like libmagic, in
pure Python. psutils 3 uses it to tell PDF from PostScript input.

setuptools build with setuptools-scm for the version. Native variant
is needed because psutils imports it while generating man pages.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-puremagic_2.3.0.bb         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-puremagic_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-puremagic_2.3.0.bb b/meta-python/recipes-devtools/python/python3-puremagic_2.3.0.bb
new file mode 100644
index 0000000000..dfe7abe0ad
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-puremagic_2.3.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Pure python implementation of magic file detection"
+DESCRIPTION = "puremagic identifies a file by its magic numbers, like \
+libmagic, but in pure Python without external dependencies."
+HOMEPAGE = "https://github.com/cdgriffith/puremagic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ac85ec1f210835a5806bc00df0be30d7"
+
+SRC_URI[sha256sum] = "b54e4a69dd37c50bacc879380f132382ab4e9a935529628c8975abcc73e10640"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-core \
+    python3-json \
+    python3-netclient \
+"
+
+BBCLASSEXTEND = "native nativesdk"
