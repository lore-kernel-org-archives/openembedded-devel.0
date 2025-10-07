Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A12CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:59:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.972.1759870796825806653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DYsml0CB;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b48d8deaef9so983877666b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759870795; x=1760475595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVBOWp8WM3Gez9XJ0Y/dmQ/h83KhR/en0F7Nxss9YE0=;
        b=DYsml0CBMZVjZ8MjjDeR/fY8wFK7KLxF/OjpDfogB8M2xzVQ3kjRWvasbmZACFmm3M
         qFm0RCjwjuqoNcQBriFObLB9wkbQi5WayD8JK56c+UU+J8fI5dEpW5G4o18ptbpbqUqy
         9bNGBGDyodsBGjdYpzHsxoqcdSz7htF6DuUe7nJVcr45ylFpXq926MLy5VZX2YlzSPrC
         12W4wZxwroVP8SA+iKboC5Uy203D9a1gMh1+LCA5erxJX8yVMT7UyFd0xms1mMY1R5Ol
         3Pj/vVbgDth0+NcO+vTivUJ/xO+t0sZYHBwnuSR52McY0qclZjyx0zounBPR+hnEyuO3
         cO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759870795; x=1760475595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVBOWp8WM3Gez9XJ0Y/dmQ/h83KhR/en0F7Nxss9YE0=;
        b=gZvkJGRrV+gs2F7A32OH5dI2TCxMRXtiMw3MB4kf9+caKWIHy5nRSJMOdK0ycnqtRs
         0ux8d/y7Y7P9XopUO8K6ZoolTj173kCQu1uSBAGyjRDsdbLwdSKQhUAk3f8AU/3JA1w9
         XV/9wHYlhJaF7q4EYCYqZjQpjLUs0TQDz6zjaMVdusWb9oMe2DqSbxPkg6dwlRA0AJY9
         YxUcpYpSUKjqafqCTICyZfc3ko5i+Ex4GPJFOGEvmyUtgveRJzWFZm3wMglvE77sMZpw
         ufPgx1qnjwtADYJggi9q6JFwcFXjJrzdmfUGbAOvHfaqdCgSxN72nVeifEUcOWSeuPiS
         03AA==
X-Gm-Message-State: AOJu0YwS+3MAD/NCx3QFfYGQlGhjKBZ3a5vVzKmrtP44kLr6n1yUR6rA
	qImvFDHKmGEYjErHO1DuynmOBUrQaljOiCaiiXck4TAnJH2fmHzzrX+AqykAnA==
X-Gm-Gg: ASbGnct/6dce+aOBdIJkDRU2M9FatRhZUks9ytVsWnQ1Tyg1gtNkC+GTtWyg/AOFpbN
	3/Blrw5AsRalnh+g5nihfFBn8JBbVdAOxuIva9ETpBWelHNg7FfVjq4ViNZpNyX7ZjV2/zOE3jG
	RMTRFL33/xhH2GYMeQD9lPMFsF6PC1P/mCfVP+2Odls8NNR2bYK7tNgOpqLSE87+hpfsBNbvYiV
	LoGQzWdIf7Jb114InF9JrTCXO2ptUzOqoZkmC1bxXPlotowptR1x19Ft6LQQwXlel4wjvSpPjjN
	k6VnNKpTFtOSJcOcPmKKVop+nKqnmToKlSHvEAXCqKsEL/1usHRJvmmbAqvr9jUq3vj1RjywZZn
	z48oGktmpVnTLmUnSOAbbXCcM27Anjjwo23t9Mq+ri1fa
X-Google-Smtp-Source: AGHT+IGVmz+9k3NQOY3vL0s3sUswji7Dm7GMujEYT4EPWKGCBxddZcwPErGH2X2aOFBO9fx/i7jqtg==
X-Received: by 2002:a17:907:9702:b0:b3c:6093:679b with SMTP id a640c23a62f3a-b50ac2d58b3mr116361266b.36.1759870794881;
        Tue, 07 Oct 2025 13:59:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9bd7sm1497134566b.3.2025.10.07.13.59.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 13:59:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nbdkit: upgrade 1.45.1 -> 1.45.9
Date: Tue,  7 Oct 2025 22:59:53 +0200
Message-ID: <20251007205953.199074-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 20:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120351

While working on it, also ignore CVE-2025-47711 and CVE-2025-47712.
Both vulnerabilities are fixed already (they were fixed before the
upgrade also, but there is no version-range associated with the CVE report).

CVE-2025-47711: https://gitlab.com/nbdkit/nbdkit/-/commit/e6f96bd1b77c0cc927ce6aeff650b52238304f39
CVE-2025-47712: https://gitlab.com/nbdkit/nbdkit/-/commit/a486f88d1eea653ea88b0bf8804c4825dab25ec7

