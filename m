Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6267.1792499565004087041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RFsmAlxG;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so22239335e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499563; x=1793104363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDiwtC8pBIW4OvgkSrqkqK5vyeOq7VMzUBzs9/F5I3g=;
        b=RFsmAlxG+Ig0azUBFbdDkIXzzgjmdloLIzk8ELqaHWga243n8Tzmd81cR8xSUrs6s2
         Kc7WOYIvsJUoq9e53eGw1ioDpZfNFA1kgwEoI8Y2Jo2bMcyjZbQ+fhDSx9LAT4MIyx7/
         ho6Lbm313GCJSpPxqrEOuHc7ggS5FKd642NFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499563; x=1793104363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDiwtC8pBIW4OvgkSrqkqK5vyeOq7VMzUBzs9/F5I3g=;
        b=J/EGMYFAaB9/Zg6HNgQ35vzx7kIfnA0jAYwmTazbCvmi0byJ88hkyLFcxZ+hWH3vF3
         fkopyI5UJ7L+t+JyU7tN27HYqB5uWCCeNlrDxFfxNsdsTZO43676w9njgG1RtA4Z+V0B
         /p2nigV5pkoGVV+UFRAfY2JqpLXIWFlgf1iICY1QK4u7ce9cQPnQuyYLDnhD8eU2byA1
         L+PSz5KctH2SRcWgVkgEtQ6zyLIu3LeQ9XY/OZf8NNDlmpeeKJQBd2Q05LdljOVtbaVg
         CO1DJi9kGZlzVY+EhQEcEFXQmxJPHbkn0fm//VTWr7zVhUhkrmJpCVs2KwegHIKcd+b1
         9V1Q==
X-Gm-Message-State: AFq9FYJjzAzp0+FkoMEZHyfdt+2MzTsfAQposBWqqo0MdlKK1VlafCuC
	+wrbY4XxGf9mw/s2za+FhzMiGXoMBsQ8ZnmQHHsGJlHB4Pgge19ItuzNPUwqvkg09og6L61k+pd
	74sBA
X-Gm-Gg: AYBFou2+qqgT2mJEAfnGMZNKcgls1YcnO+9UoD6JE4Ow5PRZyQSkIPkdZVfPlyCX8lH
	uhnjPlIdTuwptO0gPsR1HeTw3W1TBKb9iuu0Al7gqbZqCx2gojBH+Sd3d6etfYCQiMRuts3xAKp
	F2hBKjznMPNeupXTmyXohU3y3u6j7TxKI/ND8w1W4H/AalHQhTFnyiNOcY+EFrNK1CL8zxcGmY4
	9aDTHt8SeA49XhrWYBTy0JM0aBjqsyOuJ2/pFVd5/QUA4nNE+aaPaUVIConfAEGoqxhL7+KhoV6
	Hii9ESkuoh4aXTlcMtArLXekzyi5A/2mwTVGcPraIYHwGhGGEbflGySM21HK5z+pNAr68sRKmQW
	f+NwNWM4SgbJC11YNHCwqLc3DKHoq2LNUITVxhP1S8Ha4Jou+bF0GYb7+tF7+TcQEhTDHU5IJ4B
	S52Nn8WCHVkMWzlWFWbCkCYj8OoBMUJr0YK8cQK+TxXqM5LOAG2IJM3w9lTmJaIzVDHUsdiXmK+
	o1QV+HFApVYuaRH1eDJUlMdmgXM/x0aL32rLjTFndH0ZImAzYgjsfyQ41OFnNliZeoLwMvME6NX
	Fa8sqGqGh6RtW/jYTY4eIBA=
X-Received: by 2002:a05:600c:3b17:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a1d7621208mr246511575e9.31.1792499563023;
        Tue, 20 Oct 2026 05:32:43 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/14] python3-fsspec: Upgrade 2026.7.0 -> 2026.9.0
Date: Tue, 20 Oct 2026 15:32:25 +0300
Message-ID: <20261020123226.4033600-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131171
Content-Type: text/plain; charset="utf-8"

Switch SRC_URI to enable tests and upgrade to release 2026.9.0:

- ia:// filesystem for files in Internet Archive items: an
  HTTPFileSystem reading from archive.org/download with credentials
  from ia configure's ia.ini
- Allow instance-local memory stores with global_store=False while
  preserving normal instance caching and the default shared store
- Add an adaptive readahead cache
- Implement created and modified for SFTPFileSystem
- Allow filesystem implementations to assign protocol per instance
- Delegate sizes and cat_ranges from DirFileSystem to the wrapped
  filesystem
- Delegate invalidate_cache, ukey and checksum from DirFileSystem
  to the wrapped filesystem
- Support negative offsets in TarFileSystem.cat_file
- Mirror readinto from the PyArrow stream onto ArrowFile
- Allow simplecache files to be removed by age using their
  modification times
- HTTP: retry transient failures (408/425/429/5xx, dropped
  connections, timeouts, truncated range bodies, a 416 inside the
  file) of cat_file, HTTPFile block reads and the size lookup
  behind open, controlled by the new retries, retry_wait,
  retry_statuses and retry_exceptions options

