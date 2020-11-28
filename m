Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.36479.1606592854026428150
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ItiJ8HDD;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id b6so7385185pfp.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3RAc9xkDXfhwJ0/vfFzw4gj3FfEuHLAitsl9rOAhNYk=;
        b=ItiJ8HDD0tEJ+h2Hn3a2gi6P2ywTfS1MXw77Y+TJG2bMiV50BHTkAD7JcUInYu+nby
         p6hEgT6iRO2f3eLRidFQ0bhn5nx6P8RETlEfh2KvmUzqXopIHZa1p/0ETgFvJiDBD0MJ
         5pGGWNa/oUtJj5drKM6v7lZTwxcTc5yOSHIK++0gA4J9Y7552rMnWkJWvCBF6JtnQl3G
         XPK8RFN2x/QFJRLOzDiNg6EnSBfpqYj8CpmnGsEG5K6piFbQdU5+U63fivBPnRYVx/y7
         u3UIGv/1aU/SqJDzvVQn6JuUTtohO1ZgDFX4rBGpr9WgWoSipgSFM2ZZZpjFjENEMQKK
         w7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3RAc9xkDXfhwJ0/vfFzw4gj3FfEuHLAitsl9rOAhNYk=;
        b=NedON89QAfkrM0LumfyYSeOtDC6LUNJYtfQdymMADitJVmFitP/bIzzrIGvHF1+Fhx
         nl9Djfw2Wpkpi9HO5rOJcwF3IE+uGQ9ah8HMrw6qGtIknmHbfqvAZuGe2Y54Y7DpSk7m
         ARisnK45uU2mEtXCKuPGI1EahknrfZqWsAhwGuEX3cTH9HoNG6TihXhhX++a4x9JZt5L
         KM4m8P6s3hZXAMelXdKbKeZQd5iCzFUzCFwehLSZNMaZHzxX2uQ4h6VG2zOcwBK4ewjf
         rFPAIDOP1yzSPgQahLgnnlZ51bg3zh81Ex5uvSQC8VXRQ+oyl7jPFI+Hr9DY3GiKe9pa
         3fpg==
X-Gm-Message-State: AOAM531dahv1TSEDGS8p1cvOMZn8LNNCZRtXn46lvSwnpYzDFzXRjnRU
	/g6ycupBOnrk5g1PSHKzVVpIEX4mUfZZPA==
X-Google-Smtp-Source: ABdhPJyOtDgQ7A75Jr5iyXQ9mUzW1i0j+qLiTK1w0kmkjpEx7fi+1dHwXUP+zo5WBaTIHW5iqmYk8A==
X-Received: by 2002:aa7:8f09:0:b029:18c:4cc6:891d with SMTP id x9-20020aa78f090000b029018c4cc6891dmr12348097pfr.46.1606592853401;
        Sat, 28 Nov 2020 11:47:33 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:32 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 15/16] python3-hypothesis: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:55 -0800
Message-Id: <fa4d69a0a33940e6bf7b514f01a9f17e137f8cc5.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-hypothesis_5.41.3.bb            | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
deleted file mode 100644
index b7bf15c31e..0000000000
--- a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A library for property-based testing"
-HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
-
-PYPI_PACKAGE = "hypothesis"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
-
-RDEPENDS_${PN} += "python3-core"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

