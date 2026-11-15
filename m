Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3884.1794729059991640893
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=L7PzTJOs;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so3931314eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729059; x=1795333859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCihr5gvVLKKQLBPVFwC2YTSo2Lh4/bqbYEowyvgY9Y=;
        b=L7PzTJOs+DlEFtCUe8kbveCZS6XekRDEw+ERsDl7WCrvIHNJ3ocvP1MnrcHYZmxrfc
         VxNT4PMo/DJqYAOUwj+vuln1PlRWAXd4ku282usyDDpmAO2Shwdt8l+EttorwwuwxamU
         /usHECH1UcJxoGm8LlJPlvI6EUAxZFWmQzUzMLcTqZ0Kmx4RerRhjcxkN9Vhl7B6F5AT
         NWFXyZQ0JZcCfLl7mUJlMS0+NLG2L3MG/5gxTlrk/V0EFsM6lkh2tR3ynG5URFZpULX+
         vvBHpleZCm3zAKQ0ej7tCw4I/T3uprBvjm7q0/HwBnQ7pAv2GpYBT+oU2tL4vYsAMKT8
         MFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729059; x=1795333859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCihr5gvVLKKQLBPVFwC2YTSo2Lh4/bqbYEowyvgY9Y=;
        b=yFBrfhNSn5Np/sVyvoO+rlW+WLucY4RNmXn+SPFWFV23NO1DrOCNaq2SJ1o1MstVjA
         J9j2ua6tdqR2gt5lQ6wwBBrwwca9lO73vdNu1JxFaDIm8WgR3RbIkkB9ee7fXLl5x2ae
         9HHIZN8RNsCOCzGiokX1z0+bG0BQaXj9zz0Um88gn4ozel5pCIkuBC0ZWTPtiY45QH98
         24Cnogqxo3kjCyOyeDYcbzo4U6+AvhP4KrNcOQUCxWpEo31Qy+G93qszL/RoOdEU01MQ
         Si+O6DMzd13vgIZCDksxRCEVrAr5Mcsiias38bqUAqRKuugObRX9Ffb0WtJW2caEM/VI
         PlVQ==
X-Gm-Message-State: APuU4Z+wqtc3FPvKMjF8s8le9EqzWmfRfbNvT3aWEnVFNYkEp0t6e7Cg
	Zdlef8qSAJ3yh12+VJGKp94SthWOvsl/xYO+h5+HImyrR1HtI5Pmte21FjcGbwYh
X-Gm-Gg: AYBFou2wyoIU5V2NVAyI6edUl05okCysThCVhClxj0MjC1EUr0sCtCcKxy14rG1zk+w
	aCgIWd+aUodOE5USIJuY6zfp09b6tt/6oek/y4iXwWI0IRkaJEkYbatBNKloN9/aWC2/kLaDkgW
	HwSzPPMe/VnSQwg5qP3WktI+f3UqkutD/snrEV7uh2O70Ny598mgjDVXygOk+lN1XQppE+7ztY7
	lag8mxCrU0NPXXbRnlqej69eUreqa3r6oIhxNjTCIlkQTFtFKzeffcuampXfDQEcXT84SnuCpOX
	w5M12LxmF984oNakxSX6qbA54uVaOjFop5C0aCdSaoBl+o7uR0Oo75CziZNlHVcHoD4DSycFcux
	t8ZtNoYj2R5csez+FaPqqlcy1pzlvWqcCZ/Awi7yvBMAYtI5BsuErmctkBj60iPMqZ0hMSsPM85
	W96Lt/lsbdS64pkprNKmlQV4c93W8n1eolD2kqUL++tTfSCa7zuwxl/luHgqJokZjCN36XSRhOv
	uWIlePtrt+jDno0SUwFXk/wvvjXXeYWlGwyKMzowFbKOKmlL3YsDm5cFuNHgASjM9zfTeY1ZTAi
	uLhdYYXZmiRgftvou5lGhCbu2DxNwxoHLfOU+L8G1rT62oB+QikEu/87KtvqnzcJwLsNHXhVeal
	d4ROJzln/gClc0SLGffweShoXaIqeu5EWIRZQJzau0/49GfXIDR9nZst4YloV6m3dpIhhrCgpHT
	14hkK5Qib6ydNvlMCUNQYACMkqtzCa6Eh5rMz7hLWJVvVZCFiiQyTaCvyeo+PJUz6EXjiMWv1Mj
	YbLmrdcL+ItUaNKI+cT7pTyJhEv7c98q3vynwkkMA5R+ubtHqU0MI/0tuF7htmCss/JfRGn7Fdk
	K7sbp1vgoS9A4vmDuU08sJT5cg==
X-Received: by 2002:a05:693c:60cd:b0:376:fa06:573e with SMTP id 5a478bee46e88-379658c795emr8186469eec.5.1794729058672;
        Sat, 14 Nov 2026 23:50:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 61/96] hdf5: upgrade 2.0.0 -> 2.2.0
Date: Sat, 14 Nov 2026 23:48:39 -0800
Message-ID: <20261115074918.2932593-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132331
Content-Type: text/plain; charset="utf-8"

Releases are published on GitHub now.

Drop CVE-2026-17572, CVE-2026-17573, CVE-2026-17574, CVE-2026-26197
and CVE-2026-26199 patches, their upstream commits are part of 2.2.0.
The other CVE fixes are only on the develop branch and are kept.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hdf5/files/CVE-2026-120689.patch          |  10 +-
 .../hdf5/files/CVE-2026-17572.patch           | 253 -------
 .../hdf5/files/CVE-2026-17573.patch           |  53 --
 .../hdf5/files/CVE-2026-17574.patch           |  65 --
 .../hdf5/files/CVE-2026-26197.patch           |  70 --
 .../hdf5/files/CVE-2026-26199.patch           | 677 ------------------
 .../hdf5/{hdf5_2.0.0.bb => hdf5_2.2.0.bb}     |  11 +-
 7 files changed, 7 insertions(+), 1132 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
 rename meta-oe/recipes-support/hdf5/{hdf5_2.0.0.bb => hdf5_2.2.0.bb} (83%)

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
index dd9e9374ac..bddffa8c17 100644
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
@@ -17,12 +17,12 @@ Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
  2 files changed, 20 insertions(+)
 
 diff --git a/release_docs/CHANGELOG.md b/release_docs/CHANGELOG.md
-index c181f174bbb..b5c99cd4b16 100644
+index d547b36..f8aacb0 100644
 --- a/release_docs/CHANGELOG.md
 +++ b/release_docs/CHANGELOG.md
-@@ -778,6 +778,12 @@ Added Fortran wrapper `h5fdsubfiling_get_file_mapping_f()` for the subfiling fil
+@@ -232,6 +232,12 @@ The `h5repack` tool now obtains its default low and high library version bounds
  
-    A malformed HDF5 file could have an attribute with a recorded name length of zero.This would lead to an overflow and an invalid memory access. An integrity check has been added to detect this case and safely stop file decoding.
+    `H5S_select_deserialize()` and the per-selection-type deserialize callbacks (all, hyperslab, none, and point) previously computed the pointer to the last valid buffer byte as `buffer + size - 1` without first checking the buffer size. A buffer shorter than the 4-byte selection-type header, or a zero-length selection-info buffer, would underflow this computation and produce an out-of-bounds end pointer, defeating subsequent overflow checks. The deserialize routines now reject a buffer that is too small to hold the selection type, and they reject an empty selection-info buffer before deriving the end pointer. Hyperslab decoding additionally now rejects a serialized rank of 0 or greater than `H5S_MAX_RANK`. As a companion fix, `H5S__hyper_serialize()` now returns an error when asked to serialize a hyperslab selection on a rank-0 (scalar or null) dataspace, a state that can arise when a dataspace extent is collapsed to a scalar after a hyperslab selection has already been made.
  
 +### Fixed a stack overflow when iterating a corrupted B-tree
 +
