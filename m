Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B082C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 15:21:23 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15279.1786720877070345524
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 08:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dl+Bn8LS;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=30867; q=dns/txt;
  s=iport01; t=1786720877; x=1787930477;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CJVmtec56EFkkiDZc0ql9Q2MU1+74iUJgjd3aYcOzWs=;
  b=dl+Bn8LSp+nrICrEvBV+zNhtsDq4YiQeM0/BhRPXJ2hRBXk+NiYLo4B4
   VyNO0Em0hn16tRv63jiUZY0EERmVt8VnZssfDuuoj9j/8UrSN2q+YnZ9J
   Va3NbZDsBCgFInfeAe1eDbNgxaPtsJjy27x6ZrHOY/WBiAY7s8NQJpuWI
   AbF2VRDA1yJumg9gE4z9yO/ivAFy5V5gpc0EcLaGC+X/MTaqvQKOa9tLU
   8PPD5Tih2xlfRNBOnOs9YZXVB/qAB9Ub0bOFGamY9ny8gI3Prfyf0p+nj
   rXuVrRG+0CizH4AzhYpgH6+oUXwQe/8bDy4qEkQLKxSugA8sw15+Im7K1
   w==;
X-CSE-ConnectionGUID: DNyMtRsrQTiwKT7mEMS9Fw==
X-CSE-MsgGUID: T+o6I0D/SS6L+XexG4s7SQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgADMX9q/5MQJK1aHgEBCxIMggULgld0XkNJA5ZHg?=
 =?us-ascii?q?RadCIF+DwEBAQ9EDQQBAYUFAo1pAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEdGAEYAS0sAwECWiMhgwIBgnQDEcMkgiyBA?=
 =?us-ascii?q?YMJHwGBVNswAQsUAQWBM4U/iCFdGAGEfCcbG4FygRWCc3aBBYFcAoglBIIie?=
 =?us-ascii?q?hKBWoEvkA9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEoh?=
 =?us-ascii?q?DcjGTZ6gQlegSsqYQESF4EJghICgnOCBgIBSQwLGA1IESw3FBkEPm4Hjhogg?=
 =?us-ascii?q?kAGAQEwQwcJCgElBhcJMC8GDA8jQQsdEQ0EGBSSaQEHkBaCIaEPCiiDdowhl?=
 =?us-ascii?q?ToaM4QEgVeCG5AliyGHMAuYfYJZizGVaGiEaYFoPIFZcBU7gmcJShkPjioDC?=
 =?us-ascii?q?wuDYIQHyDInMgIJAy8BAQcCBw4DC4FokR5gAQE?=
IronPort-Data: A9a23:Z9zilK06f+P4BvK80PbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzAEx
 2FKW23UP/mNMzbzKt0nb463pBlUuJLVy4cxHAVs3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIGcnGJEi4fxOPWBR1
 sBHLR0oVUGtmLfjqF67YrEEasULJc3vOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEuojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOG2bIKIIY3bLSlTtnrbo
 Tznp0i+OSpEEJ+vxCqqrmnzvdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:QNF1C6pQIMhxHu6a+dx9iRoaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3Ab3XJGGgd3IH679hoy3AomzjlWjJuXlvM6WvqOFW?=
 =?us-ascii?q?BNWd2a4HKTHK1w/JKjJ87?=
X-Talos-MUID: 9a23:rn+fvwoHrelKftp3Cl4ezw0hM5lJu4jpM3tTtdY2ttmraTcvAA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,222,1779148800"; 
   d="scan'208";a="813405399"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Aug 2026 15:21:15 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 917661800014D;
	Fri, 14 Aug 2026 15:21:15 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 3145FCC12A6; Fri, 14 Aug 2026 08:21:15 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 1/2] hdf5: Fix CVE-2026-26199
Date: Fri, 14 Aug 2026 08:21:14 -0700
Message-Id: <20260814152115.3812730-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129053

From: Devansh Patel <devanshp@cisco.com>

