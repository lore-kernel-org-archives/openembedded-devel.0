Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.3479.1618693572417405619
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFVytof4;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id o16so2131318plg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nuSLYVHJWKQ3UY095Sx0qyepcchOGx2H7wAcrQeLphQ=;
        b=BFVytof4ZhygELovBhGcigX32G3soPRR/Vteg9hn7Y8eZbAqC/k3fcJw+woyFNd9gj
         2icv2l74AfjvAwLda2SgpROTaX1QM2zm4ZfqikmFCc9L2s1kgLldlA/9Cc/30jyDkqje
         4/GcDBqbhoIOlPrAYJeVppO+EkmPHSFPXsQkinDY22IfAKq2zuebNv30nHaT+f9J9ILT
         liRmXbwBvpqh50HqYOfcxiv1sRaToRZAK/DeHFkGw6ZW604k0G4W4Xb5acCIsXz9I2Fx
         w8SKnD7d/+Nk+trtebmizJoloT+w+bwFkBOaAd27zHcoiX31Gp0y2xxBmmVhOyy2/Hac
         2ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nuSLYVHJWKQ3UY095Sx0qyepcchOGx2H7wAcrQeLphQ=;
        b=pi8EB69CjBnGuhoc1kP4qWK0wUfWGSx3OvX78jRVg33yNd5tA9HZToZ3fullOk3DjT
         8H6lA7cGL4QHywG1QBi+50/Ss7BJOiWhCb+m8NvhWv1kiKuR0PfD4OrT8YTNJYTUj2iO
         a1qABgPzB75LDw9g5WNe7I2OU9o960n1fwvqZ/Vk9gXMS6Q/U7ZtvS8MqWC7KLOAEU9m
         cBHSOGrvnNaAITwlRag+sjXPAQvVPRNQeoB9BxS/iBHeLRH/eqF04RuZYje5uEkNcDDX
         RRNLHzBj3NOl3RvVN98hDOqaMQhrrmfg35Mv4T1LAYb9vI0JROhUhgtXmi31uEL1+mzz
         PnSw==
X-Gm-Message-State: AOAM533d7tMVQy+eoR6bJcxZG5HWAqSnksFs2ufmOB2HJkQgsAnV97E1
	AMIas6khhP+s99H0NHeZfRkM94I7A0XoMw==
X-Google-Smtp-Source: ABdhPJwswoRdSLKe7i05zZIRB8CR/qMU9BoL2PJ2labwMhzmQOLovz1XTVI/RrSwURbx9CtnjLa3sQ==
X-Received: by 2002:a17:902:c407:b029:e7:2272:d12e with SMTP id k7-20020a170902c407b02900e72272d12emr15423685plk.52.1618693571726;
        Sat, 17 Apr 2021 14:06:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 02/50] tbb: Fix build with musl
Date: Sat, 17 Apr 2021 14:05:11 -0700
Message-Id: <16103af5b994479e06d30e17dcea7b3310e6ad42.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Need to link libucontext on musl
Additionally, mips also needs libatomic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index d0e23114021..b05a59dc70a 100644
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
2.17.1

