Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1871.1795113413780701532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qcJBKFR6;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so80572b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113413; x=1795718213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DbDQJ1R5lIZiSM/GBg1YT6aVeeHgXw9a9B8yEQ7T8E=;
        b=qcJBKFR68Vj5k6MrDwO5TsP7PKoN2ZPUVKqVlogdJjQFfngd8iAIh61vLm6SbB392A
         z4rYWp/QSurAa0EcpzvEmsDSy5wre/L3PnQzwxiYRH2kuXd6BSRCH4vNHaFGWUkE3k4c
         sztb5ipBS5P3LOTnJ5L332TrQhI3ES21JvVwojjrH4aEU8+ImnzIGvINTKBlCyvzUYwA
         x7YPCyXG/b45cGar51DeE4bvapx0IdByVfMA4d8sKAVPD+AS1sNGHmgZ2VVGro44RkIz
         42ThdUJ9HnYTvS7/Wg4y4kJSIBUO8hqrcqD5XHM0nBbHpd3ooAzxeQ+/Z+y2kSslJHDw
         DTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113413; x=1795718213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DbDQJ1R5lIZiSM/GBg1YT6aVeeHgXw9a9B8yEQ7T8E=;
        b=AZNtitZjCHWkF7T3qbPc9WZpZpcNKvpO4gjGXxPzWNBYrdi/mHNpTpxA+V//GeALTm
         ixSsy7zJAH6bWk619UN2MWJuxyZ5lFsIwG23oOtwwnd5RRiRa+Myi4kYbuu3QrsabpXr
         AcDLuG41rex0QYcXk1/FstxPfgKVolk428HVgv+vAc6oYfqQN3WZkh2IZ5Oo2MbusDfF
         V/6N2TsLiXMcpRSHPzgoduPt8qsVBrIzE7eISCxze0MGb9V3bCpg2iDX8/l5TRCB47Ij
         Jo1csmaLo+GWK/nX2c3D78GnYLgADN00kAJHuiC+Quop/HNniTJLepXeRv8PGzvF11Gi
         L2xQ==
X-Gm-Message-State: APuU4Z8L4vrlDwgvuLDxdbVNbFfPWuaBhjN8saSgvcmylu6a8jiEt/Ms
	bElVTaVQaoCM+HLda8f1vgtls11/ohe0fOxhfnN6Pdyqaqki8WeKgjNqQ5gmEw==
X-Gm-Gg: AYBFou2q0eLQVFRWZstVk24BiCW1yDdMRkaETPsob9ONKzu/IKsgWwsNS8+lNhcGyDo
	+JZLY1LOOtgQQiakFP42nr/NGmhZ1Fmg6xsTan6W4g2rfiPDNjY0pOPGgKlvxpmpdkG8id3KbTi
	WcXzoa6pdOMqBmGCUYQQYF2vq4SfqSUV8PuJ+Le6rHTiRxNq+zr+pKSSRW9UPftGtjUozn2ondO
	Do/IkYQrd3iXzArEhS3Cft2ZocswObG3TraEgqlKpEQwVV0BP9UerIxUO3cr+opdi9m6e3SUak7
	ksMPxy+MJ/gCduOKYHHfwir/ayWNIYbrVu/YY1p90O0v7V4KGoxdEPzmTZMJh+M2JepLMRMBmkX
	wdR+I4edqIxg/We7HZCk9dDoOgxNbNa8nAc8Ont0dShRWr2hI+2x5I3e23puVE5bNFMpBPPVLao
	jE+CK4VgAeMfnpRaEOMHNeGUDYUmKHNOI+DiBCgJZFcAUj9Vjw5pJnjdYWB4E+FiOT+SwazRHrD
	u09WBPD//MNGQpb9ZlI9N9MQe5CnJvA37Rqhzj+YTXK77nE7vI1l/zkMEPNuQ0WjL7qN8ggCgxw
	ZyD96DkzgFMEiiXwnWpuVGvKDawSMFeoV1TFoDVws45SxpWuGIukq1O5p9ayTHKNmdRHO5IsQd8
	oxFHoMFs=
X-Received: by 2002:a05:6a00:32cb:b0:848:77b3:579a with SMTP id d2e1a72fcca58-8c87b8da4f3mr466789b3a.17.1795113412987;
        Thu, 19 Nov 2026 10:36:52 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 22/64] hdf5: patch CVE-2026-19023 and CVE-2026-19024
Date: Fri, 20 Nov 2026 07:32:50 +1300
Message-ID: <706616366e534ddee37be5c02cba092d56e770b1.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132712
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
index 3e87851cf9..9d300b210a 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-17574.patch \
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
+           file://CVE-2026-19023-CVE-2026-19024.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
