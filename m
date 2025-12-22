Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5C6E6ADE7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:27:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88050.1766435260080602827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+gjF9w8;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2211183f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 12:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766435258; x=1767040058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgx3AVDaefpFYjIv1h2YIVjB9bIC+0nPVM9os9LTrZs=;
        b=d+gjF9w8i7jgTxm2TBm/sXgMh2Q3K4GaPQZgPq55z3DtBM37EA20CUjqdLZmGmN4Nh
         U+oNVoWo7354wOmu9Zafwu3+dLgCbRjOEl6nN4IQAXfv5kKZ5pl6QIFpgWwSi4mEyqr4
         +U7gYptjw5mHu2zNZNpsaC4aQPJkHg9wIsjd4huXrl1i69Sij5V9JYnUz/T6kLFZaBrS
         5c4ZyxVHzYQup9BLgXVXeniZjdARXkOLgWxWCB5cbJNqM7e6vJYBQA7WiA9w6vj1XZ/t
         yFxTZMCb6IEyYK9HJ1wXwmXjN/6ZHbCZ7Vg6LXWFoT9ZKmn4k8oZ2rPyLF6SlYhZEoPg
         nVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435258; x=1767040058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgx3AVDaefpFYjIv1h2YIVjB9bIC+0nPVM9os9LTrZs=;
        b=ipBSLnAF77bc75VYsSzmL7Sec8OcM/Y72gKNy822m0XwZv13S8fgb4QE/E5VJ5GrTO
         5xRhUIT78N3Bvh91alxNtDyZOsnAtf4pjULGVaNwMhVzFbeL239xq3JhsWk29KWg9qea
         pGljpfjgGTrxD5Xq9ClzQwbZ4iFjlEJpBg0b1kAVdL2B/QOfQGxjZWygTj6X2zO4o/0p
         tnzRxgLfcLwzp7AQy5WiP1zNOOn4L+2IptxPTCQYFfSuDy3zYU/uhE3FH/o5AZD7AfhI
         9C0yFseO9fbOFAax92O3+HXwhOwCQHxEcGhAqg8jJk/I5sKtGn8GXDQWn4FH18xb3Mic
         Qhdg==
X-Gm-Message-State: AOJu0YwkFHSX1rmzWKdgvtIvRoDbXqaHIEAPTnAk6IEaqhJ55mcibaPo
	kJzafyLoPEwwQs5Xfv+k/8yHyC9Z+qyViPHRMmpDHbsKggIaxYun8qu9+NjXxQ==
X-Gm-Gg: AY/fxX4AN4cW0W9A9hwpMmY2+JJysrZwls38+tNYO8HI+WSFVxxJyU8wvOyx/+wP52y
	GogPrtRZW4+0IT5HYZ9HGcaeojK1syErOXHGXAjI8+DqTIq2JEmD9aIEqDMqlGQC4emWAfWElNO
	75tI+wVqbYApdgPouOtkUtzrHyamsVE8M2boYAqQSK2ljnngvfmfpypbIZwXclUwYThoONVn/+U
	EUqHk0IfMfISWS38sx4VTHpEzqXTkYZBLkM+yVotVTZhlL3WLmi8TWXQllMGuITD18plGgvvnp/
	m4KhZsXeINiZGeFbkCwhAoNEgP8mHtDnW6lKpNXS79JPfIqrqxkMGWZuYbjOXSgMy4t6v+opYNf
	xDSaQOcoATdSE2CxzKDTvVdMCmcHe2+1NIOVM5m7FH1BVP55BzKb4PTLozQlH9IFxtFwLggrK6k
	NuCeMslcFo
X-Google-Smtp-Source: AGHT+IFNaEPZgFNiB4grzZjVWLDgiBrv2X1In0vBB0Jh7f3dYRNQyg+YgcIcJ0lCCnHtgPRd+3ZJkQ==
X-Received: by 2002:a05:6000:26cf:b0:42f:b649:6dc9 with SMTP id ffacd0b85a97d-4324e70997cmr15235487f8f.58.1766435258375;
        Mon, 22 Dec 2025 12:27:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm24204522f8f.38.2025.12.22.12.27.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:27:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/5] minio: ignore irrelevant CVEs
Date: Mon, 22 Dec 2025 21:27:29 +0100
Message-ID: <20251222202732.3363914-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222202732.3363914-1-skandigraun@gmail.com>
References: <20251222202732.3363914-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 20:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122808

The minio umbrella covers multiple projects. The recipe itself builds
"minio client", which is a set of basic tools to query data from
"minio server" - like ls, mv, find...

The CVEs were files against minio server. Looking at the go mod list,
this recipe doesn't use minio server even as a build dependency - so ignore
the CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df462075be855c60117af661dbce1836c652fc16)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index f278a728fd..511dd4d869 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -164,3 +164,9 @@ do_install() {
     install -d ${D}/${sbindir}
     install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
 }
+
+CVE_STATUS_GROUPS += "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: The vulnerability is in minio server, not in minio client-tools"
+CVE_STATUS_WRONG_CPE = "CVE-2018-1000538 CVE-2020-11012 CVE-2021-21287 CVE-2021-21362 \
+                        CVE-2021-21390 CVE-2021-43858 CVE-2022-35919 CVE-2023-28433 \
+                        CVE-2023-28434 CVE-2024-36107"

