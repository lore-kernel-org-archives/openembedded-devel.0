Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1919.1795113514676428777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q/mHjgMy;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so78692b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113514; x=1795718314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC2/AoOu87TmaFNUDHiE95J7X5bsxVDi5vBS4NOUhT8=;
        b=q/mHjgMylniLitI4YCiIQXpT26Tdvtcl2W2uOL1/pnRTlwwhV+XuBiGn05DQwdUUwh
         bBqD5C1AYicBRFwMkmz2zIwooCFikPl0kkaUiIU/9KauEMrLUEqkWS/kToutRZdtdd/O
         8h3vCcAy2ZaG8Ca6RMbV+CEWpoUEgRpwsFHKOpYBCfr+WX4wq49W76NNanfxz3f64HB/
         zdKEc/fYGa54ncKIt+VOJmy8syRx7miRSPQtTiXeN/wKb0kEAq5EpUA0sDKfcXp7LghF
         dQ8F0GWlziplGrC6gaXap44QOR3dE6vNdiNbsFI54DXjkEiqvYz9PciHWN+tyOa4UmOR
         IfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113514; x=1795718314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rC2/AoOu87TmaFNUDHiE95J7X5bsxVDi5vBS4NOUhT8=;
        b=mPRaiGyPIpVUC775Fb+YDprVLV6Mtst7BjJBqJNELla0um9CR8mj7x3YIqUvgF/qTZ
         zsy41s0Rx/5vCoezmTi00M7o4ObAHke8x8kxmlWyecXP6r+3YeXQ9C9RTPzVMHxbKfOb
         pbdzT3f8Yo0Uo+1QCM9tSjllpfjMBiNqC9q7uL1IVRFHCnTL4JkTMj7RNfkCPxk50yOE
         pj1zHPgwNxg869YrCXNoiJyiiRNQG8ukk7JsmBD89A1CU2xSEEilaKFtBCPDqCfAASTY
         bhJI+RU4fS+xXMOMTNpaYEEN8dvmvBJbNc6dBpxaWTt7LbXSvNvRqsxx8kBBJueicaq4
         UmSQ==
X-Gm-Message-State: APuU4Z/hpm6McVLOjK2cTE0jigZT/MCiu9TR+Svdh5Qc090SqvL5pOFz
	liyMmt+EywRPkekAtK3ZxiZVfaTdJ6HJ3p3SiEgfDXAndJOo9+vqEn+kF0IlCA==
X-Gm-Gg: AYBFou2tyRo2m5eBs4K1q/AkylipYGo2BKXmVY4beVTjaZgES+cKJcraY4AEltOdXcW
	2hJ3Wt0GjcbPQUkOARODKlYeATapS8n1T7HCdcrEzOZVYtFZplywbR+gSKBVdEuJ1MxsdCyzIol
	7yDGmlQRdl+jb/RtBpUmIlZGqG6zLMHEaBXJVKK4aitDe2lE5BwF+mfFEx/A7tRal4GfGS3ocew
	VWDOMsshXhSZUu77vQFWAW+YAqH6Uul2/zc1MOdKwVF+cWiW189V3ZNmeJotTBAePYISWxY5UZh
	Stl1XYTY4V/yACJl5P3VSXsKh7mxuBrpvzhWTbEoTncAOXCol5gbxsL8ipFKG0RLqpOKcUvZFUj
	IqhlisQMh7utviCixRJUO4DZZ7jV8XQRphnu1Pv2TZ4WeiylWqT2ItSr5H3q9vaOXuWsJx4umXH
	3VXCcntvkOuEMh0xsx0hi+8quvMTHv1P1umuGzINb8M2CbQ8lKrdeQUf+GMkKrLiNZ9L+hvlhRQ
	1anmDmblyCGJhpA2efa2fEcDwI6kS2jaQ8DvBzBOauLVK921fEpKKkMeMIBmoF0cuu6v3829fYd
	tqgvpdUZtp6kZJ6s5LpnJ3NOrCkllLF/BJFWUPBn1rqoHiicql3ZZ0aTAHlRNQ==
X-Received: by 2002:a05:6372:a705:b0:3e2:8f64:e500 with SMTP id adf61e73a8af0-4014ec4259fmr362101637.62.1795113514028;
        Thu, 19 Nov 2026 10:38:34 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 61/64] mongodb: Keep build paths out of buildInfo
Date: Fri, 20 Nov 2026 07:33:29 +1300
Message-ID: <50c3ddc86de4ec2f415c6981d59abb8aefa55786.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132751
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

By default buildInfo embeds the compiler version string and CCFLAGS,
CXXFLAGS and LINKFLAGS, which carry --sysroot and -ffile-prefix-map
paths into mongod and mongos and trigger buildpaths QA warnings. Pass
a variables file that drops those entries from
MONGO_BUILDINFO_ENVIRONMENT_DATA.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 17fb07cf799cc98205c63c2d2cc956fc8d12b533)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-dbs/mongodb/mongodb/oe-buildinfo.vars     | 11 +++++++++++
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb    |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
new file mode 100644
index 0000000000..950dc4baa2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
@@ -0,0 +1,11 @@
+# Keep the compiler and its flags, which carry build paths, out of
+# the buildInfo command and --version output
+from mongo.generators import default_buildinfo_environment_data
+
+MONGO_BUILDINFO_ENVIRONMENT_DATA = {
+    k: v for k, v in default_buildinfo_environment_data().items()
+    if k not in ('cc', 'ccflags', 'cxx', 'cxxflags', 'linkflags')
+}
+
+# SConstruct rejects unknown names left in a variables file
+del default_buildinfo_environment_data
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 22169ddd64..6c4fdf91a9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0003-boost-Fix-build-with-clang-23.patch \
            file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
            file://0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch \
+           file://oe-buildinfo.vars \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -87,6 +88,7 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  TARGET_ARCH=${MONGO_ARCH} \
                  MONGO_VERSION=${PV} \
                  OBJCOPY=${OBJCOPY} \
+                 --variables-files=${UNPACKDIR}/oe-buildinfo.vars \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
