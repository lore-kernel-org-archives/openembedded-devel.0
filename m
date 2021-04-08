Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.277.1617899834052277029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uyb2DacO;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id s16-20020a0568301490b02901b83efc84a0so2861310otq.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mn9GZGxZt8idzxrEwi5BRHNJ9zlPF3DCigaHvTFMnyQ=;
        b=Uyb2DacO+LzNYWAD6l+mtfoVqVRnEBFP3Ac8bGSuZO7Nhk8TlrVSKI5EyNxfPzux1I
         R2HHz5grGrGS2SdT4MEG9kk9LHa54PBlJQpCqnjvo60Nob6rNFQ7mCE6M0MC764uF5IR
         cOEPsa3tfzFcdf/4cNYXdDR/nkN19YeIAbsGXqBDrWamyU8+6FdN8WGrdlq3/sDY0FRB
         gUtr9Z0Ocayq/MRUZKfPKvmQTYR6ePAVIBhGQFExorUqbTAcNZ/Kdbq5RCRUeoCG0f2/
         oUzVO6WE3ru86u8EFwOwejjvveeY/pZnE0zlTZiQDBM4RoglLCYJ9RSl/qUv9wmWO/vz
         a5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mn9GZGxZt8idzxrEwi5BRHNJ9zlPF3DCigaHvTFMnyQ=;
        b=ghG/BHdqhsEHEWPAQ+Psi+5Nsyh0rAvHN+yOHkIlMDbJt+UDJ0OChdDsgsEzZG8qOz
         X92wyv5MXY0/aS7ne9I6jvBWwAtdqtEXFaN2J3pZUQYKrmalQ+8j329P0FiuRU6oCGql
         bOPMPY+2l55dbaHMbhcCFcDw//zFUqA3J+TrWRYBgEBgP+Te7PypTmxgtkiwQDtC33eJ
         TXXv9qPkE97fbWpN/ERttryxFpV6XUvsdKAU/idpTLgjPKinicsTaAG69Bpmp+veOUES
         so5IJTQxmXzmEAy623mbn4C+sCPVJH8UO1KthmyBznsTuJgFPj9KDPljgLAHI3n0ja+s
         lbCg==
X-Gm-Message-State: AOAM533clA/IQmbtQYMWIDUYwi0Bp90+tCfJHWj6I3fAphWNuYGAxxhJ
	9wB9i5P3FLJ/ddEUXtcR5/GgJlsQ8jA=
X-Google-Smtp-Source: ABdhPJydlCYkS0cC8K+eWlNDhUreF78TCDwpEeUoTx2rURESIjLCRtXsDd/3W+C5kilDXRrppNOb7A==
X-Received: by 2002:a05:6830:40b3:: with SMTP id x51mr8338941ott.106.1617899833219;
        Thu, 08 Apr 2021 09:37:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 64/64] fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
Date: Thu,  8 Apr 2021 09:36:11 -0700
Message-Id: <622ede33f6cd5e6e08d20e4e2ac0218e5559645c.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

Remove branch 2.1.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 555b90779f6d86f7df05604f474323d9aef96886)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 74a2683ac9e..c2badc4469f 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
 SRCREV = "e2d67ea77237046b703d537aec90620c22f7f629"
 S = "${WORKDIR}/git"
 PV = "2.1.7"
-- 
2.17.1

