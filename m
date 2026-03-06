Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CAEFCC05E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1712.1772822032448937688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KDUwpJ0i;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso3232094f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822031; x=1773426831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7jmQ7t19NNlusbg+JR0Kp4wrlDhk2kdkBl+WqXOF3U=;
        b=KDUwpJ0iv1z3eL4+40E6HBrht6J/r2yNHh0d5oyFFYe0kgF+oAp49vUfIPGNq+H44q
         CH13JkYY7zk/O89v6ah8Een8GuWx1dRBHYMUizHnUDRmYJqgPomrK0MZZQG3HZ8Nd6PO
         VSOVpcnm2/TEl8+YeE+ZBqlOHEI6Ems/4BqNIUNnmVW4J1ny8CP5uwPtdzp1iOWcF4Bm
         N9wQG2PsvBn6GY5KzKT4RKWhQJa7m9pNqaW7kavMGvRQ4DiATPG4cO+tmrTN9EPtYlH4
         o4etyXBdt4uKxLgocLbq79t1v9iO0ZRNV7Y07CmK0jpx4TvwM4aC/8wnq4CgMhuOId3b
         KlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822031; x=1773426831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7jmQ7t19NNlusbg+JR0Kp4wrlDhk2kdkBl+WqXOF3U=;
        b=cT7aZvigXVRdn4XWgIKakXnPnvbirVTJ90CTLmfKmVcIXcC+3QWjxc5r1QH1m0i1Wt
         vAVsZG3kPqXCCqXcnde/21bvCLz+eJg0BcAVxkpM7aM72F1gsg27jZIn3YJ9DOB4q1fE
         6Xg/rzRHyTpi11vslUe/2CBytNAegG2yNNU3aLU1Sqqw0copab2rZnI2Sd7p3RZRi5Rr
         EkXq+3fVixWe4Cffpzm4ZxLucL9o0Mbo9gTg4qoNH7PPhT+Nc1zAVN9DW755i4mkmYOh
         teqjvngsuwNtHPAs4MVduT8A2TrSi+JEzmKx2o+5gzA6DNtMA0Aktu0/WaViwL8We+Ci
         CTBw==
X-Gm-Message-State: AOJu0Ywy9B7oNSDXX6UzmsQztBmHFICOb+s1U7Zknswk9ebYvcoJJFvo
	taExEANRkMSiSki4J9CoMGm5qHTbi8dqwKxpqsheAcuy+XGWzs2/QrKXRM1Xeg==
X-Gm-Gg: ATEYQzwrRY/xoRCTwF/o/wfjQkfMSdSJ8DfUlC9g99LelB8/dne8a6jXZ0Z1pge4q5x
	RUlJ1zSU4mCf4aNYWuxKU+xSkjJIwgw1gHmI3ein78/41w9agil5x1+MfbT1oFJ6lCVFjm40xbD
	zra2L4AUJT1ScaT0etEsuYEkX97VF/+AN9NoY3OZT5CqRSjwim9Qb6zvKrialVORdJfi8D1pSE8
	/+08dCNxqZo46UPSGcs49P6IzGzc5tt5t48OThMfZ0VxqKl+569H4RQ5Cdv0BywgPM0B9IyIIuk
	oDYQWIhjsMcGDvJIJOCk1/iOU5frLJQZh3+ITBAShzE0Ir6PlOV2FJmna6VmtBxojo4hNfeaynY
	zcl5th+6R1q05pCPYDR0RDWFFP02YrTRFaT8woFgcNJ1RG+A4FrnXaWOSTqkaeiOBf63G5064GY
	AqO6wsrPFOJbkOB3+EByj9vNSe0ZYrq74=
X-Received: by 2002:a05:6000:2313:b0:439:af49:38c8 with SMTP id ffacd0b85a97d-439da35f658mr5394830f8f.18.1772822030556;
        Fri, 06 Mar 2026 10:33:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 4/6] python3-pillow: patch CVE-2026-25990
