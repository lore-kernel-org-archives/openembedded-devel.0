Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4C7C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:38 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11233.1788451229314569009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OGI/rS2v;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11887; q=dns/txt;
  s=iport01; t=1788451229; x=1789660829;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x0vafbd/n4Busf76Kw0xPUD7oHTsvhPDtcWN/2rxSDM=;
  b=OGI/rS2vnCqJm4uqnmI3No+xUNyqbd7NwUK24LDq4jKkKXoqaAH4HwOi
   nmIZIswsGv4kdwjgOQaNZ0rZiUtJ7TdFN5ws4Pzx6zuWSVcXxidxyiIx4
   8z1KcOpyhNPeBo03l0+cZBb3PdKlCBitAhLZGOA63eSEIhouFujkthJyg
   eV8jbpLIGLTVljhTVFktQz6KAycR3oFUYTcnzBxbtrD5e4NJ8AY6Z0FUx
   cnFPEdaHynhXeltyYp6aLv78G9Cs46ManVK52F6o3hXK7x6vGl9HAydw5
   xK82FKtrn31hXI00zMQSLkTTmmTCfKTZodtm1v0Vfh5HGhqT+g6tFUXut
   A==;
X-CSE-ConnectionGUID: Q+Pe3CT5SiGEgCt0ud84Cw==
X-CSE-MsgGUID: opoBl3EwSjSah6iJOmLWLg==
X-IPAS-Result: =?us-ascii?q?A0A4BgCbmJlq/5AQJK1aHgEBCxIMggULgld0YENJh2KMR?=
 =?us-ascii?q?4IhkyGKfYF+DwEBAQ9EDQQBAYUFAo4AAiY1CA4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NkBkBLQsBGAFZAwECWiMhgwIBgnQDEcEPgXkzg?=
 =?us-ascii?q?QGDCR8BPwJDUNlKgWcBCxQBgTiFP4giXRgBhHwnG4FJRIEVg2mBBYFcAQGBJ?=
 =?us-ascii?q?4Z+BIINgQ8SgVqBDoRphhuFfEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsGBYEdgSeDPyMZNnqBCV6BKylhEheBCYIIAoJUggUCAUlDDgdHUwknO?=
 =?us-ascii?q?AsYDUgRLDcVGQQ+bgeOXx+CUAEgDGEBExIGBUENMmcYNwIpknQRkBaCIYE1n?=
 =?us-ascii?q?1qEKIwilToaM4M5S4FXkkAgkjILmH2OCpVzXYRpgWkBOoFHCwczGggbFTuCZ?=
 =?us-ascii?q?wlKGQ+OKwMLC4NggX+CCMgyJzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:A1rqvKKAEggsI3BpFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS0WNVn
 zAfXW3Xaf2PNzb8Ktl1aYTg80hXsJWGz9VrT1Yd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9imYvaj58B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1XT3k7ZqYkp912LkxB3
 uBANTxdMjuc0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237nFYgiuaxa4aJEjCMbcJNmWyc/
 U/ZxGbCCxFENf64zB661n3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KLpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:n+9xQ68CDmM/8juVh99uk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AgBSSQGq+DS3goYsunwfsy9jmUflmSnCG50uNGE6?=
 =?us-ascii?q?XJGlCVOWIRQ/M07wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUJmsOA0UpjpBBsaljMvxGg8ZRjUj5LypIkRWvIo?=
 =?us-ascii?q?9ufKNNXJxGRCYqAuTTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829264344"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2026 16:00:28 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 3E480180004D4
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 16:00:28 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id D119CCE9ECD; Thu,  3 Sep 2026 09:00:27 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 1/3] hdf5: Fix CVE-2026-17572
Date: Thu,  3 Sep 2026 09:00:25 -0700
Message-Id: <20260903160027.1611530-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 16:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129742

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/20f0b9564bc46154e60f8d35578720a599d41552
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17572

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../hdf5/files/CVE-2026-17572.patch           | 272 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 273 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
new file mode 100644
index 0000000000..d5470c9325
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
@@ -0,0 +1,272 @@
+From b15094c046a44e2d5408e4c7f6e3519441ca3dd1 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-17572
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/20f0b9564bc46154e60f8d35578720a599d41552]
+
+Backport Changes:
+- Omitted CHANGELOG.md file changes.
+- Added the missing `done:` label and replaced
+  `FUNC_ENTER_PACKAGE_NOERR` with `FUNC_ENTER_PACKAGE`; both are
+  required when using `HGOTO_ERROR` in the function.
+
+Co-authored-by: H. Joe Lee <hyoklee@hdfgroup.org>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+(cherry picked from commit 20f0b9564bc46154e60f8d35578720a599d41552)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5SMcache.c |  17 ++++-
+ test/tsohm.c    | 173 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 189 insertions(+), 1 deletion(-)
+
+diff --git a/src/H5SMcache.c b/src/H5SMcache.c
+index 77f1eef222..794656fb3e 100644
+--- a/src/H5SMcache.c
++++ b/src/H5SMcache.c
+@@ -480,12 +480,18 @@ H5SM__cache_list_verify_chksum(const void *_image, size_t H5_ATTR_UNUSED len, vo
+     uint32_t              computed_chksum;  /* Computed metadata checksum value */
+     htri_t                ret_value = true; /* Return value */
+
+-    FUNC_ENTER_PACKAGE_NOERR
++    FUNC_ENTER_PACKAGE
+
+     /* Check arguments */
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
+@@ -495,6 +501,7 @@ H5SM__cache_list_verify_chksum(const void *_image, size_t H5_ATTR_UNUSED len, vo
+     if (stored_chksum != computed_chksum)
+         ret_value = false;
+
++done:
+     FUNC_LEAVE_NOAPI(ret_value)
+ } /* end H5SM__cache_list_verify_chksum() */
+
+@@ -547,6 +554,14 @@ H5SM__cache_list_deserialize(const void *_image, size_t H5_ATTR_NDEBUG_UNUSED le
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
+index e6b9e0b5e2..3ea3b0a8c4 100644
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
+@@ -3755,6 +3924,10 @@ test_sohm(void)
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
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 816bd752a1..88e0f0a1ac 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2025-2309.patch \
     file://CVE-2025-2308.patch \
     file://CVE-2025-6857.patch \
+    file://CVE-2026-17572.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


