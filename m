Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C83C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24358.1786747565863363424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UbdGmJfO;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so23135865ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747565; x=1787352365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAuuOF2qxSPMKn7MQ94LKu3OjWp0WOLewoQWLrSX1QQ=;
        b=UbdGmJfO5/4rd5nIRLh3lIUuXiM4lO903v314l/wQJeI7y2d6TAO5SeqBkuchByM2V
         a3YEf8wARdWDu8F8Fu3DJnniH8/PLPMffv6w1eMdW20f2wK3QpHcQNHQdc5ltm9kdWQB
         rqUp8zymdfNbKGi2f8JB1YjMS6AiYNayD8XjwmBLYSsXblzEvEfyOJoPLqAKXSW9wnTQ
         iCbVxZJHq/CAzW6vHujOM8tPqn9fUHgkSYxiYnMJKdiTx1hsK4XAWRDJbYFJeLznE3O2
         FDmnrRVBbFP3VQK7AKn8SP4ip/BcSDlnv75dD/29taHDo8SmZRD32f86L4VuHbYpoKbh
         7rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747565; x=1787352365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAuuOF2qxSPMKn7MQ94LKu3OjWp0WOLewoQWLrSX1QQ=;
        b=MmmbPeAF9XjzMQ+a8Qy6sdhkl7YwKQjNEFWYwIsooR/YIp4QmuLWKhgGa7khAN4XX5
         SHouV/ASJlVC/rIozfK4c9qgeeQkIzCjDNwWS0pq7T4gJSpcz+h1MSPlrwo2QR9Xq63T
         u9YzIbeJgUwyKJdu2lPBQ5XEonvNM9s3OAHZ6D2Kvkg9/4WfpvwDuXufLUGi1uJU4wo3
         ifWeJzyIJSc2Ib1PLXsOkH+AQ57PiFTZQxla5nqECwayJ4xA3bf0yzrJg4CxPYk/PzO3
         vTxPShXUNTESQm4FwXKhjtoUwBw2yHR5f0J8an4/TbbRw4XJikh1noKpvsFyVglT8BQl
         yPnQ==
X-Gm-Message-State: AOJu0YyOZoG1eY7yeWJCyHbS6uLdtlOPBbZiTS1aTuovwe45AeUCU+cm
	aoE70Zs1RHbiVNzUX/H1FZe84qHEWu/m6YWGAoa5PIxVU2gjRdwp9fwWzOxpJgMe
X-Gm-Gg: AR+sD11MluxcHG3YRGckoSgLpjjNwvSzTQ/UMhSE4xb6XmcYQsiHXaI+T9hza/lFnGR
	nC6gxfVo5pguTGopUTxNgcDGs0HUc38Hukce1QgAtasNWm1JmcJG9T8I2cgMThKQ8uZCn5YxlKe
	rCLZjMDbnbvi39MY/e/oIwkYWg9k+0OUNst/ONlhJKpvGKMDM+VWUmI+Ff91b/StoeakCMMuV5M
	RuM72k7NkUQckoxyqlSLLA4OfQ/rEVEth4xHdZ9ZHBVsJ2lIiFNY0ZQkkJ6rL+rW+JMvFD331/f
	LnNj83oZHNTPHq01VAMYW7ZeP76dgkPVVUpigyEHvM/vTuGq36Vg5nriBiTm1tJhyhjiJGwDRTl
	8Fi09YBqIge6k05nKBJ+ulHeq8ZQ17WJ6tzeeCSYfSroSXX/00PFAh3PmMCRjoKWaCmMulY1irg
	7bVeGLPZqCAhGNgO0lRrdLZlUwziBbe5TIY+i4+BAFP+aoftMWFx62p4H20xxRNs3vA7m+Qej+v
	O+uYsjxOpecaw95VzL201CpWZ92orYfnrWcWbTWcIr/feFziL/vUPDC/nFLSFrReMHqLQhoaYy4
	Y9HL4L4pNw0KOJ3DlEr9j8D87WVCFWN3w/uPKl+c3kNQmiRJdmqWetP41b5GAOc/eWPnc0Ebkac
	vvEttM3iaxdUZyDmGnPE0Yu6sBNzjRLXx+UN08hkGBO91Ug==
X-Received: by 2002:a05:6a21:599:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3cc717540ddmr10440252637.0.1786747565166;
        Fri, 14 Aug 2026 15:46:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 020/109] glaze: upgrade 7.8.2 -> 8.0.0
Date: Fri, 14 Aug 2026 15:44:06 -0700
Message-ID: <20260814224539.1523174-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129084

Major release that tightens correctness and hardens the readers, per upstream
release notes. Full UTF-8 validation is now performed on every read (RFC 8259
8.1) including values reached through skip/raw_json and unmatched keys, with an
opt-out option; out-of-range integers are rejected rather than silently wrapped
(the range check previously ran after the operation that destroyed the value);
reader recursion is bounded at 256 levels so hostile buffers report
exceeded_max_recursive_depth instead of overflowing the stack; truncated
non-null-terminated input reports unexpected_end and blank input reports
no_read_input instead of spurious success; and BEVE variants move to the v2
wire format with tagging decided per variant rather than per alternative.
Buffers that used to parse may now correctly fail. Glaze remains a header-only
C++23 library (cxx_std_23 target feature unchanged) and no recipe in this layer
DEPENDS on it, so the ABI-less break has no in-layer consumers.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/glaze/{glaze_7.8.2.bb => glaze_8.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.8.2.bb => glaze_8.0.0.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.8.2.bb b/meta-oe/recipes-support/glaze/glaze_8.0.0.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.8.2.bb
rename to meta-oe/recipes-support/glaze/glaze_8.0.0.bb
index 293adc1981..a96a729ea1 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.8.2.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "c2eef5e33ef0b0e221e8b2154f7988dcaa13f483"
+SRCREV = "be4481f4b106fc82f0b7bc85f6a92202f8c0dd59"
 
 inherit cmake
 

