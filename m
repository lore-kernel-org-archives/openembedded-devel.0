Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12022.1794070365076550636
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N+uhUPtw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so10948345e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070363; x=1794675163; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLb4ZN22w6DOOGTdaiDztYpE1OBUul1Wm8KJneNHvJQ=;
        b=N+uhUPtwlIohuXJLrsvWP8Hb5MvgrSmU7MXGkgEU8VsOyRxXjCKkuv6PXCdw+HrpYQ
         TZOOZ+mX4BD+kGn+B+m6/X6f4bjG2yMd913qtuMoyi4bPeJcRniGkZu+gB1AA9UaNQd0
         FKw1noawY0odZFWPoGZZB3RMlO9O1r8+p8iLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070363; x=1794675163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLb4ZN22w6DOOGTdaiDztYpE1OBUul1Wm8KJneNHvJQ=;
        b=iKDYKhCe5dZGRns994CIy5pAKLmnYEmcdKe0UIH1M9dDabzoPu5xptjOIPhts9Rfob
         CLDNYvgubM73lSdi7BgVR0sv7qUppupAj8PBN0Qb1ojdDjGqSaTPdFDG1JrXMirYkPPP
         XeBjrqbVd3vsRMWJqtQnoYaIjmxlF7udBI6X4Y6FktLoipfNsvGiSK9rKZIlMnGADfhD
         tL3S0JlMa3o5dKrJd3TYeAtD/wIBmup4mziBf4IBw2qZFMBcXWFurFKhy0ZA8Qa5PObs
         WFreGXIuiNuS+Qr/XhOkIKoKOYuRiJXUR4H0DGNAJ+FRYCT1tNaPykamvs0QNIB61AUb
         kAPg==
X-Gm-Message-State: APuU4Z9oK9A3fw6sRjX8jEvu8HUk9SpiOjkGkW2aPe7bgt6ohd7Hqc4/
	Jg3aC1YEmXGyTLzK6X+XYD8RFqbi09AJnNq40xTN9qdgiGlc6o/wavKU6NxssOKt+VXQ1obXBUh
	DoC7E
X-Gm-Gg: AYBFou1KKmrDXX8RpWYn1CTYkQrcUgHkHDu0E/mLjf1QMX/S193g0o/lumohwifdnT7
	Z5Mr9sOjxJELc+Eg3cKckEDS7FouftUfWcmrf4DteTDz2W+yI+iRtFMHMb/U6dKD2bbe8lCJhem
	jCQCuf4mZXpAwOzG9aJAh6oK7gpPvsEsOjS/C21M+yOSeXxGIvQbl+9s/tl0FknvWcqqQZxpVO+
	aX/QZElW285RkXlUj3Qqo190XLCLVJDoABOpzhoD8HOZgEiQkz0qD3cAuGuzUAz7HbEFU3VehyB
	EwhP2Ly/5UpDaJZI2YH3Jy3H2nJ2OcIl3/O0pKMKUo85UdWGi9NQ6/gQk92dcaVJW9j2vy6nWFS
	tNPrJVgL5c2rvgGscauimUCCiC+UYWd3uoIpedqFW3OSd6ifw2bNgJUWxJ1fwx7RQp0X3891/k0
	qagqQzoAmNIJ2MEdXJJDl98sF2vVkhAP9rP72V6nIlvjsdEHbbNiJh2iGZlsstkJRuzyrTSw5vF
	YOEnD/dd9S8uh2B/0h4SQKgUU/xcjPgh1uBlgvk/ORAyZgpr+582u+GX4V4GKyvWRpUIdhjHfSn
	R5xJ9UuL9RjC3/RoI7dM2VdnKP4AvAU3MOM8Sd/l7gV9PGoPsHhhzotFRGgvkpOLajUQkfDvAXJ
	HmXgs7Lu5uXbYfx6lfrOSfhXLvAqf/V0p6M4uLGxtdhEiy4dQf+56G8CZ8G/IwREgS2UD/5y0Ou
	U=
X-Received: by 2002:a05:600c:3f16:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4b6dea6a06cmr97787175e9.21.1794070363198;
        Sat, 07 Nov 2026 08:52:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 20/22] minizip: Upgrade 1.3.2 -> 1.4
Date: Sat,  7 Nov 2026 18:52:19 +0200
Message-ID: <20261107165221.122340-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132005
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.4:

Breaking changes:

