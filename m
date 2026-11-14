Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3103.1794685067340610452
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lGU7Sv5/;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso346346eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685067; x=1795289867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOxMoLJMWnqyOgtpzqTQLYlEDIFVnPyHuq+XYfkDM/M=;
        b=lGU7Sv5/c6RShzPEpzYg0wevM2syCCSKsmY8kJF0fq8apCigLgKFq1E35ENcgvTBY9
         Dcwyap2toFzPv7uYK7mdDbt9wc47JbRgpL/ss7yph2P+UfWs6RRJMKfNtddSKr49ajWm
         urNuxQ89hPlpwHFbcUmnfEhOpWXYjgxl4Cb2vArS/dWGX9SxlcSB6hzbfpxtsAlCFoq7
         l9ReBAnsqH/c6t9UYMTCDHn+8Zc8QvoHsxfDGNPvW721TW6+mngCOPsachruZ/z1J4I0
         +eTkSck3OPyCZyECc/cXyxQxOzR9/1vhzLMu3+X116Qfj2N+J4RHp3MwpXexdjD/2bM3
         sXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685067; x=1795289867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOxMoLJMWnqyOgtpzqTQLYlEDIFVnPyHuq+XYfkDM/M=;
        b=brsTG7xEhfZNM8b/tlhd25vDx/7Ef6Qc7pUfHcokwoWCLNVi41p9wnxDakySRZlPfu
         4iN95fwiAbUCVonnyQpMiaU6O8fryx9w00JtnyT8cWHCrDg65oIqlN0MYVDk94bk+CsJ
         UEPDbrWMsxjkdhn3HeA0705rua2TUoPMF/zrVQZo0OJvRSard4vJrDHz+DIvEeqh6Sjg
         RpjhjLDqZm/R7xGhGBPolr2Cip2yJS9Vb5MYlaxxGRB6hJtcg3b4dweHkQoH9/21M8Fn
         gDY+80+x5/Y1oRIggX9lvzBAne2f+9gIYuPD+vaRdPzSCfOywxnFXjrNA8c07wcqSwWq
         EfnQ==
X-Gm-Message-State: APuU4Z/zlOT5STUTh8lJjuAx8j62m+wpFdsASOtoxQ9hwhZ0M08v1ZV5
	tez/bs32ljV/cG32+0ZWfkwRUnW607jFc68EYvop+Rtm9YUOza6FjpZvReBQq61j
X-Gm-Gg: AYBFou0sK75UtyWyX5jdk2IHB6b/KlKJG8FO9H22pVEdBZyRQOewIQ3/sPQD1iIXCfK
	WZV4tmHaUXmY2A7D6NbrvtGnhPFxw42mvslC/PCqt2Tf5k+M9azKsRa3DCynpmwRQQZhE6jc1Kj
	5xWQ1iQMwOwvGCbZEvUM5tR2NZ+seT2O4/aAYkpFHoSk1jel1VFY7X1N/VgS7H1FxgOOMxpdwuv
	l30/7m5PZmJ1LTNyfbb7SP2OUCEwt8Rx+nO1CttCIfl4mJUDnrK1O2XrXyxReE/ExDyvZ/vcikt
	ctOK5HG9ovHULqmY0/7KIMCRTY5nZd+53g0ktSnrkIALd3UvVQf9HXc4g89KyR2ULtp76zVBN8V
	NQfOHlVmnzmnlyCtuh9Ud9Ez1YAydBR23FmO9vMq7Vup2FTlZYZXI+YW+X/nOf3s64GIPuOu8v/
	8cLXS2HiWPSSlZg7SAtlTtDxiEC9ambGdF6CDlhfhNzdyl/W/pElQB865bZ6BUmnCRp530e1pZm
	hqZMF9XZLWpvJUuM2Ugwy/sWq88DPnIoSXggvpGr8LaMhETd4+bW+fpHVe5DzVwgaDEz1Lcp16J
	DveX0CeGyJI/uFQvC7FKI/S4ZT1c5zuDePK7TqEAoqDxflDIMCK5TKi5jYscUhSonvVS3YqWkBH
	nSBwX4lrT0DKhg8xh2HhZz2dB2RKIO9i7BNXVEEQTdbBqxrxV5p47EqWaAnpZj0abT8ocsI6mUv
	7pjrgVITlyk1ahtW2skWrSKwQQ6WIffnrcZeOtNbNnPiwGLVfcgYd1SEE+2z1+1c4Y1P/eawoS3
	MUhutsAWGqee9c2j89zmZtmO0EMVcjJ+R8n94Y+3JABilZAC9j2Ar8DMahgYqcVjracE5iG/sf3
	d4FE
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr5741809eec.25.1794685066638;
        Sat, 14 Nov 2026 11:37:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 09/13] caps: Build with gcc
Date: Sat, 14 Nov 2026 11:37:29 -0800
Message-ID: <20261114193733.1743149-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132266
Content-Type: text/plain; charset="utf-8"

caps relies on GCC vector extensions that clang does not support, and
on the register storage class, which C++17 removed, so build it with
gcc when clang is the default toolchain.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
index f33d7ad582..964d18a5de 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
@@ -16,6 +16,9 @@ EXTRA_OEMAKE = " \
     CFLAGS='${CFLAGS} -ffast-math -funroll-loops -fPIC -DPIC' \
     ARCH='' \
 "
+# Relies on GCC vector extensions and the register keyword
+TOOLCHAIN = "gcc"
+
 do_compile() {
     oe_runmake all
 }
