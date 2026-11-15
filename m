Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10673.1794762006164962225
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cqYaoeEQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3212504c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762005; x=1795366805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1f+8UByScyzgIB9nNbflpsFmryOVjg7J1PrzGmbGU9c=;
        b=cqYaoeEQXSowlOduaXcUF+WoGHBRtGVsUgttOT2azCrGaQQwjjz7CdhhWwV9v8u1Al
         3TJvgz+W2YImr6BnW6AmQLkFkySHaZZVJUpGQq0NtIa45qvDI12OYjxNQ+6yXO62tl7p
         37roCYT8F3Zpae8Firr5bNIr9SCncxRymDqCW/S6PKlK3l8KgBt3IZwijSXItAlcy0/y
         VO1a+7EshdVEybXGCp7FBwvtug38SLIT0cLcaPMY/PgpZIHnq9/iASPyjYr1VwTxztRh
         KcCl2FQjGeQVJZTPLDB9Q1wbhnDWZoeFXAi4/ASveTbBGvRW+8dOC0jIvMuVfYu/UXPu
         0Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762005; x=1795366805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1f+8UByScyzgIB9nNbflpsFmryOVjg7J1PrzGmbGU9c=;
        b=RavGOra6lJLUc0cpzdg1/SeCPD8Bfqb29Z/Cdoo6eGT/qeZr9RMBcp1fKR6neIcinR
         vZPvwwVvQdXsnLx3GBTA8/Fd7ssVV5AAzx6IqBh99+iGNji8+ngA3EhlzVFy1BpmHM+G
         1wWp79rOO2b6vp8W6KLbop6nfsMQd+bfm/rPJ0gWxSphckHxRVwkdXdXWM4Wub2AOVvp
         CDkW+aUJmlvZxmFNoaAFho0B+5pp+MVJzg7QnPSalKMaRSdcwg7V3kA1olGa+Kb0fchC
         pONaNjrFad+qYUqzjw6OO70mg/AOcOo4GldjtHsfEij8ZofQgoNwUPqZiGGr/nPXEupp
         qdzg==
X-Gm-Message-State: APuU4Z+ivWLN4zl6JwsxLXU5us+nfCXhZWBslmhcrn97mioHwhCSPzOJ
	KL9iaas0ECwniBtX8wVpfHFoLXXJtozyQUubFa9zyxhwgb6VPhbeWt9EAUWFYXpc
X-Gm-Gg: AYBFou1f0jLQ2ONMgUztHro8t71DPA2rP/FtlvxNxE5dFTvMr2nlftY19NLqTk4bcB7
	5t3t2EXIU2hahjqtTIbly3rtrygmBzCEwaH+FA3ysUvE+TeWBJzWlcaekRujvRvdBoqGfh5FJHg
	f4bFSgiLvh/rW21bxPbQ9DTWxy63W8/C1HzNfn6+29Owpj0mXUD5wTnr8EPrlpp/4gFwsSWVzvN
	AlwxsmfCJ45BfFMuIip0JMMhMg6QnrG/EQxagy9i9RATDuS1FNk1ZyIlUgtBrwQcBI3IjMMF7jT
	SY22dPGU5t+cpt4fPLhcCiRO7Ra8fFZwbmTZtJj3BrtuijxSqbaNPmwO4DfL4MoIqoF4nrzi0c+
	SOdHSI/si6EsaaROQKaZuzmyeiiM2zK11LuIYRZaZOf36g+kq44msCyGgOLV4plwEMimAxKEcRG
	eY9jpwlF3XSTHptMR1G3IMNidz5ztetP6q0L//el6PCgmXiVbU3HLT1HdOwYEgaLcnVjg+hMtK3
	+DnrqhSrnV9MWQnx//vOfLgLJu03di26UMN3BavWab7SO+kuiu4DGAjgJfzRS+ogeGtR683CXqa
	s8Z/7qa16McGknEfLHdKssjrBVHRNNfzK1UNpzrhMgLErG7ZCAuihHtMXgsuqvtcuB1HJVBeaBA
	x4rYDIW61mzz8I2yvOtiyPcuDZWVzI4QbObiWyJyydoUskEnbZlH/PRj0u6xHziWmrUYx0lfof6
	XXVLxihNbbtxISs7i7J10huGQqsEoSUgBUmJXJzlfHUZPHBgC2pFm9zu2+Paseaaw/t11X/wlLO
	aj5Fw9VzFQThiInqVs11KLm+3NKokOzJcz0+VbsRL6qamP2UH5KlWM2jvGQz/zqyxx4XS0D/+Qw
	ouZO