- CMake:
  - The minimum CMake version is now 3.15, up from 3.12.
  - Library file names changed on MSVC: z is now libz, as in
    libz.dll, libz.lib, and the static libzs.lib. minizip's
    libraries changed the same way.
  - On Cygwin, the libraries now use the lib prefix.
  - Contrib targets and tests built as part of zlib are now
    prefixed with zlib_. Several test targets were renamed to one
    scheme, for example zlib_examplestatic and minigzipstatic.
  - The zlib1.dll option ENABLE_BZIP2 is now
    ZLIB1_DLL_ENABLE_BZIP2.
- When not otherwise determined, z_off_t is again long, as in
  1.3.1, instead of 1.3.2's long long. Windows applications built
  with 1.3.2 headers should be recompiled; see Enhancements for
  64-bit offsets.
- deflateReset() now resets the gzip header set by
  deflateSetHeader(), as zlib.h has always said. Code relying on
  the header persisting must set it again.
- Raw deflate that completes exactly at the end of the output
  buffer now returns Z_STREAM_END instead of Z_OK, as documented.
- gzopen() with "x" now fails where O_EXCL isn't available, instead
  of truncating an existing file (Trail of Bits TOB-ZLIB-009).
- gzip reading now delivers the data decompressed before a read
  error, and only then reports the error.

Security fixes:

- Non-blocking gzwrite() had a buffer overflow; CVE-2026-85091
  (reported by mat-mo; also TOB-ZLIB-003).
- inflateGetDictionary() could write up to 8 MB past the caller's
  32K buffer (Theorem THM-ZLIB-001). This took a zlib header with
  an invalid window size, then inflateReset() or inflateSync().
  Affects 1.3.1 and 1.3.2.
- inflateSync() before the window size was known allocated a
  one-byte window that could later be overrun (TOB-ZLIB-004).
- inflatePrime() could lead inflate() to read before the start of
  the input (TOB-ZLIB-014).
- Repeated deflatePrime() calls could write past the pending buffer
  (TOB-ZLIB-013).
- inflateBack() failed to detect distances too far back, and copied
  uninitialized memory to the output (reported by Kornel Lesiński).
- gzseek() forward before any data was written could write
  uninitialized memory to the gzip output (found by Claude Opus
  5.5).
- deflateResetKeep() used mid-stream could read outside the window
  (reported by Jason Gross).
- gzdopen() now sets close-on-exec with the correct flag
  (TOB-ZLIB-008).
- minizip:
  - A double free in block_central_name() (reported by Oculytic),
    and a NULL dereference on repeated zipAlreadyThere() calls
    after a bad central directory (reported by Naveed Khan).
  - Validation of extra-field sizes, plus portable, alignment-safe
    reading, in zipRemoveExtraInfoBlock() (reported by Naveed Khan
    and jmestwa-coder).
  - unzip no longer reads Zip64 values from outside their
    extra-field record (reported by Mohamed Elnady). It also uses
    only the Zip64 locator immediately before the end of central
    directory record (reported by snajafov). Crafted archives could
    make minizip report different entries than other readers.
  - miniunz could create directories outside the extraction
    directory (reported by Naveed Khan), and on Windows write files
    anywhere (reported by Trail of Bits). Fixed by Naveed Khan.
    Path names are now processed by component.
- contrib/infback9: removed out-of-bounds pointer arithmetic in
  inftree9.c; CVE-2026-4738 (fix by npt-1707, submitted by
  CrossVR). The pointers return in bounds before use and no known
  compiler mishandles this, so the critical rating overstates it,
  though it could trap on capability hardware such as CHERI.

Bug fixes:

- gzip reading:
  - Restored the detection of truncated gzip streams, part of which
    was lost in 1.3.2. Also fixed a complete stream being reported
    as truncated.
  - An error in the first member is no longer treated as trailing
    garbage.
  - Corrected pending-skip handling in gz_skip(), gzdirect() and
    forced seeks at EOF.
  - gzgets() now returns an empty string when promised.
- gzip writing:
  - Successive SEEK_CUR seeks no longer lose zero fill.
  - Zero fill is now handled correctly after a write error.
  - gzprintf() is now all-or-nothing when blocked, and is no longer
    a stub when compiled as C++.
  - gzseek() leaves the position unchanged on failure.
  - gzopen_w() now works with paths not representable in the
    locale.
- inflate:
  - total_in was short six bytes on Z_NEED_DICT.
  - inflateReset() now restores the requested window size, and the
    wrap after inflateSync().
  - inflateSetDictionary() rejects a null dictionary.
  - With PKZIP_BUG_WORKAROUND, the code tables were slightly too
    small.
