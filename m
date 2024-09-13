Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDF1FA373D
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 10:17:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.70295.1726222650980400040
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 03:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vr2dACH/;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso933674e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726222649; x=1726827449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IebuvlOij7HTcwa/d5WoEeZZaRWue5TZbaCmmAvnbjA=;
        b=vr2dACH/I3R3v9iA9cdUIglGKLBiuKXi1AoNxAd89ubchD/2HmAp0vSAH1Q6GTVpEL
         OfT4M7UqEphH8RfLPM+9ZtuEB4MWlANEU48v13VB5VZubV3a84+/lPejJccX+BBmO/LD
         O5DoYx6BSVLGL55JQOX4avnd5QPKlJnH8PLuC/nc/PrQbsZyA1RrREvCClptb2crNVws
         GGk5QdFMxRv9+NOJ0ucAGSpcK15jCsednxvcTAzvZco6QEwAYFgNbu62RQcQYGwsQaw/
         DvH1gJag9xpxcvAtV4ynyHpci0ZmwcHfWqEsxdCNe5AfwTyGSltbaFzvbh+ZbsXuDTcU
         egwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222649; x=1726827449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IebuvlOij7HTcwa/d5WoEeZZaRWue5TZbaCmmAvnbjA=;
        b=kTEJL/sWBF176IRgM+Th5wgfLsCmvtLK0QmAOmMtB6oIxjcRrm4RyLZqJQOKFasBB+
         ITdT8AN94Wen4aWrVPf3qEqmDzPflqv2NQrv7+GOmG08Y15B2x6orT1N2cmBZCrICfkN
         fst0sdnvK+dwGUq6RDv/cntAnSmo94agl2mnZIXkm2hs/8Kk787bVngGcoLrKabuJN/7
         N0NYXI8T1Zs//uXcVH6uixwEpCYRNggVyBtK4fNaAK1ghtuFDciG9e5ZeGuAwPUKQgUw
         RN4NQ10Aa9a1I1AW7xk63g3fhj0ArBuE2Za3Bn/HbZerqXn4vQBKLkiF4xfc6xBQB4PE
         iabw==
X-Gm-Message-State: AOJu0YyG91wsjwit7qQfaxC16raTwiu2rQFv0RCVB5iu04UVcd3QJcS6
	1KEaRZOdEM5mWzEEiQ+a3LNCMptBfiYOzRNM3cuY3suvgvV3T9tEcUy3txlT6hNuF5BuccKgpNz
	j
X-Google-Smtp-Source: AGHT+IHo9PI/dQlB61ha+j4k0EpyF94VYH+86EYL0IhRLNVbsua/zrNk7jEqDYQ1JdWvHpC3WLvvVA==
X-Received: by 2002:a05:6512:3c8a:b0:535:d4e9:28bf with SMTP id 2adb3069b0e04-5367ff24b05mr1336496e87.46.1726222647841;
        Fri, 13 Sep 2024 03:17:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f86fef9sm2212222e87.83.2024.09.13.03.17.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 03:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gpsd: apply patch to fix gpsd building on Musl
Date: Fri, 13 Sep 2024 13:17:26 +0300
Message-Id: <20240913101726.128004-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 10:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112273

Import the patch from pending MR to fix the way flags are being handled
by SConsript. Otherwise CXXFLAGS being added to CCFLAGS, masking test
results because of the -fvisibility-inlines-hidden warning turning into
error.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpsd/gpsd/fix-pps_strerror_r.patch        | 51 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch b/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
new file mode 100644
index 000000000000..8942b39524c2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
@@ -0,0 +1,51 @@
+From c72a489e2eb13296c7b514b7341033114abf430a Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Mon, 22 Apr 2024 11:31:24 +0200
+Subject: [PATCH 1/2] SConscript: provide variable names to MergeFlags
+
+If the scons MergeFlags() function is provided with a list of
+compiler/linker options, it needs to guess what options belong where. If
+it doesn't recognize an option, it is silently ignored. There are also
+ambiguous options that could be both in CFLAGS and LINKFLAGS (e.g. -spec).
+
+Provide MergeFlags() with a dict instead of list to avoid the guesswork
+in order to pass all options, even if some are not recognized by scons.
+Switch LDFLAGS to LINKFLAGS for better compatibility with existing
+scripts.
+
+Upstream-Status: Submitted [https://gitlab.com/gpsd/gpsd/-/merge_requests/406]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+---
+ SConscript | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/SConscript b/SConscript
+index dab481654..ee90d87c4 100644
+--- a/SConscript
++++ b/SConscript
+@@ -585,8 +585,8 @@ env['SC_PYTHON'] = sys.executable  # Path to SCons Python
+ # explicitly quote them or (better yet) use the "=" form of GNU option
+ # settings.
+ #
+-# Scons also uses different internal names than most other build-systems.
+-# So we rely on MergeFlags/ParseFlags to do the right thing for us.
++# Scons also uses different internal names than most other build-systems,
++# e.g. it uses LINKFLAGS instead of LDFLAGS.
+ #
+ # scons uses gcc, or clang, to link. Thus LDFLAGS does not serve its
+ # traditional function of providing arguments to ln. LDFLAGS set in the
+@@ -618,7 +618,10 @@ for i in ["ARFLAGS",
+           "SHLINKFLAGS",
+           ]:
+     if i in os.environ:
+-        env.MergeFlags(Split(os.getenv(i)))
++        t = i
++        if t == "LDFLAGS":
++            t = "LINKFLAGS"
++        env.MergeFlags({t: Split(os.getenv(i))})
+ 
+ 
+ # Keep scan-build options in the environment
+-- 
+GitLab
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index 3d817172e226..f893ac359b5d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -7,6 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
+           file://fix-pps_strerror_r.patch \
            "
 SRC_URI[sha256sum] = "b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2"
 
-- 
2.39.2


