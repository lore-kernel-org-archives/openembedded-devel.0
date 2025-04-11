Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E193CC3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:06 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.14016.1744332126115654155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWT+YuSN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736a72220edso1459091b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332125; x=1744936925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFhnIk+6g8bFvEIj2XJvSGe8Xb8FzCsiPn7wExuuQ6k=;
        b=DWT+YuSNLylRwtpWLj/VsJNmatE9CGY6eRk7OcX8yBQGuJIc6BncjjXScuV1xaCBtp
         Zw0xFkBZcxMQEIMfvmCFCxCvuouy4glbOu5FDqh2xK22HM+GcRirk9bzzLfQph5Pe4d7
         cpbqmoMdhYShAZY6OKkGiufiWnaDOpSaQ/0C7aT5qn3j11UP581wqgfojj02TURafdMV
         ihnT7yA1oCQPx7moSo/zhIxa3aN2COfTUshh+OWRKftfQk7qXjjdKZdvdXQxd2gs+Ucc
         yglCuatcn3D8KTHg1DuRu8wWK86bZbA1z6d0a70oAJoDcXxT3Uwd4WU4cG+Y81uOctw/
         Lflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332125; x=1744936925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFhnIk+6g8bFvEIj2XJvSGe8Xb8FzCsiPn7wExuuQ6k=;
        b=E9Lrxox0SRA9FFSAM9NIVi49KipbjoqdJwl8LBE1UeWFlpRzOLL6KcUDrRqhKelLCT
         28l+Uw2/otXz6656MuUlMaOaZIp30bu/KHOwKyA1zaOH1jbE3NeXqHnNkriyrmfuwuHW
         3OZIchs7raSY2vXLxilDAekJugK8ywlf01WhOA75zLfaxRq/CBGtp1Vn3IpQ68sHuVkb
         0RW1/ZQy2vQlfiOjd+yqYKtLiJsyLIyraSA9ckoSlq5u+73IwfF/5kpNYWp54On6GGmK
         lpc/O3kEX8vcQAjwtbeIlPip1qiE2IdCsMj8DKc48GbovgViA0ypPkhMFpmjyljzse7x
         RjbA==
X-Gm-Message-State: AOJu0Yxr/PBrGyAg9vQMc2jfSmNc8UqKTxXIT1KG5/E3W+sSJ/pjeUah
	t92qk8/17lECzxUxypO/C532MpRtgZLTSgx1KlwDvREKkNo3vqdk5ZIjBkyz
X-Gm-Gg: ASbGncvB1fB7kfz30KsDuzoT+ZJ8TlrPnUPxnhRKTV86Pk9Ak2suR9TiuVTV9rx7G1B
	3hTvZJPMjMH3M6MdocYuF996r11XONB7vjnvcaXLrk+6o5pPD6QdNYydG4XJs/wb6Sxw4IWsNve
	UpPgMYrZTpdd7pl5ubwuSVauCVmGg+Dp6Xa7BKW2Se0x5pQv4B0NIB36Pp/XLuGMn+2HBTitvs0
	Nn/iNNf38inBv3M1LFRBAm8lsPKb4UfLUwwFUWmgt4TUG5ayl8ylvA5lHN1sa9vIR679oz1mZhg
	W6AoFiFTBqixiNvKHqM3DIPDq7cL+P+S
X-Google-Smtp-Source: AGHT+IEJl27TpMrjLuv0b4eLTPJPV43vxhYY0Ns1npS0DrOERLXKxzJ5w7KmdW2fgyNxb1MDp30s8A==
X-Received: by 2002:a05:6a20:9c97:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-2017978093dmr1263685637.5.1744332125034;
        Thu, 10 Apr 2025 17:42:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Rob Woolley <rob.woolley@windriver.com>
Subject: [meta-oe][meta-python][PATCH 01/12] qhull: Add recipe
Date: Thu, 10 Apr 2025 17:41:50 -0700
Message-ID: <20250411004201.3826913-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116775

This recipe is needed to build latest version of matplotlib python module
when internal vendored modules are not used which is preferred here, avoids
complicating recipe to counter meson's wrap logic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Rob Woolley <rob.woolley@windriver.com>
---
 .../recipes-extended/qhull/qhull_2020.2.bb    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qhull/qhull_2020.2.bb

diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
new file mode 100644
index 0000000000..4533b0a337
--- /dev/null
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "library to compute convex hulls, Delaunay triangulations and Voronoi diagrams."
+HOMEPAGE = "http://www.qhull.org/"
+SECTION = "libs"
+LICENSE = "Qhull"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=484ee0cacf0472e8b40225b116f6296c"
+
+SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz"
+SRC_URI[sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
+
+CFLAGS += "-fPIC"
+
+EXTRA_OECMAKE += "\
+    -DCMAKE_SKIP_RPATH=ON \
+"
+
+inherit cmake
+
+# The QhullTargets-noconfig.cmake checks for the executables despite not
+# needing to execute them for the build.  Staging bindir to the sysroot
+# allows us to pass the check without building qhull natively
+SYSROOT_DIRS:append = " \
+    ${bindir} \
+"

