Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2908.1794165990462581673
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49318428d98so103333f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165989; x=1794770789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2mywCslkkebzXTH20XmlImcMwN/KcUIR6EQtLlUB7E=;
        b=k8aO2aztuLgWHk6eYwuPUGbjMOTEfzvUkDcR5E/SfqK/wIJGEteJBrAr+i823EOv0j
         //IVk5SwAPfWTeTFNXLV8KZhUb2vfu8ToAvsYMFDlbBFahGvNlFP/JuLJBl3VXidVzh9
         ad/kWpdT+m6YEz5uxpwkbtyOroTabcVf3TVBM/hlhN8uOCAzx2cxiyldPn23VxuYRtQE
         zR2fJY72OXBaiTOFFZf4Dbj3qbrDT39jthJVfka0h+3/SgTJN7ET1+0ayBibtjzYj9Xz
         zV3s33urX454hMqdPtEAE/1HTBHrjtQT4Xauq3VcdoF3r74oEHPCcck2caU17pV/swY2
         xyIw==
X-Gm-Message-State: APuU4Z9ypG0gIQhYCVIfawfJlm3wOYnaP/IyEpbCtiyP/zVsqvYSNKqg
	Srq+OY2L3oz/W2SHvmSZ/wi/18SWYwVNw0qcpdpiW+A+MnSt9K27UVcQCf4HbQ==
X-Gm-Gg: AYBFou26Bs76eOnqZjLgml7A7/PWjCfeYSJwty9VchUHhAtTbs++O4EZ1WDFxtSA/kE
	/mXKR21GeihVMAFllWHDgTe0Vth9UQMpX2qTve3lE+VgHkpM/dRVGRTZx1Dmhe1rtkVWlJX3s/F
	EBwcUwtIoLlRSye+JIP/xFr6egYhVN2VvBEnbynmmPkH+jAgKLq9LenMW0/XjMunr2yEhWmKXwU
	RWRRdnDErspY2iRrJKrA75THNBp93f+9POc4GyjPXP7xiDKJO7pUc+w+qINqORVtTdU1iUxHq2W
	zvCDq5ccmLemm5CwskgLUP67ED9Mz+QSju5MfGGWg2mVLcAJ6tjbpmdxwQJbZ5UKmaWEytaC6JH
	VwAzlQODzFgkyKzRK+XTwvuNOHVLlD/muxS/vm+aVgiYT3GPDhQNi4p0tBRVSyUQu6Twpw9ydn6
	M5+2dBi/qcjK+igefOgkmoYjGxWAQB2EDEZGq+qnInTktMmpqPG5aDtrQhP9r+wMglBLYExxQX9
	w6Ei0d0/f/sn5joO84crPLVXAGz0xRV5c6CMEA5rEY4PQ97FUnixhTnimmcbqWKpSA1aBjLW4WY
	TFk71lujjEEejexxHxIG18WM2V6jOJdCAW1f3Lbbw3PuZaW+7GR5XZ4STSDnA5fQkJViDWLIJkC
	Ixhxg0K5u6RxdgJfyTkaT99+Xi6Mo7ZnzVqDqRJbZbXjN2w6i9jfo1p1oDw==
X-Received: by 2002:a5d:6f10:0:b0:490:7fb3:cb41 with SMTP id ffacd0b85a97d-49588ce14a7mr4263987f8f.24.1794165988572;
        Sun, 08 Nov 2026 11:26:28 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:28 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 03/13] python3-pillow: upgrade 12.3.0 -> 13.0.0
Date: Sun,  8 Nov 2026 20:26:08 +0100
Message-ID: <20261108192623.1082770-4-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132025
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins Pillow 13.0.0.

Drop CVE-2026-112393.patch. It backported the upstream fix [1] to
12.3.0. That commit is an ancestor of the 13.0.0 tag, so 13.0.0
contains the fix, and the patch no longer applies.

