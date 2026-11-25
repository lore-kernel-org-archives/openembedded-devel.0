Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37938.1795594085730930811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=M+P4YJEy;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so9153257c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594085; x=1796198885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYEr6/O0N1hwUb6/gkjncbkZs9xyQxWWHiNeqoofr00=;
        b=M+P4YJEyo8Bg7AwEVJazjgpPv+9nx6ReA5PTNO78Fo2+Iwt0CGUsugaV5nYDH7xuMG
         DO0itj5JRTame5X7K0SKw2TLvTqEkXdJJdma3jJQDyO9f0HFapevOLyZid+dYMG1sdWX
         Qd+agUFIatVoBu4VixzDqGMO937KJKsY9lB2r6U1FcyXUWTxAXYasTxcqjroBy5litkQ
         1fgnC0Glh1BQ7RDuMSqVlF7XMT6YnWZLbEnroB8BDc7M4SISjef/IBIa9vNtyuvtK3Lj
         mm4Pm4QL4KHEsoQ5bqp+HLoVilq4/IoJKcJTcMLnsZ45MlpfIUwW995w+fGiVdwdMO5E
         kEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594085; x=1796198885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYEr6/O0N1hwUb6/gkjncbkZs9xyQxWWHiNeqoofr00=;
        b=B62xl8pDHkJUOQRi1SNGt+dlWPisfkCS1HPc1L9//yhm9I1vt1679rATpAR2Bm36UA
         P+tNcVZCgluKsjgaZCxU2qE43y4OV8D2Rn4LRbiDdv9W6aJUZ37IklPyVj2VBEipz20t
         aBNkidWmzyXYpX2HjxUAJwOfBKRVLr8t5ywtx4gpXkpRW6smnYVVlpVyGlNbXlH84Noc
         vRXnyqDLl2RtORk4p5gfdFbKAAWkvr2pn2h9egi2AqRdR9Dp67Do7lp+YU9TUCyq3irS
         MUYVZE4WZfjXonkCZvqCgWn5nmzHyexK/YR0sPvn5qneBe2cJ6cEVqhiR9DM3+8AdrzL
         dPbA==
X-Gm-Message-State: APuU4Z8hNkMsGc73UGUGywzNYH0Myc9rSPBbPTp60imt1Ztjl+rPQfSZ
	lBcvctn/2q26x7b8jUwNyduzP2Ns23IGDrCaEgzIjJjxRSRuUtMl5ZTu1xPmpua4
X-Gm-Gg: AZFdTZfx1xxRvCQQM0ZXReXaHB4Obgr8rfDhX6E51sp+X6oE63VrNfD0O4YQhgM0Vm8
	HPXDP1P+g/El/eoQNCMCS6SAyQjvOWQFFhwrczDfyBrHX7QSnwcMaA45RkkDD8vZdklkHw0vl+f
	X9MlMwVS0p9bcy6X1YKWdx8wHCXadVu3WxQWaYwCCUZ9pSQvbAMC8dMW/hIz5ojlJuYJkb/L2TY
	xNGTcZlqSBFMKzGSBx63lwS7dE2gOkRGqFT746gfiL4TWTkzhkIQezNXIOf3vyqflR04w5v47Ul
	y3P+4VgggC86piyJm6rRFpsUfqpbrgPy6qqth/ydVvd68mhUVgQ/qd58HxZmIQeqGh5d1FEM4eu
	WvZddwHZ9r+ZfuUWTVG8cFm3WJHgOAdrS8RHUR3Qd2G/eYfqzvrOs7P6bdF7B9ZguON/pF+J1of
	wuPLQZe38jM0QKracMgpFZMxh42AJpgYpHrCzJXA2buUme+2GawR20sav2I/JhDrsfGp65sfeOc
	Jr1oXC2LcU4DAf22CcwhJCKwix7Nz11YMst+ZVMbga7saOIQ/WYcff+/8TI3no917Om79wnnuu3
	h6Q3XrY3nni343tWFqpbZLeKY3DCPp3N4OQqBr7UU8q90xTx7aUQAwpRhzezfe2tEhbZB/zzjFJ
	QHR1lA15ihZ83q+8bjCNvS47EgKR98xcPPQ4SDed2mjZULYDyyLEUaSoo93Cqx3hRD23P3WqEa4
	2sIPZSdUoekGtdow7li/kA+UQ+vYqeciQELla0Kdj9h1rM47WDCJwtfqcZKspQgJsQk7kdH/IXM
	vWEDIkffJZcmyUpbOxIdWoS9gjjNEydUYPN/9dvOC7iKc4An2w0mvD6qOY4M6ajZwxa1X/CCWVO
	/lMq
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr17242687eec.41.1795594084975;
        Wed, 25 Nov 2026 00:08:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/55] cbindgen: upgrade 0.29.2 -> 0.29.4
Date: Wed, 25 Nov 2026 00:06:34 -0800
Message-ID: <20261125080732.2419614-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133021
Content-Type: text/plain; charset="utf-8"

- Support constant enums and arrays
- In C23 mode, define sized enums as enums instead of typedefs
- Expose the line_endings option to the builder and allow pub access to
  ReprType fields
- Fix doc attribute parsing with block comments and also check CMSE ABIs

Inherit cargo-update-recipe-crates so the crate list can be regenerated
(unchanged for this release), and list the git source first so the
upstream check reads cbindgen tags instead of the first crate. Add the
upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cbindgen/{cbindgen_0.29.2.bb => cbindgen_0.29.4.bb}  | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/cbindgen/{cbindgen_0.29.2.bb => cbindgen_0.29.4.bb} (76%)

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.4.bb
similarity index 76%
rename from meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
rename to meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.4.bb
index 6b5fac9d47..b5a9df4a82 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.4.bb
@@ -3,12 +3,15 @@ HOMEPAGE = "https://github.com/mozilla/cbindgen"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-require cbindgen-crates.inc
 SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=main;tag=v${PV}"
 SRC_URI += "file://0001-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/getrandom-0.3.3/"
 
-SRCREV = "76f41c090c0587d940a0ef81a41c8b995f074926"
+SRCREV = "b826cb8911488fe8a209d2b693492c0c673e8cca"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+require cbindgen-crates.inc
 
-inherit cargo pkgconfig
+inherit cargo cargo-update-recipe-crates pkgconfig
 
 BBCLASSEXTEND += "native"