- deflate:
  - A bad deflateSetDictionary() call is now detected as promised.
  - A failed deflateCopy() or inflateCopy() leaves the destination
    safe to end.
  - Removed a possible overflow in deflate_stored() comparisons.
- Undefined behavior removed in gzwrite.c, gzseek, gz_vacate() and
  mztools.c.
- minizip:
  - zip.c no longer writes corrupt headers when a Zip64 field
    overflows an extra field (reported by mzfr and itsgaldoron), or
    for Zip64 entries with file comments.
  - zipOpen3() no longer leaks memory or returns a freed comment
    pointer on failure.
  - Added allocation checks.
- Build:
  - configure now builds the shared library with linkers such as
    lld that reject undefined symbols in zlib.map, including for
    --solo.
  - zlib.h no longer depends on NULL being defined.
  - zip.c builds with NO_ADDFILEINEXISTINGZIP.
  - The test programs use the generated zconf.h when building out
    of tree.
- Many CMake fixes: pkg-config files, installation of headers and
  of minizip's configuration, symbol prefixing, assembler
  detection, and parallel testing. It also works with CMake 4.

Enhancements:

- 64-bit offsets on Windows with MSVC or MinGW, by compiling the
  application with _FILE_OFFSET_BITS=64 or _LARGEFILE64_SOURCE. The
  library itself needs no changes.
- Platforms:
  - Android large file support.
  - An export list on AIX.
  - -Wno-psabi, only where the PowerPC note would appear.
  - s390x VGFMAFLAG in configure.
  - Win32 Makefile.msc builds for ARM64.
  - minigzip's mmap code uses POSIX types.
- CMake:
  - Package components, with _FOUND variables.
  - Installation and export of zlib1.dll and zlibwapi.dll.
  - Contribs build standalone, with zlib's defaults.
  - Tests consolidated, and tests on Windows.
- minizip:
  - The traditional encryption header uses a PCG generator instead
    of rand().
  - Fewer compiler warnings.
- Documentation:
  - Clarified that undocumented functions are not part of the API.
  - inflateGetHeader() header reuse.
  - deflateBound() and deflateSetDictionary() ordering.
  - The application's responsibilities in unzip.h.

Known issues:

- contrib/iostream2 is unsafe on untrusted input (reported by Trail
  of Bits). When reading a string, it uses the length stored in the
  compressed data without checking it, so a crafted file can write
  past the end of the destination buffer. Use contrib/iostream3
  instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 25 -------------------
 .../{minizip_1.3.2.bb => minizip_1.4.bb}      |  6 ++---
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
 rename meta-oe/recipes-core/minizip/{minizip_1.3.2.bb => minizip_1.4.bb} (72%)

diff --git a/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
deleted file mode 100644
index 1d05989c74..0000000000
--- a/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
-From: Rui Chen <rui@chenrui.dev>
-Date: Tue, 17 Feb 2026 10:48:39 -0500
-Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
-
-So that ints.h is part of the installation.
-
-Upstream-Status: Backport
-Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
----
- contrib/minizip/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
-index d343011..b7dea4f 100644
---- a/contrib/minizip/Makefile.am
-+++ b/contrib/minizip/Makefile.am
-@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
- minizip_includedir = $(includedir)/minizip
- minizip_include_HEADERS = \
- 	crypt.h \
-+	ints.h \
- 	ioapi.h \
- 	mztools.h \
- 	unzip.h \
diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.2.bb b/meta-oe/recipes-core/minizip/minizip_1.4.bb
similarity index 72%
rename from meta-oe/recipes-core/minizip/minizip_1.3.2.bb
rename to meta-oe/recipes-core/minizip/minizip_1.4.bb
index 95a605ecf4..c8ef81862f 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.4.bb
@@ -8,13 +8,11 @@ LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=b7d2930a7332b2bc68f
 
 GITHUB_BASE_URI ?= "https://github.com/madler/zlib/releases/"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz \
-           file://0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch;patchdir=../.. \
-           "
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz"
 
 S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
 
-SRC_URI[sha256sum] = "d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3"
+SRC_URI[sha256sum] = "4f11c512053d7bab8d9e9b89bde3575add3e4c50a383b42ef6cb837035fc5a7c"
 
 PACKAGECONFIG ??= "demos"
 PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
-- 
2.47.3