This patch backports the upstream fix first released in HDF5 2.1.0.
The upstream fix commit is referenced in [1], and the public advisory
is referenced in [2].

[1] https://github.com/HDFGroup/hdf5/commit/9268b803b742f99c1f8793cae74f19e74976b065
[2] https://github.com/HDFGroup/hdf5/security/advisories/GHSA-5c6x-jmgf-f5vc

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../hdf5/files/CVE-2026-26199.patch           | 675 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 676 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
new file mode 100644
index 000000000..dea76a4de
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
@@ -0,0 +1,675 @@
+From e501750498ab0d5d119f63f34b28e396c70ea1c1 Mon Sep 17 00:00:00 2001
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
+- Omitted release_docs/CHANGELOG.md because the file does not exist in
+  HDF5 1.14.4-3 and its HDF5 2.1.0 release context is not applicable.
+- Adapted test/links.c to the HDF5 1.14.4-3 test_deprec() layout,
+  where the later len and status declarations reformatted upstream are
+  absent; the zero-size regression case is retained.
+- Adapted test/trefer.c to the HDF5 1.14.4-3 test layout. The zero-size
+  regression cases are retained with the existing literal object and
+  attribute names because the later DS1_REF_OBJ and ATTR1_REF_OBJ test
+  constants are absent.
+- Preserved the HDF5 1.14.4-3 H5Rget_attr_name convention of returning
+  the required buffer size, including the null terminator. The upstream
+  base includes a separate, later API behavior change that is not needed
+  to prevent this underflow.
+
+(cherry picked from commit 9268b803b742f99c1f8793cae74f19e74976b065)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ src/H5A.c       | 11 ++++++++-
+ src/H5F.c       | 32 ++++++++++++++++++--------
+ src/H5Gdeprec.c | 32 +++++++++++++++++---------
+ src/H5I.c       | 32 ++++++++++++++++++--------
+ src/H5L.c       |  4 ++++
+ src/H5R.c       | 61 +++++++++++++++++++++++++++++++++++++++++++++++--
+ src/H5Rdeprec.c | 22 ++++++++++++++++--
+ test/links.c    | 17 ++++++++++++++
+ test/tattr.c    | 25 ++++++++++++++++++--
+ test/tfile.c    | 16 ++++++++++++-
+ test/titerate.c | 16 ++++++++++++-
+ test/trefer.c   | 44 ++++++++++++++++++++++++++++++-----
+ 12 files changed, 266 insertions(+), 46 deletions(-)
+
+diff --git a/src/H5A.c b/src/H5A.c
+index 6728596ab..7e2ee2b6e 100644
+--- a/src/H5A.c
++++ b/src/H5A.c
+@@ -1242,7 +1242,8 @@ done:
+     Up to 'buf_size' characters are stored in 'buf' followed by a '\0' string
+     terminator.  If the name of the attribute is longer than 'buf_size'-1,
+     the string terminator is stored in the last position of the buffer to
+-    properly terminate the string.
++    properly terminate the string.  If 'buf' is non-NULL but 'buf_size' is 0,
++    treat the call as length being queried.
+ --------------------------------------------------------------------------*/
+ ssize_t
+ H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
+@@ -1255,6 +1256,10 @@ H5Aget_name(hid_t attr_id, size_t buf_size, char *buf /*out*/)
+     FUNC_ENTER_API((-1))
+     H5TRACE3("Zs", "iz*s", attr_id, buf_size, buf);
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (buf && buf_size == 0)
++        buf = NULL;
++
+     /* check arguments */
+     if (NULL == (vol_obj = (H5VL_object_t *)H5I_object_verify(attr_id, H5I_ATTR)))
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, (-1), "not an attribute");
+@@ -1306,6 +1311,10 @@ H5Aget_name_by_idx(hid_t loc_id, const char *obj_name, H5_index_t idx_type, H5_i
+     FUNC_ENTER_API(FAIL)
+     H5TRACE8("Zs", "i*sIiIoh*szi", loc_id, obj_name, idx_type, order, n, name, size, lapl_id);
+ 
++    /* If buffer size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check args */
+     if (H5I_ATTR == H5I_get_type(loc_id))
+         HGOTO_ERROR(H5E_ARGS, H5E_BADTYPE, FAIL, "location is not valid for an attribute");
+diff --git a/src/H5F.c b/src/H5F.c
+index ee4fd71af..e58cc086c 100644
+--- a/src/H5F.c
++++ b/src/H5F.c
+@@ -2007,19 +2007,27 @@ done:
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
+@@ -2034,6 +2042,10 @@ H5Fget_name(hid_t obj_id, char *name /*out*/, size_t size)
+     FUNC_ENTER_API((-1))
+     H5TRACE3("Zs", "i*sz", obj_id, name, size);
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check the type */
+     type = H5I_get_type(obj_id);
+     if (H5I_FILE != type && H5I_GROUP != type && H5I_DATATYPE != type && H5I_DATASET != type &&
+diff --git a/src/H5Gdeprec.c b/src/H5Gdeprec.c
+index 19493ace0..3d42a9508 100644
+--- a/src/H5Gdeprec.c
++++ b/src/H5Gdeprec.c
+@@ -1121,20 +1121,26 @@ done:
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
+@@ -1149,6 +1155,10 @@ H5Gget_objname_by_idx(hid_t loc_id, hsize_t idx, char *name /*out*/, size_t size
+     FUNC_ENTER_API(FAIL)
+     H5TRACE4("Zs", "ih*sz", loc_id, idx, name, size);
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Set up collective metadata if appropriate */
+     if (H5CX_set_loc(loc_id) < 0)
+         HGOTO_ERROR(H5E_SYM, H5E_CANTSET, (-1), "can't set collective metadata read info");
+diff --git a/src/H5I.c b/src/H5I.c
+index a5d3b39f1..30bb9bb73 100644
+--- a/src/H5I.c
++++ b/src/H5I.c
+@@ -882,19 +882,27 @@ done:
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
+@@ -910,6 +918,10 @@ H5Iget_name(hid_t id, char *name /*out*/, size_t size)
+     FUNC_ENTER_API((-1))
+     H5TRACE3("Zs", "i*sz", id, name, size);
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Get the object pointer */
+     if (NULL == (vol_obj = H5VL_vol_object(id)))
+         HGOTO_ERROR(H5E_ID, H5E_BADTYPE, (-1), "invalid identifier");
+diff --git a/src/H5L.c b/src/H5L.c
+index 49fe1ac4f..7371da213 100644
+--- a/src/H5L.c
++++ b/src/H5L.c
+@@ -1517,6 +1517,10 @@ H5Lget_name_by_idx(hid_t loc_id, const char *group_name, H5_index_t idx_type, H5
+     FUNC_ENTER_API((-1))
+     H5TRACE8("Zs", "i*sIiIoh*szi", loc_id, group_name, idx_type, order, n, name, size, lapl_id);
+ 
++    /* If name size is zero, treat as length query and do not write, even a '\0' */
++    if (name && size == 0)
++        name = NULL;
++
+     /* Check arguments */
+     if (!group_name || !*group_name)
+         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, (-1), "no name specified");
+diff --git a/src/H5R.c b/src/H5R.c
+index 3a91b926a..5d361e91f 100644
+--- a/src/H5R.c
++++ b/src/H5R.c
+@@ -1027,8 +1027,23 @@ done:
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
+  *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
++ * Return:      Success:    The length of the name (excluding null terminator)
++ *              Failure:    Negative
+  *-------------------------------------------------------------------------
+  */
+ ssize_t
+@@ -1047,6 +1062,10 @@ H5Rget_file_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
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
+@@ -1088,6 +1107,21 @@ done:
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
+@@ -1115,6 +1149,10 @@ H5Rget_obj_name(H5R_ref_t *ref_ptr, hid_t rapl_id, char *buf /*out*/, size_t siz
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
+@@ -1156,7 +1194,22 @@ done:
+  *
+  * Purpose:     Given a reference to some attribute, determine its name.
+  *
+- * Return:      Non-negative length of the path on success / -1 on failure
++ * Description:
++ *              When 'buf' is non-NULL:
++ *                - if 'size' > 0: writes up to 'size' bytes into the buffer
++ *                  (including null terminator) and returns the required buffer
++ *                  size (including null terminator).
++ *                - if 'size' == 0: treats the call as length query, does not
++ *                  write anything to the buffer (not even a null terminator), and
++ *                  returns the required buffer size (including null terminator).
++ *
++ *              When 'buf' is NULL: does not write anything regardless of 'size'
++ *              and returns the required buffer size (including null terminator).
++ *
++ *              On error, the buffer is unchanged and the function returns
++ *              a negative value.
++ *
++ * Return:      Required buffer size on success / -1 on failure
+  *
+  *-------------------------------------------------------------------------
+  */
+@@ -1174,6 +1227,10 @@ H5Rget_attr_name(const H5R_ref_t *ref_ptr, char *buf /*out*/, size_t size)
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
+index 90869cf3a..41cecdcad 100644
+--- a/src/H5Rdeprec.c
++++ b/src/H5Rdeprec.c
+@@ -747,9 +747,23 @@ done:
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
+@@ -773,6 +787,10 @@ H5Rget_name(hid_t id, H5R_type_t ref_type, const void *ref, char *name /*out*/,
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
+index 4ea612ebd..85e9225ac 100644
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
+@@ -1949,6 +1952,9 @@ test_deprec(hid_t fapl, bool new_format)
+     hsize_t    num_objs; /* Number of objects in a group */
+     char       filename[1024];
+     char       tmpstr[1024];
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
++    ssize_t    name_len;         /* Length of name */
+ 
+     if (new_format)
+         TESTING("backwards compatibility (w/new group format)");
+@@ -1997,6 +2003,17 @@ test_deprec(hid_t fapl, bool new_format)
+     }
+     H5E_END_TRY
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
+index d38fdaabc..30a436465 100644
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
+@@ -6512,10 +6513,13 @@ test_attr_rename_invalid_name(hid_t fcpl, hid_t fapl)
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
+@@ -6525,6 +6529,9 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
+     hid_t   fid;
+     hid_t   attr;
+     hid_t   sid;
++    char    non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char   *buf_ptr;          /* To pass mid-string */
++    ssize_t namelen;          /* Length of attribute name */
+ 
+     /* Create dataspace for attribute */
+     sid = H5Screate(H5S_SCALAR);
+@@ -6555,6 +6562,20 @@ test_attr_get_name_invalid_buf(hid_t fcpl, hid_t fapl)
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
+index 028de9a3e..f4abe35b8 100644
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
+@@ -2425,6 +2430,15 @@ test_file_getname(void)
+     CHECK(name_len, FAIL, "H5Fget_name");
+     VERIFY_STR(name, FILE1, "H5Fget_name");
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
+index 3c0b82e68..fd3b55783 100644
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
+@@ -872,7 +875,9 @@ test_grp_memb_funcs(hid_t fapl)
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
+@@ -886,6 +891,15 @@ test_grp_memb_funcs(hid_t fapl)
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
+index fc0d89420..f5503b9a1 100644
+--- a/test/trefer.c
++++ b/test/trefer.c
+@@ -76,6 +76,9 @@ typedef struct s2_t {
+ #define MAX_ITER_WRITE  MAX_ITER_CREATE
+ #define MAX_ITER_READ   MAX_ITER_CREATE
+ 
++/* Used by test_reference_obj() and test_reference_attr() */
++#define NON_NULL_BUF "NON_NULL_BUF"
++
+ /****************************************************************
+ **
+ **  test_reference_params(): Test basic H5R (reference) parameters
+@@ -441,9 +444,12 @@ test_reference_obj(void)
+     H5R_ref_t *wbuf,    /* buffer to write to disk          */
+         *rbuf;          /* buffer read from disk            */
+     unsigned  *ibuf, *obuf;
+-    unsigned   i, j;     /* Counters                         */
+-    H5O_type_t obj_type; /* Object type                      */
+-    herr_t     ret;      /* Generic return value             */
++    unsigned   i, j;             /* Counters                         */
++    ssize_t    namelen;          /* String buffer size return value  */
++    H5O_type_t obj_type;         /* Object type                      */
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
++    herr_t     ret;              /* Generic return value             */
+ 
+     /* Output message about test being performed */
+     MESSAGE(5, ("Testing Object Reference Functions\n"));
+@@ -579,6 +585,21 @@ test_reference_obj(void)
+     ret = H5Dread(dataset, H5T_STD_REF, H5S_ALL, H5S_ALL, H5P_DEFAULT, rbuf);
+     CHECK(ret, FAIL, "H5Dread");
+ 
++    /* Test passing in non-null buffer with buffer size is zero */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    namelen = H5Rget_file_name(&rbuf[0], buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_file_name");
++    VERIFY(namelen, strlen(FILE_REF_OBJ), "H5Rget_file_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_file_name");
++
++    /* Test passing in non-null buffer with buffer size is zero */
++    buf_ptr = &non_null_buf[8];
++    namelen = H5Rget_obj_name(&rbuf[0], H5P_DEFAULT, buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_obj_name");
++    VERIFY(namelen, strlen("/Group1/Dataset1"), "H5Rget_obj_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_obj_name");
++
+     /* Open dataset object */
+     dset2 = H5Ropen_object(&rbuf[0], H5P_DEFAULT, dapl_id);
+     CHECK(dset2, H5I_INVALID_HID, "H5Ropen_object");
+@@ -2312,9 +2333,12 @@ test_reference_attr(void)
+     H5R_ref_t ref_wbuf[SPACE1_DIM1], /* Buffer to write to disk */
+         ref_rbuf[SPACE1_DIM1];       /* Buffer read from disk */
+     unsigned   wbuf[SPACE1_DIM1], rbuf[SPACE1_DIM1];
+-    unsigned   i;        /* Local index variables */
+-    H5O_type_t obj_type; /* Object type */
+-    herr_t     ret;      /* Generic return value */
++    unsigned   i;                /* Local index variables */
++    ssize_t    namelen;          /* String buffer size return value  */
++    H5O_type_t obj_type;         /* Object type */
++    char       non_null_buf[80]; /* Buffer to test non-null buffer calls */
++    char      *buf_ptr;          /* To pass mid-string */
++    herr_t     ret;              /* Generic return value */
+ 
+     /* Output message about test being performed */
+     MESSAGE(5, ("Testing Attribute Reference Functions\n"));
+@@ -2482,6 +2506,14 @@ test_reference_attr(void)
+     ret = H5Dread(dataset, H5T_STD_REF, H5S_ALL, H5S_ALL, H5P_DEFAULT, ref_rbuf);
+     CHECK(ret, FAIL, "H5Dread");
+ 
++    /* Test passing in non-null buffer with buffer size is zero */
++    strcpy(non_null_buf, NON_NULL_BUF);
++    buf_ptr = &non_null_buf[4];
++    namelen = H5Rget_attr_name(&ref_rbuf[0], buf_ptr, 0);
++    CHECK(namelen, FAIL, "H5Rget_attr_name");
++    VERIFY(namelen, strlen("Attr1") + 1, "H5Rget_attr_name");
++    VERIFY(strcmp(non_null_buf, NON_NULL_BUF), 0, "H5Rget_attr_name");
++
+     /* Open attribute on dataset object */
+     attr = H5Ropen_attr(&ref_rbuf[0], H5P_DEFAULT, H5P_DEFAULT);
+     CHECK(attr, H5I_INVALID_HID, "H5Ropen_attr");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 816bd752a..80ab17dd2 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2025-2309.patch \
     file://CVE-2025-2308.patch \
     file://CVE-2025-6857.patch \
+    file://CVE-2026-26199.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6

