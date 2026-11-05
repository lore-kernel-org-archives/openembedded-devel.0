Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5195.1793909165956595850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=duNMQDCB;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so3844209c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909165; x=1794513965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwtFoBITU/JKMonlRrIpVl62fbQbxwxQYJqmj8op4qw=;
        b=duNMQDCBzQg9sYIowJ6ngyr0q5DQF/Kp4JiyTgdLLiTnn9T0d1ne34NEHgBaC8VNWx
         5Eo4trlXeDTnpSrdtHbjR5x4o8b8VRDqZ2rsKy8e52gegWgNr1xAfolRHpNiZBEK8jW2
         JNW/B8ovPTV5cbKrfmS9UKd/ZnVVMGu7VSCBz0kuN55RRwvw41C/gdlpFXh1XBCeprY5
         bTIzdAOe8CP3EysMa5OT4OC9SEAeWoDT9gohxi0KUPZFrZGqjopK8FntXyweEmwYBBVI
         aH1h5NMCPu3HnLn5SVSJJI2plwaWPduN8Ya6J/xFIeXO68SF8fKE4rAE81M0OBw4EzV+
         on8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909165; x=1794513965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwtFoBITU/JKMonlRrIpVl62fbQbxwxQYJqmj8op4qw=;
        b=hOv3TPpXr0f2hpxvoGGmxgPIk7Ji/vR68pd1j7SG6Cd9P+YvlbvahdpQj4xra0IIv1
         PtlqirOVCQg/IxR1ksDNnFfRdTNECuQqhvOe27TVxBYMAzg9NLMUJX1/Mr7mhkoAKzjZ
         STBBzu1RuuNMeToDRYFXk1UjiibKPJW4vr0N7BPaqvew0KNx3/vcoI7xmj5zjvl+mgEj
         XcUCpbunSO4sZ518soXgYkeQvAomhNGLjAUCr5dexL9L7M9R2AoOsonmYoESjpKRokIz
         v1mrjHQem8eEhiLiUgt9V0xy+/IqOlEeyPCvbzcekhQ76HwrW1JbCdRk0MAjeQnI/dNd
         J/Og==
X-Gm-Message-State: APuU4Z+Ihj9OGcl6TvUMhWzUE0HQyIkO5zmz4lhhGxUQ2QzyWoKckssl
	XWIfKluxK4zvRty16F4OIrSFVVbLFUwtbSlxbQeyMDLIiSdo8hMGu6qlS9urNw==
X-Gm-Gg: AYBFou2NeqDiQwODJa8qoiBC/UABn4BzFpZBslCIxyP3R2+eBiwX2mWNQCz5pe62Q7C
	k7hwdv/Veipkl+fuCCqRJIq146jCU2reO9/V4BwTmL1n+AjADJnsG6PeWXAfjUowR9fmUladtTd
	yH29/B6jIfhDZ1598LAiArrsZvu9I0Ph9zzeVgBVDQH4XfMKw6kbRvEatX7LLd6VKq24wzwUoT9
	J7IB4Q56secVZX1VFsbJmfs6ME7N4/J5P02xnqh24feu/ZNl376BfZmsDKoDpPJ1N1POt8e7wLm
	riBBy7aXE2As5BmzwpnbXiz64BR6oL/7vSAHe3/DWBvTlMNeDEZSiPFC7NTo661XDyY1pPQ/jcu
	axpDuMIF3Aq9t5xsaqExeXT4nOqODHyc8hJUTIlU2qazBrrBTbI4NV1jIfbI7GOdQqnNf1tzGgX
	RIkEnHAU3SgnywPqaWFDDqkyFa2vOQ4cMHm+2XAKUdeB8YNNlJc7r4lygF0oQHM1AKpDufBet3D
	1aabo90F3xWqrGw3nMTqCK7+KHn73uoacnEi3a+QMVUGgbvdHkEoZP2V1tRi3G68MjlglZ9FCSy
	zaDca8qKdXTiX3WfSNRcC0OK7RcvYS13xxTCcptUjROzV4jhUnF6cTfzitMIcw==
X-Received: by 2002:a05:701b:204f:20b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b25d288481mr106648c88.1.1793909165101;
        Thu, 05 Nov 2026 12:06:05 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/9] hdf5: patch CVE-2026-120754 and CVE-2026-120755
