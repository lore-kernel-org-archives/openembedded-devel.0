Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD72E98FC2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126138.1775715549879275241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=haoBDIKM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394hjMf267603
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Apr 2026 23:19:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=O+Wzmce37w6AKQgYXRbD1Ag6dk9X1K/obxO//Op7vwc=; b=haoBDIKMa4Fq
	vDfOaLZtMoGaEDgzsaw+JY6uNcmOulBtAS+A39xNbiZKNdGPQnlabkM+Rz/Hjb2+
	Kvf4gUGMXR/gcwVBWiRUXADi411Qhoc7119LH88bGn9cVBtzyirtVI2IlQR7VX2t
	vMk7R/Z9coJ+agy+izqMqZJTiSK9/M23aFhDpM5UdUCs5pW/Fho+dvBM/FabwbYn
	TZFdttpnOVp/ffEoAxSDCwLGYzfrKaheGjTVCyV73A1LTMtkE8ExIwKX9odz2foq
	huVASKbD0MyLp5w1rlaCvDGP5odOgVux1U8F94ppiQrQv0sq0i79FC7VszRPU2WY
	HRKxuj8Jdw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmkpqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 23:19:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:08 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:08 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 03/11] hdf5: fix CVE-2025-6857
Date: Thu, 9 Apr 2026 14:18:56 +0800
Message-ID: <20260409061904.1694992-4-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QxvfN94qPdojBwX_t4lcvyl2SL6s1dsb
X-Proofpoint-GUID: QxvfN94qPdojBwX_t4lcvyl2SL6s1dsb
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d744dd cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=fM0o_JtyA1Roca-_o2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX4eY0s9ol2aZh
 wa8h7aCcJ+7/6V64AveCAEY3MkA/RjQmVqt9boqC7l8avU+4GXImO4tQYvevq7MA8gNbuFPq7Jd
 O3P+OvE+1Jq7Ktdh4zSSzNa4NbTCBw1616EELOAiYj5S+PYD0uf+5P4tdlazSDVKMQKz2B4PCl8
 pGQmiZgBpHLlELr3uqoL4/gF329KJ49XRkk1B9Y5IMx94i0jGtDTzd9ou/yyFbdVnOZotMsbVkl
 GAdr1mBJPDS36bVaziB/acGYFoHDxmcm1WbGPESk6wU8qBOP/FQoug5OYr3I3ZLx/hzxGE7uXyC
 tCnaSx84PeLYpKQ4hsp6//97oVLCfd3VjbZHxigdEwmvtIC1DfE4NdSe/Rs7ScrSnE29f2PKkc7
 2DWxp9cEFhiMewKqMrMyv8PhnIJ6CW+pZrW+JAsOF+LE5XQvAkZcIAsBcETQJcSzgly1y3hn8ZA
 H6dgd4oWUbbvTLGNcaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126113

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability has been found in HDF5 1.14.6 and
classified as problematic. Affected by this vulnerability is the function
H5G__node_cmp3 of the file src/H5Gnode.c. The manipulation leads to
stack-based buffer overflow. It is possible to launch the attack on the
local host. The exploit has been disclosed to the public and may be used.