[1] https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python3-pillow/CVE-2026-112393.patch      | 124 ------------------
 ...low_12.3.0.bb => python3-pillow_13.0.0.bb} |   3 +-
 2 files changed, 1 insertion(+), 126 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
 rename meta-python/recipes-devtools/python/{python3-pillow_12.3.0.bb => python3-pillow_13.0.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
deleted file mode 100644
index cb9be3b33e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00 2001
-From: Jeffrey 'Alex' Clark <aclark@aclark.net>
-Date: Mon, 12 Oct 2026 21:18:41 -0400
-Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving TIFF
- to BytesIO
-
-libtiff seeks past the current end of data when writing the directory
-and writes tag values there. _tiffWriteProc sized its realloc() from
-state->size + size instead of the write position state->loc + size,
-so the first out-of-line tag value written after such a seek could
-overrun the allocation by up to the size of the directory. The bytes
-skipped by the seek were also never zeroed, leaking stale heap
-contents into the saved file.
-
-Size the buffer from the write position and zero the space added by
-realloc, matching the semantics of writing to a real file. Reject
-writes where the position is still beyond the buffer for the
-non-reallocating case.
-
-Reported-by: carlini
-Reported-by: Tomer-PL
-Fixes: GHSA-332p-7hrc-92wf
-
-Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
-Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
-
-CVE: CVE-2026-112393
-Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4]
-
-Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
----
- Tests/test_file_libtiff.py  | 36 ++++++++++++++++++++++++++++++++++++
- src/libImaging/TiffDecode.c | 15 ++++++++++++++-
- 2 files changed, 50 insertions(+), 1 deletion(-)
-
-diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py
-index c9849a056..84e4299a1 100644
---- a/Tests/test_file_libtiff.py
-+++ b/Tests/test_file_libtiff.py
-@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):
-         save_bytesio("packbits")
-         save_bytesio("tiff_lzw")
- 
-+
-+    def test_save_bytesio_seek_past_end(self, tmp_path: Path) -> None:
-+        # When writing the directory, libtiff seeks past the end of the data
-+        # written so far, and then writes the tag values there. Check that the
-+        # in-memory write buffer grows to fit, and that the bytes that are
-+        # skipped over are zero, as they would be when writing to a file.
-+
-+        # 7 distinct bytes per row: PackBits emits 8 bytes per row, so the strip
-+        # plus the header are exactly 64 KiB, the initial size of the buffer
-+        im = Image.new("L", (7, 8191))
-+        im.putdata([(i * 37) & 0xFF for i in range(7 * 8191)])
-+        kwargs: dict[str, Any] = {
-+            "compression": "packbits",
-+            "description": "D" * 65535,
-+        }
-+
-+        outfile = tmp_path / "temp.tif"
-+        im.save(outfile, **kwargs)
-+        buffer_io = io.BytesIO()
-+        im.save(buffer_io, format="tiff", **kwargs)
-+        assert buffer_io.getvalue() == outfile.read_bytes()
-+
-+        # odd-length tag values, so that libtiff pads between them. Large enough
-+        # that the buffer has to be reallocated
-+        im = hopper().resize((300, 300))
-+        kwargs = {
-+            "compression": "tiff_lzw",
-+            "description": "abcdef",
-+            "software": "xyz0",
-+            "tiffinfo": {315: "artist", 33432: "copyright!"},
-+        }
-+        im.save(outfile, **kwargs)
-+        buffer_io = io.BytesIO()
-+        im.save(buffer_io, format="tiff", **kwargs)
-+        assert buffer_io.getvalue() == outfile.read_bytes()
-+
-     def test_save_ycbcr(self, tmp_path: Path) -> None:
-         im = hopper("YCbCr")
-         outfile = tmp_path / "temp.tif"
-diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c
-index 72e0d7b30..e21327f02 100644
---- a/src/libImaging/TiffDecode.c
-+++ b/src/libImaging/TiffDecode.c
-@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
-     dump_state(state);
- 
-     to_write = min(size, state->size - (tsize_t)state->loc);
-+    // libtiff may have seeked past the end of the buffer, e.g. when writing the
-+    // directory, so the required size is based on the current location.
-     if (state->flrealloc && size > to_write) {
-         tdata_t new_data;
-         tsize_t newsize = state->size;
--        while (newsize < (size + state->size)) {
-+        while (newsize < (size + (tsize_t)state->loc)) {
-             if (newsize > INT_MAX - 64 * 1024) {
-                 return 0;
-             }
-@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
-             // fail out
-             return 0;
-         }
-+        // zero the new space, so that any bytes libtiff seeks over without
-+        // writing are 0 in the output, as they would be in a file
-+        memset((UINT8 *)new_data + state->size, 0, newsize - state->size);
-         state->data = new_data;
-         state->size = newsize;
-         to_write = size;
-+    } else if (to_write < 0) {
-+        TIFFError(
-+            "_tiffWriteProc",
-+            "Invalid Write at loc %" PRIu64 ", size: %" PRIu64,
-+            state->loc,
-+            (toff_t)state->size
-+        );
-+        return 0;
-     }
- 
-     TRACE(("to_write: %d\n", (int)to_write));
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_13.0.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_13.0.0.bb
index e4826da1a6..148f59509c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_13.0.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
-           file://CVE-2026-112393.patch \
            "
-SRCREV = "bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d"
+SRCREV = "293218ad059d994baf1777d882911bed6a49704a"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.56.0

