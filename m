Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624A0C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:09:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33698.1785906583888748050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bSnyg5X2;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=30546; q=dns/txt;
  s=iport01; t=1785906584; x=1787116184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B1FVcLbd7BHFfD7TbfMUuos+KwszXEnRra5NzXHFFKk=;
  b=bSnyg5X25qQh60yb7V2kOzMBTY3dDC8nfOLVZh4z9ZGhTkPW9dEYQ+3e
   llfSucfhGBl8dsroXe7xphqXvvaGfjMCTXoLz9E2w9W9VUdM1rbbz1vgV
   2hFeqneChoaVkdeiOkxK/kd30wHXmM4k+yWTNmYWqrJVNs9HfwA6Awra8
   SLhRmEn0/kym1gnbzoZlyicRB2stI8OPiPc3FaqtyvMyc/NkpT6p4MlKk
   nJd0zdnLbxEHcQvq57zLHA5zbe2djsMSph1zV00+40XMxHuWO++oEWaHb
   zmgDpeBBWfoSWFfnLv5u8V/IRAYa/iW020RFOEPdy6GbiH3N/aiBUWleg
   Q==;
X-CSE-ConnectionGUID: Cy2/MJHeRJuijB03/kX/Bg==
X-CSE-MsgGUID: e14DQeRfTpS2NaUpTvEVAg==
X-IPAS-Result: =?us-ascii?q?A0BGAgDaxHJq/48QJK1aglmCV3RfQkkDlkeBFp0IgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjWYCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEdGAEYAS0sAwECWiMhgwIBgnQCARG8YoIsgQGDKAGBV?=
 =?us-ascii?q?NsuAQsUAQWBM4U/iCFdGAGEfCcbG4FygRWCc3aBBYFcAoglBIINFXoSgVoeg?=
 =?us-ascii?q?S2FI4oJSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRtI?=
 =?us-ascii?q?xk2fIEJXoEtKmQBEheBCYJ7AoJ6bwsYDUgRLDcUGQQ+bgeNaCCCQAEwQwcJC?=
 =?us-ascii?q?gETEgYXCTAvBgwPXQcLHQ8CDQQYFJJpAQeQFoIhoQ8KKIN1jCGVOhozhASBV?=
 =?us-ascii?q?4IbkCWLIYcwC5h9glmLMZVoaIRpgWg8gVlwFTuCZwlKGQ+OKgMLC4NghAeBD?=
 =?us-ascii?q?McmJDUCCQMvAQEHAgcOAwuBaJEeYAEB?=
IronPort-Data: A9a23:EUrRIq0zalasMx8MKvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2RVz
 zdJXjrVOPyNajT2KtFzYNm09hlTuZfRyNU1HgVq3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EjxYtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24sbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ1Bseqg62utNI3xP9
 9ZAc3cOXlepiLfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOGxboWNJIzVLSlTtkvB+
 k7/8l73PgkhbvqW9CK57F+Sr+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:vZLO+aADOELd9v/lHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:pDrQWGNYY5IwXu5Dczg9s2s2Os0fUGDczl2IeAi7OSFDR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3An4BWdQ8jGTLNUcov0LzxwDyQf8oxv4iXBXoDrY0?=
 =?us-ascii?q?94e+NCDRMJRqjpTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="814670687"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:09:31 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 71C5F18000100;
	Wed,  5 Aug 2026 05:09:31 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 0FDBEC8EA73; Tue,  4 Aug 2026 22:09:31 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][wrynose][PATCH 1/2] hdf5: Fix CVE-2026-26199
