Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23814.1793120402470042848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 10:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R4KSBB7X;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so2509c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120402; x=1793725202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2JTYzB5HmpwWUG0Nxnhmv5MluHNqcSmfXtgT1077NI=;
        b=R4KSBB7XJB3Q2u974faVX9ofUuCuD9vJ/iAYuygIwXbBsgIKCzzI60ZLttQ1tlKDQX
         Ccg3d46j2FUN7oILlwe0nUN1fRe7BdvFGr/PHTlkLiiAil33fcLNzE33/KKZI6Qil/BO
         5ie7XG/yiXBld/dM813RkqATqNT/BOS473ke1mNiHpCfs5+QIavjnj1yWm4ydpeCeRNr
         2cC6cenIvwDtEpLzsrYz+geJGk7GM1om2WHB5rIGoKnOZ7WLJCa1Q80gdXe6E7nEjarG
         +WHYgnJfrDPvOjNiW0breREPfsiCg4xDN9n5lLwasN/9bKNoGHL4BlhqicrqFdOF7Jvi
         /kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120402; x=1793725202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2JTYzB5HmpwWUG0Nxnhmv5MluHNqcSmfXtgT1077NI=;
        b=IIlaEjlnwmk4nb+hAY0N7xvfj7B6z1bCMQ6GUZ+ZYkt5TWCzX36oCC0SDntQhyf52g
         OEw1EreJM20h/rq1J8tsx13PdtEdMbqWBTk3GtWMVxOrwfVbKcc3MOvsVNHNkBEN2/Fu
         1YvVMVzHct7B0Zdb764yRr5PQIvNbDGvVtNdmQtGzLagLGuk1JlY5Pd87NBp1En4VYOl
         dQEEev7P+EWjzr6dlx0EsjuTr5JRvTZFIF844xoFCJ5HOzmeFJOsfwu4kohQAkeZGr0J
         EsZ9yUdSqKfIQ/zJq8IKV9mQvLd9InkW/cqInYcePKUdLTHZT9xkKtx680oz18LZAth3
         dyCQ==
X-Gm-Message-State: AFq9FYLJ0tmEJCCCTwJ0w31jMPFKdlJ4dP4vFv9nKDqmwWS4gzBWAVcU
	r6gNnb1EkynPwaIByhLyuCe83SufUJ9WgOGlok9Cxri+nJvDyqAMmhJcnN2XiZ6uyr0=
X-Gm-Gg: AYBFou3pzOlpvixqELo5K+ckSWZywj3U8VKfVicx6A89sjfUMEz4g3zYWwGgIoSMC92
	d7EPqMPI7DRb9/NMM4ItfXlYZaeiCYhT3WZAXqpw1JLLvUPJBHM02RMrpEgf8ylJ8ku4jQPdvWe
	tnIzyObEXvDZK/VDtSN/LFM2pZhH14h+ok/XjREwjoS0NH8HTBgBypFRZ4KQP98IYG6w4HwQGf9
	q9C6+ZmLEFmTOfEuTyruVnIZKeEJVtGnOh8nJ3DXKBlWUrfu8ZnSvZ9+wkqb0fYknWl0gOLCKoH
	U4gy1VMhqmlTtyHywctK0M+++qay0TEIe9pUPF6O/fRoTTi1+OwYM0o7L2VmshqoeWL17pOVU7J
	MqLkGnilyGX3KYaomA0bSQYUAyHto6SrzNsZvlhwoTUCuX2Q/t9s+YWH6tazUVmxXbiX1gPAnR4
	AkVNvJsLjB+2cv+kXWhJV3+T1fkvdCpwZevPQ+Mh727EYO/VNQwhDAvN08zbHhtFLyo1Rl52/Dt
	jJsCnEf6vuOtPrEWvnebd0QID0OWix9oesMmTzJ6XgYz8VzlOpJO7jATMCuuPKb1t4pBccdKyo1
	UDazbDP38Kv2BSCJNZk2tRlf/QMW3WhOBFFLXm525ahSubuJ4k32e336I1gjsyKegMV9xA8Oea0
	wgokP86e+t9TrIBsBZljPCK7iHJ3WpqEPvIICF2lf7RYqjSegNP7r1ocWMbAEQmhaUqg+QluY+g
	O7hd1932a7e25YmZVlwbkfOaLm0hQF14Sy3zYAwV+28/K6QesSuxCFwnu2RyyKli3wWBkQnnCAs
	78lrFGnKPwTRyv1hi/NombcQJZ193c=
X-Received: by 2002:a05:7022:1508:b0:182:6c6c:d876 with SMTP id a92af1059eb24-19934a928c1mr15798687c88.8.1793120401400;
        Tue, 27 Oct 2026 10:00:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm33219217c88.5.2026.10.27.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-grpcio-tools: Use python_setuptools_build_meta
Date: Tue, 27 Oct 2026 09:59:58 -0700
Message-ID: <20261027165958.937291-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131543
Content-Type: text/plain; charset="utf-8"

pyproject.toml specifies setuptools.build_meta as the build backend, so
inherit python_setuptools_build_meta instead of setuptools3. Fixes:

QA Issue: inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

pyproject-build checks the build requirements, so add the wheel and
Cython build dependencies and relax the strict Cython==3.1.1 pin, as
python3-grpcio already does. The C++ sources are pre-generated, so
Cython is not actually run.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-grpcio-tools_1.84.1.bb                 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
index 3f7f64c076..91d14f719a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
@@ -5,14 +5,18 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=0bcf70029ff7f40a132bf95381ee0b2d"

-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta cython

-DEPENDS += "python3-grpcio"
+DEPENDS += "python3-grpcio python3-wheel-native"

 SRC_URI[sha256sum] = "ca8a326df3441127d6709d992774844bb496db30b08f76ed5d1a912089e03f2c"

 RDEPENDS:${PN} = "python3-grpcio"

+do_configure:append() {
+    sed -i 's/"Cython==/"Cython>=/' ${S}/pyproject.toml
+}
+
 do_compile:prepend() {
     export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
 }
