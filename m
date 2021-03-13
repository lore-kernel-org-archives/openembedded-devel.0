Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.2010.1615658827382521519
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=equaX+eM;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so12673575pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 10:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJo2YlZzoj/qa8foNCkoF8HZUgT488A7pLwPXPPcfQs=;
        b=equaX+eMJsKYJ9uJWByRDFf05QVikBsrX9fum+nMo4d+0VICfy9prFbyfZl8JCG9K5
         3+AcY3LYUWDvufO6b4Uw/qKtU+O6hew/lSOGcHikRW8TxrXE6JX+FiXVPF16UuJ+N976
         GRt7jTY+TDikN71URDQxcEfsgxhySTdTL2OW2RCYyLy+ifwnFxtWKh32tQCFZ4nH80V+
         ou3WeL4hWxn+wFkmOizbVfk+VuzBWbMO3uHKjf/d4GJ9icxo8UlEMGqFuC5ie+0C9ceH
         eAME/DWmfE07nxe51acy8LB27HaN8yhcnaLD1TgEozeWsD8pYCHIU1Bs2i0SLttI2Npe
         GZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJo2YlZzoj/qa8foNCkoF8HZUgT488A7pLwPXPPcfQs=;
        b=NrlrUyRKzRZEV+OQXceGiEMEiRbbocWmzAzEDau+3BLXf/K7NPIflVK6VMVt6z5OJR
         HLlFlUvbBqQBeeqpdy5vQQgBg/bvOpujye5qznkEMCWEWdchIqL4I3noZIsn196LtzwD
         Lf4eq3JgQhbphzsatNI4anWpsW+KviuoXiisCoAvEvSyeNJYTFaJDki8gFNhgbl8a/7X
         qlWTNLwCy3e5g0rlxNDRs4treoz9129RDRr0tT8feTXRityv+QgK0U4DGdGv8cYaG+3n
         XIqnEjURs5lUOzCByc6pjisTCEsR563+G90UqwNf24WEK2bePccN3q8fU6KwgyULJAdl
         24Jw==
X-Gm-Message-State: AOAM533fUqOdjTb8PQX7nvgTPnNDMxkK47AvYiSZny7eZtY3SdzMJ+XT
	95M7FW+a9FfSCq4R7eCNFcrIH7k/QTXA5g==
X-Google-Smtp-Source: ABdhPJzs/4QcHzG+/yioT045K5G191xJW4zGhyMv/74tRZOkSr8qbzIcIIm58ZpVnUuvyVdk27k0Lw==
X-Received: by 2002:a17:902:b185:b029:e6:6d17:6ea with SMTP id s5-20020a170902b185b02900e66d1706eamr4151669plr.40.1615658826484;
        Sat, 13 Mar 2021 10:07:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id a7sm8846348pfo.105.2021.03.13.10.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:07:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Fix cross build on ppc64le
Date: Sat, 13 Mar 2021 10:06:58 -0800
Message-Id: <20210313180658.386899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/mongodb/disable_runtime_check.patch | 17 +++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb          |  8 +++++---
 2 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
new file mode 100644
index 0000000000..78ebba8fb7
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
@@ -0,0 +1,17 @@
+Lets use cached result for this otherwise runtime test, on qemuppc64
+when this test is run using gcc11, it returns 1, since we dont worry
+about older compilers here, we can cache the result and use it here
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/SConstruct
++++ b/SConstruct
+@@ -3904,7 +3904,7 @@ def doConfigure(myenv):
+ 
+         conf.AddTest('CheckAltivecVbpermqOutput', CheckAltivecVbpermqOutput)
+ 
+-        outputIndex = next((idx for idx in [0,1] if conf.CheckAltivecVbpermqOutput(idx)), None)
++        outputIndex = 1
+         if outputIndex is not None:
+             conf.env.SetConfigHeaderDefine("MONGO_CONFIG_ALTIVEC_VEC_VBPERMQ_OUTPUT_INDEX", outputIndex)
+         else:
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 2edd345590..3214918db8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Fix-compilation-with-fno-common.patch \
            file://0001-stacktrace-Define-ARCH_BITS-for-x86.patch \
            file://0001-include-needed-c-header.patch \
+           file://disable_runtime_check.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -56,12 +57,15 @@ PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[shell] = ",--js-engine=none,,"
 PACKAGECONFIG[system-pcre] = "--use-system-pcre,,libpcre,"
 
+MONGO_ARCH ?= "${HOST_ARCH}"
+MONGO_ARCH_powerpc64le = "ppc64le"
+
 EXTRA_OESCONS = "PREFIX=${prefix} \
                  DESTDIR=${D} \
                  LIBPATH=${STAGING_LIBDIR} \
                  LINKFLAGS='${LDFLAGS}' \
                  CXXFLAGS='${CXXFLAGS}' \
-                 TARGET_ARCH=${TARGET_ARCH} \
+                 TARGET_ARCH=${MONGO_ARCH} \
                  MONGO_VERSION=${PV} \
                  OBJCOPY=${OBJCOPY} \
                  --ssl \
@@ -116,5 +120,3 @@ scons_do_install() {
 CONFFILES_${PN} = "${sysconfdir}/mongod.conf"
 
 SYSTEMD_SERVICE_${PN} = "mongod.service"
-
-
-- 
2.30.2