Date: Tue,  4 Aug 2026 22:09:30 -0700
Message-Id: <20260805050931.3936854-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128797

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream HDF5 2.1.0 backport for
CVE-2026-26199. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/HDFGroup/hdf5/commit/9268b803b742f99c1f8793cae74f19e74976b065
[2] https://github.com/HDFGroup/hdf5/security/advisories/GHSA-5c6x-jmgf-f5vc

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../hdf5/files/CVE-2026-26199.patch           | 678 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 679 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
new file mode 100644
index 0000000000..1e8d8d44df
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
@@ -0,0 +1,678 @@
+From 20f4eeca67f84fc40bf2edb1625f5383164f64ee Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Mon, 26 Jan 2026 19:07:23 -0500
+Subject: [PATCH] Fixes buffer underflow (#6143)
+
+Fixes security issue by treating non-NULL buffer with size 0 as length-only query in get_name API functions.
+
+Behavior:
+Modify get_name API functions to treat (buffer != NULL, size == 0) as length-only queries, preventing undefined behavior.
+Fix applied to H5Aget_name, H5Aget_name_by_idx, H5Fget_name, H5Gget_objname_by_idx, H5Iget_name, H5Lget_name_by_idx, H5Rget_file_name, H5Rget_obj_name, H5Rget_attr_name, and 8 other functions.
+Tests:
+Update test/links.c, test/tattr.c, test/tfile.c, test/titerate.c, and test/trefer.c to verify new behavior with non-null buffer and size 0.
+Documentation:
+Update comments in H5A.c, H5F.c, H5Gdeprec.c, H5I.c, H5L.c, H5R.c, and H5Rdeprec.c to reflect new behavior.t]@users.noreply.github.com>
+
+CVE: CVE-2026-26199
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/9268b803b742f99c1f8793cae74f19e74976b065]
+
+Backport Changes:
+- Omitted release_docs/CHANGELOG.md because its HDF5 2.1.0 release
+  context does not apply to the 2.0.0 backport.
+
+(cherry picked from commit 9268b803b742f99c1f8793cae74f19e74976b065)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ src/H5A.c       | 11 ++++++++-
+ src/H5F.c       | 32 ++++++++++++++++++---------
+ src/H5Gdeprec.c | 32 ++++++++++++++++++---------
+ src/H5I.c       | 32 ++++++++++++++++++---------
+ src/H5L.c       |  4 ++++
+ src/H5R.c       | 59 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ src/H5Rdeprec.c | 22 ++++++++++++++++--
+ test/links.c    | 21 ++++++++++++++++--
+ test/tattr.c    | 25 +++++++++++++++++++--
+ test/tfile.c    | 16 +++++++++++++-
+ test/titerate.c | 16 +++++++++++++-
+ test/trefer.c   | 43 +++++++++++++++++++++++++++++------
+ 12 files changed, 265 insertions(+), 48 deletions(-)
+
+diff --git a/src/H5A.c b/src/H5A.c
+index 0725489bc..9d4862d32 100644
+--- a/src/H5A.c
++++ b/src/H5A.c
+@@ -1221,7 +1221,8 @@ done:
+     Up to 'buf_size'-1 characters are stored in 'buf' followed by a '\0' string
+     terminator.  If the name of the attribute is longer than 'buf_size'-1,
+     the string terminator is stored in the last position of the buffer to
+-    properly terminate the string.
++    properly terminate the string.  If 'buf' is non-NULL but 'buf_size' is 0,
++    treat the call as length being queried.
+ --------------------------------------------------------------------------*/
+ ssize_t
+ H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
+@@ -1233,6 +1234,10 @@ H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
+ 
+     FUNC_ENTER_API((-1))
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (buf && buf_size == 0)
++        buf = NULL;
++
+     /* check arguments */
+     if (NULL == (vol_obj = H5VL_vol_object_verify(attr_id, H5I_ATTR)))
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "not an attribute");
+@@ -1295,6 +1300,10 @@ H5Aget_name_by_idx(hid_t loc_id, const char *obj_name, H5_index_t idx_type, H5_i
+ 
+     FUNC_ENTER_API(FAIL)
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check args */
+     if (H5I_ATTR == H5I_get_type(loc_id))
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, FAIL, "location is not valid for an attribute");
+diff --git a/src/H5F.c b/src/H5F.c
+index a0a57d294..2450098b7 100644
+--- a/src/H5F.c
++++ b/src/H5F.c
+@@ -1972,19 +1972,27 @@ done:
+  * Function:    H5Fget_name
+  *
+  * Purpose:     Gets the name of the file to which object OBJ_ID belongs.
+- *              If 'name' is non-NULL then write up to 'size' bytes into that
+- *              buffer and always return the length of the entry name.
+- *              Otherwise `size' is ignored and the function does not store
+- *              the name, just returning the number of characters required to
+- *              store the name. If an error occurs then the buffer pointed to
+- *              by 'name' (NULL or non-NULL) is unchanged and the function
+- *              returns a negative value.
++ *
++ * Description:
++ *              When 'name' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
++ *
++ *              When 'name' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
++ * Return:      Success:    Length of the name (excluding null terminator)
++ *              Failure:    Negative
+  *
+  * Note:        This routine returns the name that was used to open the file,
+  *              not the actual name after resolving symlinks, etc.
+- *
+- * Return:      Success:    The length of the file name
+- *              Failure:    -1
+  *-------------------------------------------------------------------------
+  */
+ ssize_t
+@@ -1998,6 +2006,10 @@ H5Fget_name(hid_t obj_id, char *name /*out*/, size_t size)
+ 
+     FUNC_ENTER_API((-1))
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check the type */
+     type = H5I_get_type(obj_id);
+     if (H5I_FILE != type && H5I_GROUP != type && H5I_DATATYPE != type && H5I_DATASET != type &&
+diff --git a/src/H5Gdeprec.c b/src/H5Gdeprec.c
+index b6364db46..b610ad473 100644
+--- a/src/H5Gdeprec.c
++++ b/src/H5Gdeprec.c
+@@ -1145,20 +1145,26 @@ done:
+  * Function:	H5Gget_objname_by_idx
+  *
+  * Purpose:     Returns the name of objects in the group by giving index.
+- *              If `name' is non-NULL then write up to `size' bytes into that
+- *              buffer and always return the length of the entry name.
+- *              Otherwise `size' is ignored and the function does not store the name,
+- *              just returning the number of characters required to store the name.
+- *              If an error occurs then the buffer pointed to by `name' (NULL or non-NULL)
+- *              is unchanged and the function returns a negative value.
+- *              If a zero is returned for the name's length, then there is no name
+- *              associated with the ID.
+  *
+- * Note:	Deprecated in favor of H5Lget_name_by_idx
++ * Description:
++ *              When 'name' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
+  *
+- * Return:	Success:        Non-negative
+- *		Failure:	Negative
++ *              When 'name' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
+  *
++ * Return:      Success:    Length of the name (excluding null terminator)
++ *              Failure:    Negative
++ *
++ * Note:	Deprecated in favor of H5Lget_name_by_idx
+  *-------------------------------------------------------------------------
+  */
+ ssize_t
+@@ -1172,6 +1178,10 @@ H5Gget_objname_by_idx(hid_t loc_id, hsize_t idx, char *name /*out*/, size_t size
+ 
+     FUNC_ENTER_API(-1)
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Set up collective metadata if appropriate */
+     if (H5CX_set_loc(loc_id) < 0)
+         HGOTO_ERROR(H5E_SYM, H5E_CANTSET, (-1), "can't set collective metadata read info");
+diff --git a/src/H5I.c b/src/H5I.c
+index b71a9772b..4b8fc4f02 100644
+--- a/src/H5I.c
++++ b/src/H5I.c
+@@ -824,19 +824,27 @@ done:
+  *
+  * Purpose:     Gets a name of an object from its ID.
+  *
+- * Return:      Success:    The length of the name
++ * Description:
++ *              When 'name' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
+  *
+- *              Failure:    -1
++ *              When 'name' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
++ * Return:      Success:    The length of the name (excluding null terminator)
++ *              Failure:    Negative
+  *
+  * Notes:
+- *  If 'name' is non-NULL then write up to 'size' bytes into that
+- *  buffer and always return the length of the entry name.
+- *  Otherwise 'size' is ignored and the function does not store the name,
+- *  just returning the number of characters required to store the name.
+- *  If an error occurs then the buffer pointed to by 'name' (NULL or non-NULL)
+- *  is unchanged and the function returns a negative value.
+- *  If a zero is returned for the name's length, then there is no name
+- *  associated with the ID.
++ *              If a zero is returned for the name's length, then there is no name
++ *              associated with the ID.
+  *
+  *-------------------------------------------------------------------------
+  */
+@@ -851,6 +859,10 @@ H5Iget_name(hid_t id, char *name /*out*/, size_t size)
+ 
+     FUNC_ENTER_API((-1))
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Get the object pointer */
+     if (NULL == (vol_obj = H5VL_vol_object(id)))
+         HGOTO_ERROR(H5E_ID, H5E_BADTYPE, (-1), "invalid identifier");
+diff --git a/src/H5L.c b/src/H5L.c
+index a818445c5..ee603bfa8 100644
+--- a/src/H5L.c
++++ b/src/H5L.c
+@@ -1478,6 +1478,10 @@ H5Lget_name_by_idx(hid_t loc_id, const char *group_name, H5_index_t idx_type, H5
+ 
+     FUNC_ENTER_API((-1))
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check arguments */
+     if (!group_name || !*group_name)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "no name specified");
+diff --git a/src/H5R.c b/src/H5R.c
+index 2b8dcdbf2..8851cb33f 100644
+--- a/src/H5R.c
++++ b/src/H5R.c
+@@ -1013,8 +1013,23 @@ done:
+  * Purpose:     Given a reference to some object, determine a file name of the
+  *              object located into.
+  *
+- * Return:      Non-negative length of the path on success / -1 on failure
++ * Description:
++ *              When 'buf' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
++ *
++ *              When 'buf' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
+  *
++ * Return:      Success:    The length of the name (excluding null terminator)
++ *              Failure:    Negative
+  *-------------------------------------------------------------------------
+  */
+ ssize_t
+@@ -1032,6 +1047,10 @@ H5Rget_file_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
+         H5R__get_type((const H5R_ref_priv_t *)ref_ptr) >= H5R_MAXTYPE)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (buf && size == 0)
++        buf = NULL;
++
+     /* Get name */
+     if (H5I_INVALID_HID == (loc_id = H5R__get_loc_id((const H5R_ref_priv_t *)ref_ptr))) {
+         /* Un-opened external references do not have loc_id set but hold a
+@@ -1073,6 +1092,21 @@ done:
+  * Purpose:     Given a reference to some object, determine a path to the
+  *              object referenced in the file.
+  *
++ * Description:
++ *              When 'buf' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
++ *
++ *              When 'buf' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
+  * Return:      Non-negative length of the path on success / -1 on failure
+  *
+  *-------------------------------------------------------------------------
+@@ -1099,6 +1133,10 @@ H5Rget_obj_name(H5R_ref_t *ref_ptr, hid_t rapl_id, char *buf /*out*/, size_t siz
+     if (rapl_id < 0)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "not a property list");
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (buf && size == 0)
++        buf = NULL;
++
+     /* Retrieve loc_id from reference */
+     if (H5I_INVALID_HID == (loc_id = H5R__get_loc_id((const H5R_ref_priv_t *)ref_ptr)))
+         /* Attempt to re-open file and pass rapl_id as a fapl_id */
+@@ -1140,6 +1178,21 @@ done:
+  *
+  * Purpose:     Given a reference to some attribute, determine its name.
+  *
++ * Description:
++ *              When 'buf' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
++ *
++ *              When 'buf' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the name (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
+  * Return:      Non-negative length of the path on success / -1 on failure
+  *
+  *-------------------------------------------------------------------------
+@@ -1157,6 +1210,10 @@ H5Rget_attr_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
+     if (H5R__get_type((const H5R_ref_priv_t *)ref_ptr) != H5R_ATTR)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (buf && size == 0)
++        buf = NULL;
++
+     /* Get attribute name */
+     if ((ret_value = H5R__get_attr_name((const H5R_ref_priv_t *)ref_ptr, buf, size)) < 0)
+         HGOTO_ERROR(H5E_REFERENCE, H5E_CANTGET, (-1), "unable to determine attribute name");
+diff --git a/src/H5Rdeprec.c b/src/H5Rdeprec.c
+index 6ca014e16..4b5437d4f 100644
+--- a/src/H5Rdeprec.c
++++ b/src/H5Rdeprec.c
+@@ -741,9 +741,23 @@ done:
+  * Purpose:     Given a reference to some object, determine a path to the
+  *              object referenced in the file.
+  *
+- * Return:      Success:    Non-negative length of the path
+- *              Failure:    -1
++ * Description:
++ *              When 'name' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the actual length
++ *                  of the name (excluding null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the actual length of the name (excluding null terminator).
+  *
++ *              When 'name' is NULL: does not write anything regardless of 'size'
++ *              and returns the actual length of the path (excluding null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
++ * Return:      Success:    The length of the path (excluding null terminator)
++ *              Failure:    Negative
+  *-------------------------------------------------------------------------
+  */
+ ssize_t
+@@ -766,6 +780,10 @@ H5Rget_name(hid_t id, H5R_type_t ref_type, const void *ref, char *name /*out*/,
+     if (ref_type != H5R_OBJECT1 && ref_type != H5R_DATASET_REGION1)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "invalid reference type");
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Get the VOL object */
+     if (NULL == (vol_obj = H5VL_vol_object(id)))
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "invalid file identifier");
+diff --git a/test/links.c b/test/links.c
+index 262cd0f2e..091cdaf84 100644
+--- a/test/links.c
++++ b/test/links.c
+@@ -154,6 +154,9 @@ static const char *FILENAME[] = {"links0",
+ #define TIMESTAMP_GROUP_1 "timestamp1"
+ #define TIMESTAMP_GROUP_2 "timestamp2"
+ 
++/* Used by test_deprec() */
++#define NON_NULL_BUF "NON_NULL_BUF"
++
+ /* Link iteration struct */
+ typedef struct {
+     H5_iter_order_t order;     /* Direction of iteration */
+@@ -1990,8 +1993,11 @@ test_deprec(hid_t fapl, bool new_format)
+     hsize_t    num_objs; /* Number of objects in a group */
+     char       filename[1024];
+     char       tmpstr[1024];
+-    int        len = 0; /* Length of comment */
+-    herr_t     status;  /* Generic return value */
++    int        len = 0;          /* Length of comment */
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
++    ssize_t    name_len;         /* Length of name */
++    herr_t     status;           /* Generic return value */
+ 
+     if (new_format)
+         TESTING("backwards compatibility (w/new group format)");
+@@ -2052,6 +2058,17 @@ test_deprec(hid_t fapl, bool new_format)
+     if (len >= 0)
+         TEST_ERROR;
+ 
++    /* Verify that passing a non-null buffer with size 0 still returns the correct name
++       size and the buffer is not modified */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    if ((name_len = H5Gget_objname_by_idx(group1_id, (hsize_t)0, buf_ptr, 0)) < 0)
++        FAIL_STACK_ERROR;
++    if ((size_t)name_len != strlen(tmpstr))
++        TEST_ERROR;
++    if ((strcmp(non_null_buf, NON_NULL_BUF) != 0))
++        TEST_ERROR;
++
+     /* Test getting the type for objects */
+     if ((obj_type = H5Gget_objtype_by_idx(group1_id, (hsize_t)0)) < 0)
+         FAIL_STACK_ERROR;
+diff --git a/test/tattr.c b/test/tattr.c
+index 780f11591..af08d2db0 100644
+--- a/test/tattr.c
++++ b/test/tattr.c
+@@ -148,6 +148,7 @@ static float attr_data5 = -5.123F; /* Test data for 5th attribute */
+ 
+ /* Used by test_attr_info_null_info_pointer() */
+ #define GET_INFO_NULL_POINTER_ATTR_NAME "NullInfoPointerAttr"
++#define NON_NULL_BUF                    "NON_NULL_BUF"
+ 
+ /* Used by test_attr_rename_invalid_name() */
+ #define INVALID_RENAME_TEST_ATTR_NAME     "InvalidRenameTestAttr"
+@@ -6526,10 +6527,13 @@ test_attr_rename_invalid_name(hid_t fcpl, hid_t fapl)
+ 
+ /***************************************************************
+ **
+-**  test_attr_get_name_invalid_buf(): A test to ensure that
+-**      passing a NULL buffer to H5Aget_name(_by_idx) when
++**  test_attr_get_name_invalid_buf(): A test to ensure that:
++**    - passing a NULL buffer to H5Aget_name(_by_idx) when
+ **      the 'size' parameter is non-zero doesn't cause bad
+ **      behavior.
++**    - passing a non-NULL buffer to H5Aget_name(_by_idx)
++**      when the 'size' parameter is zero treats as a length
++**      query call.
+ **
+ ****************************************************************/
+ static void
+@@ -6539,6 +6543,9 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
+     hid_t   fid;
+     hid_t   attr;
+     hid_t   sid;
++    char    non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char   *buf_ptr;          /* To pass mid-string */
++    ssize_t namelen;          /* Length of attribute name */
+ 
+     /* Create dataspace for attribute */
+     sid = H5Screate(H5S_SCALAR);
+@@ -6569,6 +6576,20 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
+ 
+     VERIFY(err_ret, FAIL, "H5Aget_name_by_idx");
+ 
++    /* Verify that passing a non-null buffer with size 0 still returns the correct name
++       size and the buffer is not modified */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    namelen = H5Aget_name(attr, (size_t)0, buf_ptr);
++    CHECK(namelen, FAIL, "H5Aget_name");
++    VERIFY(namelen, (ssize_t)strlen(GET_NAME_INVALID_BUF_TEST_ATTR_NAME), "H5Aget_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Aget_name");
++
++    namelen = H5Aget_name_by_idx(fid, ".", H5_INDEX_CRT_ORDER, H5_ITER_INC, 0, buf_ptr, 0, H5P_DEFAULT);
++    CHECK(namelen, FAIL, "H5Aget_name_by_idx");
++    VERIFY(namelen, (ssize_t)strlen(GET_NAME_INVALID_BUF_TEST_ATTR_NAME), "H5Aget_name_by_idx");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Aget_name_by_idx");
++
+     /* Close dataspace */
+     err_ret = H5Sclose(sid);
+     CHECK(err_ret, FAIL, "H5Sclose");
+diff --git a/test/tfile.c b/test/tfile.c
+index 7f7e293b9..32ea586cd 100644
+--- a/test/tfile.c
++++ b/test/tfile.c
+@@ -147,6 +147,9 @@
+ /* Declaration for test_incr_filesize() */
+ #define FILE_INCR_FILESIZE "tfile_incr_filesize"
+ 
++/* Used by test_file_getname() */
++#define NON_NULL_BUF "NON_NULL_BUF"
++
+ /* Files created under 1.6 branch and 1.8 branch--used in test_filespace_compatible() */
+ static const char *OLD_FILENAME[] = {
+     "filespace_1_6.h5", /* 1.6 HDF5 file */
+@@ -2411,7 +2414,9 @@ test_file_getname(void)
+     hsize_t dims[TESTA_RANK] = {TESTA_NX, TESTA_NY};
+     char    name[TESTA_NAME_BUF_SIZE];
+     ssize_t name_len;
+-    herr_t  ret; /* Generic return value */
++    char    non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char   *buf_ptr;          /* To pass mid-string */
++    herr_t  ret;              /* Generic return value */
+ 
+     /* Output message about test being performed */
+     MESSAGE(5, ("Testing H5Fget_name() functionality\n"));
+@@ -2426,6 +2431,15 @@ test_file_getname(void)
+     VERIFY_STR(name, FILE1, "H5Fget_name");
+     VERIFY(name_len, strlen(FILE1), "H5Fget_name");
+ 
++    /* Verify that passing a non-null buffer with size 0 still returns the correct name
++       size and the buffer is not modified */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr  = &non_null_buf[4];
++    name_len = H5Fget_name(file_id, buf_ptr, 0);
++    CHECK(name_len, FAIL, "H5Fget_name");
++    VERIFY(name_len, strlen(FILE1), "H5Fget_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Fget_name");
++
+     /* Create a group in the root group */
+     group_id = H5Gcreate2(file_id, TESTA_GROUPNAME, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
+     CHECK(group_id, FAIL, "H5Gcreate2");
+diff --git a/test/titerate.c b/test/titerate.c
+index 7efae3472..595a577d8 100644
+--- a/test/titerate.c
++++ b/test/titerate.c
+@@ -39,6 +39,9 @@
+ #define SPACE1_RANK 1
+ #define SPACE1_DIM1 4
+ 
++/* Used by test_reference_obj() and test_reference_attr() */
++#define NON_NULL_BUF "NON_NULL_BUF"
++
+ typedef enum { RET_ZERO, RET_TWO, RET_CHANGE, RET_CHANGE2 } iter_enum;
+ 
+ /* Custom group iteration callback data */
+@@ -894,7 +897,9 @@ test_grp_memb_funcs(hid_t fapl)
+     VERIFY(ginfo.nlinks, (NDATASETS + 2), "H5Gget_info");
+ 
+     for (i = 0; i < (int)ginfo.nlinks; i++) {
+-        H5O_info2_t oinfo; /* Object info */
++        H5O_info2_t oinfo;            /* Object info */
++        char        non_null_buf[80]; /* Buffer to test non-null buffer calls */
++        char       *buf_ptr;          /* To pass mid-string */
+ 
+         /* Test with NULL for name, to query length */
+         name_len = H5Lget_name_by_idx(root_group, ".", H5_INDEX_NAME, H5_ITER_INC, (hsize_t)i, NULL,
+@@ -908,6 +913,15 @@ test_grp_memb_funcs(hid_t fapl)
+         /* Double-check that the length is the same */
+         VERIFY(ret, name_len, "H5Lget_name_by_idx");
+ 
++        /* Test with non-null buffer for name and 0 for size */
++        strcpy(non_null_buf, NON_NULL_BUF);
++        buf_ptr = &non_null_buf[4];
++        ret = (herr_t)H5Lget_name_by_idx(root_group, ".", H5_INDEX_NAME, H5_ITER_INC, (hsize_t)i, buf_ptr, 0,
++                                         H5P_DEFAULT);
++        CHECK(ret, FAIL, "H5Lget_name_by_idx");
++        VERIFY(ret, name_len, "H5Lget_name_by_idx");
++        VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Lget_name_by_idx");
++
+         /* Keep a copy of the dataset names around for later */
+         obj_names[i] = strdup(dataset_name);
+         CHECK_PTR(obj_names[i], "strdup");
+diff --git a/test/trefer.c b/test/trefer.c
+index cd6bf2ca1..4df923fd8 100644
+--- a/test/trefer.c
++++ b/test/trefer.c
+@@ -88,6 +88,9 @@ typedef struct s2_t {
+ #define MAX_ITER_WRITE  MAX_ITER_CREATE
+ #define MAX_ITER_READ   MAX_ITER_CREATE
+ 
++/* Used by test_reference_obj() and test_reference_attr() */
++#define NON_NULL_BUF "NON_NULL_BUF"
++
+ /****************************************************************
+ **
+ **  test_reference_params(): Test basic H5R (reference) parameters
+@@ -458,11 +461,13 @@ test_reference_obj(void)
+         *rbuf;          /* buffer read from disk            */
+     H5R_ref_t *wbuf_cp; /* copy buffer                      */
+     unsigned  *ibuf, *obuf;
+-    unsigned   i, j;     /* Counters                         */
+-    ssize_t    namelen;  /* String buffer size return value  */
+-    char      *namebuf;  /* Buffer for attribute's or dataset's name */
+-    H5O_type_t obj_type; /* Object type                      */
+-    herr_t     ret;      /* Generic return value             */
++    unsigned   i, j;             /* Counters                                 */
++    ssize_t    namelen;          /* String buffer size return value          */
++    char      *namebuf;          /* Buffer for attribute's or dataset's name */
++    H5O_type_t obj_type;         /* Object type                              */
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
++    herr_t     ret;              /* Generic return value                     */
+ 
+     /* Output message about test being performed */
+     MESSAGE(5, ("Testing Object Reference Functions\n"));
+@@ -626,17 +631,31 @@ test_reference_obj(void)
+     CHECK(namelen, FAIL, "H5Rget_file_name");
+     VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
+ 
++    /* Test passing in non-null buffer with buffer size is zero */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    namelen = H5Rget_file_name(&rbuf[0], buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_file_name");
++    VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_file_name");
++
+     /* Get the file name for the reference */
+     namebuf = (char *)malloc((size_t)namelen + 1);
+     namelen = H5Rget_file_name(&rbuf[0], namebuf, (size_t)namelen + 1);
+     CHECK(namelen, FAIL, "H5Rget_file_name");
+     VERIFY(strcmp(namebuf, FILE_REF_OBJ), 0, "namebuf vs FILE_REF_OBJ");
+     VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
+-
+     free(namebuf);
+ 
+     /* Testing Dataset1 */
+ 
++    /* Test passing in non-null buffer with buffer size is zero */
++    buf_ptr = &non_null_buf[8];
++    namelen = H5Rget_obj_name(&rbuf[0], H5P_DEFAULT, buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_obj_name");
++    VERIFY(namelen, strlen(DS1_REF_OBJ), "H5Rget_obj_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_obj_name");
++
+     /* Getting the name of the referenced object and verify it */
+     namelen = H5Rget_obj_name(&rbuf[0], H5P_DEFAULT, NULL, 0);
+     CHECK(namelen, FAIL, "H5Rget_obj_name");
+@@ -2479,6 +2498,8 @@ test_reference_attr(void)
+     char      *attr_name = NULL; /* name of attribute, from H5A */
+     ssize_t    attr_name_size;   /* size of attribute name */
+     H5O_type_t obj_type;         /* Object type */
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
+     herr_t     ret;              /* Generic return value */
+ 
+     /* Output message about test being performed */
+@@ -2649,10 +2670,18 @@ test_reference_attr(void)
+ 
+     /* Testing "Attr1" */
+ 
++    /* Test passing in non-null buffer with buffer size is zero */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    namelen = H5Rget_attr_name(&ref_rbuf[0], buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_attr_name");
++    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_attr_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_attr_name");
++
+     /* Getting the name of the referenced attribute and verify it */
+     namelen = H5Rget_attr_name(&ref_rbuf[0], NULL, 0);
+     CHECK(namelen, FAIL, "H5Rget_attr_name");
+-    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_obj_name");
++    VERIFY(namelen, strlen(ATTR1_REF_OBJ), "H5Rget_attr_name");
+ 
+     namebuf = (char *)malloc((size_t)namelen + 1);
+     namelen = H5Rget_attr_name(&ref_rbuf[0], namebuf, (size_t)namelen + 1);
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 350be8dc0e..b28d1e0faf 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -16,6 +16,7 @@ DEPENDS += "qemu-native zlib"
 SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
+           file://CVE-2026-26199.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
-- 
2.35.6

