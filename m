Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10232.1795752928966489288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UhifomrJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so11891992c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752928; x=1796357728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0apI8pTNw36G4DXsCglQEO7Cz727zbrwGtPTw/Iq/Ew=;
        b=UhifomrJdy3np6AJAnlREX4jnw2VTuKXIQ9qayNVmaCpj2mOlQdy+8fWIVM5GTPWV6
         YG0QvchZ2hcszPTg184oymzXDk5ECh74vFIclBgHPTvP+ja6gK/RU5KwrVeiYXB3tMu1
         0zPuO1O2lC9p6d6zTT8ujA6M6eL//H3ZW7+9q8YsjVZtNApgvMREDIj+FMzdT8RVxlpq
         Q4noWZrwgaFv/j7aWeoS3QRw2ZvEM8657y2p+fQzYEEluKHCX1MdpB0wak18DX0VSBwZ
         /4uziQrgyV7b6ckfoOg5Dp9OGiaNEzXSqfITxmxINwCUoLkVygKrBKEsXkOBm0h1Zta5
         bPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752928; x=1796357728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0apI8pTNw36G4DXsCglQEO7Cz727zbrwGtPTw/Iq/Ew=;
        b=CsMRbUo94s6v6DlVllgPtMxqaBALsFcDePHRJ1sBQ/KAVZ4qhpbGWo/KmwpcKSNHwc
         ZDlbHXfVgGXuWuuesEQIaFGsQIq4aNcBTVj9c9X9IC37CFOVwuQXTsnhK4iWr8XmsLuq
         bKrsK9O2zJL4nvcgiwIAti885ti4VyFdRs3ixuY0KTxtDxrFjiDezvHmGPAhxcWAOxcF
         s5+X9CfWOZ4T9pwKfFUoTHs8RKqiFWj1AkV+Z/QDx+/dSNUpgRE2x6GFyPCZZJt2CJfq
         ga81xyJkt9lIwO0oYhoogfLW/P6UEYdhggRhuO5FmgyytqaCRFbSTN4BqKAJGm/guUdj
         VlUA==
X-Gm-Message-State: APuU4Z/AQkUwKaHfyCGN3yrt7+0QpG4nIaeCrzPhqQvVx36LvLkyiEaU
	dtdlp6igl4x8uotWHcb8lCcrJM4ObTfthB2PihDmW+nmdmq70qRgi5oKByEHO8l4
X-Gm-Gg: AZFdTZev/c50utcxnohre44AN57EEOEdtkcn+f8cHaXaPswh1tlWJrhtCfBL6UkwKXa
	fpth+MDsoGPNsfSZ3E8WyPZuatRq6ak4m86fLLdZHocM+tnMfrM+CbbpgBNruVQig02OhavkOcc
	eaKhiao5HqZ1STT8JR5Skb99RHk8kwv55sceWpRcjvb4S3V9odJdHjvMa98NU+C0gEZnfqqj9T7
	VfEoc9HrhD5AdS9LYCQ17FATC6OLPCKJ86J6i9P21jakn4dkEZ/ay3dxDa/YtnGWob+p3MNvRQ6
	mzLo593j6y2MED4xSZOKsMpngfGoQXQU2NangvYKnIvINWJmvb/w6YQ9B/JbDMKvPhVE8/zUcI+
	Oj+Y5APXGL0lyKPU0uVCEuk8pN1MeAwIOMJxQTq89+ZOhum4g0drfnTZcuwMunslZXdS0OjoT8z
	LU54Fse2qxfBqUoQFXOVJrXf5Q31lZvVqE36NXCEIPS9QT98irkNjle6cFEgl7phWqjuQmABvi8
	CXkmu959yXjp/6/Y/GPkxv2nbXyEcD7Hh8Omo+eQtolixsLvfOZ5KohzN851BBx7PC38aPYiY/D
	teHWd5VML6PyYrRtseKzXFAQ9alO7n2IBYQMEHOtoghSdA4PbU1y6KnbFZJ56OrlVUjzzcH/q5C
	OV1bumzu2PnLuZXpsJrF+BveIr5FZm3Wl6MpIm0+HlQpSFilSt5AvVTbt9RP3d11cHskjlkvqSV
	xDwZEOALa+dA1V9zvznCVWnEqlbUgxHCFRH09MFig2XZAtbM2XPJ6lWkdgoUKXnyPkjjB+g7sAW
	24qpf/7MiV7s7lCltylGKjM8hsbq1A4KosEbllOARmPf8QhYlsQXVSze7eZiDMxSbUn5qM2NnkC
	24Pi
X-Received: by 2002:a05:701b:21cd:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b5568bc08amr22595856c88.18.1795752927731;
        Thu, 26 Nov 2026 20:15:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/8] poco: Sync MongoDB architecture exclusions with mongodb
Date: Thu, 26 Nov 2026 20:15:14 -0800
Message-ID: <20261127041517.1773986-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133215
Content-Type: text/plain; charset="utf-8"

The MongoDB PACKAGECONFIG pulls mongodb into the ptest image, and
mongodb 7.0 only builds for x86_64, aarch64 and powerpc64le. Also
remove MongoDB on 32-bit arm and x86, loongarch64 and big-endian
powerpc64.

Anchor UPSTREAM_CHECK_GITTAGREGEX and match only the -release tags,
which are the ones SRC_URI uses.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/poco/poco_1.15.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.15.4.bb b/meta-oe/recipes-support/poco/poco_1.15.4.bb
index 7bca5fcc6a..43151a0095 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.4.bb
@@ -28,10 +28,15 @@ inherit cmake ptest
 PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite DNSSDAvahi Zip Encodings Prometheus FastLogger"
 # MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
 # and mongodb needs meta-python enabled as well
+PACKAGECONFIG:remove:arm = "MongoDB"
+PACKAGECONFIG:remove:i586 = "MongoDB"
+PACKAGECONFIG:remove:i686 = "MongoDB"
+PACKAGECONFIG:remove:loongarch64 = "MongoDB"
 PACKAGECONFIG:remove:riscv32 = "MongoDB"
 PACKAGECONFIG:remove:riscv64 = "MongoDB"
 PACKAGECONFIG:remove:mipsarch = "MongoDB"
 PACKAGECONFIG:remove:powerpc = "MongoDB"
+PACKAGECONFIG:remove:powerpc64 = "MongoDB"
 # Following options have dependencies on recipes which don't have native variant
 PACKAGECONFIG:remove:class-native = "MongoDB DataODBC DataPostgreSQL DNSSDAvahi"
 
