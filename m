Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3855.1794729104411954472
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZzdF14fm;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so3487342c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729104; x=1795333904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2mDGCs1UBZggljUoMLK57alljnYneNhRtOn6nj3Knc=;
        b=ZzdF14fmUvF7tUnQ8l1o1DZA/cDRieLxe5rCcelZrtR1hB8K2hHuw7rPReqWAICqt2
         xP8mO6Re6KKpYAc9f4UIpqkG9Wqw9v5tykpjKnFvtg+EiAkGE5+pk0/fBHHi/9No7R29
         FpPGqegG9yAIKYBZHRH16ka5G8Fn0uuiHyucqxWd7s4+o8GFKg7LlMUGoUwAiV4/UOSu
         JRJqA5+WT2Xb02EkqLwQ2x/AMfTCbfqYrH1VEJ/a9HrFaHl8xVxpgNKgYIYrcr4qertP
         NBupMEB5eb5XbDFcAcJ6c1Ad9IrcN8Zec+nJCvVjVa0vIkj5JgUthYqTg/YFaiGaUNFo
         ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729104; x=1795333904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2mDGCs1UBZggljUoMLK57alljnYneNhRtOn6nj3Knc=;
        b=F8UAegFdGDOAeOrb8TTcM3e8IWb2H7YmdHi1HZtu5qpQViCnzRztnRMBP/z+pExyBM
         H1gMLPs660FqG4Ygd2ZrWxE0QykJ+FE1vpd+inMfDxhJPsgwlgfYDgB3YQKRLIqMpwMG
         AIz92oO6FbTwGugErWl/HSD6OussK355k1gvuypqZVYprBWuG368IMMj5JiN2eMCE2zy
         KJUXIap3/RDv4GBj+QPqj/XJ3yLUz9rJB4jBoY/RHGn5QZ5grr30Sy6mQyyJjGmRsCaw
         UHyIsPAAhHb8kd7sAXMUMx8BTzIelmncnvHQQY2eQzPqBOwtfoXcffbV8cxraqKu7/pa
         +i3w==
X-Gm-Message-State: APuU4Z97Uo9GYbP8FX2UAYXjfBECGtG2wIZikZCVCc/gw5H8gI3dgm5H
	PwDQGR+6BqIzZe23XZMROn/0e2j2ClJ/qsHeCqIp6MJX1/y2ynIZlFRq8jLp//eJ
X-Gm-Gg: AYBFou1/ahmsLKI8AThKUWKWYYtDFy93vl8h1jZIoNC7rkG2r09xBAWH3XHg8ueg/Rg
	m5F6BrvmG3XwvxRNEC2Idjf1bHnS5iiHfg3ErMt1AcNRD1Kd5PcicOEkKJ4Ggswv7fOQ9QKcFLS
	QEl0ueTl7rJuvuEnn3CWRkVnBBEf5N+43TBVxX88SVO7zQpUyj11oo24uW7UIw2OTaGmL4y+ths
	yr4VcngPyEkMLcDvbIt/D1tQ1ApiYFVCJDI2egLN9LK20TETAhLjKtNaSccSN56thWsoUJGcu7p
	WDkrrwQY9fizc6fiMLaDamz2uVk+GRB+3ghxNyjgk5FuvOI9M/jKSheZt9HapmD6r5jzqv1EGqw
	iyBwA4O11qU/i8uYAZhdIFA4cm96jOrKwqYISOuwkOWSv6F9pQknXBLBSvS9qMQco/M3hrDjbd9
	XUl57jZGSzreBvWqmo3pY0xNWhfxs6X0vgIzJdQtfGPR25NaITl8pRx2cQA/9Oli+K9KYa/dGOE
	zGFFKWbtSlvAqwNV84KmPciDKsd/BBJDr/NGhHSd4HZfcx6I+tDMahESqdvAkw7lPCXVF1Vv1is
	yMMQhOLk+1QdYd/1OLCZoAy/yylCij/L63KaHvGRUDqO0bAxoDj+R2PTrYoOcM9CA5O0UAya/GJ
	SAP+oRqdkmd1ve517mUVBqVq4OxjDlEa7gO3zEAjWLBhpjjhJx23B0v9e6N2G57BmnfHV2pHr8/
	j5mWUKi6Iz+Ao7434zML37/++aWp+uvMbhE/HbGWlIJtVgv5v16kvQTCNF38CIFbuaT0gL13hSu
	gH0Mncl9d+BmNHh7v17elxesXBda6y3LoJjGuZNVe8/gBx6fZB2e3BjLrei7cQ45MCudnCAwUuL
	KW3lcvXI8ylCehQZLcBzCukqXQ==
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id 5a478bee46e88-37966f32039mr7422545eec.20.1794729103691;
        Sat, 14 Nov 2026 23:51:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 87/96] cyaml: upgrade 1.4.1 -> 1.4.2
Date: Sat, 14 Nov 2026 23:49:05 -0800
Message-ID: <20261115074918.2932593-87-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132357
Content-Type: text/plain; charset="utf-8"

Upstream moved the 1.x releases to main-v1; main is now the 2.x
development branch and does not contain v1.4.2. Add tag=v${PV} so the
fetcher checks SRCREV against the release tag.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/cyaml/{cyaml_1.4.1.bb => cyaml_1.4.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cyaml/{cyaml_1.4.1.bb => cyaml_1.4.2.bb} (89%)

diff --git a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb b/meta-oe/recipes-support/cyaml/cyaml_1.4.2.bb
similarity index 89%
rename from meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
rename to meta-oe/recipes-support/cyaml/cyaml_1.4.2.bb
index 5f33c27c52..a3bdcfe245 100644
--- a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
+++ b/meta-oe/recipes-support/cyaml/cyaml_1.4.2.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe6f0e49348c87bddd5d27803dceaaf0"
 DEPENDS = " \
     libyaml \
 "
-SRCREV = "07ff8654a270ec9b410acd3152b60de9e9f941af"
+SRCREV = "d05365e474e56d34c8d4b25599a333c0635eeebf"
 
-SRC_URI = "git://github.com/tlsa/libcyaml.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/tlsa/libcyaml.git;protocol=https;branch=main-v1;tag=v${PV}"
 
 
 inherit pkgconfig
