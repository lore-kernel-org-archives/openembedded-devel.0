Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11823.1795763014841366066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=b40bJXk1;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so9015845c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763014; x=1796367814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRw08ctZa1u/t+0J3BK+BVpFtLTR3p0pqXqIy899rgA=;
        b=b40bJXk1jxu7uS3LiujJy2feEfXX0w4eDqx9c8IwHu1rtMNDP1YvXWr7GvNxWNmewI
         a4ZqJYLtKQv8HWmJqApT66CGd6eyhQE9rhBolHicuKrQdS3ua/hivHo8SCo/vXg7c6WR
         r1aNCpD0vSXLFam0LTdZTCKJ7Tue41w2CdH57Y4DMOz2yVCZkKoaGiq8QGc2ntkAcUr4
         2OR4RaBJXhVQgJNAId03shem94cOSIPZXy1hI0PHogPtvqxhb/t+AatILv5VxzDfg9c6
         HXnu9J5bbk3If4UQ764GJoTkhli+k5Y99fIJdJGGCUXAGNMaippWZIlVLELuKlVOvzBt
         mePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763014; x=1796367814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRw08ctZa1u/t+0J3BK+BVpFtLTR3p0pqXqIy899rgA=;
        b=jxnzl481sgArPNh2YiBUeBE0T7Kpy9MHC1NVRJqoexmi+KrV60IK7GypWOZZylaSGm
         n1cAyon7RArGeNW0ngQ9YZfDjYrU/ATD+0r/pQEzZHG+v0DEJGTh8iWvbrrvd0tUPwBa
         uWSrAps4kPafmthLMTw/xROPBjbM4bUc+D3u8gHesbMZe5ocf95gUt9hmOPjw+1dWGdG
         K2UbW1KphdshlVJIoPuKOUJo6gtUE7899WIWI0YN8Ekz2leENpg+Ec4Y1AT4Zvv/lZd6
         2QtlXvJVjQJEINaSAjdw5rCrjmfcKne8ikpCtIU00Uu1G3R2MjZECMi2UXcYHz1fTjRN
         1Gmw==
X-Gm-Message-State: APuU4Z/7jnIWt5ovN+J5fKGgJgbAmIzkxDnxfxLzl1Lqm3GxwRgnKABR
	e9PgSWSGpXKDCzjKHYS07kXNygpuC2gAKeTvtD+A7KvxkS6AH+59Ds8VA2laXijC
X-Gm-Gg: AZFdTZfkOLhOajw3PgSpeN5x8LEH/N3cBOWCctCS2OTl384NY4vTot2gjoX8EQaYEm+
	eST1s6aNNHj6tqGag7hQAu+LCkyVtptFPw9WNzx80KepxN5BsN+vTOmhAnQn7ivIxrNPsUmM5/D
	Ovdh336Ekvl3oJIFVRDEirldPSh6dV+cSbG4E9+rs2P4PDphdIqUpBoGsQr0+oJe2se9P+UUPnn
	IU3BrlSJcJ4srlZCIyxDRI3pWV2geE5k+c2fCWq9ARmRemXoqwbUlwL32ALPFp0r8jrghWIksiG
	TFTelgDopMBMKl58jPxC7oMfcFuM62fxg2PWyLSQKzgFTDGG7ZMV3NGa90FtV8p0iPkPVCC7Ijd
	uXpWS5TdvQd4+LJwM217NCVlyb9a5EAHxD5P2aZLmCLu3NjrQlkoH+HzFN9cfm26QvUzFiTIqVc
	ipvY09CL1p4fT+idtpYfZxzA91md7qorDj6+2RIxKsbuVdc9TCokFvNOTYc+1qzlaFjoL8QW72W
	69ApH6CZc3cBVVj/9DrtuHdYptXj7z0RoyzK3BRy6kbSpUWttQmnlsFJU12CAz1lyQokJO5Pomu
	i3h1FaUO0reZZJscEIIzwar9BXqfEp4Bun2XpQz/qnrenHPxl/9OnFD/UEQfLja03MO9RfBt8/B
	9DNfzUjA9QQ2wtWz88Haey/1ppHBEs8+Apm6dYZmYwdZ8VX4fVt23a+VTIcvRSF5LuBymd2MVes
	9Nu/RlLGPgHxszhKigrAFh+05CSWvXkcOBb3HX88OyrNlMwdAEBZjpLancXzO5uAUddMYl9j5MA
	vn2md9woWg9rS8ht7uCmkOwIdBk4Z7nC091DWmqHv9GX+E7lIJYE23VtfVaKQ7j6UXa4i2Vr4aB
	s91y
X-Received: by 2002:a05:7022:7f18:b0:1b3:9b4d:85f3 with SMTP id a92af1059eb24-1b5568a28a5mr27473490c88.19.1795763014160;
        Thu, 26 Nov 2026 23:03:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61327766c88.13.2026.11.26.23.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH 2/3] kexec-tools-klibc: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:28 -0800
Message-ID: <20261127070329.2393585-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
References: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133362
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up the v20080324 date tag. Match only
vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index a6ef7a4d66..a532b10c47 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -14,6 +14,8 @@ inherit klibc autotools siteinfo
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;branch=master"
 SRCREV = "15d78e5799eea7ec5ea9c5897ae95aaa0ce8970c"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 BUILD_PATCHES = "file://0001-force-static-build.patch \
                  file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch \
                  "
