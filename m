Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316A7FF886F
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:00:05 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6083.1777356004420396203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kE8b2fqy;
 spf=pass (domain: mvista.com, ip: 74.125.82.41, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c45281a06so15007486c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 23:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777356004; x=1777960804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFZJ0lJycR9ia3++NpO86eQau76qEPl93EWk4E2DV/M=;
        b=kE8b2fqyELyEjTcN26GdguAsrWnSbvNyFC/bWz7cM0vM+LYjUqFBXG62JrNZNFTjKe
         d2Zgdw3JlQUNI5g2BhFTPLUQnHreaWNNTqO2g2LOnk45dyFHBbOpA5kK3/yg34LT4qCL
         KVP2iotyxI+0MbNa3ISGtLRvWJh2q2klAenco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777356004; x=1777960804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFZJ0lJycR9ia3++NpO86eQau76qEPl93EWk4E2DV/M=;
        b=oYAFXtP/iRZaS3o6AWbXQL6h9vtPOJc/oo+jiJogpQuRUb5IjA3ij/Tt2GR/JOniLm
         w+z+9BIeE/YZB024oZ3X4t++OtH4/Swof0/gE2N08Bc1F+K1FRd0CqvsCIfIXTS1Jgcg
         UwiqqRqfDUkwCASdOPJSB5lQ0vIRGXF+M9Gn+R2fYM0rFEnhGEFArDYLw04qtTHedAnJ
         npQfCn6MEW5Xhp2CrTiwvDFCqnJU7nPi4EcGooKMIEuT4C3joqDpq8ym8s93vvM+5Rl9
         ofdXoIRRZtKtNR4LwuqGPw141QL1r/NaDwNQmADU+PW+dkb3Fq4sOYnW8PJeze0/cQBa
         PS5g==
X-Gm-Message-State: AOJu0Yx7XMycNDNu1iiSnFqbJKY7n3V8NSviqTD2Xbte1GhzfZx83ooP
	dgd4dBJHbOnb1zv1RNfjPsbJ7zXUuxgcxmA8sKDft1OIuCK/4f9o4zQRVvVTJKrTHx4Q7y3eQK1
	kL/TVeuY=
X-Gm-Gg: AeBDievJ0oTtNHVVdex1u4HEAoIo6VcfaXPzLUfNPb8KgRpcEAnPvuEKthAU6pVXOQ9
	S+nfuB0HA8DuK8PpBH1YN34pVaMKFktUAxl5B92s+NB0MqkCC9OgB868VhjuMxEURqmER5aGxsL
	yFsS9wp5Cg85Cky4OXZp3GgfqXFmDDRTfcAGBXvuunwuyAzPlrv/aEu/5Gn0OkdUEoBefQlfiiZ
	b2KuaVtIEA5jMMEYkwpAIDz72JaAFHjXqmItZKtKAzURpI3LjALvWRAvTDD6J1TTxaUA6x1ZY9d
	ZNq8Ff7Stn7fQYFBT/rPmJpOaw9MG4gLEoaVlSFF6BoZBGUClZ3k1OoZP+m1Ys3f+JH4LS/p0fd
	YE/ChL+jRTZ+AgecKbyNtlF6zT+vdAd8mnMXv5b/sLoiLHNhUPVblvGzDbklOCz/HTZ3uGq9PpY
	9REd8QiuHipke9lr4sMuqr24xSC47lESF+AMm10hjzxH6R9IE=
X-Received: by 2002:a05:7022:43a6:b0:11b:923d:7753 with SMTP id a92af1059eb24-12ddd93f8ecmr840888c88.3.1777356003565;
        Mon, 27 Apr 2026 23:00:03 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd93c1c0sm1396472c88.7.2026.04.27.23.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:00:03 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pillow: fix CVE-2026-40192
Date: Tue, 28 Apr 2026 11:29:53 +0530
Message-ID: <20260428055953.49083-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 06:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126646

Backport commit[1] which fixes this vulnerability as mentioned NVD report in [2].

[1] https://github.com/python-pillow/Pillow/commit/3cb854e8b2bab43f40e342e665f9340d861aa628
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40192
[3] https://security-tracker.debian.org/tracker/CVE-2026-40192

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-pillow/CVE-2026-40192.patch       | 50 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch
new file mode 100644
index 0000000000..7e8170eec6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch
@@ -0,0 +1,50 @@
+From 3cb854e8b2bab43f40e342e665f9340d861aa628 Mon Sep 17 00:00:00 2001
+From: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
+Date: Wed, 1 Apr 2026 00:02:08 +0300
+Subject: [PATCH] Only read as much data from gzip-decompressed data as
+ necessary (#9521)
+
+CVE: CVE-2026-40192
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/3cb854e8b2bab43f40e342e665f9340d861aa628]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/PIL/FitsImagePlugin.py | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/src/PIL/FitsImagePlugin.py b/src/PIL/FitsImagePlugin.py
+index 071918925..7791adc50 100644
+--- a/src/PIL/FitsImagePlugin.py
++++ b/src/PIL/FitsImagePlugin.py
+@@ -124,17 +124,18 @@ class FitsGzipDecoder(ImageFile.PyDecoder):
+ 
+     def decode(self, buffer):
+         assert self.fd is not None
+-        value = gzip.decompress(self.fd.read())
+-
+-        rows = []
+-        offset = 0
+-        number_of_bits = min(self.args[0] // 8, 4)
+-        for y in range(self.state.ysize):
+-            row = bytearray()
+-            for x in range(self.state.xsize):
+-                row += value[offset + (4 - number_of_bits) : offset + 4]
+-                offset += 4
+-            rows.append(row)
++        with gzip.open(self.fd) as fp:
++            value = fp.read(self.state.xsize * self.state.ysize * 4)
++
++            rows = []
++            offset = 0
++            number_of_bits = min(self.args[0] // 8, 4)
++            for y in range(self.state.ysize):
++                row = bytearray()
++                for x in range(self.state.xsize):
++                    row += value[offset + (4 - number_of_bits) : offset + 4]
++                    offset += 4
++                rows.append(row)
+         self.set_as_raw(bytes([pixel for row in rows[::-1] for pixel in row]))
+         return -1, 0
+ 
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index a81bcca215..9f1ef87a46 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://0001-support-cross-compiling.patch \
            file://run-ptest \
            file://CVE-2026-25990.patch \
+           file://CVE-2026-40192.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.50.1


