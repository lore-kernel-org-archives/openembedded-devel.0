Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.10739.1593562070693672970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aosm1n9/;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id l6so7106446pjq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yIBIEQjnMBpnN1JSZibrw66m/LQAwYGPbzgb7kdotiQ=;
        b=Aosm1n9//PcLLMub76BtYzy8bZ8D+vqG+fxEtSbgI/4X9En2PFCuF67I8WhxfAXBKO
         KRfDPv9a8x6S4kXYzGt830UynjW1XcVCBebH4sSB+nt5nJDG3NpKG5qJcJGeVFM7Q1SH
         c6FMFQvF7YNuYdRHHuCVTW/5GLK/aSsysVwEdqPeSzq38it5KzgNrKTIijeNsev6c7mu
         TPySjdWkMG9t8EMmvGZo5gKFf8yxH5gsYX1h/SuLNkrHjYS6yUp9x8qOknVj/pKhJhVi
         ZjSMie1lpHoZ5GGoyIN3kFvmoQM3knRvDCidZCvzbG4Nk07hnmejcklfBtac8APKuyMy
         mmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yIBIEQjnMBpnN1JSZibrw66m/LQAwYGPbzgb7kdotiQ=;
        b=AeoHNinXcjAOU9+VNtrPr4YFGmctcfukYXUZLMMsnIqFTnCEerhRZFCin7Xp8mGwy6
         FBS4ZuO82kejxmrqwbk6FrQewygp1C4dLizYfqsbh5zMuhZW6vNX2/RafcPfCMXnH/SK
         8Hrt4V6XcjnpYsl1XMcha1aaR2iZ3WZbUhX5Bv2S/5NuTnTndOkjR/VrnzNqXAiJkKuS
         b+ZRBfIkx45sd7jSVCgk+IzHNT3R+zj+BVRUZCz5cjgER0x0u3qIgrSMTUDZf+WnDtSg
         wPdkw/gYy/+8PLEx5yRaKIlBforzYGcGllo2NQaY7ZQMtuycawdRvtUT4DT8+ucXeHL0
         YcdA==
X-Gm-Message-State: AOAM530bkHUGQOXmHTyH+Af8xUqNLS7spIr/PERBgR+tQD+dtazwMNPi
	iTV9d4qF0q+7MYnbXEhkc3vYFPYw8MA=
X-Google-Smtp-Source: ABdhPJyrSg3H0sQJh8p5KxlwHsOda/W5wNHz4EpA8tCr0nTXMpTmJUOVLtRIklf0tblK7FJMRkD7Yw==
X-Received: by 2002:a17:902:a717:: with SMTP id w23mr16316900plq.292.1593562069576;
        Tue, 30 Jun 2020 17:07:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 24/32] protobuf-c: disable parallelism to avoid race condition
Date: Tue, 30 Jun 2020 17:07:09 -0700
Message-Id: <d6aff1ae4be6ef8d40d2e3232597ab994538a2a3.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Paul Eggleton <paul.eggleton@linux.microsoft.com>

Unfortunately 489d3b4b932ee8016d792341f8ea5836a9522cd4 did not completely
fix the problem - if you try cleaning and rebuilding protobuf-c-native it
doesn't take long to reproduce the issue on a 32-core machine. I spent
some time trying to debug this but failed, there is still a race between
generating t.test-full.pb.h and compiling cxx_generate_packed_data.c
despite BUILT_SOURCES and explicit dependencies. I even tried converting
the multiple target rules to use grouped targets (&:), that didn't fix it
either. Disabling parallelism as a workaround only costs ~20s and it
turns out that upstream is switching to Meson soon anyway:

  https://github.com/protobuf-c/protobuf-c/pull/340

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3251fe210a91d13ab2a6c5b7ecb283aa8e019020)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
index 94c3893574..ed8773443e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
@@ -26,6 +26,11 @@ BUILD_CXXFLAGS += "-std=c++11"
 
 inherit autotools pkgconfig
 
+# After several fix attempts there is still a race between generating
+# t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
+# BUILT_SOURCES and explicit dependencies.
+PARALLEL_MAKE = ""
+
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 
 FILES_${PN}-compiler = "${bindir}"
-- 
2.17.1

