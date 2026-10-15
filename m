Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77566CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:39:09 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32489.1792039148382998186
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b0Z+HBra;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f1f76ea84so685201eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 21:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039148; x=1792643948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMzmZ5sUSRYknaxtEsEg6kBiEPjZzvn2pbn4MJW4ucQ=;
        b=b0Z+HBraYro9z1tlvf99EPdeYqkKPHA7nazNHRqFNgczUSe3oL4SY3u0tVSl89oM9z
         aDhYh+0xwhDY+W87a+QCLbi6qAvS582Pwfy2TR6LJBLoI0m2/lR5Zq8RaH/CcDhXUnq1
         upWx5bmTq02z8fcWbcw5zwFEM/IgO0r4Zs5J8wiOB0f7QqbWn3N3fQOB++gE7G1mXw8n
         xzXe8PhaN26fZmkrb539xQNHz1UOxEB7v89ZoMinXHyl1rJf25kQAwSMzWCJRMSaYQMH
         LxeRWM2KH0aCvQTyGkC7jwsBFMeqtk6DJdz7r9l153Apl0XYvvHkYXa0p1npVh8jB7an
         6hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039148; x=1792643948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMzmZ5sUSRYknaxtEsEg6kBiEPjZzvn2pbn4MJW4ucQ=;
        b=INnpdgr064nWY4DCt6/57rrwFvVxSSjKKVAVoac0MeeFBxnS/VVEv4xVr/WXOMjtL3
         xdIXSsnT2f46vPSG0dKJgzLVHQDxywPBrWTyomLRtead2c42wz887lz8RgAk9Rkn+0Q6
         XLypQ1JgTW9vvDiTn9SO8VbOS1hplfLscDyj4NxbnOWauA8bIXh5538wJheJcmhEZu01
         7B4Jv1syIjGuJJZNMp3UsiHCij+MUeQT35Bc2zG3XJVsMzUJjEc13gOiHk1r00uZ2MZ4
         R+wQswELGFWrv4gDRK+ZQpp2LxVBdUSOQXKx+CwaeRyJkF4h6aG22CLeESB+YPirAhCN
         mUMA==
X-Gm-Message-State: AFq9FYIl80KTg1ODgFItGbg6XzOMhJ75k9MhnOHYj02JnD+RHcMM3oCA
	8kqP4tXLEmsGrsERLCtRIs+tqOwrG2Gz5+ChYRZh4VSJ9YJ4/fUFmilxiOjQsOHzFS4=
X-Gm-Gg: AYBFou30lnHoKvQyui/k+5bVe2fQ6D8S6sXcbwG4xPLShT0dEZ948E3LRURdlC9mwTS
	5D9J4sCEtgj+yeCXk6NvKAY7iMpRJC/tZEkibmzDGnGttBlvM6TbyxUM3n1In4fM8/sgKZ4ofXW
	liQj22ehvNH2GPUOwvNBtldDZ2RQ+tsejxH+U1lmXuvdyI1XZ6bud3s9TcomMnBsja2KRaYS2vn
	IrI80XxtoYYSdGdsA1boY1t06+IQly2qTobDbCV4IsAqZ0i6n2BDqqyYJ7FdGDfAe6tkUj61/bI
	n4ZQxNZ5gKdEmrYdZ1tb0m5VWirmDVZRB51WdQMly2cv5tMffpxmWPCRHxb6x4BnJC4QwVaeVaA
	hLKlTOsFOhnaBQ+N6QWubZYZMT1m5pbdvkc/AmmfN6jnrF/r6OMsbicfT3DWL5noRkFw/gPqZuW
	WAa+nVIJvLVP5SmdtRcuEqWaIn362hofOapfPfIDy49LJNk0QoqdU5YUU+37sKlUCYiNTiTQ9yL
	5kkmeuHEftbS+CRi56IOk2/4hel8I8lxWIMijTAUaDUPF9z75WKDtrDAyFE4rrtvJNENViaUzte
	ChZjo/BlnL5uSbqkjyXF7wNMUm3M5a4FTzmWq5yDuzbQgngF+WOH2qHpjNandnc7GOrTKVWhwpH
	rQd9t0ezXTFNAhXf/2JCoyVCQkaYRzHXhtwjBwVtrtA7M5Nib2rXBWStgayAnC1X+Q1yME11IYe
	P6RCguCehJu6zdLWFZFqyiMUYCUOnslsZk5nkXIY3YB2OZzBQXaW+gakOE
X-Received: by 2002:a05:693c:8643:20b0:35e:fd8:3201 with SMTP id 5a478bee46e88-35e0fd83708mr5130054eec.14.1792039147579;
        Wed, 14 Oct 2026 21:39:07 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm49199424eec.15.2026.10.14.21.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:39:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] kmscon: fix declaration after case label in font_psf
Date: Wed, 14 Oct 2026 21:38:59 -0700
Message-ID: <20261015043859.3073445-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
References: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130912

kmscon builds with -std=gnu99 -Werror, and clang rejects the
declaration directly after the default: label in font_psf.c as a C23
extension. Give that case its own block scope.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...on-after-label-for-pre-C23-compilers.patch | 31 +++++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_10.0.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch
new file mode 100644
index 0000000000..8bfec26d4e
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch
@@ -0,0 +1,31 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 10 Oct 2026 00:00:00 +0000
+Subject: [PATCH] font_psf: Fix declaration after label for pre-C23 compilers
+
+kmscon builds with -std=gnu99, where a label (including a case label)
+must be followed by a statement, not a declaration. Clang rejects the
+"uint8_t i" declaration directly after "default:" with
+-Werror,-Wc23-extensions. Give the default case its own block scope.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/font/font_psf.c
++++ b/src/font/font_psf.c
+@@ -394,7 +394,7 @@
+ 			case 0xff:
+ 				ch++;
+ 				break;
+-			default:
++			default: {
+ 				uint8_t i = utf8_len(code.map[0]);
+ 				if (i) {
+ 					code.val = ((uint32_t)(code.map[0] & (0xFF >> (2 + i)))
+@@ -408,6 +408,7 @@
+ 				if (unicode_table_add(self, code.val, ch))
+ 					return 1;
+ 			}
++			}
+ 		}
+ 		ucode_idx = 0;
+ 	}
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
index 400d9b5f59..3ece44b175 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
@@ -26,6 +26,7 @@ SRCREV = "68fc8e1b2601e816e3a4ef95e3d8e700677509b9"
 SRC_URI += " \
     file://0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch \
     file://0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch \
+    file://0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch \
 "

 inherit meson pkgconfig systemd

