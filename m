Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6629.1793913779949792875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MqzLYLLG;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso128954eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913779; x=1794518579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKcJChIQQ4BNQL2uTStls8BatYWzKDucFBs2RmD3uPg=;
        b=MqzLYLLGSncLxdDsTtz35wlDkIaX2vUKwRAsZbnC2OGk45IowobYvByuKRtDDZy9E9
         qrMuOmfkYOs75Jv/H2z8SP16d5I1RBD0z0IDJ1AwKBUm9Or6j4rfzl7g2zHdbzIyEiI9
         iz83p6F2Tsj294UWNv/5dJjakW1dDf2p6JbcChrHyWwYUq0Ss4ehN/hOAgeZuh5yrj3G
         NpLPW7nSt8xx7kXL65dSOK+Fe58s9G0tyDUU0nxrXe8cLtJpxpF22f4j3jDZIX1NgpFc
         ypo+x+s4DvYekkbr3B/cJNRsCZ2aA+ybsR7HyfXeJ2dE95wyVksxDyJlFFY9AtTHToCr
         IiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913779; x=1794518579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKcJChIQQ4BNQL2uTStls8BatYWzKDucFBs2RmD3uPg=;
        b=EHPfnuGeix3cXkAnK3BmdUGfShwMS7bJ0CnrW+tPhteJFCrwnJYxHB6/ZB+63tk4u8
         PwY9MNYG5nSqd1ToCQC62q17EvOgQQmZEhjjrCm7nQTEsvua5FIiF0UDTKZAG4uOQ/cN
         RquyQxRaQzfeoMVAfB2SP9ZlxUclfl+8X5bq3hoIgMp+MSjDiqNFTXiUUUqjQL+Dt3sa
         EmfnmW82/cuAvLctPSHED77qOkcC2ByMi82jaIe50H/NxknQhbssbUHhpi07uA7avs1W
         K5c8DlESMI7RmNxNW/upqv+xMUJ301p/BcXTBTQdxwo2v/nLyuGYn5m5t8dY6Y416KLk
         HTbg==
X-Gm-Message-State: APuU4Z8azmj3Q5qj1134ywSqwGn3EQ0CwZOa1/iRAwe/GVoGqE5NsO4e
	JawEngTCQTA8gBWkShn0AGzCFb9bxjy0Pm4NHA0S9PUAo9i/bsSwiDhWJnuu4w==
X-Gm-Gg: AYBFou1WoXO8hu9MV0mykZJwrnOa1IxixI8iG/F/egagRsgzorgzWksw38m+3T8UovF
	Dcyir3aeja3TMYCNJAISJ6xCAiJe9hOjDHTauXMFBJw2GWTtsfEGhBfjeHNid4TTBBH/IQCeQ5g
	mQGirC80ghHuKgmiBsMUKNpucPKmfz3kCc+t9ujgmJcH1kl8ikomDnAgrrLiiiUfB4oyjtKZ+TC
	ekTCdhcFtZGADTLWh73ZgmMq2kVCaizI39n7btCMzm8XRMZbMiQ2tETbL9fCR9RnbveWvm/Eg55
	UOqAExxaq4bsW3yQwu/jykFq19NlxB4qlyGCB7vb2WdwfznNBvrdf53CdnZrEExFutliXOQYKgp
	CmvSUw0KobFDWrz/J5GJfHDBTlLwaE0OK1ba8Ue65dbhk+myUdk5EqAjg3FSs6SolbQsFKHOKsW
	/fDpDiNa4UFSpqROE/X8KWytC22qKm7IRutzdFY3FV7G+ABEA6LgYPiq00r9T0TAY99qhz1G4tE
	oWf7lvThMN4b3Wkzgn1MgRfbNCk6J6hVZ/T4YjWdKnmgbIpF7anCMiaAfHPDdtFGeNC1ILamblu
	PhAbTmLWTgGdbpVc5TR8maQMCk2Y/toHVFYu3J/2/6Nn3LqzP7yZ+RkUlsIJJA==
X-Received: by 2002:a05:693c:26c9:b0:369:36c9:5848 with SMTP id 5a478bee46e88-36f76022c16mr494205eec.12.1793913779026;
        Thu, 05 Nov 2026 13:22:59 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:22:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/14] hdf5: patch CVE-2026-19023 and CVE-2026-19024