Shortlog:
Merge branch '2025-optional-qemu-img' into 'master'
build: Check for qemu-img and disable some tests if not present
tests/curl: Skip test if 'disk' was not created
server/public.c: Use common/include parse_bool function
common/include: Extra bool parsing into a mini-library
docs: Shorter title and tweaks to the description
indexed-gzip: Include <stddef.h> to get ptrdiff_t
indexed-gzip: Move variable decl outside for loop
vddk: Sort synopsis into alphabetical order
ext2: Update docs since filter supports concurrent connections
docs: Move --short/--long-options to right place in synopsis
(origin/rhel-10.2) docs: Document how to probe for server command line options
server: Document --long-options and --short-options
docs/nbdkit-probing.pod: Rearrange synopsis to match description
server: Add --name parameter
docs: Fix bolding of --log=/path option
tests/test-python-plugin.py: Remove unused variables
python: Add binding for nbdkit_parse_bool
tests/test-python-plugin.py: Add name of test for test_parse_size
(tag: v1.45.6) Version 1.45.6.
Merge branch '2025-rounding' into 'master'
server/public.c: Use lrint() instead of implicit conversion to int
indexed-gzip: Fixes for 32-bit support
indexed-gzip: More editorially neutral content
Merge branch 'add-indexed-gzip-filter' into 'master'
Introduce index-gzip filter
Move unmodified index build/extract to ig_zran.h/c
Add serialize/deserialize fn for zran structs
Restructure zran.h, zran.c for use as library
Import zran.c/zran.h v1.6 (2 Aug 2024) from zlib
Merge branch '2025-delay-trigger' into 'master'
delay: Add new delay-trigger option
delay: Rearrange the options in alphabetical order in the documentation
tests/test-map.sh: Fix "nbd_pread: count cannot be 0: Invalid argument"
docs/nbdkit-client.pod: Document attaching NBD devices to QEMU VMs
docs/nbdkit-client.pod: Combine and rename "LIMITATIONS" section
Merge branch '2025-fix-golang-test' into 'master'
tests/test-golang-fork-warning.sh: Fix hanging test
Merge branch '2025-misc-fixes' into 'master'
tests: Use 'define script' in a few more places
tests: Modify make-pki and make-psk scripts to be atomic
tests: Define common functions for requiring TLS certs and PSK
tests/test-tls.sh: Remove unused export of pkidir
tests: Generate make-psk.sh
tests/make-psk.sh: Fix typo "pkstool" -> "psktool"
tests: Fix typo "An good" -> "A good"
map: Implement map-size feature
tests/test-at-file.sh: Fix srcdir != builddir
tests: Work around realpath error on BSDs
Merge branch '2025-eq-file' into 'master'
Merge branch '2025-server-debug' into 'master'
server: Use debug() instead of nbdkit_debug() consistently in the server
map: Refer to @PATH syntax in documentation
server: Add @PATH syntax
server/main.c: Factor out the function that parses key=value
server/main.c: Fix comment
server/main.c: Move key=value parsing to a new function
server/options.h: Reject empty string ("") as a short name
server/options.h: Add comment to is_short_name
server/main.c: Reject empty string as a plugin name or filter name
common: utils: Add const to <vector>_duplicate variable decls
data: Use new vector_append_array in a couple of places
map: Use new vector_append_array function instead of loop
common: utils: vector: Fix vector_uniq prototype and add a test
common: utils: vector: Add range functions for insert, append and remove
common: utils: vector: Prefer vector_reset over free()
Merge branch '2025-map-filter' into 'master'
New filter: map for remapping arbitrary blocks
common: utils: vector: Add new vector_uniq function
tests/functions: Factor out 2^63-1 constant used by a few tests
tests/test-cache-block-size.sh: Remove unused socket
data: Minor revisions to the documentation for clarity
full: Remove reference to equivalence of nbdkit-readonly-filter
tests/test-floppy.sh: Simplify this test
count: Add an example to the documentation
common/include/test-once.c: Further fixes for pthread_barrier_t
common/include/test-once.c: Skip test on macOS which lacks pthread_barrier_t

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nbdkit/{nbdkit_1.45.1.bb => nbdkit_1.45.9.bb}            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.1.bb => nbdkit_1.45.9.bb} (83%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb
similarity index 83%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb
index 63194ad393..fa850e1a28 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "243c6911984abc82bb711d2e5ecb1a13c7ff93c4"
+SRCREV = "2e2f933abf4e19842db0fdba2ac4030baea57686"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
@@ -31,3 +31,6 @@ EXTRA_OECONF = " --without-libvirt --without-libguestfs --disable-perl"
 #EXTRA_OECONF += " --disable-tcl"
 #EXTRA_OECONF += " --disable-lua"
 #EXTRA_OECONF += " --disable-vddk"
+
+CVE_STATUS[CVE-2025-47711] = "fixed-version: the used revision contains the vulnerability fix"
+CVE_STATUS[CVE-2025-47712] = "fixed-version: the used revision contains the vulnerability fix"

