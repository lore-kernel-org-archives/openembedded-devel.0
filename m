Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17650.1794787848758836118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IAQhOJMm;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2539361c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787848; x=1795392648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzoU60GE5pU9rIxgnrGZE8qra3Xn2U+FVNlWwcUGThg=;
        b=IAQhOJMmwVlvJA0tWTUtDlKPeeBkjDSl2sEcq8zixjVEwdEmOpHaEsj5agCnPiPKlV
         LLfrr4US5zANG0a9tHni/ifgj8fntEY7zEjggH9ustnrU+Tttq63iEdEbLghd3wmPjRj
         VY9qEoWfbf6rVKpFph+AP1RSXDSEdHmyc0x3wUZ45GtWA1d/n0WXWq8qVwdkwU9Mlcr8
         t/w2H9KlSIaEUDi35i1s5fSSBIoYL3zl2oMRhEcB29C3B+VSFK7Kqcj0casKz7L20vLR
         b+Gmec7iv0Rp0ISLU7ftJY1En63UXmCPClJf6l7eQBw5QudlMD05HzIARxpO31UNGtbt
         In8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787848; x=1795392648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EzoU60GE5pU9rIxgnrGZE8qra3Xn2U+FVNlWwcUGThg=;
        b=tFNMI+0evYQgZtv38QFVYdy0DHLmbsn72a5c2Z10Pr5b1MztNMKZ6kNXAyLtp6wghH
         sP0/6+6G6m/VyfOTkLBVfdrlzI8q6+1Ewrwzc3/EvHV23e61bamY4ToD6Kn+m7Z3ValN
         Zk1juKn9h2POdVrKrHRz/ibwwv5ao5zUqyUJC4v4ybjInATc62vnyINYzhvjdkk5Az3y
         RNooXVzPA0iM0qSMdF6p7kjno7fLEFp/vYTHd8EVseFtwVQkR2nkIgpdnwkiGOH5HwEb
         de9Tr4exiZcjU9LnQZ0x/sQ1JquWStMyPuJm+CTrjVnKNnjPxdbefwLhp6MfMJ1eRkpk
         xYgQ==
X-Gm-Message-State: APuU4Z9VyMbObcNwni+3PBrfHu+zHAYu0E2BkHvWV+3NhbDX6nYyNSZf
	mjMonZgfs8tQTGjl4vPb6GxQ3SgnjAxYmOMnTnq6u7Cj7PNcjPQWSWrE9Wh8tqI/
X-Gm-Gg: AYBFou1FHmZn2AIuNudcE3CeSt1TObZaLhxunkh8nqrQEAd3Ovi1KkYDFsnXl1daP5A
	niPvjlikZS0qKyBWUj0VkW8eYMtg9vOakvgR42IW1jCvn3R7b+9S6MBpKbagg5QGsmoEIYej+AR
	qKEJm8jTfrY8NBVFgWFru9KEot6mFdjStlMl3t/EiNfPZkS4gxAjnIu1X43VvTifHgprUyIUNMU
	6TrJrg5t4h+3lQsKz+EFHXsLwxmaheYLoQn5TYPCrJ3E4ALEb48NuzviA0uZPlwb2pN7xk3YsmF
	Fj1Qyw4yNbLje/T0EqsFu/m4poF+ArXnwAMWQT/26my/vSKuSqQcUZrhJBIkRuasQFIP5lNIjem
	oM7NkTGiSWGf8ul3BYEDCUzzgkK/FL9v51VnKm+17yX8ipIrl9wg7bGGo0pcVg9OxETWejrWsr3
	MMH6nHSQUnPa7WfGAOJIg8aTHPSGsd23AZVJ36F/9bzbBp4eyS+xcNFj6qrkni4IQ4s+P/fmzAK
	LEkFxgQz7Fl26BnsdMvfkIbCPNtq965JimW6MLiF7sfHoWv8xNMzE4koiZlsYe03ZELsaD0djoG
	keG6ci1NgqThscvHmi8BGqoGMsCjBw8WkRh4zQ8zI8hSzeQo1Awo6o6JnS06uAI4J3K8t4p3jWP
	nVZTuc5v5zw6xyK7b1KDYJWenW7/w8NvPyzVZuvN9U4wNjQdy5VrxEH3WR2YKY6IRaJcMUREpxn
	BlxesOH2RvGNY89qSyAsCjsKmGDmL6nhH7t1aZCsFzhHyXfrHeGKU+IJ+sSSZVML5Otv3q8qEOv
	JtlCovOhesGzq7wqf+FPxq3cv8V7Vet1QE/1RWAiYo/TW1qtw+7MhH2y+igiY9dpmTnYjS3dxSi
	HhcZ3g==
X-Received: by 2002:a05:7022:258f:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b503112636mr10234863c88.25.1794787847840;
        Sun, 15 Nov 2026 16:10:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/16] python3-m2crypto: Use x86-x32 override for x32
Date: Sun, 15 Nov 2026 16:10:28 -0800
Message-ID: <20261116001038.440763-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132387
Content-Type: text/plain; charset="utf-8"

There is no x32 override, the x32 tune sets x86-x32 in MACHINEOVERRIDES,
so -D__ILP32__ was never passed to swig.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
index 98db2eceb1..454893884d 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
@@ -37,7 +37,7 @@ SWIG_FEATURES:append:riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__ris
 SWIG_FEATURES:append:mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
 SWIG_FEATURES:append:powerpc64le = " -D__powerpc64__"
 SWIG_FEATURES:append:x86 = " -D__i386__"
-SWIG_FEATURES:append:x32 = " -D__ILP32__"
+SWIG_FEATURES:append:x86-x32 = " -D__ILP32__"

 export SWIG_FEATURES

