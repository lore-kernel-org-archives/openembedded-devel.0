Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.20744.1586975056315891509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 11:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DZdQ4I6t;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id n24so308610plp.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VX54iV9ZQCcermT6TyVuWfvnGbco/FR3R20TSxj9kGU=;
        b=DZdQ4I6tUPZXX/NAywTZbU6XZD1FdrNk8r8d6/72nL4kZmgueaNeF+ry0Ppg0bh+AU
         rcRdQj53GjqTE5SPvvlnQbjQZmRsC4WiwB1VvURFSjjsmSokWZrk0e+BCGSDTNtNF5jB
         bom2G2GEVkauFyUakAJbDRLtgsMwL3TljGvZlULOiqUcqZEJ62v99VRYrd+IizSEqOxg
         pgazexlXxAgdRXtHOWhUXzWbRpvf+QPHlzvkaSjreflKsQuUrW6D9PgwNM4JFAaMmnaB
         E0KokWopglS/dM2RaI+ReiH1cGoGx/zZAlzwwHRgKZTcN7TV0Rp5EcmLQrCli7QZ3vR6
         du7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VX54iV9ZQCcermT6TyVuWfvnGbco/FR3R20TSxj9kGU=;
        b=neWumTPj5SLryFT9w4SbFhHQdy1RYI/tFilUXNYZlVVVGfsHv2yZrF2baAJfZc8bzh
         CR0N86+sDg2fFaYqRAvGPViT8aZZcawQAMQxkUp8y6J4GZHb44sPgc/mEkeay5DKzMzk
         PUR8BGkD/PrZS+xnW3HUeYr9qJ3MQSPBjxLzpCICwjgMsWOBzweGgg7AsIuOTHRyxiDU
         Wp6ts0YBB8ZA53792MBguWOyIWiF4WBO8cykp/mO9hP8V7USXIQ+hY90IzYEBC06xNUZ
         WUSnjgg4Bil2/zHRAKpe3ExsPlGY0IvDJviXYhNrPpYAk3Al6YieDel8tW+t6UhcCHc3
         C0ng==
X-Gm-Message-State: AGi0PuYPSl9le7C2Kr7LkOmi6aPFv4lsN7uAjvJ2p/dgMwcuyvetOdDG
	v7RG6+byGU4zRRHyplDSYzcMOxZpnZU=
X-Google-Smtp-Source: APiQypLx8rWI5c6YFwTta5Ctlh6XVqVQC5Q2aZzFKg2Kmey6k78s7pr4SqNq01Gam+F5eJ9+ooAxKQ==
X-Received: by 2002:a17:902:eed1:: with SMTP id h17mr1807852plb.206.1586975055191;
        Wed, 15 Apr 2020 11:24:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id f3sm245564pjo.24.2020.04.15.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 11:24:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Fix -Wc++11-narrowing on mips
Date: Wed, 15 Apr 2020 11:24:12 -0700
Message-Id: <20200415182412.2176914-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/nodejs/mips-warnings.patch         | 19 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_12.14.1.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch
new file mode 100644
index 0000000000..1a773f23d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch
@@ -0,0 +1,19 @@
+Add explicit static cast to fix narrowing warning
+
+Fixes
+deps/v8/src/codegen/mips/assembler-mips.cc:3556:44: error: non-constant-expression cannot be narrowed from type 'int' to 'size_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/deps/v8/src/codegen/mips/assembler-mips.cc
++++ b/deps/v8/src/codegen/mips/assembler-mips.cc
+@@ -3553,7 +3553,7 @@ void Assembler::GrowBuffer() {
+                                reloc_info_writer.last_pc() + pc_delta);
+ 
+   // Relocate runtime entries.
+-  Vector<byte> instructions{buffer_start_, pc_offset()};
++  Vector<byte> instructions{buffer_start_, static_cast<size_t>(pc_offset())};
+   Vector<const byte> reloc_info{reloc_info_writer.pos(), reloc_size};
+   for (RelocIterator it(instructions, reloc_info, 0); !it.done(); it.next()) {
+     RelocInfo::Mode rmode = it.rinfo()->rmode();
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index 28b4136a5a..d468fb3ffa 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://big-endian.patch \
            file://0001-build-allow-passing-multiple-libs-to-pkg_config.patch \
            file://0002-build-allow-use-of-system-installed-brotli.patch \
+           file://mips-warnings.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.26.1

