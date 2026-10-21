Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7544.1792574992728328740
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dY0utr0r;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15943c9c005so628118c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574992; x=1793179792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJ5hTX/SKOeCIJEnFOKGcFMzm8eZxlRxckBhSZlXEqc=;
        b=dY0utr0rfmukwzmYEaeZuas4+ZMW4IjYMSMcOVPnDeY21zeKCGheVhKiD0o0zsgMVM
         MjGLUTCVMU/1HtN6V31e9jajcq7bm6QHWhKs2fpRqohQ5wLw1qSoFqMLmSRQevyCFm8q
         U/3N5/JMUJE9BzkWsDTE/pHu1k9dRWX7KZEStrnQ20OSKQt4ev1UJZiu4eFr61EdcR2b
         wKo3WMO2HXB/3GgEKyY7RqDkaOrnafX+77PLW693ykX+SUyu5+VJ/Dsa83OmGOCBG110
         Jp0BbZdy9mZKLsiqg5l5XnxVv9p33fyE7j0MBBiZd5lRt2ZX1KYSzrB3y5mdGolD5sAh
         WHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574992; x=1793179792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJ5hTX/SKOeCIJEnFOKGcFMzm8eZxlRxckBhSZlXEqc=;
        b=dtgETI7DH1yZuxXT6h0kH5AEhbPBJG/qMVFkuiXBI4Nlzx9rGrhJYGxDi/VsjS6yOk
         GuLtSCCDz2iYSMyC8ioc6oEYJ5z6uSWHXy3m4wtHJ6SAS6zK4a1WIz4HSh1SorQ0B7kZ
         p1vMADy3ihi23Prz9LPD2bxu0PSPb8mRbhFLNlwbnaTdZappKCzBeB1RJawtYOYYyvLl
         RIvGbEJobNIE6uo8+uGygRWB6/bk17cYqQ2lGA7q9+MRl0JM7yK0xPdnvm42FnH8Hj4X
         ZvMPVEU2vxXxv4BCZqKkwuCfaIRRD4EV757j4KNobrNVdoH0HudX7NCi1/yjxNRf/+qE
         jGIw==
X-Gm-Message-State: AFq9FYIkK8qd7APc3vRukemtxPzG2ZM3tuJRMJuY1lIjvY3yMRaROAXs
	ZvPFihii5OwszBWMWUUbFIM5Pn/XP02c1QSynBIyxowqIhS8OEHBadnKHN3fPA==
X-Gm-Gg: AYBFou3EmQsP9O/kvkcd3oeUrQaAu+IM3srTOdAqwhdNcleQ/2F4PkYLRzt9k3TWnn0
	P5fvbRjQriRBqcGAPqXO9zzvgIiR0NMjL1NL365gcmj+2NtBRuR3iIjyvIU2FbfWpLYPetW1Lk/
	3qWX+CWX2fFOIx6ulZR/6fpnvwudOHiGqC3POOCRV2wIW1RsjB7ZjGdQt3b0vVwnSKKOyObcAgV
	HjTrDhP3vbyp+XAiPQqgPZpIyFLtUcvULxcC/YAz9p7ZRDl7D2ioVG1M+hMkRWJMVxKP6rkvcgh
	4pontUp4rFBd/2w6Z/3RTjiuQoWYj0mGopSoHCKeQ3jFXPLIAfE6AAicksGIw7HkLB43wiwMpNO
	UdLolodeUtG6NTqMSjMIMqZck1nrsHKtFQa8w8ellCZRjNa+M6thjHKY/JCx9aT+tT3NHXDk91I
	zqRP1YX5GXfmGytBjG948Hv67QkX52sn6YIyF/VI8rnexOrmuKRR0u7MO+/U3ZZNNOrb8uKjrdN
	zPcynt10UFqP+vfEdQ3pRoQRd217nsADjAZ7uWvLiTUeDTvSWCIQPjaMXLfzJ2aKLn3iQ0p8Gtu
	MhMMYc6geVkx4PWyZw+1tG8rc727iwc=
X-Received: by 2002:a05:701a:c973:b0:143:868a:20c1 with SMTP id a92af1059eb24-190a9db4303mr1683578c88.46.1792574991947;
        Wed, 21 Oct 2026 02:29:51 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 21/44] poppler: patch CVE-2026-102620
Date: Wed, 21 Oct 2026 22:28:34 +1300
Message-ID: <20261021092857.3585453-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131208
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also backport commit[1] to allow cherry-pick of the commit fixing the CVE.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-102620