Date: Fri,  6 Mar 2026 19:33:45 +0100
Message-ID: <20260306183347.1014705-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306183347.1014705-1-skandigraun@gmail.com>
References: <20260306183347.1014705-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124920

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25990

Backport the patch referenced by the NVD advisory.

Note that the patch contain some new binary test data, which
requires "git" PATCHTOOL - other tools fail to apply binary patches.

All ptests passed successfully:

Testsuite summary
TOTAL: 5011
PASS: 4577
SKIP: 431
XFAIL: 3
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 59
END: /usr/lib/python3-pillow/ptest
2026-03-06T17:58
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-pillow/CVE-2026-25990.patch       | 151 ++++++++++++++++++
 .../python/python3-pillow_12.0.0.bb           |   5 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
new file mode 100644
index 0000000000..e2c12b7b24
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
@@ -0,0 +1,151 @@
+From 829bd7b5c533e3a58d6f0a0ef4f001ea2605b784 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Wed, 11 Feb 2026 10:24:50 +1100
+Subject: [PATCH] Fix OOB Write with invalid tile extents (#9427)
+
+Co-authored-by: Eric Soroos <eric-github@soroos.net>
+
+CVE: CVE-2026-25990
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/9000313cc5d4a31bdcdd6d7f0781101abab553aa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Tests/images/psd-oob-write-x.psd | Bin 0 -> 1126 bytes
+ Tests/images/psd-oob-write-y.psd | Bin 0 -> 1126 bytes
+ Tests/images/psd-oob-write.psd   | Bin 0 -> 37212 bytes
+ Tests/test_file_psd.py           |  17 +++++++++++++++++
+ Tests/test_imagefile.py          |   7 +++++++
+ src/decode.c                     |   3 ++-
+ src/encode.c                     |   3 ++-
+ 7 files changed, 28 insertions(+), 2 deletions(-)
+ create mode 100644 Tests/images/psd-oob-write-x.psd
+ create mode 100644 Tests/images/psd-oob-write-y.psd
+ create mode 100644 Tests/images/psd-oob-write.psd
+
+diff --git a/Tests/images/psd-oob-write-x.psd b/Tests/images/psd-oob-write-x.psd
+new file mode 100644
+index 0000000000000000000000000000000000000000..86359f4cb7e826a69a8e69a4b85947498ec18923
+GIT binary patch
+literal 1126
+zcma)5J!lkB5dL=WC-F>3z$=1SY;juU8Wp`VZp09|z;cO@XbSh|ZgXUJ@7TRX4pIuX
+z0SkW`qZT&S+FIBOg5VE`wTL!~HWJqFz0GA0$%PEez3<J;H#cu)wx%1)P>@QFhrkNP
+zAuvV#TGJPoazEr{TAAgkKpC9EmzOT6P~@#DuSJ<hm6j=CQFnxTwjbr^06*x3jRjp>
+zUAwN0ePiq~9H(A1?WlXnFzSMFu>5&1Gvi%V<T^NJq;=A1Mm8UyF=Ec{hCSk&#20S$
+zx&q%PF54TXL;Re0He`XsABEjY@ppk;iB&?B!<EK7-&Q8p+#zfYVS6L=8FQX76~_;l
+zUtLYHBk-2Mz8AALDPjf_&EVQH&kFSv7O;pV7|>uLMjIY_sPYVGiO`^5AHhE<`36}Q
+zS#8*4Tt){zOv#6s0b?jxZ==?^v(ltY=s@91lKeUijNJuxx0B@W<0RRA0^~jeuY!!<
+z*#T<5Y2VIll}EtTZQ#Z0%x2vKUfuy_K6TB|l>Z~PO>MP+pU;5FHQ>ZspmZbc8-2o$
+zryqb7_Nx8{c<>N7<1+X9h<A^Zu-~^sWA^&TIbWq-;U;II5Gs4$Lb}sM=`V`S4mzQq
+zq_OJ*N=Y~EO*ibs9I}Y<;-F3647CKEJ-4w57a=DQb9#=9>9@HB$WwFjZhIlIc)`9T
+z6kgJL@)8%N^RTLn0liQ+`%UH?s%V<N0_v=&k0$F$eOV>)+x7mhM3JvQ>aRNJ<v*Wo
+Br)B^E
+
+literal 0
+HcmV?d00001
+
+diff --git a/Tests/images/psd-oob-write-y.psd b/Tests/images/psd-oob-write-y.psd
+new file mode 100644
+index 0000000000000000000000000000000000000000..73498266a7d732ad70be649718229fa5f07997b7
+GIT binary patch
+literal 1126
+zcma)5O=uHQ5dL=a(;8b^Foz-@_7FWa7ZuI1ZpBhbVM!~r+JpO(Y(sZ9VK++&coe)A
+zJot05>cNX=y?XE}2!cN#o<;Pc=tau<y|;-Qq$v(e-uGtao6MV;t?9-p6r_^lA+Ul;
+z2ux8w*YxF;+&6idRpxmrP==@Q<)sTM6nU%4Yf<J=rDaA~)IFh|?ML|qzz=$1V@cQ6
+zH?C?EUl@A?N2%vcJL+CAjJjYPEWh5$%y?53xeksQYn^tQk<ABaj99R{VUPGa@wuH|
+zSKzzEWqZqXh@TSAhb)lzy|7y;{wlC5u}X+?xYk(Y+see6JA$ndY;T1=W6m<B;`jmc
+ztLrIt1im4#@5QW5ikQJvGq|$KvqC+AB`jkF1~gcR(T0Z}syqW)A~fjN$MBC!zCo5n
+zRvR`M7tw(aQ}Q8Zz!*x_+o*Nsv@|JGI#BqOBtK396Ssl=-6Z+_FiG|w0lAOBiy-57
+z_JG<?+IKTs<pD5r6L|JAvsrh5=eK~l4_z}f<^PCnQ(G<I`x9V#132~?C|yhYMxXHG
+z@jGCRy{f+g?%fAYxy-#e=G~Jd{O#MJF@yeb&X=i|xXGC)gv#JsNO!s@{YA0aK_~Q+
+zG<I`HDe0!Y?S`G0Ll!Y!9JJ}1qn4nv=Qg(CBIE>OPS24s{WiA%d1_AHZ7(DiFOZT@
+z1~9EBFYiTZJFF^Wz(S#J_M6N(Qqe4Z1=LwlA5GSi`m##ox9j~=340;B^S{69u$O-T
+DuU)5R
+
+literal 0
+HcmV?d00001
+
+diff --git a/Tests/images/psd-oob-write.psd b/Tests/images/psd-oob-write.psd
+new file mode 100644
+index 0000000000000000000000000000000000000000..65a4472cf263a94277952c06903709afb0c8213f
+GIT binary patch
+literal 37212
+zcmeI!I|{-;5CG8e2f;Js6jo_XXCVk)LDH$<2|S2L%6V+#=3`?OM1sW|nCvc@*<D_>
+zMR_>JEc#fa;nZao?R<!Q8IecK-|IB4yX<SKuD|O3S4FwoU#_=vGZZ&X^GNwj%T3Bv
+zzi(EzJ?WeF%<9jci0uU7lnIa>L4W`O0t5&U7$GptyKKZoln@|5fB*pk1ildPmiYor
+z3jqQI2oNCfHv$oNL4W`O0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N
+z0t5&UAV7cs0RjXF5FkK+009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+
+t009C72oNAZfB*pk1PBlyK!5-N0t5&UAV7cs0RjXF5FkK+0D&I~yZ}A8uQLDu
+
+literal 0
+HcmV?d00001
+
+diff --git a/Tests/test_file_psd.py b/Tests/test_file_psd.py
+index 38a88cd17..63db7b26a 100644
+--- a/Tests/test_file_psd.py
++++ b/Tests/test_file_psd.py
+@@ -184,3 +184,20 @@ def test_layer_crashes(test_file: str) -> None:
+             assert isinstance(im, PsdImagePlugin.PsdImageFile)
+             with pytest.raises(SyntaxError):
+                 im.layers
++
++
++@pytest.mark.parametrize(
++    "test_file",
++    [
++        "Tests/images/psd-oob-write.psd",
++        "Tests/images/psd-oob-write-x.psd",
++        "Tests/images/psd-oob-write-y.psd",
++    ],
++)
++def test_bounds_crash(test_file: str) -> None:
++    with Image.open(test_file) as im:
++        assert isinstance(im, PsdImagePlugin.PsdImageFile)
++        im.seek(im.n_frames)
++
++        with pytest.raises(ValueError):
++            im.load()
+diff --git a/Tests/test_imagefile.py b/Tests/test_imagefile.py
+index 7dfb3abf9..2ef9fe2b9 100644
+--- a/Tests/test_imagefile.py
++++ b/Tests/test_imagefile.py
+@@ -169,6 +169,13 @@ class TestImageFile:
+             with pytest.raises(ValueError, match="Tile offset cannot be negative"):
+                 im.load()
+ 
++    @pytest.mark.parametrize("xy", ((-1, 0), (0, -1)))
++    def test_negative_tile_extents(self, xy: tuple[int, int]) -> None:
++        im = Image.new("1", (1, 1))
++        fp = BytesIO()
++        with pytest.raises(SystemError, match="tile cannot extend outside image"):
++            ImageFile._save(im, fp, [ImageFile._Tile("raw", xy + (1, 1), 0, "1")])
++
+     def test_no_format(self) -> None:
+         buf = BytesIO(b"\x00" * 255)
+ 
+diff --git a/src/decode.c b/src/decode.c
+index 051623ed4..7ec461c0e 100644
+--- a/src/decode.c
++++ b/src/decode.c
+@@ -186,7 +186,8 @@ _setimage(ImagingDecoderObject *decoder, PyObject *args) {
+         state->ysize = y1 - y0;
+     }
+ 
+-    if (state->xsize <= 0 || state->xsize + state->xoff > (int)im->xsize ||
++    if (state->xoff < 0 || state->xsize <= 0 ||
++        state->xsize + state->xoff > (int)im->xsize || state->yoff < 0 ||
+         state->ysize <= 0 || state->ysize + state->yoff > (int)im->ysize) {
+         PyErr_SetString(PyExc_ValueError, "tile cannot extend outside image");
+         return NULL;
+diff --git a/src/encode.c b/src/encode.c
+index b1d0181e0..117bf2164 100644
+--- a/src/encode.c
++++ b/src/encode.c
+@@ -254,7 +254,8 @@ _setimage(ImagingEncoderObject *encoder, PyObject *args) {
+         state->ysize = y1 - y0;
+     }
+ 
+-    if (state->xsize <= 0 || state->xsize + state->xoff > im->xsize ||
++    if (state->xoff < 0 || state->xsize <= 0 ||
++        state->xsize + state->xoff > im->xsize || state->yoff < 0 ||
+         state->ysize <= 0 || state->ysize + state->yoff > im->ysize) {
+         PyErr_SetString(PyExc_SystemError, "tile cannot extend outside image");
+         return NULL;
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
index 4db5db1572..34b462ca4f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
+           file://CVE-2026-25990.patch \
            "
 SRCREV = "693df7b42c666f88c719f9973be0ad71607328e0"
 
@@ -65,3 +66,7 @@ CVE_PRODUCT = "pillow"
 RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
+
+# CVE-2026-25990.patch in SRC_URI contains a binary blob, which needs to
+# be applied with git
+PATCHTOOL = "git"