Date: Fri,  6 Nov 2026 09:05:47 +1300
Message-ID: <20261105200552.81303-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131932
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120754
https://nvd.nist.gov/vuln/detail/cve-2026-120755

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2026-120754-CVE-2026-120755.patch     | 172 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
new file mode 100644
index 0000000000..3f0a8d69d5
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
@@ -0,0 +1,172 @@
+From 78672660618de8cca7c804f465886af02a89e79b Mon Sep 17 00:00:00 2001
+From: Matt L <124107509+mattjala@users.noreply.github.com>
+Date: Wed, 21 Oct 2026 13:52:39 -0500
+Subject: [PATCH] Bound filter header reads to the stored chunk length (#6585)
+
+* bound scaleoffset and fletcher32 reads to the chunk buffer
+
+* Bound filter header reads to the stored chunk length
+
+This PR is an expansion of #6579.
+
+The scaleoffset bounds checks measured against *buf_size, the size of the
+chunk buffer, rather than nbytes, the number of bytes the pipeline read from
+the file. H5D__chunk_lock() sizes a filtered chunk buffer to MAX(stored size,
+unfiltered size) so filters have room to expand into, and fills only the
+stored bytes, so the buffer is routinely longer than the data in it. A
+truncated chunk therefore passed the header check and decompressed out of the
+uninitialized remainder of the allocation, returning unrelated heap contents
+as dataset data. Because the reads stay inside the allocation, the address
+sanitizer does not see them.
+
+This PR switches every read-side check in H5Z__filter_scaleoffset()
+to bound against nbytes and pass the stored length to
+H5Z__scaleoffset_decompress().
+
+Similar short-chunk checks are added to szip and fletcher32.
+
+The direct chunk test has been extended to cover a chunk whose unfiltered size is
+larger than the bytes stored for it, and to cover szip.
+
+* Correct potential invalid pointer usage
+
+* update CHANGELOG
+
+* Update CHANGELOG comment
+
+* Guard scaleoffset output size against multiplication overflow
+
+---------
+
+Co-authored-by: Nayyar <nayyar@bugqore.com>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-120754 CVE-2026-120755
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/cdb13c4de9c7edbbae180f384e2e610a3b3cf185]
+
+Dropped changes to the test and CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Zfletcher32.c  | 13 +++++++------
+ src/H5Zscaleoffset.c | 15 +++++++++++----
+ src/H5Zszip.c        | 18 ++++++++++++++----
+ 3 files changed, 32 insertions(+), 14 deletions(-)
+
+diff --git a/src/H5Zfletcher32.c b/src/H5Zfletcher32.c
+index b89724ad0a3..5ef3b04cbcf 100644
+--- a/src/H5Zfletcher32.c
++++ b/src/H5Zfletcher32.c
+@@ -62,13 +62,14 @@ H5Z__filter_fletcher32(unsigned flags, size_t H5_ATTR_UNUSED cd_nelmts,
+     assert(sizeof(uint32_t) >= 4);
+ 
+     if (flags & H5Z_FLAG_REVERSE) { /* Read */
+-        /* A Fletcher32-filtered buffer must contain at least the trailing
+-         * checksum.  Reject anything smaller to avoid a size_t underflow
+-         * when computing the data length.
++        /* The checksum is stored at the end of the chunk, so anything shorter
++         * than the checksum itself makes the length arithmetic below wrap.  A
++         * chunk of exactly FLETCHER_LEN bytes holds no data and would return a
++         * filtered size of zero, which the pipeline reports as a filter failure,
++         * so reject it here where the reason can be stated.
+          */
+-        if (nbytes < FLETCHER_LEN)
+-            HGOTO_ERROR(H5E_STORAGE, H5E_OVERFLOW, 0,
+-                        "fletcher32 filter input buffer too small to contain checksum");
++        if (nbytes <= FLETCHER_LEN)
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
+ 
+         /* Do checksum if it's enabled for read; otherwise skip it
+          * to save performance. */
+diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
+index d39b4f40403..d506e5203a0 100644
+--- a/src/H5Zscaleoffset.c
++++ b/src/H5Zscaleoffset.c
+@@ -1205,10 +1205,18 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         unsigned long long minval_mask  = 0;
+         unsigned           minval_size  = 0;
+ 
+-        minbits = 0;
+-        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5, (unsigned char *)*buf + *buf_size - 1))
++        /* Bound every read below by nbytes rather than *buf_size.  The caller may
++         * provide a buffer larger than the data it holds, so restrict the read
++         * to the valid nbytes.
++         */
++        /* The minbits and minval-size fields are the first five bytes of the
++         * stream, so validate that length before deriving an end-of-buffer
++         * pointer from nbytes
++         */
++        if (nbytes < 5)
+             HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
+ 
++        minbits = 0;
+         for (i = 0; i < 4; i++) {
+             minbits_mask = ((unsigned char *)*buf)[i];
+             minbits_mask <<= i * 8;
+@@ -1224,8 +1232,7 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         minval_size = sizeof(unsigned long long) <= ((unsigned char *)*buf)[4] ? sizeof(unsigned long long)
+                                                                                : ((unsigned char *)*buf)[4];
+         minval      = 0;
+-        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size,
+-                                  (unsigned char *)*buf + *buf_size - 1))
++        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size, (unsigned char *)*buf + nbytes - 1))
+             HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
+         for (i = 0; i < minval_size; i++) {
+             minval_mask = ((unsigned char *)*buf)[5 + i];
+diff --git a/src/H5Zszip.c b/src/H5Zszip.c
+index 9b37035374f..dd6c3619873 100644
+--- a/src/H5Zszip.c
++++ b/src/H5Zszip.c
+@@ -28,6 +28,9 @@
+ #include "szlib.h"
+ #endif
+ 
++/* Size of the uncompressed-length header stored in front of the szip stream */
++#define SZIP_HEADER_LEN 4
++
+ /* Local function prototypes */
+ static htri_t H5Z__can_apply_szip(hid_t dcpl_id, hid_t type_id, hid_t space_id);
+ static herr_t H5Z__set_local_szip(hid_t dcpl_id, hid_t type_id, hid_t space_id);
+@@ -284,6 +287,13 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
+         uint32_t stored_nalloc; /* Number of bytes the compressed block will expand into */
+         size_t   nalloc;        /* Number of bytes the compressed block will expand into */
+ 
++        /* The uncompressed length is stored in front of the compressed stream, so
++         * a chunk shorter than that header makes the length arithmetic below wrap.
++         * A chunk of exactly SZIP_HEADER_LEN bytes holds no compressed data.
++         */
++        if (nbytes <= SZIP_HEADER_LEN)
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
++
+         /* Get the size of the uncompressed buffer */
+         newbuf = (unsigned char *)(*buf);
+         UINT32DECODE(newbuf, stored_nalloc);
+@@ -295,7 +305,7 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
+ 
+         /* Decompress the buffer */
+         size_out = nalloc;
+-        if (SZ_BufftoBuffDecompress(outbuf, &size_out, newbuf, nbytes - 4, &sz_param) != SZ_OK)
++        if (SZ_BufftoBuffDecompress(outbuf, &size_out, newbuf, nbytes - SZIP_HEADER_LEN, &sz_param) != SZ_OK)
+             HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, 0, "szip_filter: decompression failed");
+         assert(size_out == nalloc);
+ 
+@@ -313,7 +323,7 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
+         unsigned char *dst = NULL; /* Temporary pointer to new output buffer */
+ 
+         /* Allocate space for the compressed buffer & header (assume data won't get bigger) */
+-        if (NULL == (dst = outbuf = (unsigned char *)H5MM_malloc(nbytes + 4)))
++        if (NULL == (dst = outbuf = (unsigned char *)H5MM_malloc(nbytes + SZIP_HEADER_LEN)))
+             HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, 0, "unable to allocate szip destination buffer");
+ 
+         /* Encode the uncompressed length */
+@@ -332,8 +342,8 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
+         /* Set return values */
+         *buf      = outbuf;
+         outbuf    = NULL;
+-        *buf_size = nbytes + 4;
+-        ret_value = size_out + 4;
++        *buf_size = nbytes + SZIP_HEADER_LEN;
++        ret_value = size_out + SZIP_HEADER_LEN;
+     }
+ 
+ done:
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 99f1eebec2..7642beb675 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
            file://CVE-2026-19023-CVE-2026-19024.patch \
            file://CVE-2026-120689.patch \
+           file://CVE-2026-120754-CVE-2026-120755.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
