Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10108.1794999730659071028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xVzsXzxD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so8565025e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999729; x=1795604529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBqccGZF0TcH8HaWSv91Z9Qic3aNcT7oeq1MQsoE+98=;
        b=xVzsXzxDXHZam3qLPq2sQrYzQSzSdlGRWr0CrJZ6ihBZGaw2d52C+V26CopQleyfBA
         G0OhkUo5kN5ZLVWr69AaouId6MrNRM/vEXsGYWRCyRLcCZzYueCYcXCHh1kS4rWDXBTE
         zO3AEUsuNBrDdVzrEamZh5QBcZ4vd66CtBrPCwD+migpdcG6Ey/8cHQMV/nt4u2owqf6
         w22MRpXb0Y5QkU/A7XGMWSOWYWEJcbSTsWPoO4yZvtVy5jp/mkxBHokkfukKkVCpMVOT
         MRJDgy58grw11ekUZbg0E56bn1PBgjUm3jZexHxD4fZsnenuUN+7e/KDveTka5RJn4DA
         yOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999729; x=1795604529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBqccGZF0TcH8HaWSv91Z9Qic3aNcT7oeq1MQsoE+98=;
        b=sez02EQs9wqs1FLrDF60Bg+BEkiIafBn6m33RM8uCwIblSq0WqTrvEo6RjWKYIgTGu
         lWb1d9jHLDA94ikNLuXSm8z3W2cvP+I+6DO3rkDXFcNi95G2uoO+2qrJJ62RuT30JQnr
         wnSxhcoAIRtaHHX2AldvQan0C0UbUcBSK+2hgg7+uo9cJ0ObeFUrlBkDKWvXAiwk2TOI
         lknKlltRORGD/YxUlP50P8L1uJ5F+TdiI85jDN9AnYfDBn5Rf7d2ey3pJL2asMI7zlAK
         x2l+9r+mP+zyUmOWrUfDhRjYPaqOvBb+H4XureemnEfkhX3CVyYzpnjZOPC3eb9GqFyX
         SjTg==
X-Gm-Message-State: APuU4Z/HJZas3PDt/JlMsc0jJm8ZbxboIb6dVlfNy1LMGVlJaIRCNHPx
	bwzMr0pfA++GVPi6dG3s6Jf7Ai+91slT1wGagXTw9uv8pMpNDlukZruIxZuiFX/v
X-Gm-Gg: AYBFou0UJja2drhQU3bKUi2kmIAibv4KmEmXhU2/348PljL3Vh/qocgP7ZJnRFhkO+l
	Q2LC5S23FpcCbdxTvKTmfcVHWOwmtv8lCxrdR2ovq/D0zU2xLgB5JP84uuNYEmz/uG8P1sR5uVK
	sWyMq04K+Jwzn0/xUSOv76Jicp0wi3Ik/5Qos18QSaoLQyNed1OXRjFGq0NLcyboxteYRIj7M2P
	lTCW5c6sTMFL5uzlTl422UZ/+/DVs01zz4MNE/ThoUav8FsocVJ7kReGhikgH/m2LvJ8vx4Wjae
	lOw7Cg123gv6ZGKZaO1MnGD+TmgRtjr1UtstQFisSxujLPtRzTseVzaGm97haUwYbWrAc7iNpb+
	nkvQ3DVvPX7H57rW3g3E52D/d9MIMsWOE2iw1b/1PM5tITx7cqhJCXwF8vDTZx/o0irLsXeaxUe
	B9CvuM+TJua6OFUd/w2Y71JLO/wygde+lhqF9Sq1V9kJzgPxy6sp8OPYE/+PvDz1B1k8/1On7vs
	XtyP8tDXrOJUuhElK49ijMJeTodr8un/PKOIywN1Fw+lLvwEJVbSsjLn+YMoIbT4hKZEhy163H1
	Zdw9H62tJDAvyRtMig2Fb9BNLTVzANrRLU05mHWrgKrGnHyj6uMf5qD9k4ndYDcaBb4ZjYgeIbE
	=
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr43629925e9.4.1794999728490;
        Wed, 18 Nov 2026 03:02:08 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:07 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 7/7] mongodb: Keep build paths out of buildInfo
Date: Wed, 18 Nov 2026 16:01:20 +0500
Message-Id: <20261118110120.3913031-8-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132644
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

By default buildInfo embeds the compiler version string and CCFLAGS,
CXXFLAGS and LINKFLAGS, which carry --sysroot and -ffile-prefix-map
paths into mongod and mongos and trigger buildpaths QA warnings. Pass
a variables file that drops those entries from
MONGO_BUILDINFO_ENVIRONMENT_DATA.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 17fb07cf799cc98205c63c2d2cc956fc8d12b533)
Signed-off-by: Awais B <awais.b@rufilla.com>
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
index 0cd1dd9def..76a3acfda4 100644
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
-- 
2.34.1

