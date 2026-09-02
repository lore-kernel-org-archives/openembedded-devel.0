Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB87C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 17:46:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.335.1788367997749296832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 09:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yi+lr+Vj;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-85590c5aeabso1169457b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367997; x=1788972797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDMoe+brS8suLF/0i2GstG2Mu0uzP4BIIwO4VwaVWBg=;
        b=Yi+lr+VjKrXEVkjTeX+jECChJq04m5s5cjoNRQtFhKKQCtchyF2ukV1Gw87RF/wKps
         PQPfYuMmVRy1jRDCE1V/ubXKcf+qt34o3zVKUh0KbYrBQ6KGwa+8HZ78OTO0eAYBsw22
         yvEMl0VW9xhuUpxgdzizOtBSWqFcauLgbMB5E+VK3JG8X7G0PDEWQ9xKjK8yKXLmKrZf
         pfGcy3WQBCPQv1T9EjjhoGouFfgcqOXUfNDbO43Yo1udjhefQClrDE3fEYs1M9xaf5U+
         S0kW2cA+jZUiywfmSuPlD7TuISYMr69oBXPlFqOYMekyrOGMsz0ay9MgOF9IaGf3bGH8
         Ikww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367997; x=1788972797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDMoe+brS8suLF/0i2GstG2Mu0uzP4BIIwO4VwaVWBg=;
        b=f5jJr4sVy6t5r+EVoKxIA2wrR2WlMbeDLHr6XUyuXCU1vaTRqPxcIJKf+W9pd20p+g
         uj+AjM3TQwi+04v2NiOrq0b28pHnr29UFLlWttXOtWne+KaVUvHrjlQeyHYVGBzv1Usy
         dFfgUxtfwcaDwgzYWG5PRVn006DqjgPDt+gtyRv1pLL0y/htdzhYOeynB9fwl2X0ll8e
         Nt+VBSEkm8Oq8th1lEA/Z2VwLyle6W8dtq/1o8UzLkph/fQomVAQ9e33hOGNedqEdrch
         Fs4Mb7UCCDx+4yOq1FrTpu2tm599fYlthidi7K/zzjb8e+7uux5Lae+0KaPFtdauSi1v
         urrg==
X-Gm-Message-State: AFuF++nuOsPH1jABV9FUtMXEpNe7vTnVSkAfo+8gxaFlh2I++CA1zExN
	p2lGgm6VZFq5BfTuUbsjevb/doFRffy9IwGLjm2DKJNyOu7UzCgKwd9Mxo+TevCC3E9jXg==
X-Gm-Gg: AYBFou0jtrRN5yvzLsRFYi9L2Ze51ZnoN3hFSAUKHzbSOGbT4U3VAJY+9GOcX+kql8f
	k+VZ9a0IP2IWb8KK6ayvD2ixXQyhGBaWx4E1bqyqgzVRRqW+SjajqCJse7fD8Dy9pXKxVVJpWDe
	avW9IsJZz2xaIC8cSAu9V4NfpYrkNNKOSEyCBqw3j1N4026GsbloePDPVy1ghbjX0pEjggw/Y53
	odw9JbOYfPoTuY17CqiH3webx2qEiOdNxl1zisxGSLMZhJKaG2X0rGeh04QeSHx9ChCEecTq/NH
	G4qkzVx/ofFbNH485VYadHm2UxtihNxU9rciLBzJu15ch+Ce9+bzwOjn9p3JuQneR2BYQhUL9Ue
	qPgVS4InVEEE+qEhtKPs6wsBiuzGSWZnLm7MxH/QDPKcqvzg+EEFQzNbNMKCbHVVDom4gdLPmWx
	YDoNGbhng4IpOfvLvrwezPH1d15L3E8KMmZpQVP863F6MGWlXHP66PTmulaumwIG9tQvkw+4+Zq
	L6Us982ZaSKaD+E6tZqE677GJ3oEYaB/cF+jZ9u+l+BYQ==
X-Received: by 2002:a05:6a00:4510:b0:857:7317:cff4 with SMTP id d2e1a72fcca58-85ed47375cfmr10610685b3a.21.1788367997096;
        Wed, 02 Sep 2026 09:53:17 -0700 (PDT)
Received: from air.lan ([2601:602:57f:c7b0:d6fc:cce0:dbc5:cca6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d0022c7sm1383024a12.15.2026.09.02.09.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:53:16 -0700 (PDT)
From: "Joel Winarske" <joel.winarske@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Winarske <joel.winarske@gmail.com>
Subject: [meta-oe][wrynose][PATCH] capnproto: build position independent code
Date: Wed,  2 Sep 2026 09:53:07 -0700
Message-ID: <20260902165307.1259305-1-joel.winarske@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 17:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129699

The recipe produces static archives only, and does not compile them PIC, so
linking capnp or kj into a shared library fails:

  libkj.a(exception.c++.o): relocation R_X86_64_TPOFF32 against
  `kj::(anonymous namespace)::threadLocalCallback' can not be used when making
  a shared object; local-exec is incompatible with -shared

kj/exception.c++ has a file-scope thread_local, which non-PIC code compiles to
the local-exec TLS model. A shared object cannot use that model, so the link
fails on any consumer that puts capnp inside a .so. Debian and Fedora do not
hit this because they ship shared libcapnp.

Set CMAKE_POSITION_INDEPENDENT_CODE. Packaging is unchanged: still static,
still no .so, no new packages and no ABI surface, only the code model differs.

Backport of the same change sent for master, where the recipe is 1.5.0.

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
index 948ff80345..8c914d96bd 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
@@ -19,8 +19,17 @@ CXXFLAGS:append:mips = " -latomic"
 CXXFLAGS:append:powerpc = " -latomic"
 CXXFLAGS:append:riscv32 = " -latomic"
 
+# The build produces static archives only. Compile them position independent so
+# they can be linked into shared libraries; without this any consumer that does
+# so fails on the thread-local in kj/exception.c++, which non-PIC code compiles
+# to the local-exec TLS model:
+#
+#   libkj.a(exception.c++.o): relocation R_X86_64_TPOFF32 against
+#   `kj::(anonymous namespace)::threadLocalCallback' can not be used when making
+#   a shared object; local-exec is incompatible with -shared
 EXTRA_OECMAKE += "\
     -DBUILD_TESTING=OFF \
+    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
 
 FILES:${PN}-compiler = "${bindir}"
-- 
2.55.0


