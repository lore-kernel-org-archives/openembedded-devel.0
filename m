Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A548C5DF66
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 00:38:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3631.1786667911348454541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 17:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MMLqQabC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so610759a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 17:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667911; x=1787272711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hP/rG5WrHCysrC0Epz4PtUiA9pbDoLGVg8WeNseYUpQ=;
        b=MMLqQabCDKJoCS4PCYCCgdOHsPSPMckMTi6T74BRRPr7tmQ1BP0GBuFNy3lEN4qd/m
         wClSm2MEUPutROVEGViLA+ZQXLaAjKpII7IvaKd4R/7jDd0o6TZp3JCXpUzImXUBQ4Mj
         6gzKU06TW9JaGBtsBU5Dwx9bsTSTodtT8MIvKpP6p+82w7M8zseuYoTpoRJ06cx/diPL
         b7HBuwfmFPT1Sr+jGjw/iMSTPnkLWPhXybaXSbu7Wd0N4VwqVv3wM5LrsjmWjNibzVIW
         rRvRMrTPABBcsGCI2quqYjDcuLv0GUnGCmruTSQXJA8UWZKPk6ZEiewQ/WvaxhvvI1Z2
         93XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667911; x=1787272711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hP/rG5WrHCysrC0Epz4PtUiA9pbDoLGVg8WeNseYUpQ=;
        b=gSW1xIaySxUBP/NKuByk3V5q1yUSaJTgipYdkRJvKMdib10iDGlPoWrZT7VfUTtVK9
         raHLE7iGwxceMl7MkxOx9XRq2cVcGQ/Fe+WVQuf8WDoNLE5isdlb96eWkVv8A4JWgezo
         SEOpDLpFAy+wZtK3CoWwvn95F9kkgtdWC2F6hxeKNG6sCdOjbI0hmdsBPcPRiNJr77aR
         i5AmTY1cNQUTxyxCSe91edbc3jVxVgPg8mx+qx5jUUEL7pWd9czcV8OE3athGlvtpqyM
         v01h3YnkZhbynkHDML2vJLDYvOjqRp9dbpZFiRYtJrDkgLTLPcIQjKzRomQbibzbeQYA
         xbIg==
X-Gm-Message-State: AOJu0YwgqDXqgFBMVzZlklEP6qZnZbIPYHkXc5duOUizLlWxnWfuzWmM
	r9xoxEpnEcwgDPyrJidoHZV/MhJOKB8S76pxALkxnG7J1zhy9pjro/E5GflUyib/
X-Gm-Gg: AR+sD12HUTk4IAhWpMdkBykC6d0hXld28ARiofq5EycOVDjYmZaPIASe2CJPrUN57SF
	gb18kGdwnNnSeH6MW05goCadIe3h/MbTqwmUwS3m6Yr9YmhGA4jllCU23rpRz5nbhw5Dy11h2pw
	1mz9h6tEs/GCcf3zr94s9EpRPdMj+RBMjvB8ZHWyZ6VHidIiUTtLrMS3aY11Ku87Hq6nh2WMCUb
	EVCZ3hj2h84laBs0O0CgP/ZrRAW4q5dSMwrRXTqJzfFMx29FgFwvlCbjTZBkWmdBhwiAUaj0hKZ
	WWoLq9VSYWl7gcA++XF84vZpMjg248EXfDM/Hdq6E5ymq3bOqBzt80F1dXneJawx/xrZoT5etMB
	iFciyaOmEZC8aeVBHYMokREUj6PC1+4obguhBVMOwVEs2HMWhMkrlOVyksFsq4QI3TPNPBOVwCG
	v0t0VJgtxfaWlpFMAGAAzrBadM/dafLyXIIUqz4pYX2zXeBzshtMWTZLGkLMoTAbjz0gK+6f2ss
	VCWgDuoJB0CQPH5WCFtyJasmBJU1TQYEYXgqkf0VuMSvwPwQAIGDAi5Gbw5wK33AkpHF0/czOrZ
	ZX8JtVh54akhXgkWe3my1v9JcEQ/ailP5nb2V5EkW9GhdQDqnjHbGzoCQjieO+E13k539Qsu710
	J/W28NPz3Q/BtsQl4hJHdmoV1/N2eQoHse82mypUMBsdB0Q==
X-Received: by 2002:a17:90b:4f8b:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-3933bcc78a9mr1894040a91.19.1786667910597;
        Thu, 13 Aug 2026 17:38:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm3236209c88.2.2026.08.13.17.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:38:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/4] upm: fix removed Python 2 C-API symbol in carrays_uint32_t.i
Date: Thu, 13 Aug 2026 17:38:18 -0700
Message-ID: <20260814003819.1417656-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
References: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 00:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129027

PyInt_AsLong is a Python 2 C-API name with no fallback definition in
Python 3.14, so any SWIG module that %includes this file (e.g. hmtrp)
fails to compile:

  hmtrpPYTHON_wrap.cxx:7351:14: error: use of undeclared identifier 'PyInt_AsLong'; did you mean 'PyLong_AsLong'?

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...t.i-use-PyLong_AsLong-instead-of-PyI.patch | 23 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0002-carrays_uint32_t.i-use-PyLong_AsLong-instead-of-PyI.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0002-carrays_uint32_t.i-use-PyLong_AsLong-instead-of-PyI.patch b/meta-oe/recipes-extended/upm/upm/0002-carrays_uint32_t.i-use-PyLong_AsLong-instead-of-PyI.patch
new file mode 100644
index 0000000000..d2703084ac
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0002-carrays_uint32_t.i-use-PyLong_AsLong-instead-of-PyI.patch
@@ -0,0 +1,23 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Subject: carrays_uint32_t.i: use PyLong_AsLong instead of PyInt_AsLong
+
+PyInt_AsLong is a Python 2 C-API name with no fallback definition in
+Python 3.14, so any SWIG module that %includes this file (e.g. hmtrp)
+fails to compile:
+
+  hmtrpPYTHON_wrap.cxx:7351:14: error: use of undeclared identifier 'PyInt_AsLong'; did you mean 'PyLong_AsLong'?
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/carrays_uint32_t.i
++++ b/src/carrays_uint32_t.i
+@@ -45,7 +45,7 @@
+   long v;
+   int res = SWIG_AsVal_long ($input, &v);
+   if (SWIG_IsOK(res)) {
+-    $1 = PyInt_AsLong($input);
++    $1 = PyLong_AsLong($input);
+   }
+   else {
+     SWIG_exception_fail(SWIG_ArgError(res), "failed to convert uint32");
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 9b809ce727..0257ae8ed7 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch \
            file://0001-cmake-Disable-using-Wno-maybe-uninitialized.patch \
            file://0001-include-missing-cstdint.patch \
+           file://0002-carrays_uint32_t.i-use-PyLong_AsLong-instead-of-PyI.patch \
            "

 SRC_URI:append:toolchain-clang:x86 = " file://0001-nmea_gps-Link-with-latomic.patch "

