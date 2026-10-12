Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90F1CA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3521.1791763865460770629
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GkKj46xu;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a5aad413so613416a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763865; x=1792368665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQGQuHIaxDSL9TFDWXqM5bu3wBbrle3z2o81dZ1QKb4=;
        b=GkKj46xujP2nNZ1wuoe2qDhpwuJsEqDbhXnmLmipnCknMKpAmlW9vb6EV1wwuDpOMl
         SUVVzr0C49ENBBOuksxGCJO06lc68R3qt8nJjkThc802ja1Mg2bGbMPAbcYfgxxyuaBs
         z/VipxMrrj179zvCmcILhBiE5rsW9eEcCLq2i+ujikCaPH+l+t24oof7lW2McL6b7tvh
         yiywh+52rnbr2++Hhopa17gA9L3YBBVCCXhOm62CD5mb4ic0rm7dLKp4O+COAybdqwSQ
         MZVgD9hk90e86QUUkKDm1ZwgNySZn9u273FAurp/OQiRLOKSbzQ1JskSghL0UxsOptBB
         yt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763865; x=1792368665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQGQuHIaxDSL9TFDWXqM5bu3wBbrle3z2o81dZ1QKb4=;
        b=acizw2Tub1w+k5GERxdMfBhYJ2fINOJt7iEV0EFAeN1jYSeyAOVYpG83CAnRv9zmAN
         SY9/lAZyHHImIVH1f55lyaGWgxx7S8LYgOHiUlp8627MQmqQ0qTtzmTDso0hrNBVYdvG
         jSlBbLojayZg3xb0nsKqIzeWsnwm7r6/ky6sHZ0izpouZCHncN/40EccI5SBoQ+2sJd8
         //CaXZm7eczZ8PkkMBmtz6/u85iCz6ijFO8c6gBi00Tf0oluEB+hXb35LSlDpvLFTFtP
         KMlMb9qo4/puCnF3L7Pj8c1/DLi9NMDHAhAAW8xWANBo2h0+LQy+nEexa67BiVwJJIpZ
         61jA==
X-Gm-Message-State: AFq9FYK+fDFl2Iz+Eq0hsqyPo8SIRrgcCCJLA8usyJiBIVhZZ9GLud/I
	DxEEEOnxvcldcqkkJd3Bg3sgtVSTVJn4r4MMzoJ6WTIZoVtQgXXiDH+R370iefn7RW4=
X-Gm-Gg: AYBFou2pYwoQK34LNw8PtQBhmRB2DUhgluiI94MGRU6lTdhy3nXku5eNy9gEJNEY3NR
	vnG4e6Gd/NqFTe2b3VujBpInRjk19MfP+h/lJKzMMfW6tqxbQgCQD3BX9gjEzR7LpvUWcjXGhAp
	0o2wFXE7LIAf9Zmp+et8ORTcMAKtBsY6Png2TCzvqQX67Jm0hLIoqhPoXCjGHRfjESSpZT+fu8n
	A1bKPHtZKDt0dQ7UvQA4mW7IF/NuJojilI9U3B1IgrZhUXJ5ngDWbf4rPwPn+CK9fpDJeyl3xHZ
	RuhC6SeCtds9rn4MlNMn4WtGv8+mNVORA4RGP8DkuoIpJsLvQDJ3iSw3ChnsxqnhMhlpPyAtAC2
	yaWgIPwnV5d9Aq4gEuz95wYgzHqca2w0AN50JfOstA/TEYh31qq5XIGKHDIfofzN+dzlqVF1Byy
	fJIK2BBi1Gw5pLVjRWSCpFlIsXQAqWgUhYj+01nFmXoC175w9B3MDzQrhby+sZWKcp9WFVQQTYb
	xaF6cTmRV7mByQZN50teeHiKa+0aXXwdfkIS6k=
X-Received: by 2002:a17:90b:2886:b0:3ab:3606:f281 with SMTP id 98e67ed59e1d1-3ab3a92f6c3mr6248656a91.47.1791763864603;
        Sun, 11 Oct 2026 17:11:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 19/28] hdf5: patch CVE-2026-17572
Date: Mon, 12 Oct 2026 13:09:57 +1300
Message-ID: <20261012001007.2541673-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130744

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
 