Fixes:

- Compute HadoopFileSystem.fsid from its configured host and port
  instead of accessing attributes no longer exposed by PyArrow
- Normalize dot path components in TarFileSystem listings and
  lookups, while preserving original archive names for reading
- Make merge_offset_ranges O(n log n) and keep merged blocks within
  max_block, replacing the quadratic nested-range filter
- Fix transactions with compressed files
- Make MemoryFileSystem.rm raise FileNotFoundError for a path that
  does not exist, as rm_file and the other filesystems do, so
  deleting a missing key from a memory-backed mapper raises
  KeyError
- Create missing ZIP archives in append mode without truncating
  existing archives
- Close cached readers when exiting an open_files context
- Avoid mutating live BlockCache and BackgroundBlockCache instances
  when pickling
- End the transaction even when a commit or discard raises, so the
  filesystem is not left in transaction mode and deferred temporary
  files are cleaned up
- Honor a caller-owned output file in get_file
- Preserve existing files when checking FSMap write access
- Normalize ZIP paths in pipe_file and find
- Reject get destinations that resolve above the target
- Pass maxdepth through in AsyncFileSystem._rm
- Do not let isfile swallow BaseException
- Keep reference filesystem get destinations inside the target
- Return relative names from DirFileSystem.glob and find
- Raise FileNotFoundError for missing ZIP and TAR members
- Stop collapsing three-character drive-relative paths to the drive
  root
- Use / as the only glob separator on every platform
- Distinguish omitted and None defaults in FSMap.pop
- Forward an Arrow file's flush and closed state to its stream
- Keep reference filesystem cat_file offsets inside the referenced
  part
- Raise FileNotFoundError from archive ls for a missing path
- Download uncached files in simplecache.cat_ranges
- Fix tail on simplecache and filecache
- Get whole-file reference sizes asynchronously in
  ReferenceFileSystem._info
- Report the target size for links in TarFileSystem
- Keep the async generator returned by AsyncFileSystemWrapper._walk
- Join the default output filename with / in _expand_paths
- Make names relative in DirFileSystem.walk(detail=True)
- Ignore a leading slash in TarFileSystem paths
- Fix cat_ranges on whole-file caches
- Normalize paths in AsyncFileSystemWrapper like the wrapped
  filesystem
- The SFTP host key policy is configurable with the new
  host_key_policy argument of SFTPFileSystem, which accepts
  "auto_add" (default, unchanged behaviour), "warning" or "reject",
  or any paramiko.MissingHostKeyPolicy

Other:

- Use trusted publishing for releases and trigger the release
  workflow on tags
- Remove the stale async wrapper documentation warning
- Add Zarr to the test_downstream extra so the Xarray/Zarr test
  runs again
- Clarify that rm handles directories
- Fix grammar in features.rst
- Patch HAS_CPYTHON_API where _fast_slice reads it in tests
- Percent-decode the username and password parsed from URLs in
  infer_storage_options so that backends (ftp, sftp, smb, ...)
  receive the real credentials rather than their URL-encoded form;
  a password whose bare % produces bytes that are not valid UTF-8
  (for example pass%ab) is left untouched so that pre-existing URLs
  with unescaped % continue to work

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-fsspec_2026.7.0.bb         | 24 ------------
 .../python/python3-fsspec_2026.9.0.bb         | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
deleted file mode 100644
index d34b67c428..0000000000
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A specification that python filesystems should adhere to."
-HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
-
-SRC_URI[sha256sum] = "c803c40f4cf860b49dea58ee3e1c33cb9c790520e233537e1340049f89b82a88"
-
-inherit pypi python_hatchling ptest
-
-
-DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-
-RDEPENDS:${PN}-ptest += "\
-	python3-pytest \
-	python3-pytest-mock \
-	python3-pytest-asyncio \
-	python3-pytest-cov \
-	python3-pytest-benchmark \
-	python3-aiohttp \
-	python3-numpy \
-	python3-requests \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
new file mode 100644
index 0000000000..43d405f017
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A specification that python filesystems should adhere to."
+HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
+
+SRC_URI = "git://github.com/fsspec/filesystem_spec;protocol=https;branch=master;tag=${PV}"
+SRCREV = "0f76baaae4a227b085b18e8469e6cc1792a95ade"
+
+inherit python_hatchling ptest-python-pytest
+
+DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-pytest-mock \
+    python3-pytest-asyncio \
+    python3-pytest-cov \
+    python3-pytest-benchmark \
+    python3-aiohttp \
+    python3-numpy \
+    python3-requests \
+    python3-pandas \
+    python3-paramiko \
+"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/implementations
+    cp -rf ${S}/fsspec/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/fsspec/implementations/tests ${D}${PTEST_PATH}/implementations/
+    touch ${D}${PTEST_PATH}/implementations/__init__.py
+    # Tests import helpers via fsspec.tests / fsspec.implementations.tests,
+    # which aren't in the installed package
+    grep -rlE 'fsspec\.(implementations\.)?tests' ${D}${PTEST_PATH} \
+        | xargs -r sed -i -E 's/fsspec\.(implementations\.)?tests\b/\1tests/g'
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

