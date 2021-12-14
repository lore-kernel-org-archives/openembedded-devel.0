Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1755FC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 19:04:39 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.30034.1639508677719835530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 11:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1BEJ4alT019841
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 13:04:36 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-matplotlib: Disable automatic
 download during do_compile
Date: Tue, 14 Dec 2021 13:04:36 -0600
Message-Id: <20211214190436.1819246-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 19:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94359

From: Mark Hatle <mark.hatle@xilinx.com>

Add a patch to disable the automatic download of components.

Add manual download for a specific freetype and qhull version.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../matplotlib-disable-download.patch         | 50 +++++++++++++++++++
 .../python/python3-matplotlib_3.5.1.bb        | 12 +++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
new file mode 100644
index 000000000..e032ceb2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -0,0 +1,50 @@
+Disable automatic downloading of components!
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
+
+--- a/setupext.py.orig 2021-12-14 09:44:33.499041044 -0800
++++ a/setupext.py      2021-12-14 09:45:00.447041706 -0800
+@@ -64,40 +64,7 @@
+     BytesIO
+         The file loaded into memory.
+     """
+-    cache_dir = _get_xdg_cache_dir()
+-
+-    if cache_dir is not None:  # Try to read from cache.
+-        try:
+-            data = (cache_dir / sha).read_bytes()
+-        except IOError:
+-            pass
+-        else:
+-            if _get_hash(data) == sha:
+-                return BytesIO(data)
+-
+-    # jQueryUI's website blocks direct downloads from urllib.request's
+-    # default User-Agent, but not (for example) wget; so I don't feel too
+-    # bad passing in an empty User-Agent.
+-    with urllib.request.urlopen(
+-            urllib.request.Request(url, headers={"User-Agent": ""}),
+-            context=_get_ssl_context()) as req:
+-        data = req.read()
+-
+-    file_sha = _get_hash(data)
+-    if file_sha != sha:
+-        raise Exception(
+-            f"The downloaded file does not match the expected sha.  {url} was "
+-            f"expected to have {sha} but it had {file_sha}")
+-
+-    if cache_dir is not None:  # Try to cache the downloaded file.
+-        try:
+-            cache_dir.mkdir(parents=True, exist_ok=True)
+-            with open(cache_dir / sha, "xb") as fout:
+-                fout.write(data)
+-        except IOError:
+-            pass
+-
+-    return BytesIO(data)
++    raise IOError(f"Automatic downloading is disabled.")
+
+
+ def get_and_extract_tarball(urls, sha, dirname):
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index f9eb79ff1..9b3ca5902 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -25,6 +25,18 @@ SRC_URI[sha256sum] = "b2e9810e09c3a47b73ce9cab5a72243a1258f61e7900969097a8172322
 
 inherit pypi setuptools3 pkgconfig
 
+# Stop the component from attempting to download when it detects a missing
+# dependency
+SRC_URI += "file://matplotlib-disable-download.patch"
+
+# This python module requires a full copy of freetype-2.6.1
+SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build"
+SRC_URI[freetype.sha256sum] = "0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014"
+
+# This python module requires a full copy of 'qhull-2020'
+SRC_URI += "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz;name=qhull;subdir=matplotlib-${PV}/build"
+SRC_URI[qhull.sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
+
 # LTO with clang needs lld
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
 LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
-- 
2.33.0


