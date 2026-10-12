Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C23CCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5100.1791839460266803876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o4/5GjAY;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so584949a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839460; x=1792444260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQGQuHIaxDSL9TFDWXqM5bu3wBbrle3z2o81dZ1QKb4=;
        b=o4/5GjAYWiuCbfYO+6km90rjKzF83z6jOOh6Nl1GviXsYzfAysuxjEfD5uQ5USCywu
         YRu0yFPb4Mu4FDjLSiMEhoCU3blWcbkCAu2p9jrJ227b+fdvyqekfJnfnYxFCwTxAQgD
         np5iss2mjJG3HVqeJbx2NfQFANWhzMjPcwbvsl86NHk9BLs/p+027+/WuAd2ymQAjBVm
         D3FqJThUhzXREAajJ6m05sQ1Ldq4XhFAFKqNP62oKtT80ELPBLmviFECrKKv4ioaZbtJ
         Y6I+BTSReQehDXXDMQkE+6Bnu5h0HUAJi4SPDLOSNEVmerXoLg3OqlYIWR3Y7Libj54+
         yTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839460; x=1792444260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQGQuHIaxDSL9TFDWXqM5bu3wBbrle3z2o81dZ1QKb4=;
        b=v7nKUAYKn8FOySjtg45Vj0KUHX2JWkKYX8GBYaj7tyVj2b1cDZs+JdVeVz4MVztMbk
         xLEclXrl6rgt59+ZhL/In8dmIs8K16M6THkHNWTlLLXGRfoCeYJx2+kBpplcfynXp+Vf
         E+M5Lm32SDOMc9HKzFVprmyf8Rsii7x4WdWUqubBP1qybWJvYPqnubVnkER8tMPdOp/S
         dG5CDu0HjkOkS9JNp3HHnS+9mdZ3098S5GnyHNJelNsneKSgrg0xudee92VBHp9VxS9r
         s0P0KZwoBlks2X4JOwyAMqRw+SSY1NlC4ruqUWarWqqwSgmw+oj4DxSU82KqK2DxPAGB
         0Zrg==
X-Gm-Message-State: AFq9FYJ2z6nMcjnZrCcddl28IPxrfZ9ap/bKhlQTbFAgr8SytqN1XTJo
	rQ3/xHTz3AC8sBw+utQhxzrFGM83CXswG15G4vymaMB19mO+FONH7CdM9txZAKIh
X-Gm-Gg: AYBFou0e0j96MJQyawoCBdkE17l70wbWi34Phf/f4HdaUTDnfnyos3Qtoxb+eq/x1fG
	W0bdCsngE1QdmHMhpw/yICpW0tbuEgL4T+T8DIXCsWsvLhXjUtNNbpQBZwhQM2BVDPuJeZEoe+I
	o1QJoITrFOOKvA2YdrbnKcQA6+cUATICOypRAEnS1n/JeGTvp1D1QAktlWE8Z5tt6m5ys8orxHH
	obpmjBnDlyuHZEHh9DcU1C/mBwrQPkfQeBD9AHAape/SzOSh8De+kFegeYZL1a3dwueRlueAUyI
	Lz4UBxDSI7i4+mPNos84WdirU70/YWCv0nM0ugotvJCa7rGoMMFOBYePhrjeXV6KMwQzebZuOr8
	kaySC2085SbabGxeAFfaDueqO+LChYmw6ZJ9w3YJlcfRzxZhMj0JeZbmiF81Yk8Q2cOY6IIJ+/z
	S32/MG5HtC5bsw+EWiKuo8uMe4oGdyDju+qtJRW/rExf8oprP9kiRXG70uPWhlvwijwHleyzpVh
	h4FndAWru+cxc9gwSqN8OA7zcOfT2AG/5fgSCY=
X-Received: by 2002:a17:90b:384a:b0:3a8:1320:38ae with SMTP id 98e67ed59e1d1-3ab3a291871mr8545053a91.9.1791839459402;
        Mon, 12 Oct 2026 14:10:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 16/43] hdf5: patch CVE-2026-17572
Date: Tue, 13 Oct 2026 10:09:40 +1300
Message-ID: <20261012211009.3352822-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130786

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from the PR[1] fixing the issue[2] mentioned in the NVD[3].
Debian[4] has also identified the commit.