X-Received: by 2002:a05:7023:a87:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1b5241f3e3fmr2853278c88.19.1794762005337;
        Sun, 15 Nov 2026 09:00:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 05/15] fluidsynth: upgrade 2.5.7 -> 2.6.2
Date: Sun, 15 Nov 2026 08:59:44 -0800
Message-ID: <20261115165955.3485789-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132371
Content-Type: text/plain; charset="utf-8"

The bundled signalsmith-basics now uses CMake FetchContent to get the
signalsmith linear, dsp and hilbert-iir header libraries, which is not
possible in an offline build. Fetch them with the bitbake fetcher and
point FETCHCONTENT_SOURCE_DIR_* at them.

List the licenses of the bundled header libraries (gcem: Apache-2.0,
signalsmith: MIT and 0BSD) in LICENSE.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...luidsynth_2.5.7.bb => fluidsynth_2.6.2.bb} | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.5.7.bb => fluidsynth_2.6.2.bb} (59%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb
similarity index 59%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb
index 8bf40cbb51..03d40eaaae 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb
@@ -1,8 +1,13 @@
 SUMMARY = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
+LICENSE = "LGPL-2.1-only AND Apache-2.0 AND MIT AND 0BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://gcem/LICENSE;md5=175792518e4ac015ab6696d16c4f607e \
+                    file://signalsmith-audio-basics/LICENSE.txt;md5=24bc379a8a5433981804371861282220 \
+                    file://signalsmith-deps/linear/LICENSE.txt;md5=4c639037b59931f4da681810a23d6afd \
+                    file://signalsmith-deps/dsp/LICENSE.txt;md5=10f34296480e9e3fa42e9dd2acfff6a5 \
+                    file://signalsmith-deps/hilbert/LICENSE.txt;md5=5ded873b823122eb4fd596677999bbfd"

 DEPENDS = "glib-2.0"

@@ -10,16 +15,25 @@ SRC_URI = " \
     git://github.com/FluidSynth/fluidsynth.git;name=fluidsynth;nobranch=1;protocol=https;tag=v${PV} \
     git://github.com/kthohr/gcem.git;name=gcem;subdir=${S}/gcem;protocol=https;nobranch=1 \
     git://github.com/Signalsmith-Audio/basics.git;name=signalsmith-audio-basics;subdir=${S}/signalsmith-audio-basics;protocol=https;nobranch=1 \
+    git://github.com/Signalsmith-Audio/linear.git;name=signalsmith-linear;subdir=${S}/signalsmith-deps/linear;protocol=https;nobranch=1 \
+    git://github.com/Signalsmith-Audio/dsp.git;name=signalsmith-dsp;subdir=${S}/signalsmith-deps/dsp;protocol=https;nobranch=1 \
+    git://github.com/Signalsmith-Audio/hilbert-iir.git;name=signalsmith-hilbert;subdir=${S}/signalsmith-deps/hilbert;protocol=https;nobranch=1 \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
 SRCREV_FORMAT = "fluidsynth"
-SRCREV_fluidsynth = "3ede3f7c8ffc5d16e5d28f416cbfd71f3ad2b814"
+SRCREV_fluidsynth = "c3b244ddfd094489a5490beee013c621a504adf2"
 SRCREV_gcem = "012ae73c6d0a2cb09ffe86475f5c6fba3926e200"
 SRCREV_signalsmith-audio-basics = "012d2be17b0eb6839628f8c73687c4ccccc1bb01"
+SRCREV_signalsmith-linear = "5668673560146a9cfe38c25315071e3fd68c8317"
+SRCREV_signalsmith-dsp = "2d20161915e733f117545c6be8cd3275a739a1e3"
+SRCREV_signalsmith-hilbert = "9e42e09714c8215d51eaa1b52a3d54ae8dd2a3a3"

 inherit cmake pkgconfig lib_package

-EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} -DGCEM_INCLUDE_DIR=${S}/gcem/include"
+EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} -DGCEM_INCLUDE_DIR=${S}/gcem/include \
+                 -DFETCHCONTENT_SOURCE_DIR_SIGNALSMITH-LINEAR=${S}/signalsmith-deps/linear \
+                 -DFETCHCONTENT_SOURCE_DIR_SIGNALSMITH-DSP=${S}/signalsmith-deps/dsp \
+                 -DFETCHCONTENT_SOURCE_DIR_SIGNALSMITH-HILBERT=${S}/signalsmith-deps/hilbert"

 do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/pkgconfig/fluidsynth.pc
