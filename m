Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7048FCCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 14:53:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14115.1761058432750719207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 07:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUBDrFIM;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so3029945e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058431; x=1761663231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7geCl3h1wM+azRbUb5/nw8tzJVUBoQSVSr7Ozf/z7U=;
        b=lUBDrFIMEOfXChBp8kvOyxP2jSvl3dpEJVRdZj1f5LrBPNKn2UdosSwBxo4w/h2FIS
         2AaOrBOgj8pFTASwjDs6j6EGiPClyel0HpkEDG7ee8Lz1LDYlLrZIjPpG41YCw3Epjpe
         Jbzx7MgMOnVkKbFJP93ZJCehtcyT3ODZxU7FPUZA5aeGi0ibQN6AVjwpC3/X5KabVJBq
         c14BB09bny+riIISZI5glfkyZIfm5D5pFSA5WyHxUUR69xnXj0sdMHamWumSl02jEdNg
         jbHUo/f3tTu8vmjMq0CA7g2Hln0SlRzsFLMQLSZ3NH+2uQAW5iW4BH2dpF4JeGzoDAMw
         TJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058431; x=1761663231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7geCl3h1wM+azRbUb5/nw8tzJVUBoQSVSr7Ozf/z7U=;
        b=hYtDo7LNt6ZiYDEMYgEEujK9BrPwW5gy0vW4TvemM70A8bBRXf6OpYJSaLbpnkmA4m
         2YlxDS+fG0/iRfSXkcUKL3O18wFAjtQCwZMsY5UeShLvbp9ac/+4Q8wYOhPKkcSSfK86
         KWWUbHpwNZyo3zj4VQVCC1xuQZ2Yb9R91/XWLUabdvSu2QS4k8x2I5ntx1ItkUZ2yAnW
         K3jChKh7/6lcLRPoTj56WZKYwdZFXdMo6188L3WUdHQfx3GROuTyjxaeXWoGLirMrB3L
         0GhWDX/SuPSrrBPR+RamM2NNj1DQV+1j13Man4b5X3hZ57HB3IrJH8/vExs0+zA39ft+
         ZhHw==
X-Gm-Message-State: AOJu0YxBAOvyV6VClxepU+9VItnGhAfGlLVpjAatJMwLJYqfzzu3YAOv
	wk7c2ZXeEaEIhDHd1e/DzNVSiT5f684hixz7oZCOWlt0JOwrI7Vrp/xXqrN0NA==
X-Gm-Gg: ASbGncsyRGjkGT5AnzBUXfSHXMSYT/J5/H68bx83ZIk+AH3uaOfVlc7cnMr0/LO1ApJ
	cVAwTElCF5s1n/4Y9mvzKkYEVHS5u/zkmKD3TzGgXrRDdu70ADeovQA/ebQDFUJ1EWl+E/hU6o/
	PfY/j3XbieC+1A/mb6afpH7qkqgvGd2kt2bxKRw5epFa8+TPIagmli+drOnA2L2PWu7WCuXQc/G
	Rwih8LZMElBBlc/Sf46zD7deS+QuIZExECJaHxPls7lnuVgSpb8BQwg+RHZTTq0ffBwvZNOThMn
	G1VW/SC3YsHsODQWfaizFu6XXLnPJ4BWTecrOuPKFDO65/bixxta9x5rqNsFpsfa4xu9ppEZnw7
	8sEzmO9KH+KuMbTek5PBZDhuAm36DcLAAU3NU6gtbVzdHYapjf/RFSUa9PL+An8wJr3CWSLrqXE
	bKfKXcpGUY
X-Google-Smtp-Source: AGHT+IFBy0SFCl4010/oYrjCkqdMGdLJqidQwpbus73bJsA8AwSX327onUkuJfpgHJNwpFrOTtv+aA==
X-Received: by 2002:a05:600c:3f08:b0:470:ffd1:782d with SMTP id 5b1f17b1804b1-47117876a19mr144162105e9.6.1761058430847;
        Tue, 21 Oct 2025 07:53:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm283259535e9.11.2025.10.21.07.53.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:53:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/4] wavpack: patch CVE-2016-10169
Date: Tue, 21 Oct 2025 16:53:45 +0200
Message-ID: <20251021145349.33878-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 14:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120835

Details: https://nvd.nist.gov/vuln/detail/CVE-2016-10169

Backport the relevant part of the linked patch.

(The full patch contains fixes for other vulnerabilities also, which
were introduced after v4.60)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wavpack/wavpack/CVE-2016-10169.patch      | 27 +++++++++++++++++++
 .../wavpack/wavpack_4.60.1.bb                 |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch b/meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch
new file mode 100644
index 0000000000..22dbc2648c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack/CVE-2016-10169.patch
@@ -0,0 +1,27 @@
+From 847968ff66f0d743ed2cf3d5f1f7d8d8dafcf42d Mon Sep 17 00:00:00 2001
+From: David Bryant <david@wavpack.com>
+Date: Wed, 21 Dec 2016 22:18:36 -0800
+Subject: [PATCH] CVE-2016-10169
+
+CVE: CVE-2016-10169
+Upstream-Status: Backport [https://github.com/dbry/WavPack/commit/4bc05fc490b66ef2d45b1de26abf1455b486b0dc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/words.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/words.c b/src/words.c
+index c87b8d2..272760a 100644
+--- a/src/words.c
++++ b/src/words.c
+@@ -1117,6 +1117,10 @@ int32_t FASTCALL get_word (WavpackStream *wps, int chan, int32_t *correction)
+ 
+     low &= 0x7fffffff;
+     high &= 0x7fffffff;
++
++    if (low > high)         // make sure high and low make sense
++        high = low;
++
+     mid = (high + low + 1) >> 1;
+ 
+     if (!c->error_limit)
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
index 021496bd43..8dbeb9883c 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "WavPack is a completely open audio compression format providing l
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=f596650807588c61fcab60bec8242df8"
 
-SRC_URI = "http://wavpack.com/wavpack-${PV}.tar.bz2"
+SRC_URI = "http://wavpack.com/wavpack-${PV}.tar.bz2 \
+           file://CVE-2016-10169.patch \
+           "
 SRC_URI[md5sum] = "7bb1528f910e4d0003426c02db856063"
 SRC_URI[sha256sum] = "175ee4f2effd6f51e6ec487956f41177256bf892c2e8e07de5d27ed4ee6888c5"
 

