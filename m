Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16DFD13C05
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18919.1769432715017247446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrSpkZWc;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4200865f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432713; x=1770037513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZoKvAw3hakVmxRBdH64AtBbHTShWZdqdTLqfR0j1h4=;
        b=WrSpkZWcvSGRcfF9Y/ZqMwC1U4rCi3gET2yLEeTfcjtvfbgHwNTATE8xUJsSdhJ9es
         5jW6ZYVEFrBst+u/RqXRl8BZ6MLgb1OKpZiQMfEy3xIgsxl2qR52cshxe2rR5/kv9LXf
         vLrvVJD8KllNv5dXP0etMcSq9R0Qm+4vpAXMD0oUHH/9bj5ywH/fJeh4dh95TZAx+msy
         bcAjixAouM8WxN1TeapmqSIvUPO12erIO65tMV1k7LMulMMCOowO8k8EJYu/YNFxBMQs
         +HhiSjF/3zAWWzTm3Ij9+Rr1VopAiJ0AFjQeOkTUcaL+lmU664QJrsK9+whl6WBz53Wr
         nvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432713; x=1770037513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZoKvAw3hakVmxRBdH64AtBbHTShWZdqdTLqfR0j1h4=;
        b=JscyBC59xwpOKMu4E1B+qbAqHOXutYnaG293XsIFa9R/ocfeEbg5b4KJ18ThSjIwW0
         8QkGuYDthf/6Bv2PRiijSQlz267tmBgSrBLF5AouRJkvY4LcGyK4Qz3xcFpQFMJoF82E
         CzeBsF8RbfMWUnPDT7YnuBz8SVTgDxDUaoRZzmTvTppYq1FaAnCm26IPQF9oxLTXSNRQ
         EpVRpw/41ZmEavO1HZf+L3HF65yRSNWAHpbtPrbCfLoThKMThV7RIajiiDdozJNP6sep
         m4t3wTsi0Wl9HOSpMOSe9+DBPH5DoP7Qcm2RuDUs3wAQQsvrXsAZrpfeYPC12xkX/xY2
         VrqA==
X-Gm-Message-State: AOJu0YzCTI8zSXRMHs1S5BZ4R0+UqR/ON4wM/Z6PYd84yyOqJ1xD4jww
	bNzTl5z1eDqMATxsy3ecebGveoTz8HHpDfrIpZP/EeFNQ/u8YPqaRHfizm+MdA==
X-Gm-Gg: AZuq6aLuALYngBYqtt05m+J9DfysEiJ25v3DMv2t6FaY+YuwXOMpWLBHlhDnQA1Jfg8
	tF9jA1idPbmERoZ+b5H1nrhg9cQ9DrSGc8TXd6U5zMulx4+DYYYKqJHIZVq8Gzxl4qmnx9YC9lz
	fxGsl1al95KUNO0r8jENLcVeMRlU0qs3QXHCZHwJNGPn0IBF9m20uG7E783RGY1vVD0jXgFHRoN
	I1XjDuzw5wJXo99PtPIjqPByPvuK5jr/rTQwhwsPtvkCxVa3iW4WBbzThoK0tZ7rfVWThHu/ZK2
	Qje9VSJOFKQRMcp6fDC6hTgOrjn5efEInw5i4UYIPOeEw4fN1fXcCF5zIpPsop1TUDBFBck27C3
	9GS8aNhTjtiCH/SaMbqh6eCHdoQClccofZk6We47i/ZRs3s2J6mhbuUt2ooC1LoEfuPxxlIK8Wi
	VxTafqWjRd
X-Received: by 2002:a05:6000:1ace:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-435ca193bc9mr7535370f8f.29.1769432713210;
        Mon, 26 Jan 2026 05:05:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 08/11] sox: patch CVE-2017-18189
Date: Mon, 26 Jan 2026 14:05:02 +0100
Message-ID: <20260126130506.82699-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123885

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-18189

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-18189

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-18189.patch              | 34 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
new file mode 100644
index 0000000000..3ca829b230
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
@@ -0,0 +1,34 @@
+From c9e266bc77952c873a28ae320dac2eae5cbc9934 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Thu, 9 Nov 2017 11:45:10 +0000
+Subject: [PATCH] xa: validate channel count
+
+A corrupt header specifying zero channels would send read_channels()
+into an infinite loop.  Prevent this by sanity checking the channel
+count in open_read().  Also add an upper bound to prevent overflow
+in multiplication.
+
+CVE: CVE-2017-18189
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7a8ceb86212b28243bbb6d0de636f0dfbe833e53]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/xa.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/xa.c b/src/xa.c
+index 81a7677..9fc086e 100644
+--- a/src/xa.c
++++ b/src/xa.c
+@@ -143,6 +143,12 @@ static int startread(sox_format_t * ft)
+         lsx_report("User options overriding rate read in .xa header");
+     }
+ 
++    if (ft->signal.channels == 0 || ft->signal.channels > UINT16_MAX) {
++        lsx_fail_errno(ft, SOX_EFMT, "invalid channel count %d",
++                       ft->signal.channels);
++        return SOX_EOF;
++    }
++
+     /* Check for supported formats */
+     if (ft->encoding.bits_per_sample != 16) {
+         lsx_fail_errno(ft, SOX_EFMT, "%d-bit sample resolution not supported.",
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index d49ac822b4..8606eb6c0f 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15371.patch \
            file://CVE-2017-15372.patch \
            file://CVE-2017-15642.patch \
+           file://CVE-2017-18189.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

