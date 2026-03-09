Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9E0EF371D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:48:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9633.1773046121450628291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QnV6ZodR;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b7c2788dso5627877f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773046120; x=1773650920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2GD8fiCXFcVA8HfX9tTcVZ1J91Zj9RJXhyD5/hIRvY=;
        b=QnV6ZodRvCuILw+vlopfi2FSvl84DU4vHhgH+g94ZaZMKGNZSpv1I1OJ7GfR+hHVzX
         FDdpgNLDrDvXvvKzBjWQgVWovz24grISmlZxb+k/5pWaqZF+jxLS+8kyh3nfhkyLdjOM
         juHy6TDAeCksyYfQV5N1S9jq7Vp7DpkzQYRuC7QQqyQHaQfwlxyxCwnpyBNy5ejjwYfl
         a/d3AGxVf5SNDegHCyTZgomHP/lBJxlDwODWKo84b5YDi1YpNQw+/SoK2hRJdI4zIq0/
         xiq9bFc6TovWzqrIugpLlurVtyOMbwxwZSSxJQnszYRR6RR9uIqs82DmhCBulxY6P7PZ
         lViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046120; x=1773650920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2GD8fiCXFcVA8HfX9tTcVZ1J91Zj9RJXhyD5/hIRvY=;
        b=fXE+o5AJp5tmBfYeiaO1UUuinX6vwoO74AKSMuVCHfPIa3CAHMAtIiy4oZKcQWd+VO
         FSe+Z3QAEM+XNs5AgmcCin0vZUuj52+YYRzP4nSqQSbQ5m/HNgxhUOMDQAZEBSQHo8Gg
         5+DIPCqeJ7S6zObAlmxXNC4sWV8rnlEehNCQ2gI6Kyjkethh4qYLEP6Zwp6L5VF9LIqO
         yfjTbj6EqHRqVItQ+1helvgEEQ2V3BKODmHQ+TW09vokg7pzYeLtWVS9gVGTWXEzyQnS
         FpI/5rYevpBKp52J1hxoTn/zqPxS4raa12CiB/+EaV+Khd85x3QGWY97ei4z6rev8e9/
         lcMg==
X-Gm-Message-State: AOJu0YwkOqi6TOiE/YKprwxAvKcX8SHtLBm0Sr7ByLGta5Y6XhmJM73B
	b40caXA9JRmuPGkX6LasaPaMEtJ0ux2hMhHBXo9ZPcysB7xmCM4/kUzfLHbVXQ==
X-Gm-Gg: ATEYQzyKNJTPYIMeqO6S9Sr287DciI4EwnnscoX8vDpTXrTFlNy7NoHDB5QCWQoZq/k
	ftEudNM4RsfQkgwL2O94PxPQNYUiMmXu6GDh0j20P8kpGomiDT7uQYXjceUV6KUgb9JlYCB2NEa
	EVvMsV2QrAbPDnzeCRTRJURXELnEy4bYLBWwzv11eOYsUfVu2J9/eZfH4LLi6AwcJK0oP4aEq+3
	eOSeE3VgXTmwlD+zcWdgLugeK1uNqHK1fFXp/ysAR5mQ+iUHPUAhimByJPT6UasgSVlXsgjnlpz
	jW7bh9Da02EAenzKfDw96ya367EyuxT36Qj5ZdF2u2YHmxuFQNdBFH+pDqrgNzx5EXUxT4HY8Lq
	66I3weULZgWJxmuhNFIBDVhngDNDmaLRidWSzpBjuTWFil58eeRDawCcn3X0dxO/1sE4xwjaHiF
	p/q9Fq3Yyx0bbtTj/F155p
X-Received: by 2002:a05:6000:430d:b0:439:d74f:2109 with SMTP id ffacd0b85a97d-439da680676mr17334555f8f.49.1773046119622;
        Mon, 09 Mar 2026 01:48:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm26850386f8f.7.2026.03.09.01.48.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:48:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] aom: add bindir to SYSROOT
Date: Mon,  9 Mar 2026 09:48:37 +0100
Message-ID: <20260309084837.185189-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309084837.185189-1-skandigraun@gmail.com>
References: <20260309084837.185189-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124960

The cmake files files installed by this recipe check the existence of
the binaries in ${bindir}, and throw a fatal error in case it cannot
find the expexted files.

Due to this, it is not possible to include aom in other cmake project,
because it errors out:

The imported target "AOM::aomdec" references the file
|
|      ".../recipe-sysroot/usr/bin/aomdec"
|
|   but this file does not exist.  Possible reasons include: ...

To avoid this error, incldue the content of bindir in the sysroot.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
index 141b02306d..b157dc79ec 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
@@ -25,3 +25,5 @@ EXTRA_OECMAKE:append:riscv32 = " -DENABLE_RVV=OFF"
 do_generate_toolchain_file:append() {
     echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake
 }
+
+SYSROOT_DIRS += "${bindir}"

