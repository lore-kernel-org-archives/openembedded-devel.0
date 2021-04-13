Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.428.1618326314371205905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 08:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7efvA5y;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso9165414pje.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Apr 2021 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtWE+TfDZgvFtn7UVKT00NwXpHWY2aGqtSTmoRinhww=;
        b=i7efvA5yvLMKCRtBx3+vY7eyheu7YeUr1PcRytvlTgw7RB1NWUV96eEk6PtcsUKWUj
         i4XWUF9W/cPREKWXud99e/X6T6WVl5k+if5OXnJsM8rmqlre4Cvs1ASQf10/a5kWSAbT
         hdLYmJGpeZFqn8+NbQjyLrZBP9QvrmoK9vTFpmJ13V3TKE0/fsdxJkYqLAW/lzXhVIDn
         GQBVE8zRHc+ujz2PgdXSuvAPX7dbeCRa/VO4ifEMj97I36talw6zPmagtVR9T30PCaG6
         7Rbbmg+3QA1jZEoskjmyLkR4RNqlnV9MyzvS1oFa+rKral+aUOI/x0Kusg8v190C+6K4
         soeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtWE+TfDZgvFtn7UVKT00NwXpHWY2aGqtSTmoRinhww=;
        b=UGTYMgdWE6xK3F3WVMjv8JmU4euBAZRrcKBP8Ih0SH83q9oYd4Hmhztj3mcDViYGHq
         j1qWKhrqAeuvE3N747n8Q9X6p1xifrPBaBnPdTkiLV8pMUjq+qjFtzHfGP+7SXdloTyB
         P3fzdZTJjwdjtTF8lWDjD+T1WQoY1kJ0mUV2h9rBYMI2Jqe15AWV7wEt/zEJ48XQdxWE
         yZEou1o87j9BTmE4/80mqExq9bh4fwPKZRXCfdlX3fCg/VvH/yjKuG5QMb8OVO6EMq3o
         r8DOuoheAImi53tgNIRZ80gblrMA/dZcf1itWEiH9N0AKRdbIO/oadAknxgdEolc6Zxm
         lcsg==
X-Gm-Message-State: AOAM532PNJjOR7q6y3B0pGqqKwdWlBoIamrk+x0YXgdovqxFxNP9PLOh
	TYpbjZqyLJV/yxakxIK039nYWUxTMc/NLg==
X-Google-Smtp-Source: ABdhPJzv7HSewwhvWtPhsgAEj4IhV1Gi5rOE7L26bC5cv6AlEpMPCUt1DwhD35NC6Sj1cpMfq75iKw==
X-Received: by 2002:a17:90a:ec09:: with SMTP id l9mr463677pjy.141.1618326313605;
        Tue, 13 Apr 2021 08:05:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id u18sm12814524pfm.4.2021.04.13.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:05:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Subject: [meta-oe][PATCH v2] tbb: Fix build with musl
Date: Tue, 13 Apr 2021 08:05:11 -0700
Message-Id: <20210413150511.671001-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Need to link libucontext on musl
Additionally, mips also needs libatomic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
---
v2: libatomic is also needed on glibc/mips

 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index d0e2311402..b05a59dc70 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -6,6 +6,9 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
+
+DEPENDS_append_libc-musl = " libucontext"
+
 BRANCH = "onetbb_2021"
 SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
@@ -33,3 +36,10 @@ EXTRA_OECMAKE += " \
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
+
+ASNEEDED = ""
+
+LDFLAGS_append_mips = " -latomic"
+LDFLAGS_append_mipsel = " -latomic"
+
+LDFLAGS_append_libc-musl = " -lucontext"
-- 
2.31.1

