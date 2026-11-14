Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3142.1794685062962741360
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wAaSryn4;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2414806eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685062; x=1795289862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHm7mjRO2PJcJq74cd9sYZZLjg1vXgPuI8mY//SQo78=;
        b=wAaSryn4nwoea9Kij+YiFkUGuR1kmqwJhN2OyTMEk6De/x/DCzLXrHs0ifjFU2AVCb
         1pRqxUvVMYi2qiLFfYyIbgvlkHxdGoh0QwoUt9mrmhuEweYh71gXL68MYz3hSLqCGuF7
         tAjoOdwyKfGmZ4TLCJ7ipuW55qtkXXtS2kh+czdKJbdpGcnzM4XFWULMZnDvTVOyS5Tv
         xVA3US63p9//ylxQ3O2RI3JxWvToLFHX73c3vEAwEN+vjSmi10X3XXSJlyu4m8/Tf0c4
         JIxFBk94F+q2M7TcExhCfgKqRohax4pdrHmtN4ZHP9JjMdUBsnQFOtsbehX3sxosSwjK
         YEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685062; x=1795289862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHm7mjRO2PJcJq74cd9sYZZLjg1vXgPuI8mY//SQo78=;
        b=kN2khihOl2QAPneFcleCLciDPe7owZHq4JZe08Zpy/8C071OmY1BiRxuH+Jzlk1Zkw
         v8OV2PZh8ExbWJwwzGCzxhy1Q8mNysT3TmwWo5xvAx1AzBu4IgOb3LmtPr3crurTrnwl
         ySRRPH8suv+8LcxNOHxzrkGF8u9wb2Ph4623VzAnTgufhp4S0gaiVBczzLDbhQ+PjANm
         DVAr0J1EqBzQeWTcK1CE8ywig6FgWqUTlTDSU63958DRdoWrZtjsYqCL9t5Kbh90lakP
         PVgwiJUEL0yQir/is3yogoC/LLP4skDkSV59e3I4ILHboYVjm0O2i7wGDn9T4fCNOpKD
         jspg==
X-Gm-Message-State: APuU4Z+Ckz5qCKFFDrwUAM2NJayjfvUtTmuF++5FVsYn4PFNyzzPtK27
	sICoDzCYI1SleTVHyFTALFNvrG0BZl6T3IxxQkZjzeX9dAlQXFzFSFBMFeFPeVB1
X-Gm-Gg: AYBFou1t0at3YGG7HIF69ysQZWyHevKih4KIVX43GvCDY7W9Mi7uwF7mTQeXCsbSkjx
	6OpCtFGowgv2jmvz5S+BTtHfQwYdjaJ7a9lIa8teh7uUyUJCEiHOwlCGy1Esw6DWNoglJIwPdf9
	ht+ooLL+A3asoVFsgC3dTHz50Qfuqp/25T7prlEkIDfuYWPhdH3Gi7nshil4+fdLDsDS70GY/Zd
	aiHPHEhkHHvrnzQ/VfRe0y9Qh+B5u6IYulOhNXw5rsmBNK5YGyb96+VasqRUi7S9ZS4VbeM8ps6
	sQGWdz3HoMmRd4uvg0O7R5SMm/2R0wuFwCvSdZT20Fk7acpd5bxdKHEE2yNygcSTQZFhZUkn1Sr
	Qqjlfi5O/an54pWVtJdE05vAIP6pwXc2EMszWdAYEVM6AuKIHRzlZlDUVx675BmhIB1YGEBybSq
	Ipe6mJ2YjP9cOMDdCObib9+mKPrabX7h3nqhJsOjW29z3ytklt/YvHBf7swPA4hckIuSZ7WubzZ
	n0T6nDj57iVwHtZ8NtqYjdYrzUAQ8BtRtLr5MrcOZ9Dp/HcLfGnri+JExysjzePys2mUasGS8Bw
	SsgJtRjTg4PI7jGvilKo04Gx3Lb0jvlPyeQirl76YPTbWOMpS5V1KOlDJr7WsuYi0cRwzxbWQXi
	fPbrfRLcZERGE+TYH1A6PJuPQ5rDoIdZtjdcK89E3hEtE6V8u5g8r3JC80ZrGtiDchQ2BQ54XMZ
	qLv2swW/Y4rFk8qjOtxxT+k0vw7Oc/2Af10eeeBXnD5GSLwo4cECSk+XPqIyjFrvHWAEu04JHeZ
	lzj6FWMi9gNRy8add2anWNfgjiYNFtdioV5hmQUoM3CYk2utsFsMmuT0iRMJ+59QHUNMB+8uSzE
	E6bH
X-Received: by 2002:a05:7301:4604:b0:376:703c:8819 with SMTP id 5a478bee46e88-379681c6998mr6774445eec.38.1794685062107;
        Sat, 14 Nov 2026 11:37:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/13] libkcapi: Fix build with lld
Date: Sat, 14 Nov 2026 11:37:25 -0800
Message-ID: <20261114193733.1743149-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132262
Content-Type: text/plain; charset="utf-8"

The version script lists all APIs, including the asymmetric cipher and
KPP ones that are only built with --enable-lib-asym/--enable-lib-kpp, so
lld fails with:

  error: version script assignment of 'LIBKCAPI_0.12.0' to symbol 'kcapi_akcipher_init' failed: symbol not defined

Upstream prefers to keep a single version script for all configurations
[1], so allow undefined versioned symbols with lld.

[1] https://github.com/smuellerDD/libkcapi/issues/191

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
index c4f5010058..c9983f3bd8 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
@@ -11,6 +11,9 @@ inherit autotools
 
 CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
 
+# The version script lists the APIs that can be disabled at configure time
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,bash"
 PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