Backport patch [2] from upstream to fix CVE-2025-6857

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6857
[2] https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-6857.patch            | 248 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
new file mode 100644
index 0000000000..8b40d0e946
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
@@ -0,0 +1,248 @@
+From eb3af284cc0ac8c758c65f492fc693ed50539592 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Thu, 29 Jan 2026 13:59:39 +0800
+Subject: [PATCH] Fix CVE-2025-6857
+
+Add additional checks for v1 B-tree corruption
+
+An HDF5 file had a corrupted v1 B-tree that would result in a stack overflow when performing a lookup on it. This has been fixed with additional integrity checks.
+
+CVE: CVE-2025-6857
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5B.c    | 92 +++++++++++++++++++++++++++++++++++++++++++---------
+ src/H5Bpkg.h |  6 ++++
+ 2 files changed, 83 insertions(+), 15 deletions(-)
+
+diff --git a/src/H5B.c b/src/H5B.c
+index 5a7a238..4efa679 100644
+--- a/src/H5B.c
++++ b/src/H5B.c
+@@ -140,6 +140,8 @@ typedef struct H5B_ins_ud_t {
+ /********************/
+ /* Local Prototypes */
+ /********************/
++static herr_t    H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found,
++                                 void *udata);
+ static H5B_ins_t H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8_t *lt_key,
+                                     bool *lt_key_changed, uint8_t *md_key, void *udata, uint8_t *rt_key,
+                                     bool *rt_key_changed, H5B_ins_ud_t *split_bt_ud /*out*/);
+@@ -252,26 +254,67 @@ done:
+ } /* end H5B_create() */
+ 
+ /*-------------------------------------------------------------------------
+- * Function:	H5B_find
++ * Function:    H5B_find
+  *
+- * Purpose:	Locate the specified information in a B-tree and return
+- *		that information by filling in fields of the caller-supplied
+- *		UDATA pointer depending on the type of leaf node
+- *		requested.  The UDATA can point to additional data passed
+- *		to the key comparison function.
++ * Purpose:     Locate the specified information in a B-tree and return
++ *              that information by filling in fields of the
++ *              caller-supplied UDATA pointer depending on the type of leaf
++ *              node requested.  The UDATA can point to additional data
++ *              passed to the key comparison function.
+  *
+- * Note:	This function does not follow the left/right sibling
+- *		pointers since it assumes that all nodes can be reached
+- *		from the parent node.
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
+  *
+- * Return:	Non-negative (true/false) on success (if found, values returned
+- *              through the UDATA argument). Negative on failure (if not found,
+- *              UDATA is undefined).
++ * Return:      Non-negative (true/false) on success (if found, values
++ *              returned through the UDATA argument). Negative on failure
++ *              (if not found, UDATA is undefined).
+  *
+  *-------------------------------------------------------------------------
+  */
+ herr_t
+ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *udata)
++{
++    herr_t ret_value = SUCCEED;
++
++    FUNC_ENTER_NOAPI(FAIL)
++
++    /*
++     * Check arguments.
++     */
++    assert(f);
++    assert(type);
++    assert(type->decode);
++    assert(type->cmp3);
++    assert(type->found);
++    assert(H5_addr_defined(addr));
++
++    if ((ret_value = H5B_find_helper(f, type, addr, H5B_UNKNOWN_NODELEVEL, found, udata)) < 0)
++        HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key");
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
++} /* end H5B_find() */
++
++/*-------------------------------------------------------------------------
++ * Function:    H5B_find_helper
++ *
++ * Purpose:     Recursive helper routine for H5B_find used to track node
++ *              levels and attempt to detect B-tree corruption during
++ *              lookups.
++ *
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
++ *
++ * Return:      Non-negative on success (if found, values returned through
++ *              the UDATA argument). Negative on failure (if not found,
++ *              UDATA is undefined).
++ *
++ *-------------------------------------------------------------------------
++ */
++static herr_t
++H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found, void *udata)
+ {
+     H5B_t         *bt = NULL;
+     H5UC_t        *rc_shared;           /* Ref-counted shared info */
+@@ -281,7 +324,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     int            cmp       = 1;       /* Key comparison value */
+     herr_t         ret_value = SUCCEED; /* Return value */
+ 
+-    FUNC_ENTER_NOAPI(FAIL)
++    FUNC_ENTER_NOAPI_NOINIT
+ 
+     /*
+      * Check arguments.
+@@ -306,6 +349,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = exp_level;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -329,7 +373,17 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+         assert(idx < bt->nchildren);
+ 
+         if (bt->level > 0) {
+-            if ((ret_value = H5B_find(f, type, bt->child[idx], found, udata)) < 0)
++            /* Sanity check to catch the case where the current node points to
++             * itself and the current node was loaded with an expected node level
++             * of H5B_UNKNOWN_NODELEVEL, thus bypassing the expected node level
++             * check during deserialization and in the future if the node was
++             * cached.
++             */
++            if (bt->child[idx] == addr)
++                HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, FAIL, "cyclic B-tree detected");
++
++            if ((ret_value = H5B_find_helper(f, type, bt->child[idx], (int)(bt->level - 1), found, udata)) <
++                0)
+                 HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key in subtree");
+         } /* end if */
+         else {
+@@ -343,7 +397,7 @@ done:
+         HDONE_ERROR(H5E_BTREE, H5E_CANTUNPROTECT, FAIL, "unable to release node");
+ 
+     FUNC_LEAVE_NOAPI(ret_value)
+-} /* end H5B_find() */
++} /* end H5B_find_helper() */
+ 
+ /*-------------------------------------------------------------------------
+  * Function:	H5B__split
+@@ -425,6 +479,7 @@ H5B__split(H5F_t *f, H5B_ins_ud_t *bt_ud, unsigned idx, void *udata, H5B_ins_ud_
+     cache_udata.f         = f;
+     cache_udata.type      = shared->type;
+     cache_udata.rc_shared = bt_ud->bt->rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (split_bt_ud->bt =
+                      (H5B_t *)H5AC_protect(f, H5AC_BT, split_bt_ud->addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree");
+@@ -532,6 +587,7 @@ H5B_insert(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     bt_ud.addr            = addr;
+     if (NULL == (bt_ud.bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to locate root of B-tree");
+@@ -789,6 +845,7 @@ H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+ 
+     if (0 == bt->nchildren) {
+         /*
+@@ -1077,6 +1134,7 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, H5B_operato
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable to load B-tree node");
+ 
+@@ -1190,6 +1248,7 @@ H5B__remove_helper(H5F_t *f, haddr_t addr, const H5B_class_t *type, int level, u
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5B_INS_ERROR, "unable to load B-tree node");
+ 
+@@ -1542,6 +1601,7 @@ H5B_delete(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1782,6 +1842,7 @@ H5B__get_info_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, const H5B_
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1923,6 +1984,7 @@ H5B_valid(H5F_t *f, const H5B_class_t *type, haddr_t addr)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree node");
+ 
+diff --git a/src/H5Bpkg.h b/src/H5Bpkg.h
+index d1ad647..f75e857 100644
+--- a/src/H5Bpkg.h
++++ b/src/H5Bpkg.h
+@@ -39,6 +39,11 @@
+ /* # of bits for node level: 1 byte */
+ #define LEVEL_BITS 8
+ 
++/* Indicates that the level of the current node is unknown.  When the level
++ * is known, it can be used to detect corrupted level during decoding
++ */
++#define H5B_UNKNOWN_NODELEVEL -1
++
+ /****************************/
+ /* Package Private Typedefs */
+ /****************************/
+@@ -60,6 +65,7 @@ typedef struct H5B_t {
+ typedef struct H5B_cache_ud_t {
+     H5F_t                    *f;         /* File that B-tree node is within */
+     const struct H5B_class_t *type;      /* Type of tree */
++    int                       exp_level; /* Expected level of the current node */
+     H5UC_t                   *rc_shared; /* Ref-counted shared info */
+ } H5B_cache_ud_t;
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index e8432f0d6b..1b9f0fcfa8 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch \
     file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
     file://CVE-2025-2926.patch \
+    file://CVE-2025-6857.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