@@ -32,9 +32,9 @@ index c181f174bbb..b5c99cd4b16 100644
 +
  ## Java Library
  
- ### Renamed the Callbacks.java file to H5Callbacks.java
+ ### Fixed a datatype ID leak when reading or writing array/vlen datatypes
 diff --git a/src/H5B.c b/src/H5B.c
-index c9571708b73..4c6b1a55480 100644
+index c957170..4c6b1a5 100644
 --- a/src/H5B.c
 +++ b/src/H5B.c
 @@ -1140,6 +1140,20 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_lev
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
deleted file mode 100644
index 373a6c374e..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
+++ /dev/null
@@ -1,253 +0,0 @@
-From 606bb0a0282d0b056a3bdda1d489a608deee78d2 Mon Sep 17 00:00:00 2001
-From: Nayyar <nayyar@bugqore.com>
-Date: Tue, 14 Jul 2026 23:39:56 +0530
-Subject: [PATCH] reject SOHM list message count exceeding list_max (#6499)
-
-* bound SOHM list decode to list_max messages
-
-* Add tsohm test for out-of-range SOHM list message count
-
-Create a file with a shared-message list index, corrupt the on-disk
-message count so it exceeds list_max (repairing the table checksum),
-and confirm reopening rejects the file instead of overrunning the
-list image buffer and message array.
-
----------
-
-Co-authored-by: H. Joe Lee <hyoklee@hdfgroup.org>
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-17572
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/20f0b9564bc46154e60f8d35578720a599d41552]
-
-Dropped changes to the CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5SMcache.c |  14 ++++
- test/tsohm.c    | 173 ++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 187 insertions(+)
-
-diff --git a/src/H5SMcache.c b/src/H5SMcache.c
-index eb6d612a78..96687ffed9 100644
---- a/src/H5SMcache.c
-+++ b/src/H5SMcache.c
-@@ -489,6 +489,12 @@ H5SM__cache_list_verify_chksum(const void *_image, size_t H5_ATTR_UNUSED len, vo
-     assert(image);
-     assert(udata);
- 
-+    /* The buffer only holds list_max messages; a corrupted header whose message
-+     * count exceeds that would size the checksum region past the end of it.
-+     */
-+    if (udata->header->num_messages > udata->header->list_max)
-+        HGOTO_ERROR(H5E_SOHM, H5E_BADVALUE, FAIL, "number of SOHM messages exceeds list size");
-+
-     /* Exact size with checksum at the end */
-     chk_size = H5SM_LIST_SIZE(udata->f, udata->header->num_messages);
- 
-@@ -552,6 +558,14 @@ H5SM__cache_list_deserialize(const void *_image, size_t H5_ATTR_NDEBUG_UNUSED le
-         HGOTO_ERROR(H5E_SOHM, H5E_CANTLOAD, NULL, "bad SOHM list signature");
-     image += H5_SIZEOF_MAGIC;
- 
-+    /* The message array is sized for list_max entries; a list index always
-+     * holds at most that many before it is promoted to a B-tree. Reject a
-+     * corrupted header whose message count would drive the decode loop past
-+     * the allocation and the input buffer.
-+     */
-+    if (udata->header->num_messages > udata->header->list_max)
-+        HGOTO_ERROR(H5E_SOHM, H5E_CANTLOAD, NULL, "number of SOHM messages exceeds list size");
-+
-     /* Read messages into the list array */
-     ctx.sizeof_addr = H5F_SIZEOF_ADDR(udata->f);
-     for (u = 0; u < udata->header->num_messages; u++) {
-diff --git a/test/tsohm.c b/test/tsohm.c
-index 1652c9b044..61036e7dc3 100644
---- a/test/tsohm.c
-+++ b/test/tsohm.c
-@@ -3702,6 +3702,175 @@ test_sohm_external_dtype(void)
-     free(orig);
- } /* test_sohm_external_dtype */
- 
-+/*-------------------------------------------------------------------------
-+ * Function:    test_sohm_reject_bad_count
-+ *
-+ * Purpose:     A shared-message list index holds at most list_max messages
-+ *              on disk before it is promoted to a B-tree, and both the list
-+ *              image buffer and the in-memory message array are sized for
-+ *              list_max entries. Corrupt the on-disk message count so it
-+ *              exceeds list_max and verify the list load rejects the file
-+ *              instead of sizing a read or indexing the array past its end.
-+ *
-+ *-------------------------------------------------------------------------
-+ */
-+static void
-+test_sohm_reject_bad_count(void)
-+{
-+    hid_t    fcpl_id   = H5I_INVALID_HID;
-+    hid_t    fid       = H5I_INVALID_HID;
-+    hid_t    sid       = H5I_INVALID_HID;
-+    hid_t    did       = H5I_INVALID_HID;
-+    hsize_t  dims[1]   = {4};
-+    FILE    *fp        = NULL;
-+    uint8_t *buf       = NULL;
-+    long     fsize     = 0;
-+    long     table_off = -1;
-+    unsigned list_max  = 100;
-+    uint32_t chksum;
-+    size_t   pos;
-+    int      i;
-+    herr_t   ret;
-+
-+    /* On-disk shared-message table layout for a file with a single index and
-+     * 8-byte addresses: a 4-byte "SMTB" signature, one index record, then a
-+     * 4-byte checksum. Within the record the 16-bit message count follows the
-+     * (version, index type, message types, minimum size) prefix and the 16-bit
-+     * list and B-tree cutoffs.
-+     */
-+    const size_t rec_size     = 1 + 1 + 2 + 4 + 3 * 2 + 8 + 8;                     /* 30 */
-+    const size_t table_body   = (size_t)H5_SIZEOF_MAGIC + rec_size;                /* 34 */
-+    const size_t num_msgs_off = (size_t)H5_SIZEOF_MAGIC + (1 + 1 + 2 + 4 + 2 + 2); /* 16 */
-+
-+    MESSAGE(5, ("Testing rejection of an out-of-range SOHM list message count\n"));
-+
-+    /* Create a file whose single shared-message index is a list that can hold
-+     * up to list_max messages before converting to a B-tree.
-+     */
-+    fcpl_id = H5Pcreate(H5P_FILE_CREATE);
-+    CHECK_I(fcpl_id, "H5Pcreate");
-+    ret = H5Pset_shared_mesg_nindexes(fcpl_id, 1);
-+    CHECK_I(ret, "H5Pset_shared_mesg_nindexes");
-+    ret = H5Pset_shared_mesg_index(fcpl_id, 0, H5O_SHMESG_SDSPACE_FLAG | H5O_SHMESG_DTYPE_FLAG, 1);
-+    CHECK_I(ret, "H5Pset_shared_mesg_index");
-+    ret = H5Pset_shared_mesg_phase_change(fcpl_id, list_max, 0);
-+    CHECK_I(ret, "H5Pset_shared_mesg_phase_change");
-+
-+    fid = H5Fcreate(FILENAME, H5F_ACC_TRUNC, fcpl_id, H5P_DEFAULT);
-+    CHECK_I(fid, "H5Fcreate");
-+
-+    /* Several datasets sharing one dataspace and datatype leave the index a
-+     * list holding a couple of messages, well under list_max.
-+     */
-+    sid = H5Screate_simple(1, dims, NULL);
-+    CHECK_I(sid, "H5Screate_simple");
-+    for (i = 0; i < 5; i++) {
-+        char name[16];
-+
-+        snprintf(name, sizeof(name), "dset%d", i);
-+        did = H5Dcreate2(fid, name, H5T_NATIVE_INT, sid, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
-+        CHECK_I(did, "H5Dcreate2");
-+        ret = H5Dclose(did);
-+        CHECK_I(ret, "H5Dclose");
-+    }
-+    ret = H5Sclose(sid);
-+    CHECK_I(ret, "H5Sclose");
-+    ret = H5Fclose(fid);
-+    CHECK_I(ret, "H5Fclose");
-+
-+    /* Read the whole file so the shared-message table can be located and edited. */
-+    fp = fopen(FILENAME, "rb");
-+    CHECK_PTR(fp, "fopen");
-+    if (fp) {
-+        if (fseek(fp, 0, SEEK_END) != 0)
-+            TestErrPrintf("fseek failed at line %d\n", __LINE__);
-+        fsize = ftell(fp);
-+        if (fsize <= (long)(table_body + 4))
-+            TestErrPrintf("unexpected file size %ld at line %d\n", fsize, __LINE__);
-+        rewind(fp);
-+
-+        buf = (uint8_t *)malloc((size_t)fsize);
-+        CHECK_PTR(buf, "malloc");
-+        if (buf && fread(buf, 1, (size_t)fsize, fp) != (size_t)fsize)
-+            TestErrPrintf("fread failed at line %d\n", __LINE__);
-+        if (fclose(fp) != 0)
-+            TestErrPrintf("fclose failed at line %d\n", __LINE__);
-+        fp = NULL;
-+    }
-+
-+    /* Find the shared-message table by signature, confirming the match with the
-+     * stored checksum so the correct bytes are edited.
-+     */
-+    for (pos = 0; buf && (pos + table_body + 4) <= (size_t)fsize; pos++) {
-+        if (memcmp(buf + pos, H5SM_TABLE_MAGIC, (size_t)H5_SIZEOF_MAGIC) != 0)
-+            continue;
-+
-+        chksum = (uint32_t)buf[pos + table_body] | ((uint32_t)buf[pos + table_body + 1] << 8) |
-+                 ((uint32_t)buf[pos + table_body + 2] << 16) | ((uint32_t)buf[pos + table_body + 3] << 24);
-+        if (chksum == H5_checksum_metadata(buf + pos, table_body, 0)) {
-+            table_off = (long)pos;
-+            break;
-+        }
-+    }
-+    if (table_off < 0)
-+        TestErrPrintf("could not locate the shared-message table in %s\n", FILENAME);
-+
-+    if (buf && table_off >= 0) {
-+        unsigned bad_count = list_max + 200; /* well past the list_max cutoff */
-+        size_t   base      = (size_t)table_off;
-+
-+        /* Overwrite the 16-bit message count and repair the table checksum so
-+         * the table loads and the corruption is only caught at the list.
-+         */
-+        buf[base + num_msgs_off]     = (uint8_t)(bad_count & 0xff);
-+        buf[base + num_msgs_off + 1] = (uint8_t)((bad_count >> 8) & 0xff);
-+
-+        chksum                     = H5_checksum_metadata(buf + base, table_body, 0);
-+        buf[base + table_body]     = (uint8_t)(chksum & 0xff);
-+        buf[base + table_body + 1] = (uint8_t)((chksum >> 8) & 0xff);
-+        buf[base + table_body + 2] = (uint8_t)((chksum >> 16) & 0xff);
-+        buf[base + table_body + 3] = (uint8_t)((chksum >> 24) & 0xff);
-+
-+        fp = fopen(FILENAME, "r+b");
-+        CHECK_PTR(fp, "fopen");
-+        if (fp) {
-+            if (fwrite(buf, 1, (size_t)fsize, fp) != (size_t)fsize)
-+                TestErrPrintf("fwrite failed at line %d\n", __LINE__);
-+            if (fclose(fp) != 0)
-+                TestErrPrintf("fclose failed at line %d\n", __LINE__);
-+            fp = NULL;
-+        }
-+
-+        /* Reopen and share a new message, which protects the list and drives
-+         * the vulnerable decode. The load should reject the file cleanly.
-+         */
-+        fid = H5Fopen(FILENAME, H5F_ACC_RDWR, H5P_DEFAULT);
-+        CHECK_I(fid, "H5Fopen");
-+        sid = H5Screate_simple(1, dims, NULL);
-+        CHECK_I(sid, "H5Screate_simple");
-+
-+        H5E_BEGIN_TRY
-+        {
-+            did = H5Dcreate2(fid, "trigger", H5T_NATIVE_INT, sid, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
-+        }
-+        H5E_END_TRY
-+
-+        if (did >= 0) {
-+            TestErrPrintf("dataset creation succeeded on a corrupted SOHM list at line %d\n", __LINE__);
-+            H5Dclose(did);
-+        }
-+
-+        ret = H5Sclose(sid);
-+        CHECK_I(ret, "H5Sclose");
-+        ret = H5Fclose(fid);
-+        CHECK_I(ret, "H5Fclose");
-+    }
-+
-+    free(buf);
-+    ret = H5Pclose(fcpl_id);
-+    CHECK_I(ret, "H5Pclose");
-+} /* test_sohm_reject_bad_count */
-+
- /****************************************************************
- **
- **  test_sohm(): Main Shared Object Header Message testing routine.
-@@ -3755,6 +3924,10 @@ test_sohm(void H5_ATTR_UNUSED *params)
- 
-     test_sohm_extend_dset();    /* Test extending shared datasets */
-     test_sohm_external_dtype(); /* Test using datatype in another file */
-+
-+    /* Editing the on-disk table in place needs the single-file sec2 layout */
-+    if (default_driver)
-+        test_sohm_reject_bad_count(); /* Test rejecting a bad SOHM list message count */
- } /* test_sohm */
- 
- /*-------------------------------------------------------------------------
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
deleted file mode 100644
index 3cfb52de42..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 856e7f1dd23e466ebeab5e454a5891b12e188f6a Mon Sep 17 00:00:00 2001
-From: jhendersonHDF <jhenderson@hdfgroup.org>
-Date: Tue, 27 Jan 2026 05:55:38 -0600
-Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)
-
-Fix double-free caused by loss of buffer pointer after re-allocation
-
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-17573
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262]
-
-Dropped changes to the CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Dchunk.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c
-index f2a0e85c03..5ff537ebde 100644
---- a/src/H5Dchunk.c
-+++ b/src/H5Dchunk.c
-@@ -7034,7 +7034,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
-                 const H5S_extent_t *ds_extent_src, H5T_t *dt_src, const H5O_pline_t *pline_src,
-                 H5O_copy_t *cpy_info)
- {
--    H5D_chunk_it_ud3_t udata;                       /* User data for iteration callback */
-+    H5D_chunk_it_ud3_t udata = {0};                 /* User data for iteration callback */
-     H5D_chk_idx_info_t idx_info_dst;                /* Dest. chunked index info */
-     H5D_chk_idx_info_t idx_info_src;                /* Source chunked index info */
-     int                sndims;                      /* Rank of dataspace */
-@@ -7202,7 +7202,6 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
-         HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, FAIL, "memory allocation failed for raw data chunk");
- 
-     /* Initialize the callback structure for the source */
--    memset(&udata, 0, sizeof udata);
-     udata.common.layout    = &layout_src->u.chunk;
-     udata.common.storage   = &layout_src->storage.u.chunk;
-     udata.file_src         = f_src;
-@@ -7253,11 +7252,11 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
-         } /* end for */
-     }
- 
-+done:
-     /* I/O buffers may have been re-allocated */
-     buf = udata.buf;
-     bkg = udata.bkg;
- 
--done:
-     if (dt_dst && (H5T_close(dt_dst) < 0))
-         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close temporary datatype");
-     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
deleted file mode 100644
index 0ae79a2811..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From e374b227c277e100d9bfa3b1fe5c0b60cdff6c43 Mon Sep 17 00:00:00 2001
-From: tbeu <tbeu@users.noreply.github.com>
-Date: Thu, 28 May 2026 17:26:57 +0200
-Subject: [PATCH] Validate VL datatype type during decode and check file
- pointer in H5T_set_loc (#6395)
-
-H5O__dtype_decode_helper() reads vlen.type from the file without
-validation. With corrupted HDF5 files (e.g. from fuzzing), this field
-can have an invalid value that is neither H5T_VLEN_SEQUENCE nor
-H5T_VLEN_STRING, which later triggers assert(0) in H5T__vlen_set_loc()
-(debug builds) or a NULL pointer dereference / SEGV in release builds.
-
-Fix by:
-1. Adding a validation check in H5O__dtype_decode_helper() immediately
-   after reading the vlen.type field, returning an error if the value
-   is invalid.
-2. Adding a NULL file pointer check in H5T_set_loc() before calling
-   H5T__vlen_set_loc() when loc == H5T_LOC_DISK, so the low-level
-   assert(file) invariant is never violated.
-
-This fixes the root cause at the decode level where the bad value
-enters the system, as requested in review of #6378 and #6385.
-
-Found by OSS-Fuzz via the matio fuzzer (ClusterFuzz testcase
-5366895365914624).
-
-(cherry picked from commit 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc)
-
-CVE: CVE-2026-17574
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Odtype.c | 2 ++
- src/H5T.c      | 5 +++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/src/H5Odtype.c b/src/H5Odtype.c
-index d6405cdb86..6e622f3ebc 100644
---- a/src/H5Odtype.c
-+++ b/src/H5Odtype.c
-@@ -751,6 +751,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
-              */
-             /* Set the type of VL information, either sequence or string */
-             dt->shared->u.vlen.type = (H5T_vlen_type_t)(flags & 0x0f);
-+            if (dt->shared->u.vlen.type != H5T_VLEN_SEQUENCE && dt->shared->u.vlen.type != H5T_VLEN_STRING)
-+                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL, "invalid VL datatype type");
-             if (dt->shared->u.vlen.type == H5T_VLEN_STRING) {
-                 dt->shared->u.vlen.pad  = (H5T_str_t)((flags >> 4) & 0x0f);
-                 dt->shared->u.vlen.cset = (H5T_cset_t)((flags >> 8) & 0x0f);
-diff --git a/src/H5T.c b/src/H5T.c
-index 3b2e391a53..e2c9ba9791 100644
---- a/src/H5T.c
-+++ b/src/H5T.c
-@@ -6953,6 +6953,11 @@ H5T_set_loc(H5T_t *dt, H5VL_object_t *file, H5T_loc_t loc)
-                         ret_value = changed;
-                 } /* end if */
- 
-+                /* Validate file pointer for disk-based VL types */
-+                if (loc == H5T_LOC_DISK && NULL == file)
-+                    HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
-+                                "NULL file pointer for disk-based VL datatype");
-+
-                 /* Mark this VL sequence */
-                 if ((changed = H5T__vlen_set_loc(dt, file, loc)) < 0)
-                     HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "Unable to set VL location");
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
deleted file mode 100644
index c8d3547e08..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 7a9f34e150beb688397d3f562d0f6ed1f9cd0e60 Mon Sep 17 00:00:00 2001
-From: bmribler <39579120+bmribler@users.noreply.github.com>
-Date: Tue, 3 Feb 2026 16:26:51 -0500
-Subject: [PATCH] Validate datatype size for consistency (#6173)
-
-User report:
-When a file is corrupted such that an array datatype's size, the
-number of elements, and the element size are not in agreement, it can
-trigger an out of bounds read.
-(private GH issue: GHSA-gh44-7wpq-622f)
-Added a validation to ensure the above are in agreement.
-
-CVE: CVE-2026-26197
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6]
-
-Backport Changes:
-- Omitted release_docs/CHANGELOG.md because its HDF5 2.1.0 release
-  context does not apply to the 2.0.0 backport.
-
-(cherry picked from commit 8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6)
-Signed-off-by: Devansh Patel <devanshp@cisco.com>
----
- src/H5Odtype.c | 20 +++++++++++++++++++-
- 1 file changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/src/H5Odtype.c b/src/H5Odtype.c
-index f53f608ee..d6405cdb8 100644
---- a/src/H5Odtype.c
-+++ b/src/H5Odtype.c
-@@ -774,7 +774,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
-                 HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "invalid datatype location");
-             break;
- 
--        case H5T_ARRAY:
-+        case H5T_ARRAY: {
-+            size_t expected_size; /* for validating array datatype size consistency */
-             /*
-              * Array datatypes...
-              */
-@@ -816,6 +817,22 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
-             if (H5O__dtype_decode_helper(ioflags, pp, dt->shared->parent, skip, p_end) < 0)
-                 HGOTO_ERROR(H5E_DATATYPE, H5E_CANTDECODE, FAIL, "unable to decode array parent type");
- 
-+            /* Check for multiplication overflow */
-+            if (dt->shared->parent->shared->size > 0 &&
-+                dt->shared->u.array.nelem > SIZE_MAX / dt->shared->parent->shared->size)
-+                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
-+                            "array datatype size calculation would overflow");
-+
-+            expected_size = dt->shared->parent->shared->size * dt->shared->u.array.nelem;
-+
-+            /* Verify the stored size matches the calculated size */
-+            if (dt->shared->size != expected_size)
-+                HGOTO_ERROR(
-+                    H5E_DATATYPE, H5E_BADVALUE, FAIL,
-+                    "array datatype size mismatch: expected %zu (element_size=%zu * nelem=%zu), got %zu",
-+                    expected_size, dt->shared->parent->shared->size, dt->shared->u.array.nelem,
-+                    dt->shared->size);
-+
-             /* Check if the parent of this array has a version greater than the
-              * array itself. */
-             H5O_DTYPE_CHECK_VERSION(dt, version, dt->shared->parent->shared->version, ioflags, "array", FAIL)
-@@ -829,6 +846,7 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
-             if (dt->shared->parent->shared->force_conv == true)
-                 dt->shared->force_conv = true;
-             break;
-+        }
- 
-         case H5T_COMPLEX: {
-             bool homogeneous;
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
deleted file mode 100644
index 24ad0f5660..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
+++ /dev/null
@@ -1,677 +0,0 @@
-From e26fc8e32247cef9524a539a921ff986bd8cbf66 Mon Sep 17 00:00:00 2001
-From: bmribler <39579120+bmribler@users.noreply.github.com>
-Date: Mon, 26 Jan 2026 19:07:23 -0500
-Subject: [PATCH] Fixes buffer underflow (#6143)
-
-Fixes security issue by treating non-NULL buffer with size 0 as length-only query in get_name API functions.
-
-Behavior:
-Modify get_name API functions to treat (buffer != NULL, size == 0) as length-only queries, preventing undefined behavior.
-Fix applied to H5Aget_name, H5Aget_name_by_idx, H5Fget_name, H5Gget_objname_by_idx, H5Iget_name, H5Lget_name_by_idx, H5Rget_file_name, H5Rget_obj_name, H5Rget_attr_name, and 8 other functions.
-Tests:
-Update test/links.c, test/tattr.c, test/tfile.c, test/titerate.c, and test/trefer.c to verify new behavior with non-null buffer and size 0.
-Documentation:
-Update comments in H5A.c, H5F.c, H5Gdeprec.c, H5I.c, H5L.c, H5R.c, and H5Rdeprec.c to reflect new behavior.t]@users.noreply.github.com>
-
-CVE: CVE-2026-26199
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/9268b803b742f99c1f8793cae74f19e74976b065]
-
-Backport Changes:
-- Omitted release_docs/CHANGELOG.md because its HDF5 2.1.0 release context does not apply to the 2.0.0 backport.
-
-(cherry picked from commit 9268b803b742f99c1f8793cae74f19e74976b065)
-Signed-off-by: Devansh Patel <devanshp@cisco.com>
----
- src/H5A.c       | 11 ++++++++-
- src/H5F.c       | 32 ++++++++++++++++++---------
- src/H5Gdeprec.c | 32 ++++++++++++++++++---------
- src/H5I.c       | 32 ++++++++++++++++++---------
- src/H5L.c       |  4 ++++
- src/H5R.c       | 59 ++++++++++++++++++++++++++++++++++++++++++++++++-
- src/H5Rdeprec.c | 22 ++++++++++++++++--
- test/links.c    | 21 ++++++++++++++++--
- test/tattr.c    | 25 +++++++++++++++++++--
- test/tfile.c    | 16 +++++++++++++-
- test/titerate.c | 16 +++++++++++++-
- test/trefer.c   | 43 +++++++++++++++++++++++++++++------
- 12 files changed, 265 insertions(+), 48 deletions(-)
-
-diff --git a/src/H5A.c b/src/H5A.c
-index 0725489bc..9d4862d32 100644
---- a/src/H5A.c
-+++ b/src/H5A.c
-@@ -1221,7 +1221,8 @@ done:
-     Up to 'buf_size'-1 characters are stored in 'buf' followed by a '\0' string
-     terminator.  If the name of the attribute is longer than 'buf_size'-1,
-     the string terminator is stored in the last position of the buffer to
--    properly terminate the string.
-+    properly terminate the string.  If 'buf' is non-NULL but 'buf_size' is 0,
-+    treat the call as length being queried.
- --------------------------------------------------------------------------*/
- ssize_t
- H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
-@@ -1233,6 +1234,10 @@ H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
- 
-     FUNC_ENTER_API((-1))
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (buf && buf_size == 0)
-+        buf = NULL;
-+
-     /* check arguments */
-     if (NULL == (vol_obj = H5VL_vol_object_verify(attr_id, H5I_ATTR)))
-         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "not an attribute");
-@@ -1295,6 +1300,10 @@ H5Aget_name_by_idx(hid_t loc_id, const char *obj_name, H5_index_t idx_type, H5_i
- 
-     FUNC_ENTER_API(FAIL)
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Check args */
-     if (H5I_ATTR == H5I_get_type(loc_id))
-         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, FAIL, "location is not valid for an attribute");
-diff --git a/src/H5F.c b/src/H5F.c
-index a0a57d294..2450098b7 100644
---- a/src/H5F.c
-+++ b/src/H5F.c
-@@ -1972,19 +1972,27 @@ done:
-  * Function:    H5Fget_name
-  *
-  * Purpose:     Gets the name of the file to which object OBJ_ID belongs.
-- *              If 'name' is non-NULL then write up to 'size' bytes into that
-- *              buffer and always return the length of the entry name.
-- *              Otherwise `size' is ignored and the function does not store
-- *              the name, just returning the number of characters required to
-- *              store the name. If an error occurs then the buffer pointed to
-- *              by 'name' (NULL or non-NULL) is unchanged and the function
-- *              returns a negative value.
-+ *
-+ * Description:
-+ *              When 'name' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-+ *
-+ *              When 'name' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-+ *
-+ * Return:      Success:    Length of the name (excluding null terminator)
-+ *              Failure:    Negative
-  *
-  * Note:        This routine returns the name that was used to open the file,
-  *              not the actual name after resolving symlinks, etc.
-- *
-- * Return:      Success:    The length of the file name
-- *              Failure:    -1
-  *-------------------------------------------------------------------------
-  */
- ssize_t
-@@ -1998,6 +2006,10 @@ H5Fget_name(hid_t obj_id, char *name /*out*/, size_t size)
- 
-     FUNC_ENTER_API((-1))
- 
-+    /* If name size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Check the type */
-     type = H5I_get_type(obj_id);
-     if (H5I_FILE != type && H5I_GROUP != type && H5I_DATATYPE != type && H5I_DATASET != type &&
-diff --git a/src/H5Gdeprec.c b/src/H5Gdeprec.c
-index b6364db46..b610ad473 100644
---- a/src/H5Gdeprec.c
-+++ b/src/H5Gdeprec.c
-@@ -1145,20 +1145,26 @@ done:
-  * Function:	H5Gget_objname_by_idx
-  *
-  * Purpose:     Returns the name of objects in the group by giving index.
-- *              If `name' is non-NULL then write up to `size' bytes into that
-- *              buffer and always return the length of the entry name.
-- *              Otherwise `size' is ignored and the function does not store the name,
-- *              just returning the number of characters required to store the name.
-- *              If an error occurs then the buffer pointed to by `name' (NULL or non-NULL)
-- *              is unchanged and the function returns a negative value.
-- *              If a zero is returned for the name's length, then there is no name
-- *              associated with the ID.
-  *
-- * Note:	Deprecated in favor of H5Lget_name_by_idx
-+ * Description:
-+ *              When 'name' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-  *
-- * Return:	Success:        Non-negative
-- *		Failure:	Negative
-+ *              When 'name' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-  *
-+ * Return:      Success:    Length of the name (excluding null terminator)
-+ *              Failure:    Negative
-+ *
-+ * Note:	Deprecated in favor of H5Lget_name_by_idx
-  *-------------------------------------------------------------------------
-  */
- ssize_t
-@@ -1172,6 +1178,10 @@ H5Gget_objname_by_idx(hid_t loc_id, hsize_t idx, char *name /*out*/, size_t size
- 
-     FUNC_ENTER_API(-1)
- 
-+    /* If name size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Set up collective metadata if appropriate */
-     if (H5CX_set_loc(loc_id) < 0)
-         HGOTO_ERROR(H5E_SYM, H5E_CANTSET, (-1), "can't set collective metadata read info");
-diff --git a/src/H5I.c b/src/H5I.c
-index b71a9772b..4b8fc4f02 100644
---- a/src/H5I.c
-+++ b/src/H5I.c
-@@ -824,19 +824,27 @@ done:
-  *
-  * Purpose:     Gets a name of an object from its ID.
-  *
-- * Return:      Success:    The length of the name
-+ * Description:
-+ *              When 'name' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-  *
-- *              Failure:    -1
-+ *              When 'name' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-+ *
-+ * Return:      Success:    The length of the name (excluding null terminator)
-+ *              Failure:    Negative
-  *
-  * Notes:
-- *  If 'name' is non-NULL then write up to 'size' bytes into that
-- *  buffer and always return the length of the entry name.
-- *  Otherwise 'size' is ignored and the function does not store the name,
-- *  just returning the number of characters required to store the name.
-- *  If an error occurs then the buffer pointed to by 'name' (NULL or non-NULL)
-- *  is unchanged and the function returns a negative value.
-- *  If a zero is returned for the name's length, then there is no name
-- *  associated with the ID.
-+ *              If a zero is returned for the name's length, then there is no name
-+ *              associated with the ID.
-  *
-  *-------------------------------------------------------------------------
-  */
-@@ -851,6 +859,10 @@ H5Iget_name(hid_t id, char *name /*out*/, size_t size)
- 
-     FUNC_ENTER_API((-1))
- 
-+    /* If name size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Get the object pointer */
-     if (NULL == (vol_obj = H5VL_vol_object(id)))
-         HGOTO_ERROR(H5E_ID, H5E_BADTYPE, (-1), "invalid identifier");
-diff --git a/src/H5L.c b/src/H5L.c
-index a818445c5..ee603bfa8 100644
---- a/src/H5L.c
-+++ b/src/H5L.c
-@@ -1478,6 +1478,10 @@ H5Lget_name_by_idx(hid_t loc_id, const char *group_name, H5_index_t idx_type, H5
- 
-     FUNC_ENTER_API((-1))
- 
-+    /* If name size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Check arguments */
-     if (!group_name || !*group_name)
-         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "no name specified");
-diff --git a/src/H5R.c b/src/H5R.c
-index 2b8dcdbf2..8851cb33f 100644
---- a/src/H5R.c
-+++ b/src/H5R.c
-@@ -1013,8 +1013,23 @@ done:
-  * Purpose:     Given a reference to some object, determine a file name of the
-  *              object located into.
-  *
-- * Return:      Non-negative length of the path on success / -1 on failure
-+ * Description:
-+ *              When 'buf' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-+ *
-+ *              When 'buf' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-  *
-+ * Return:      Success:    The length of the name (excluding null terminator)
-+ *              Failure:    Negative
-  *-------------------------------------------------------------------------
-  */
- ssize_t
-@@ -1032,6 +1047,10 @@ H5Rget_file_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
-         H5R__get_type((const H5R_ref_priv_t *)ref_ptr) >= H5R_MAXTYPE)
-         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (buf && size == 0)
-+        buf = NULL;
-+
-     /* Get name */
-     if (H5I_INVALID_HID == (loc_id = H5R__get_loc_id((const H5R_ref_priv_t *)ref_ptr))) {
-         /* Un-opened external references do not have loc_id set but hold a
-@@ -1073,6 +1092,21 @@ done:
-  * Purpose:     Given a reference to some object, determine a path to the
-  *              object referenced in the file.
-  *
-+ * Description:
-+ *              When 'buf' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-+ *
-+ *              When 'buf' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-+ *
-  * Return:      Non-negative length of the path on success / -1 on failure
-  *
-  *-------------------------------------------------------------------------
-@@ -1099,6 +1133,10 @@ H5Rget_obj_name(H5R_ref_t *ref_ptr, hid_t rapl_id, char *buf /*out*/, size_t siz
-     if (rapl_id < 0)
-         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "not a property list");
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (buf && size == 0)
-+        buf = NULL;
-+
-     /* Retrieve loc_id from reference */
-     if (H5I_INVALID_HID == (loc_id = H5R__get_loc_id((const H5R_ref_priv_t *)ref_ptr)))
-         /* Attempt to re-open file and pass rapl_id as a fapl_id */
-@@ -1140,6 +1178,21 @@ done:
-  *
-  * Purpose:     Given a reference to some attribute, determine its name.
-  *
-+ * Description:
-+ *              When 'buf' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-+ *
-+ *              When 'buf' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the name (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-+ *
-  * Return:      Non-negative length of the path on success / -1 on failure
-  *
-  *-------------------------------------------------------------------------
-@@ -1157,6 +1210,10 @@ H5Rget_attr_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
-     if (H5R__get_type((const H5R_ref_priv_t *)ref_ptr) != H5R_ATTR)
-         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (buf && size == 0)
-+        buf = NULL;
-+
-     /* Get attribute name */
-     if ((ret_value = H5R__get_attr_name((const H5R_ref_priv_t *)ref_ptr, buf, size)) < 0)
-         HGOTO_ERROR(H5E_REFERENCE, H5E_CANTGET, (-1), "unable to determine attribute name");
-diff --git a/src/H5Rdeprec.c b/src/H5Rdeprec.c
-index 6ca014e16..4b5437d4f 100644
---- a/src/H5Rdeprec.c
-+++ b/src/H5Rdeprec.c
-@@ -741,9 +741,23 @@ done:
-  * Purpose:     Given a reference to some object, determine a path to the
-  *              object referenced in the file.
-  *
-- * Return:      Success:    Non-negative length of the path
-- *              Failure:    -1
-+ * Description:
-+ *              When 'name' is non-NULL:
-+ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
-+ *                  (including null terminator) and returns the actual length
-+ *                  of the name (excluding null terminator).
-+ *                - if 'size' == 0: treats the call as length query, does not
-+ *                  write anything to the buffer (not even a null terminator), and
-+ *                  returns the actual length of the name (excluding null terminator).
-  *
-+ *              When 'name' is NULL: does not write anything regardless of 'size'
-+ *              and returns the actual length of the path (excluding null terminator).
-+ *
-+ *              On error, the buffer is unchanged and the function returns
-+ *              a negative value.
-+ *
-+ * Return:      Success:    The length of the path (excluding null terminator)
-+ *              Failure:    Negative
-  *-------------------------------------------------------------------------
-  */
- ssize_t
-@@ -766,6 +780,10 @@ H5Rget_name(hid_t id, H5R_type_t ref_type, const void *ref, char *name /*out*/,
-     if (ref_type != H5R_OBJECT1 && ref_type != H5R_DATASET_REGION1)
-         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
- 
-+    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
-+    if (name && size == 0)
-+        name = NULL;
-+
-     /* Get the VOL object */
-     if (NULL == (vol_obj = H5VL_vol_object(id)))
-         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "invalid file identifier");
-diff --git a/test/links.c b/test/links.c
-index 262cd0f2e..091cdaf84 100644
---- a/test/links.c
-+++ b/test/links.c
-@@ -154,6 +154,9 @@ static const char *FILENAME[] = {"links0",
- #define TIMESTAMP_GROUP_1 "timestamp1"
- #define TIMESTAMP_GROUP_2 "timestamp2"
- 
-+/* Used by test_deprec() */
-+#define NON_NULL_BUF "NON_NULL_BUF"
-+
- /* Link iteration struct */
- typedef struct {
-     H5_iter_order_t order;     /* Direction of iteration */
-@@ -1990,8 +1993,11 @@ test_deprec(hid_t fapl, bool new_format)
-     hsize_t    num_objs; /* Number of objects in a group */
-     char       filename[1024];
-     char       tmpstr[1024];
--    int        len = 0; /* Length of comment */
--    herr_t     status;  /* Generic return value */
-+    int        len = 0;          /* Length of comment */
-+    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+    char      *buf_ptr;          /* To pass mid-string */
-+    ssize_t    name_len;         /* Length of name */
-+    herr_t     status;           /* Generic return value */
- 
-     if (new_format)
-         TESTING("backwards compatibility (w/new group format)");
-@@ -2052,6 +2058,17 @@ test_deprec(hid_t fapl, bool new_format)
-     if (len >= 0)
-         TEST_ERROR;
- 
-+    /* Verify that passing a non-null buffer with size 0 still returns the correct name
-+       size and the buffer is not modified */
-+    strcpy(non_null_buf, NON_NULL_BUF);
-+    buf_ptr = &non_null_buf[4];
-+    if ((name_len = H5Gget_objname_by_idx(group1_id, (hsize_t)0, buf_ptr, 0)) < 0)
-+        FAIL_STACK_ERROR;
-+    if ((size_t)name_len != strlen(tmpstr))
-+        TEST_ERROR;
-+    if ((strcmp(non_null_buf, NON_NULL_BUF) != 0))
-+        TEST_ERROR;
-+
-     /* Test getting the type for objects */
-     if ((obj_type = H5Gget_objtype_by_idx(group1_id, (hsize_t)0)) < 0)
-         FAIL_STACK_ERROR;
-diff --git a/test/tattr.c b/test/tattr.c
-index 780f11591..af08d2db0 100644
---- a/test/tattr.c
-+++ b/test/tattr.c
-@@ -148,6 +148,7 @@ static float attr_data5 = -5.123F; /* Test data for 5th attribute */
- 
- /* Used by test_attr_info_null_info_pointer() */
- #define GET_INFO_NULL_POINTER_ATTR_NAME "NullInfoPointerAttr"
-+#define NON_NULL_BUF                    "NON_NULL_BUF"
- 
- /* Used by test_attr_rename_invalid_name() */
- #define INVALID_RENAME_TEST_ATTR_NAME     "InvalidRenameTestAttr"
-@@ -6526,10 +6527,13 @@ test_attr_rename_invalid_name(hid_t fcpl, hid_t fapl)
- 
- /***************************************************************
- **
--**  test_attr_get_name_invalid_buf(): A test to ensure that
--**      passing a NULL buffer to H5Aget_name(_by_idx) when
-+**  test_attr_get_name_invalid_buf(): A test to ensure that:
-+**    - passing a NULL buffer to H5Aget_name(_by_idx) when
- **      the 'size' parameter is non-zero doesn't cause bad
- **      behavior.
-+**    - passing a non-NULL buffer to H5Aget_name(_by_idx)
-+**      when the 'size' parameter is zero treats as a length
-+**      query call.
- **
- ****************************************************************/
- static void
-@@ -6539,6 +6543,9 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
-     hid_t   fid;
-     hid_t   attr;
-     hid_t   sid;
-+    char    non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+    char   *buf_ptr;          /* To pass mid-string */
-+    ssize_t namelen;          /* Length of attribute name */
- 
-     /* Create dataspace for attribute */
-     sid = H5Screate(H5S_SCALAR);
-@@ -6569,6 +6576,20 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
- 
-     VERIFY(err_ret, FAIL, "H5Aget_name_by_idx");
- 
-+    /* Verify that passing a non-null buffer with size 0 still returns the correct name
-+       size and the buffer is not modified */
-+    strcpy(non_null_buf, NON_NULL_BUF);
-+    buf_ptr = &non_null_buf[4];
-+    namelen = H5Aget_name(attr, (size_t)0, buf_ptr);
-+    CHECK(namelen, FAIL, "H5Aget_name");
-+    VERIFY(namelen, (ssize_t)strlen(GET_NAME_INVALID_BUF_TEST_ATTR_NAME), "H5Aget_name");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Aget_name");
-+
-+    namelen = H5Aget_name_by_idx(fid, ".", H5_INDEX_CRT_ORDER, H5_ITER_INC, 0, buf_ptr, 0, H5P_DEFAULT);
-+    CHECK(namelen, FAIL, "H5Aget_name_by_idx");
-+    VERIFY(namelen, (ssize_t)strlen(GET_NAME_INVALID_BUF_TEST_ATTR_NAME), "H5Aget_name_by_idx");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Aget_name_by_idx");
-+
-     /* Close dataspace */
-     err_ret = H5Sclose(sid);
-     CHECK(err_ret, FAIL, "H5Sclose");
-diff --git a/test/tfile.c b/test/tfile.c
-index 7f7e293b9..32ea586cd 100644
---- a/test/tfile.c
-+++ b/test/tfile.c
-@@ -147,6 +147,9 @@
- /* Declaration for test_incr_filesize() */
- #define FILE_INCR_FILESIZE "tfile_incr_filesize"
- 
-+/* Used by test_file_getname() */
-+#define NON_NULL_BUF "NON_NULL_BUF"
-+
- /* Files created under 1.6 branch and 1.8 branch--used in test_filespace_compatible() */
- static const char *OLD_FILENAME[] = {
-     "filespace_1_6.h5", /* 1.6 HDF5 file */
-@@ -2411,7 +2414,9 @@ test_file_getname(void)
-     hsize_t dims[TESTA_RANK] = {TESTA_NX, TESTA_NY};
-     char    name[TESTA_NAME_BUF_SIZE];
-     ssize_t name_len;
--    herr_t  ret; /* Generic return value */
-+    char    non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+    char   *buf_ptr;          /* To pass mid-string */
-+    herr_t  ret;              /* Generic return value */
- 
-     /* Output message about test being performed */
-     MESSAGE(5, ("Testing H5Fget_name() functionality\n"));
-@@ -2426,6 +2431,15 @@ test_file_getname(void)
-     VERIFY_STR(name, FILE1, "H5Fget_name");
-     VERIFY(name_len, strlen(FILE1), "H5Fget_name");
- 
-+    /* Verify that passing a non-null buffer with size 0 still returns the correct name
-+       size and the buffer is not modified */
-+    strcpy(non_null_buf, NON_NULL_BUF);
-+    buf_ptr  = &non_null_buf[4];
-+    name_len = H5Fget_name(file_id, buf_ptr, 0);
-+    CHECK(name_len, FAIL, "H5Fget_name");
-+    VERIFY(name_len, strlen(FILE1), "H5Fget_name");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Fget_name");
-+
-     /* Create a group in the root group */
-     group_id = H5Gcreate2(file_id, TESTA_GROUPNAME, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
-     CHECK(group_id, FAIL, "H5Gcreate2");
-diff --git a/test/titerate.c b/test/titerate.c
-index 7efae3472..595a577d8 100644
---- a/test/titerate.c
-+++ b/test/titerate.c
-@@ -39,6 +39,9 @@
- #define SPACE1_RANK 1
- #define SPACE1_DIM1 4
- 
-+/* Used by test_reference_obj() and test_reference_attr() */
-+#define NON_NULL_BUF "NON_NULL_BUF"
-+
- typedef enum { RET_ZERO, RET_TWO, RET_CHANGE, RET_CHANGE2 } iter_enum;
- 
- /* Custom group iteration callback data */
-@@ -894,7 +897,9 @@ test_grp_memb_funcs(hid_t fapl)
-     VERIFY(ginfo.nlinks, (NDATASETS + 2), "H5Gget_info");
- 
-     for (i = 0; i < (int)ginfo.nlinks; i++) {
--        H5O_info2_t oinfo; /* Object info */
-+        H5O_info2_t oinfo;            /* Object info */
-+        char        non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+        char       *buf_ptr;          /* To pass mid-string */
- 
-         /* Test with NULL for name, to query length */
-         name_len = H5Lget_name_by_idx(root_group, ".", H5_INDEX_NAME, H5_ITER_INC, (hsize_t)i, NULL,
-@@ -908,6 +913,15 @@ test_grp_memb_funcs(hid_t fapl)
-         /* Double-check that the length is the same */
-         VERIFY(ret, name_len, "H5Lget_name_by_idx");
- 
-+        /* Test with non-null buffer for name and 0 for size */
-+        strcpy(non_null_buf, NON_NULL_BUF);
-+        buf_ptr = &non_null_buf[4];
-+        ret = (herr_t)H5Lget_name_by_idx(root_group, ".", H5_INDEX_NAME, H5_ITER_INC, (hsize_t)i, buf_ptr, 0,
-+                                         H5P_DEFAULT);
-+        CHECK(ret, FAIL, "H5Lget_name_by_idx");
-+        VERIFY(ret, name_len, "H5Lget_name_by_idx");
-+        VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Lget_name_by_idx");
-+
-         /* Keep a copy of the dataset names around for later */
-         obj_names[i] = strdup(dataset_name);
-         CHECK_PTR(obj_names[i], "strdup");
-diff --git a/test/trefer.c b/test/trefer.c
-index cd6bf2ca1..4df923fd8 100644
---- a/test/trefer.c
-+++ b/test/trefer.c
-@@ -88,6 +88,9 @@ typedef struct s2_t {
- #define MAX_ITER_WRITE  MAX_ITER_CREATE
- #define MAX_ITER_READ   MAX_ITER_CREATE
- 
-+/* Used by test_reference_obj() and test_reference_attr() */
-+#define NON_NULL_BUF "NON_NULL_BUF"
-+
- /****************************************************************
- **
- **  test_reference_params(): Test basic H5R (reference) parameters
-@@ -458,11 +461,13 @@ test_reference_obj(void)
-         *rbuf;          /* buffer read from disk            */
-     H5R_ref_t *wbuf_cp; /* copy buffer                      */
-     unsigned  *ibuf, *obuf;
--    unsigned   i, j;     /* Counters                         */
--    ssize_t    namelen;  /* String buffer size return value  */
--    char      *namebuf;  /* Buffer for attribute's or dataset's name */
--    H5O_type_t obj_type; /* Object type                      */
--    herr_t     ret;      /* Generic return value             */
-+    unsigned   i, j;             /* Counters                                 */
-+    ssize_t    namelen;          /* String buffer size return value          */
-+    char      *namebuf;          /* Buffer for attribute's or dataset's name */
-+    H5O_type_t obj_type;         /* Object type                              */
-+    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+    char      *buf_ptr;          /* To pass mid-string */
-+    herr_t     ret;              /* Generic return value                     */
- 
-     /* Output message about test being performed */
-     MESSAGE(5, ("Testing Object Reference Functions\n"));
-@@ -626,17 +631,31 @@ test_reference_obj(void)
-     CHECK(namelen, FAIL, "H5Rget_file_name");
-     VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
- 
-+    /* Test passing in non-null buffer with buffer size is zero */
-+    strcpy(non_null_buf, NON_NULL_BUF);
-+    buf_ptr = &non_null_buf[4];
-+    namelen = H5Rget_file_name(&rbuf[0], buf_ptr, 0);
-+    CHECK(namelen, FAIL, "H5Rget_file_name");
-+    VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_file_name");
-+
-     /* Get the file name for the reference */
-     namebuf = (char *)malloc((size_t)namelen + 1);
-     namelen = H5Rget_file_name(&rbuf[0], namebuf, (size_t)namelen + 1);
-     CHECK(namelen, FAIL, "H5Rget_file_name");
-     VERIFY(strcmp(namebuf, FILE_REF_OBJ), 0, "namebuf vs FILE_REF_OBJ");
-     VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
--
-     free(namebuf);
- 
-     /* Testing Dataset1 */
- 
-+    /* Test passing in non-null buffer with buffer size is zero */
-+    buf_ptr = &non_null_buf[8];
-+    namelen = H5Rget_obj_name(&rbuf[0], H5P_DEFAULT, buf_ptr, 0);
-+    CHECK(namelen, FAIL, "H5Rget_obj_name");
-+    VERIFY(namelen, strlen(DS1_REF_OBJ), "H5Rget_obj_name");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_obj_name");
-+
-     /* Getting the name of the referenced object and verify it */
-     namelen = H5Rget_obj_name(&rbuf[0], H5P_DEFAULT, NULL, 0);
-     CHECK(namelen, FAIL, "H5Rget_obj_name");
-@@ -2479,6 +2498,8 @@ test_reference_attr(void)
-     char      *attr_name = NULL; /* name of attribute, from H5A */
-     ssize_t    attr_name_size;   /* size of attribute name */
-     H5O_type_t obj_type;         /* Object type */
-+    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
-+    char      *buf_ptr;          /* To pass mid-string */
-     herr_t     ret;              /* Generic return value */
- 
-     /* Output message about test being performed */
-@@ -2649,10 +2670,18 @@ test_reference_attr(void)
- 
-     /* Testing "Attr1" */
- 
-+    /* Test passing in non-null buffer with buffer size is zero */
-+    strcpy(non_null_buf, NON_NULL_BUF);
-+    buf_ptr = &non_null_buf[4];
-+    namelen = H5Rget_attr_name(&ref_rbuf[0], buf_ptr, 0);
-+    CHECK(namelen, FAIL, "H5Rget_attr_name");
-+    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_attr_name");
-+    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_attr_name");
-+
-     /* Getting the name of the referenced attribute and verify it */
-     namelen = H5Rget_attr_name(&ref_rbuf[0], NULL, 0);
-     CHECK(namelen, FAIL, "H5Rget_attr_name");
--    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_obj_name");
-+    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_attr_name");
- 
-     namebuf = (char *)malloc((size_t)namelen + 1);
-     namelen = H5Rget_attr_name(&ref_rbuf[0], namebuf, (size_t)namelen + 1);
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
similarity index 83%
rename from meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
rename to meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
index 1520f8cab8..c3aa1d2fcc 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
@@ -11,16 +11,9 @@ inherit cmake pkgconfig siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
-# set downloadfilename to workaround mirroring test issues. When hdf5 is
-# upgraded beyond 2.0.0 this can likely be removed
-SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
+SRC_URI = "https://github.com/HDFGroup/hdf5/releases/download/${PV}/${BPN}-${PV}.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
-           file://CVE-2026-26199.patch \
-           file://CVE-2026-26197.patch \
-           file://CVE-2026-17572.patch \
-           file://CVE-2026-17573.patch \
-           file://CVE-2026-17574.patch \
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
            file://CVE-2026-19023-CVE-2026-19024.patch \
@@ -30,7 +23,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120757.patch \
            file://CVE-2026-120758.patch \
            "
-SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
+SRC_URI[sha256sum] = "1a1ab8209b35586fbc1aa279ba76d102130b95badcb20ca329587219112d8c16"
 
 UPSTREAM_CHECK_URI = "https://support.hdfgroup.org/releases/hdf5/"
 UPSTREAM_CHECK_REGEX = "\./(?P<pver>\d+(\.\d+)+)/index\.html"