Date: Fri,  6 Nov 2026 10:22:38 +1300
Message-ID: <20261105212250.490188-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131939
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19023
https://nvd.nist.gov/vuln/detail/cve-2026-19024

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/CVE-2026-19023-CVE-2026-19024.patch | 176 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
new file mode 100644
index 0000000000..acf3817ea1
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
@@ -0,0 +1,176 @@
+From e7e85949865b771b2b0b73ac1edaf54ce14cd894 Mon Sep 17 00:00:00 2001
+From: Matt L <124107509+mattjala@users.noreply.github.com>
+Date: Wed, 7 Oct 2026 11:03:55 -0500
+Subject: [PATCH] Fix CVEs related to vlen binary output and malformed fill
+ values in h5dump (#6507)
+
+* Fix h5dump SIGSEGVs on vlen binary output and malformed fill value
+
+Fixes two crafted-file crashes in h5dump (GitHub issues #6486 and #6487).
+A third report (#6488) is the Fletcher32 checksum-length underflow already
+fixed for h5ls in PR #6497, so it is not addressed again here.
+
+Issue #6486 (tools) - render_bin_output() SIGSEGV with "-b" on a
+variable-length string dataset. The H5T_STRING branch reused the local
+"size" variable both as the per-element stride and as the string length
+returned by strlen(), so after the first element the stride became that
+string's length and subsequent elements were read from misaligned
+addresses, dereferencing a garbage pointer. This affected any multi-element
+vlen-string dataset, not just crafted files. A separate str_len variable is
+now used for the write length so "size" stays the datatype stride. As this
+is a tools bug, the regression test is a tools test: tools/test/h5dump adds
+the tbinvlstr case (binary dump of a vlen-string dataset, file
+tbinvlstr.h5, generated by h5dumpgentest.c/gent_binvlstr), which crashes on
+develop and passes with the fix.
+
+Issue #6487 (library) - H5Pget_fill_value() SIGSEGV via H5T_path_find().
+A crafted version-1/2 fill value message can have "fill defined" set with a
+negative size field; H5O_fill_old_decode() leaves fill.size negative and
+fill.buf/type NULL instead of normalizing to the "undefined" sentinel.
+That value is neither 0 nor -1, so H5P_get_fill_value() fell through to
+H5T_path_find() with a NULL source type and crashed. H5P_get_fill_value()
+now rejects a NULL fill datatype and returns an error, keeping the dataset
+itself readable. h5dump's XML fill-value renderer (xml_dump_fill_value) is
+also hardened: it checks the buffer allocation and the H5Pget_fill_value()
+return value and emits an empty fill value element instead of dereferencing
+an unallocated or unretrievable buffer.
+
+Regression test (library): test/fillval.c test_bad_fill_value() reads a
+crafted file (generated by test/gen_bad_fill.c, committed as
+test/testfiles/bad_fill_value.h5) and verifies that the dataset data is
+still readable while H5Pget_fill_value() fails cleanly instead of crashing.
+
+Verified: both PoCs exit cleanly with the fix (SIGSEGV without it); the
+committed fixtures crash the pre-fix library/tools and pass post-fix; the
+fillval suite, the new tbinvlstr h5dump test, and the non-XML h5dump suite
+pass.
+
+Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
+
+* Update CHANGELOG to list CVEs/GH issues
+
+* Renumber tbinvlstr.h5 generator macro to FILE114
+
+---------
+
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-19023 CVE-2026-19024
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/cfcd7fe7421cc94e0527d043f2d1b271986e7b09]
+
+Dropped changes to the test and CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Pdcpl.c                 |  7 +++++++
+ tools/lib/h5tools.c           |  9 ++++++---
+ tools/src/h5dump/h5dump_xml.c | 33 ++++++++++++++++++++++++++++-----
+ 3 files changed, 41 insertions(+), 8 deletions(-)
+
+diff --git a/src/H5Pdcpl.c b/src/H5Pdcpl.c
+index 2317c317f73..a1a33d52c7b 100644
+--- a/src/H5Pdcpl.c
++++ b/src/H5Pdcpl.c
+@@ -3207,6 +3207,13 @@ H5P_get_fill_value(H5P_genplist_t *plist, const H5T_t *type, void *value /*out*/
+         HGOTO_DONE(SUCCEED);
+     } /* end if */
+ 
++    /*
++     * A fill value with a nonzero size must have an associated datatype in
++     * order to be converted to the destination type.
++     */
++    if (NULL == fill.type)
++        HGOTO_ERROR(H5E_PLIST, H5E_CANTGET, FAIL, "fill value has no datatype");
++
+     /*
+      * Can we convert between the source and destination datatypes?
+      */
+diff --git a/tools/lib/h5tools.c b/tools/lib/h5tools.c
+index b1a2aa0de4c..3e028504f7c 100644
+--- a/tools/lib/h5tools.c
++++ b/tools/lib/h5tools.c
+@@ -1825,24 +1825,27 @@ render_bin_output(FILE *stream, hid_t container, hid_t tid, void *_mem, hsize_t
+             H5T_str_t     pad;
+             char         *s = NULL;
+             unsigned char tempuchar;
++            size_t        str_len; /* # of bytes to write for this element */
+ 
+             H5TOOLS_DEBUG("H5T_STRING");
+             pad = H5Tget_strpad(tid);
+ 
+             for (block_index = 0; block_index < block_nelmts; block_index++) {
++                /* Advance by the datatype size */
+                 mem = ((unsigned char *)_mem) + block_index * size;
+ 
+                 if (H5Tis_variable_str(tid)) {
+                     s = *(char **)((void *)mem);
+                     if (s != NULL)
+-                        size = strlen(s);
++                        str_len = strlen(s);
+                     else
+                         H5TOOLS_THROW((-1), "NULL string");
+                 }
+                 else {
+-                    s = (char *)mem;
++                    s       = (char *)mem;
++                    str_len = size;
+                 }
+-                for (i = 0; i < size && (s[i] || pad != H5T_STR_NULLTERM); i++) {
++                for (i = 0; i < str_len && (s[i] || pad != H5T_STR_NULLTERM); i++) {
+                     memcpy(&tempuchar, &s[i], sizeof(unsigned char));
+                     if (1 != fwrite(&tempuchar, sizeof(unsigned char), 1, stream))
+                         H5TOOLS_THROW((-1), "fwrite failed");
+diff --git a/tools/src/h5dump/h5dump_xml.c b/tools/src/h5dump/h5dump_xml.c
+index f1a34870f4a..6f3e00a27df 100644
+--- a/tools/src/h5dump/h5dump_xml.c
++++ b/tools/src/h5dump/h5dump_xml.c
+@@ -3534,8 +3534,9 @@ xml_dump_fill_value(hid_t dcpl, hid_t type)
+     hid_t             n_type = H5I_INVALID_HID;
+     void             *buf;
+     char             *name;
+-    h5tools_str_t     buffer; /* string into which to render   */
+-    h5tools_context_t ctx;    /* print context  */
++    herr_t            fill_ret = FAIL; /* status of retrieving the fill value */
++    h5tools_str_t     buffer;          /* string into which to render   */
++    h5tools_context_t ctx;             /* print context  */
+     h5tool_format_t  *outputformat = &xml_dataformat;
+     h5tool_format_t   string_dataformat;
+     hsize_t           curr_pos = 0; /* total data element position   */
+@@ -3593,11 +3594,33 @@ xml_dump_fill_value(hid_t dcpl, hid_t type)
+         n_type = type;
+ 
+     space = H5Tget_size(n_type);
+-    buf   = malloc((size_t)space);
++    /* Zero-initialize so a partially-filled buffer never contains
++     * uninitialized memory for the rendering code below. */
++    buf = calloc((size_t)space, 1);
++
++    /* Retrieve the fill value.  This can fail on a corrupted or crafted file
++     * whose fill value has no datatype. Any errors are suppressed and handled
++     * later. */
++    if (buf != NULL) {
++        H5E_BEGIN_TRY
++        {
++            fill_ret = H5Pget_fill_value(dcpl, n_type, buf);
++        }
++        H5E_END_TRY
++    }
+ 
+-    H5Pget_fill_value(dcpl, n_type, buf);
++    if (buf == NULL || fill_ret < 0) {
++        /* No usable fill value: emit an empty element rather than
++         * dereferencing an unallocated or unretrievable buffer. */
++        ctx.need_prefix = true;
+ 
+-    if (H5Tget_class(n_type) == H5T_REFERENCE) {
++        /* Render the element */
++        h5tools_str_reset(&buffer);
++        h5tools_str_append(&buffer, "<%sNoData />", xmlnsprefix);
++        h5tools_render_element(rawoutstream, outputformat, &ctx, &buffer, &curr_pos,
++                               (size_t)outputformat->line_ncols, (hsize_t)0, (hsize_t)0);
++    }
++    else if (H5Tget_class(n_type) == H5T_REFERENCE) {
+         const char *path = lookup_ref_path(*(H5R_ref_t *)buf);
+ 
+         ctx.need_prefix = true;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 1ec5ad049e..31a56bce3c 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-17574.patch \
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
+           file://CVE-2026-19023-CVE-2026-19024.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
