Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2370CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17718.1763014839687081009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXvVizQm;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343d73d08faso478453a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014839; x=1763619639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX8ZaJLVZf4eZyrHnhGXJRvcdKXU3OSYzJ6u5zsTHkc=;
        b=gXvVizQmCkO4/UivPfEZ3wfmmmJB2H2NW53IQW9Hgoy3zVMPGQV/iy9ChkuD8tPpy+
         FViM88GL/PPePfd4wBdBvMr2EenHl3IFzzl9ZYWW6LleHYgZeVPv8SLmZg14KjIEI2Ju
         s+rA0WINmeRuEXqjBF+tmIAA1mXjo8znAZJ/9f8CbYmjx2tnZ3cselokaE4N46z4Dx2X
         fIxNyRXHhepRGj9zrKnhjc+3PxkMjbkfTx7mIxBrHJLGE4qEu9fQdEEmLrX48RAK5eXR
         TsiDKHjzcGihMLthy/h13R2WIsDCBz6+YWAhZ7OAJxQEkAXiN6yO2ZLJml3NxJvxbdxR
         Zh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014839; x=1763619639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vX8ZaJLVZf4eZyrHnhGXJRvcdKXU3OSYzJ6u5zsTHkc=;
        b=so5c3dfmYhlIOrCue5x/vWzqc7gg+IieKjBY70zZY6d2ZqThF+2WAwykNviuFxY0On
         a/LKJgcPjsyJS2cx1/frh1iYuNsgJD07YcRdbn6InPKUJbFvyA9BNiloeWH+cxMcNbex
         Z22G/KzP5kQo21mDhMA7myJvdfp/g/f2BhS6WYxSf1jaTgV9odc2FrqELxpI5KZsljua
         bDXfIJAsACMgr0ADriU8A2a6iH1vwJxJ9uV3oRizM6FgkWgEcQ81hJCf5L2mXgP+WkW/
         0UWzEFq4Jx1wcxQINx3WOLQ12Cw9c0J0ZJvicuK+3seV11AVD8qbmuY237z4bPjOdK8G
         UjOA==
X-Gm-Message-State: AOJu0YzgaLbtgvSslmNlx/jCBN9XyHxKHqAEe7cXpWOVdH5WWpv31+YG
	qCzup/31xU3kKCEj30F8YcgQj4qKTMEr9cq8ugQrqQ7NW9hBBYlI781AxADLbA==
X-Gm-Gg: ASbGncuPpA0GoYBqbW9Udw7TCgqeMeRjEQ7Uls5pAKNZZiQQhpuJMzCxCBwW9iMTRZz
	i+YZ3jrwn1Ap0OXOxGNGvJBdWjbblklncPFkHXIcgVBtKiV/emnz1OhUWOwcS/lQY9P7X3FMYD6
	DUuT/DP5uF3jO71h6obhXePgR8cthiH4BemyNOBUD6N103at2yz/9DWMl/66PRYg32qeV5g9xg9
	wigsMXDWNDQDI1bkORwJ3/ef9QB+yAT8lLhtsdl8fCLCskakCzAqPL5fmDT2wqhdY4vkxrMG5kz
	VDfULXYBYmH8zZArkusALpZekQkgLsOBnJCoGtF4eQ/UysROZQMAxZiWPAXmpEO0AAaixYQpfr+
	Jz8Bwzq16FKnhzi6hPWvMnUhGIqDzrlRDC82J2cp9VDA+QvlFxX7Gts/W/+XYg+kKvdmEap3xg/
	+XMDwU0OugX5tUzA==
X-Google-Smtp-Source: AGHT+IHNk3FV2cEOj9DuqZx4+PPweGcY9syYJaOhuVDwTx6v7OV27H1fC4ai3TTMUjGIHqVAntHbgQ==
X-Received: by 2002:a17:90b:4d07:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-343eac9cd15mr2315367a91.10.1763014838901;
        Wed, 12 Nov 2025 22:20:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 23/38] libbpf: upgrade 1.4.2 -> 1.4.3
Date: Thu, 13 Nov 2025 19:18:58 +1300
Message-ID: <20251113061914.3756301-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121621

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix libbpf unintentionally dropping FD_CLOEXEC flag when (internally) duping FDs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8fc8a8ee0ecd33bfaec8b907c0b2d391c98149f0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.4.2.bb => libbpf_1.4.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.2.bb => libbpf_1.4.3.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
index 928482ba36..665585d0cb 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.2"
-SRCREV = "1b357586a7a62db7fe27af4ebe4bdefe6986cfd6"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.3"
+SRCREV = "f8c6e0393d4be665fc0b584266b2a1354a71835e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

