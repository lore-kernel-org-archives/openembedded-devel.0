Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5538.1618065039452223947
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JbYyauG3;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id h20so4124503plr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gWZQeGoy61THmtnd1vmNkyah55Tp0Ml01mc5AyRMxXE=;
        b=JbYyauG3jPbuStPzS2gQgeWwxYQOs9wINT9+7Y0x+6u5Ln6CFH5HgawSTWnDQ6pCDW
         gspXIImITbuky7RP1+NRV0ZZgRmy7HYedT8SCZOa26BA9DdnpVIL1014bubUkzavcg8k
         GlItMUHShjukCqOqC+5N0V0OsqSsI3eMCH+Zttnvf6vdA1F7yHWdNUOSqFe1rN6lRUV/
         9zb06XnSaR4ClN9Nr0MPZ0Dmo1Mw3ak8mvZp7bmt1pMnK2XA3J7nqCOpbXArKke4kv/j
         F1izlaofgqCljqkzzcMt0xm6WeG5LL2IFpntkfnPml4WmsEc7z2KbHX/78nKcyJm8twW
         yBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gWZQeGoy61THmtnd1vmNkyah55Tp0Ml01mc5AyRMxXE=;
        b=tydInAHrG3lcm1Ugtjo8W74yAwABCe8EbKeIfIobI6P8a0ekEX/g7+7Lfcj5Wftfnw
         zxjYSPuQg6tE3sFf6qgaFLWVDIiB8r5NiZWo0ZjWR7QpuHxPmjwaccqG3FHFW6sKIEM6
         YkpxeJwqwYjz6cytFBz1rdKIAMw5XtuNdLpTEBedW4l+3mDDfxuWB6fskj39Js8F6i94
         FYSP7oj4SqguSrGgFQI53u1HTo4RQjtLx2+9kEfHuyyRiB3z+OVfR8KY7afJzW9FijH/
         uHRsUGJyXwHWVwKTYfOTlWcqj3m4hi98hzDrdKivl71EzpKcOoeOnh6rFUjnDrPmhYgt
         wGbg==
X-Gm-Message-State: AOAM5319kX2Fe4lrx7Ii7Bp2OZyt2/LE3VfUwf5hCUUbXZh2cX+R1Sk7
	TJ7NIb58EGNIETUoXKjAdePDqMXdbfg=
X-Google-Smtp-Source: ABdhPJwLNfTnwZaYVVH1w3bZ8rZe2ua9LAMqQ20XGmvoTaHQXkessG67JeaHJyiL3EFlB00HlpDpjg==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id ce15mr19417019pjb.15.1618064978969;
        Sat, 10 Apr 2021 07:29:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id a65sm5120183pfb.116.2021.04.10.07.29.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:29:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 1/6] fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
Date: Sat, 10 Apr 2021 07:29:29 -0700
Message-Id: <124319339b06025a1fd385b60aa64c2afdbd8e01.1618064877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618064877.git.akuster808@gmail.com>
References: <cover.1618064877.git.akuster808@gmail.com>

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

Remove branch 2.1.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 555b90779f6d86f7df05604f474323d9aef96886)
[AK: Minor clean for gatesgarth context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 73c1d0db69f..ee10504023c 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
 SRCREV = "6776569abe9a885bcec14141692fa93c0568d51c"
 S = "${WORKDIR}/git"
 PV = "2.1.5"
-- 
2.17.1