[1] https://github.com/HDFGroup/hdf5/pull/6499
[2] https://github.com/HDFGroup/hdf5/issues/6501
[3] https://nvd.nist.gov/vuln/detail/cve-2026-17572
[4] https://security-tracker.debian.org/tracker/CVE-2026-17572

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c279e9e68822db77648667093bcbf3013269c791)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-17572.patch           | 253 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
new file mode 100644
index 00000000000..373a6c374ef
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
@@ -0,0 +1,253 @@
+From 606bb0a0282d0b056a3bdda1d489a608deee78d2 Mon Sep 17 00:00:00 2001
+From: Nayyar <nayyar@bugqore.com>
+Date: Tue, 14 Jul 2026 23:39:56 +0530
+Subject: [PATCH] reject SOHM list message count exceeding list_max (#6499)
+
+* bound SOHM list decode to list_max messages
+
+* Add tsohm test for out-of-range SOHM list message count
+
+Create a file with a shared-message list index, corrupt the on-disk
+message count so it exceeds list_max (repairing the table checksum),
+and confirm reopening rejects the file instead of overrunning the
+list image buffer and message array.
+
+---------
+
+Co-authored-by: H. Joe Lee <hyoklee@hdfgroup.org>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-17572
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/20f0b9564bc46154e60f8d35578720a599d41552]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5SMcache.c |  14 ++++
+ test/tsohm.c    | 173 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 187 insertions(+)
+
+diff --git a/src/H5SMcache.c b/src/H5SMcache.c
+index eb6d612a78..96687ffed9 100644
+--- a/src/H5SMcache.c
++++ b/src/H5SMcache.c
+@@ -489,6 +489,12 @@ H5SM__cache_list_verify_chksum(const void *_image, size_t H5_ATTR_UNUSED len, vo
+     assert(image);
+     assert(udata);
+ 
++    /* The buffer only holds list_max messages; a corrupted header whose message
++     * count exceeds that would size the checksum region past the end of it.
++     */
++    if (udata->header->num_messages > udata->header->list_max)
++        HGOTO_ERROR(H5E_SOHM, H5E_BADVALUE, FAIL, "number of SOHM messages exceeds list size");
++
+     /* Exact size with checksum at the end */
+     chk_size = H5SM_LIST_SIZE(udata->f, udata->header->num_messages);
+ 
+@@ -552,6 +558,14 @@ H5SM__cache_list_deserialize(const void *_image, size_t H5_ATTR_NDEBUG_UNUSED le
+         HGOTO_ERROR(H5E_SOHM, H5E_CANTLOAD, NULL, "bad SOHM list signature");
+     image += H5_SIZEOF_MAGIC;
+ 
++    /* The message array is sized for list_max entries; a list index always
++     * holds at most that many before it is promoted to a B-tree. Reject a
++     * corrupted header whose message count would drive the decode loop past
++     * the allocation and the input buffer.
++     */
++    if (udata->header->num_messages > udata->header->list_max)
++        HGOTO_ERROR(H5E_SOHM, H5E_CANTLOAD, NULL, "number of SOHM messages exceeds list size");
++
+     /* Read messages into the list array */
+     ctx.sizeof_addr = H5F_SIZEOF_ADDR(udata->f);
+     for (u = 0; u < udata->header->num_messages; u++) {
+diff --git a/test/tsohm.c b/test/tsohm.c
+index 1652c9b044..61036e7dc3 100644
+--- a/test/tsohm.c
++++ b/test/tsohm.c
+@@ -3702,6 +3702,175 @@ test_sohm_external_dtype(void)
+     free(orig);
+ } /* test_sohm_external_dtype */
+ 
++/*-------------------------------------------------------------------------
++ * Function:    test_sohm_reject_bad_count
++ *
++ * Purpose:     A shared-message list index holds at most list_max messages
++ *              on disk before it is promoted to a B-tree, and both the list
++ *              image buffer and the in-memory message array are sized for
++ *              list_max entries. Corrupt the on-disk message count so it
++ *              exceeds list_max and verify the list load rejects the file
++ *              instead of sizing a read or indexing the array past its end.
++ *
++ *-------------------------------------------------------------------------
++ */
++static void
++test_sohm_reject_bad_count(void)
++{
++    hid_t    fcpl_id   = H5I_INVALID_HID;
++    hid_t    fid       = H5I_INVALID_HID;
++    hid_t    sid       = H5I_INVALID_HID;
++    hid_t    did       = H5I_INVALID_HID;
++    hsize_t  dims[1]   = {4};
++    FILE    *fp        = NULL;
++    uint8_t *buf       = NULL;
++    long     fsize     = 0;
++    long     table_off = -1;
++    unsigned list_max  = 100;
++    uint32_t chksum;
++    size_t   pos;
++    int      i;
++    herr_t   ret;
++
++    /* On-disk shared-message table layout for a file with a single index and
++     * 8-byte addresses: a 4-byte "SMTB" signature, one index record, then a
++     * 4-byte checksum. Within the record the 16-bit message count follows the
++     * (version, index type, message types, minimum size) prefix and the 16-bit
++     * list and B-tree cutoffs.
++     */
++    const size_t rec_size     = 1 + 1 + 2 + 4 + 3 * 2 + 8 + 8;                     /* 30 */
++    const size_t table_body   = (size_t)H5_SIZEOF_MAGIC + rec_size;                /* 34 */
++    const size_t num_msgs_off = (size_t)H5_SIZEOF_MAGIC + (1 + 1 + 2 + 4 + 2 + 2); /* 16 */
++
++    MESSAGE(5, ("Testing rejection of an out-of-range SOHM list message count\n"));
++
++    /* Create a file whose single shared-message index is a list that can hold
++     * up to list_max messages before converting to a B-tree.
++     */
++    fcpl_id = H5Pcreate(H5P_FILE_CREATE);
++    CHECK_I(fcpl_id, "H5Pcreate");
++    ret = H5Pset_shared_mesg_nindexes(fcpl_id, 1);
++    CHECK_I(ret, "H5Pset_shared_mesg_nindexes");
++    ret = H5Pset_shared_mesg_index(fcpl_id, 0, H5O_SHMESG_SDSPACE_FLAG | H5O_SHMESG_DTYPE_FLAG, 1);
++    CHECK_I(ret, "H5Pset_shared_mesg_index");
++    ret = H5Pset_shared_mesg_phase_change(fcpl_id, list_max, 0);
++    CHECK_I(ret, "H5Pset_shared_mesg_phase_change");
++
++    fid = H5Fcreate(FILENAME, H5F_ACC_TRUNC, fcpl_id, H5P_DEFAULT);
++    CHECK_I(fid, "H5Fcreate");
++
++    /* Several datasets sharing one dataspace and datatype leave the index a
++     * list holding a couple of messages, well under list_max.
++     */
++    sid = H5Screate_simple(1, dims, NULL);
++    CHECK_I(sid, "H5Screate_simple");
++    for (i = 0; i < 5; i++) {
++        char name[16];
++
++        snprintf(name, sizeof(name), "dset%d", i);
++        did = H5Dcreate2(fid, name, H5T_NATIVE_INT, sid, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
++        CHECK_I(did, "H5Dcreate2");
++        ret = H5Dclose(did);
++        CHECK_I(ret, "H5Dclose");
++    }
++    ret = H5Sclose(sid);
++    CHECK_I(ret, "H5Sclose");
++    ret = H5Fclose(fid);
++    CHECK_I(ret, "H5Fclose");
++
++    /* Read the whole file so the shared-message table can be located and edited. */
++    fp = fopen(FILENAME, "rb");
++    CHECK_PTR(fp, "fopen");
++    if (fp) {
++        if (fseek(fp, 0, SEEK_END) != 0)
++            TestErrPrintf("fseek failed at line %d\n", __LINE__);
++        fsize = ftell(fp);
++        if (fsize <= (long)(table_body + 4))
++            TestErrPrintf("unexpected file size %ld at line %d\n", fsize, __LINE__);
++        rewind(fp);
++
++        buf = (uint8_t *)malloc((size_t)fsize);
++        CHECK_PTR(buf, "malloc");
++        if (buf && fread(buf, 1, (size_t)fsize, fp) != (size_t)fsize)
++            TestErrPrintf("fread failed at line %d\n", __LINE__);
++        if (fclose(fp) != 0)
++            TestErrPrintf("fclose failed at line %d\n", __LINE__);
++        fp = NULL;
++    }
++
++    /* Find the shared-message table by signature, confirming the match with the
++     * stored checksum so the correct bytes are edited.
++     */
++    for (pos = 0; buf && (pos + table_body + 4) <= (size_t)fsize; pos++) {
++        if (memcmp(buf + pos, H5SM_TABLE_MAGIC, (size_t)H5_SIZEOF_MAGIC) != 0)
++            continue;
++
++        chksum = (uint32_t)buf[pos + table_body] | ((uint32_t)buf[pos + table_body + 1] << 8) |
++                 ((uint32_t)buf[pos + table_body + 2] << 16) | ((uint32_t)buf[pos + table_body + 3] << 24);
++        if (chksum == H5_checksum_metadata(buf + pos, table_body, 0)) {
++            table_off = (long)pos;
++            break;
++        }
++    }
++    if (table_off < 0)
++        TestErrPrintf("could not locate the shared-message table in %s\n", FILENAME);
++
++    if (buf && table_off >= 0) {
++        unsigned bad_count = list_max + 200; /* well past the list_max cutoff */
++        size_t   base      = (size_t)table_off;
++
++        /* Overwrite the 16-bit message count and repair the table checksum so
++         * the table loads and the corruption is only caught at the list.
++         */
++        buf[base + num_msgs_off]     = (uint8_t)(bad_count & 0xff);
++        buf[base + num_msgs_off + 1] = (uint8_t)((bad_count >> 8) & 0xff);
++
++        chksum                     = H5_checksum_metadata(buf + base, table_body, 0);
++        buf[base + table_body]     = (uint8_t)(chksum & 0xff);
++        buf[base + table_body + 1] = (uint8_t)((chksum >> 8) & 0xff);
++        buf[base + table_body + 2] = (uint8_t)((chksum >> 16) & 0xff);
++        buf[base + table_body + 3] = (uint8_t)((chksum >> 24) & 0xff);
++
++        fp = fopen(FILENAME, "r+b");
++        CHECK_PTR(fp, "fopen");
++        if (fp) {
++            if (fwrite(buf, 1, (size_t)fsize, fp) != (size_t)fsize)
++                TestErrPrintf("fwrite failed at line %d\n", __LINE__);
++            if (fclose(fp) != 0)
++                TestErrPrintf("fclose failed at line %d\n", __LINE__);
++            fp = NULL;
++        }
++
++        /* Reopen and share a new message, which protects the list and drives
++         * the vulnerable decode. The load should reject the file cleanly.
++         */
++        fid = H5Fopen(FILENAME, H5F_ACC_RDWR, H5P_DEFAULT);
++        CHECK_I(fid, "H5Fopen");
++        sid = H5Screate_simple(1, dims, NULL);
++        CHECK_I(sid, "H5Screate_simple");
++
++        H5E_BEGIN_TRY
++        {
++            did = H5Dcreate2(fid, "trigger", H5T_NATIVE_INT, sid, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
++        }
++        H5E_END_TRY
++
++        if (did >= 0) {
++            TestErrPrintf("dataset creation succeeded on a corrupted SOHM list at line %d\n", __LINE__);
++            H5Dclose(did);
++        }
++
++        ret = H5Sclose(sid);
++        CHECK_I(ret, "H5Sclose");
++        ret = H5Fclose(fid);
++        CHECK_I(ret, "H5Fclose");
++    }
++
++    free(buf);
++    ret = H5Pclose(fcpl_id);
++    CHECK_I(ret, "H5Pclose");
++} /* test_sohm_reject_bad_count */
++
+ /****************************************************************
+ **
+ **  test_sohm(): Main Shared Object Header Message testing routine.
+@@ -3755,6 +3924,10 @@ test_sohm(void H5_ATTR_UNUSED *params)
+ 
+     test_sohm_extend_dset();    /* Test extending shared datasets */
+     test_sohm_external_dtype(); /* Test using datatype in another file */
++
++    /* Editing the on-disk table in place needs the single-file sec2 layout */
++    if (default_driver)
++        test_sohm_reject_bad_count(); /* Test rejecting a bad SOHM list message count */
+ } /* test_sohm */
+ 
+ /*-------------------------------------------------------------------------
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 7860931e7e1..c83bb832deb 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://0001-cmake-remove-build-flags.patch \
            file://CVE-2026-26199.patch \
            file://CVE-2026-26197.patch \
+           file://CVE-2026-17572.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