[1]https://gitlab.freedesktop.org/poppler/poppler/-/commit/786b06dac87dbe28e85ec7ea3d340810f151c25b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../poppler/poppler/CVE-2026-102620-1.patch   | 145 ++++++++++++++++++
 .../poppler/poppler/CVE-2026-102620-2.patch   |  34 ++++
 .../poppler/poppler_26.08.0.bb                |   2 +
 3 files changed, 181 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch
new file mode 100644
index 0000000000..e85866eddf
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch
@@ -0,0 +1,145 @@
+From b8ce8bb5df02fd3a70f4b34f3d64c88df7089409 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Sat, 8 Aug 2026 15:30:32 +0200
+Subject: [PATCH] FoFiTrueType::cvtSfnts: Move variables closer to where they
+ are used
+
+(cherry picked from commit 786b06dac87dbe28e85ec7ea3d340810f151c25b)
+
+CVE: CVE-2026-102620
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/786b06dac87dbe28e85ec7ea3d340810f151c25b]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ fofi/FoFiTrueType.cc | 42 +++++++++++++++++++-----------------------
+ 1 file changed, 19 insertions(+), 23 deletions(-)
+
+diff --git a/fofi/FoFiTrueType.cc b/fofi/FoFiTrueType.cc
+index 133fbc45e..e15cfc576 100644
+--- a/fofi/FoFiTrueType.cc
++++ b/fofi/FoFiTrueType.cc
+@@ -1058,9 +1058,6 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+     TrueTypeTable newTables[nT42Tables];
+     unsigned char tableDir[12 + nT42Tables * 16];
+     bool ok;
+-    unsigned int checksum;
+-    int nNewTables;
+-    int glyfTableLen, length, glyfPos, j, k;
+     std::array<unsigned char, 36> vheaTab = {
+         0, 1, 0, 0, // table version number
+         0, 0, // ascent
+@@ -1081,8 +1078,6 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+         0, 1 // number of advance heights in vmtx table
+     };
+     std::vector<unsigned char> vmtxTab;
+-    bool needVhea, needVmtx;
+-    int advance;
+ 
+     *maxUsedGlyph = -1;
+ 
+@@ -1116,7 +1111,7 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+     i = seekTable("loca");
+     pos = tables[i].offset;
+     i = seekTable("glyf");
+-    glyfTableLen = tables[i].len;
++    const int glyfTableLen = tables[i].len;
+     ok = true;
+     for (i = 0; i <= nGlyphs; ++i) {
+         locaTable[i].idx = i;
+@@ -1169,16 +1164,16 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+     }
+ 
+     // count the number of tables
+-    nNewTables = 0;
++    int nNewTables = 0;
+     for (i = 0; i < nT42Tables; ++i) {
+         if (t42Tables[i].required || seekTable(t42Tables[i].tag) >= 0) {
+             ++nNewTables;
+         }
+     }
+-    advance = 0; // make gcc happy
++    int advance = 0; // make gcc happy
+     if (needVerticalMetrics) {
+-        needVhea = seekTable("vhea") < 0;
+-        needVmtx = seekTable("vmtx") < 0;
++        const bool needVhea = seekTable("vhea") < 0;
++        const bool needVmtx = seekTable("vmtx") < 0;
+         if (needVhea || needVmtx) {
+             i = seekTable("head");
+             advance = getU16BE(tables[i].offset + 18, &ok); // units per em
+@@ -1194,10 +1189,10 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+     // construct the new table headers, including table checksums
+     // (pad each table out to a multiple of 4 bytes)
+     pos = 12 + nNewTables * 16;
+-    k = 0;
++    int k = 0;
+     for (i = 0; i < nT42Tables; ++i) {
+-        length = -1;
+-        checksum = 0; // make gcc happy
++        int length = -1;
++        unsigned int checksum = 0; // make gcc happy
+         if (i == t42HeadTable) {
+             length = 54;
+             checksum = computeTableChecksum(headData);
+@@ -1207,8 +1202,8 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+         } else if (i == t42GlyfTable) {
+             length = 0;
+             checksum = 0;
+-            glyfPos = tables[seekTable("glyf")].offset;
+-            for (j = 0; j < nGlyphs; ++j) {
++            const int glyfPos = tables[seekTable("glyf")].offset;
++            for (int j = 0; j < nGlyphs; ++j) {
+                 length += locaTable[j].len;
+                 if (length & 3) {
+                     length += 4 - (length & 3);
+@@ -1218,7 +1213,8 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+                 }
+             }
+         } else {
+-            if ((j = seekTable(t42Tables[i].tag)) >= 0) {
++            const int j = seekTable(t42Tables[i].tag);
++            if (j >= 0) {
+                 length = tables[j].len;
+                 if (checkRegion(tables[j].offset, length)) {
+                     checksum = computeTableChecksum(std::span(file.data() + tables[j].offset, length));
+@@ -1298,7 +1294,7 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+     }
+ 
+     // compute the font checksum and store it in the head table
+-    checksum = computeTableChecksum(std::span(tableDir, 12 + nNewTables * 16));
++    unsigned int checksum = computeTableChecksum(std::span(tableDir, 12 + nNewTables * 16));
+     for (i = 0; i < nNewTables; ++i) {
+         checksum += newTables[i].checksum;
+     }
+@@ -1325,11 +1321,10 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+         if (i == t42HeadTable) {
+             dumpString(headData, outputFunc, outputStream);
+         } else if (i == t42LocaTable) {
+-            length = (nGlyphs + 1) * (locaFmt ? 4 : 2);
+             dumpString(locaData, outputFunc, outputStream);
+         } else if (i == t42GlyfTable) {
+-            glyfPos = tables[seekTable("glyf")].offset;
+-            for (j = 0; j < nGlyphs; ++j) {
++            const int glyfPos = tables[seekTable("glyf")].offset;
++            for (int j = 0; j < nGlyphs; ++j) {
+                 if (locaTable[j].len > 0 && checkRegion(glyfPos + locaTable[j].origOffset, locaTable[j].len)) {
+                     dumpString(std::span(file.data() + glyfPos + locaTable[j].origOffset, locaTable[j].len), outputFunc, outputStream);
+                 }
+@@ -1338,13 +1333,14 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+             // length == 0 means the table is missing and the error was
+             // already reported during the construction of the table
+             // headers
+-            if ((length = newTables[i].len) > 0) {
+-                if ((j = seekTable(t42Tables[i].tag)) >= 0 && checkRegion(tables[j].offset, tables[j].len)) {
++            const int length = newTables[i].len;
++            if (length > 0) {
++                const int j = seekTable(t42Tables[i].tag);
++                if (j >= 0 && checkRegion(tables[j].offset, tables[j].len)) {
+                     dumpString(std::span(file.data() + tables[j].offset, tables[j].len), outputFunc, outputStream);
+                 } else if (needVerticalMetrics && i == t42VheaTable) {
+                     if (unlikely(static_cast<size_t>(length) > sizeof(vheaTab))) {
+                         error(errSyntaxWarning, -1, "length bigger than vheaTab size");
+-                        length = sizeof(vheaTab);
+                     }
+                     dumpString(vheaTab, outputFunc, outputStream);
+                 } else if (needVerticalMetrics && i == t42VmtxTable) {
diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch
new file mode 100644
index 0000000000..e41e65ffd9
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch
@@ -0,0 +1,34 @@
+From ac82c990768a4cb3dd4fd15edb92af97b4ac6589 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Sat, 8 Aug 2026 15:47:43 +0200
+Subject: [PATCH] Fix integer overflow in FoFiTrueType::cvtSfnts
+
+Issue #1762
+
+(cherry picked from commit 245d3c6823377755f2c1d5fdddd010279c6ed94d)
+
+CVE: CVE-2026-102620
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/245d3c6823377755f2c1d5fdddd010279c6ed94d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ fofi/FoFiTrueType.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/fofi/FoFiTrueType.cc b/fofi/FoFiTrueType.cc
+index e15cfc576..9e280fe89 100644
+--- a/fofi/FoFiTrueType.cc
++++ b/fofi/FoFiTrueType.cc
+@@ -1204,7 +1204,11 @@ void FoFiTrueType::cvtSfnts(FoFiOutputFunc outputFunc, void *outputStream, const
+             checksum = 0;
+             const int glyfPos = tables[seekTable("glyf")].offset;
+             for (int j = 0; j < nGlyphs; ++j) {
+-                length += locaTable[j].len;
++                if (unlikely(checkedAdd(length, locaTable[j].len, &length))) {
++                    error(errSyntaxError, -1, "Integer overflow in glyph table length calculation");
++                    ok = false;
++                    break;
++                }
+                 if (length & 3) {
+                     length += 4 - (length & 3);
+                 }
diff --git a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
index f24ca34366..6cfcf3cf0f 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            file://CVE-2026-102621.patch \
+           file://CVE-2026-102620-1.patch \
+           file://CVE-2026-102620-2.patch \
            "
 SRC_URI[sha256sum] = "dc906e68cea698109706ac6aa3d2c9d4512fcfcac42d90b8afcda486d1b9abd0"
 
