Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8946.1793358221994048164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DWBsA3QQ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so82356266b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358220; x=1793963020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShWrbrKT+KdKVMkI01K6Y+kO4anlBK/u88IwkraGgyg=;
        b=DWBsA3QQYPrxC6kCRBAVVUSeoihIwDpgsmPNrdAnnc/NELj6ayKlvGi4Wj5RGgaBZD
         H1A5xym65aHqceVuBx2sh8sVZ1t7dFzK9wwwfJEiPAB9w63PI+q2EDLbEEXoLr4jgou4
         JONaNqZ/vtZ0NnEFZ+SLcvzNJLkt4Uo9z39to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358220; x=1793963020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShWrbrKT+KdKVMkI01K6Y+kO4anlBK/u88IwkraGgyg=;
        b=VY590KckFQIXnbWllO3ciaskXZEafHP8lmh5dUiCWKLm/zxGBE9CEYPQWe3hW9QWev
         BNnCjMb/zXQ/L141W9cghklVibb1Nq+d9GV9NLXrNLkEzJL4AjOuN2wI8Lne4sRkPoiB
         Dl7wahZVSf/M0uY0oQPoWZGQX3uDKJEnruGttT7mcdqpfCLm5grq3//DsYde8I5udyn3
         OFtulMZigwbCA2iMR3RjVeS6bt4CXvq1/iKwoJLQlkscR7RpLm1oUsFzeiAzCHr27dXe
         Td7uzwd8O9cNCNUXCkpltD7geb8ZTs2i6HS9JYwvinNEycAxSaqde3BqfmspzirogHVU
         aDqw==
X-Gm-Message-State: AFq9FYIbhC1hEBqBMZNYKHJh9cmtKt1rOKymSCoSmOBpOtYzOKtok9nU
	C1fYXoosRQUUfdsB8gqirIg3O3gQ9vI9nstT8SMhFKzpxfQeiXt1FxIuLXjfbWfMuGmKT6iYe1D
	DQFGb
X-Gm-Gg: AYBFou0WAQMWbbGr7+oklg6vxKm5XtK1WOFTAd1+d7itlCFFc9Hd9dgw8UdkEjJ2W4y
	cMrdTv3fgTADh9vwIVpQzTvDrCs0BG8u0DG+x2NvE+1KfueaOMA4nooJZHkRZNm85unBNVUkUZr
	UJ5OmzBG6v7qQE25hwb3Cpjb54IGhDwh3Jgmabd9KiIblaxx/SGCbqby6xbywHV7bPoDkS5Chz2
	ad4u7ik/8x43Jx3TyejFw1RYdCjt8/QUm6+EGtV49shViz5MZWsvhzigjnauUunjA4EA2EP7dla
	p7nMFZsKTCFwrOgaYCogkHe3AVcpDkiEoVqnhQMa5DX7Ismjp4rPiWZzkfCmYncD3dXwnt6ZyJV
	hBa8vwVUZybuKjwV9zJUAzjRgsGuOA/KvPAsGL+0VIET01u7QqNrjfuYdUtioZLPF+Z4HAiu2Nq
	iL9NJoddDxmqfCQasgE53JqtvpYNujWLORUfTsvIaSo5DCflFk+NZ4+ufk55cU3y6qUAxossAHd
	PKLpn8EMbi5zcTlTsYIok9KlQjd75YUHsvF/ckE4tOop0SQ5lTo6kXby0r0NQycGNfs+9BR3yTs
	XXU3eHX4xiG5hqKHGx6H9697Kychwwh78uZDF40t3+8o32Q1dvkYjQQ6KI1Gl0XilkhQ3FqdHmy
	IZNvRfHUSrx3u4uLZ2LSmNHlNWt8JdBoPdvO0iCkfiwZmOWltgA45fQ==
X-Received: by 2002:a17:906:99ca:b0:c24:6f60:3f7e with SMTP id a640c23a62f3a-c4ca793b87dmr172223366b.2.1793358220108;
        Fri, 30 Oct 2026 04:03:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 20/25] python3-eth-abi: Upgrade 5.2.0 -> 6.0.0
Date: Fri, 30 Oct 2026 13:03:04 +0200
Message-ID: <20261030110309.1124614-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131702
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.0.0:

- add funding.json
- docs: fix the installation package
- Template upgrades
- feat: optimize encode and decode
- refactor: drop <3.10; add <=3.14; migrate to prek and ruff; use
  Github Actions

Fixes:

WARNING: python3-eth-abi-6.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-eth-abi_5.2.0.bb => python3-eth-abi_6.0.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_5.2.0.bb => python3-eth-abi_6.0.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_6.0.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_6.0.0.bb
index f945672eda..431b15e382 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_6.0.0.bb
@@ -4,11 +4,16 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b6a85414b7d058ab1c58e11611c21b2"
 
-SRC_URI[sha256sum] = "178703fa98c07d8eecd5ae569e7e8d159e493ebb6eeb534a8fe973fbc4e40ef0"
+SRC_URI[sha256sum] = "e83a0ed91f2dadeeb50236d673736fe2edc6fcc0a1c1e13d461192d4b23d5bcc"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += " \
+DEPENDS += "\
+    python3-wheel-native \
+    python3-setuptools-scm-native \
+"
+
+RDEPENDS:${PN} += "\
     python3-eth-typing \
     python3-eth-utils \
     python3-parsimonious \
-- 
2.47.3

