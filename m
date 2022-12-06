Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E201C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 03:51:09 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.38819.1670298663537454867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 19:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yyx+NATV;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id s196so12293925pgs.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 19:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXI3Qsdpf69t/0Ws5Bkv79CT0LV4ppOT3igNs5/hYr0=;
        b=Yyx+NATVgQmxxGUmHWGBasK75qMhnyNLGsUZP1YTVjxXEeHwwbMZe65Ej3a79av4Yt
         FMNzfvpZHnX9Frv/tKsSBBFcvJJ+Ntxh/vobg5ARfT1pNUGRb2dHJiDgYIaU5U17ZZ/5
         e/NcCgKhI0tP/AgXcKPdgxqvI435Ir1H4eIKC8vSyw7nzN61fbYH7gpaclOZRJzH+LEV
         xcgWN15qphMUvDg2dKXth+WXpPrnNnMeKvoc1qi+pVJiYwmj2ILvfnbXV/l1gb2R0KQT
         1nwOLQMtPlIeA4byVlwmF13JJKpPJCTA8ucSxLGGYAvjKxjBWJhvjtsFBOEdQhgrUy5j
         3mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXI3Qsdpf69t/0Ws5Bkv79CT0LV4ppOT3igNs5/hYr0=;
        b=nMjFxS3Awg8kpv+et0DBoubVTPJKk7HYBEMGTKnp8f+2uu360IAaVnE9s7Tvm5iYSO
         0TkVJYcpCHXC80GrRkC6gRWyuDvtASdGCbaisN5nhDPiYEsKt2t5hsa5BceND1OLvuP0
         AqDuYB0pR2QAN0eWfXSBsrthXEY/0gEVYZF6OgA9A2UcEhOB4QH0HFT9fImXCTVyHDwa
         mlG8Ta3grMqQJqjg+deLigFnQ5U8I+4wWYsnQayx/27P17ilkZagfdRZT2COcwSUmhEb
         FVXoP7gEMhut1HSIchT/HvsJxQAObyWFznAsIVSE8ADoV7SjBFj1hNGq5Gt146PqLJ+t
         Qj7g==
X-Gm-Message-State: ANoB5pky5vIljIy1oa4XdHfszdmxKZWN7e76ok0Cpsz5DeVOjUJ98Yyp
	rnBNIKJNixNkZXyJxrJT9IcinGs2KtQ=
X-Google-Smtp-Source: AA0mqf59Jr5HZYm9w+DJImwwwjlAdtx/m32sD9s1z2sVCR5/XNfKaMpB9tlDByJlcahlv4QQBL6q7A==
X-Received: by 2002:a63:155e:0:b0:476:95a8:de91 with SMTP id 30-20020a63155e000000b0047695a8de91mr58484114pgv.102.1670298662754;
        Mon, 05 Dec 2022 19:51:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id x31-20020a63485f000000b00477055c6d85sm8872670pgk.22.2022.12.05.19.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 19:51:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sip: Add recipe for 6.7.5
Date: Mon,  5 Dec 2022 19:51:00 -0800
Message-Id: <20221206035100.1876852-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 03:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99955

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/sip/sip_6.7.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/sip/sip_6.7.5.bb

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.5.bb b/meta-oe/recipes-devtools/sip/sip_6.7.5.bb
new file mode 100644
index 0000000000..fb42ef476b
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.5.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A Python bindings generator for C/C++ libraries"
+
+HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
+LICENSE = "GPL-2.0-or-later"
+SECTION = "devel"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+
+inherit pypi setuptools3 python3native
+
+PYPI_PACKAGE = "sip"
+SRC_URI[sha256sum] = "9655d089e1d0c5fbf66bde11558a874980729132b5bd0c2ae355ac1a7b893ab4"
+
+BBCLASSEXTEND = "native"
-- 
2.38.1


