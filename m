Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CEBCCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:21:26 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15076.1792128079811246893
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y/HJG9YP;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14200; q=dns/txt;
  s=iport01; t=1792128079; x=1793337679;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hZjdWomV2zTtmFg9BG3HqpMb/Zu9Y7prTW3cFWhNTKE=;
  b=Y/HJG9YP457MeOnlKv6hCDSeWYqSpERHNhuARDKzdLOfRWhVsecTPpDy
   B70gE6pD+aCVy7G1+XTdfJAMbi/owMSrwO3LJD/QFY8n7ntQlTafDt02W
   UXeaVKbZg1/u8uC4m2vEXh7kP4dNjF6kWXisiViwoSPJwuROL6nCeBq06
   INdjNJaXYkawlrjSWqMPZ/64PRKi7JiCV4KkL2S36FBCfyNKIlD7NL79l
   gecrme6JgUguCnlZhECyROJl55JDd8FXRO07DngaD9EcxYGgH//QQzm8h
   SxMY2RokTR7oSyVog7pQgRclAhF4+o/KQbCBjTjk+hPSlzJ8Rgiaebmlf
   g==;
X-CSE-ConnectionGUID: RAfs5nbATfyAAKL57gzD+Q==
X-CSE-MsgGUID: o8EzmEoiSLWnIIK0D9O4rw==
X-IPAS-Result: =?us-ascii?q?A0BcAgAKs9Fq/5H/Ja1aglmCV3VgQ0mUKYIhA4ETgWuIZ?=
 =?us-ascii?q?5I3gX4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJyQBPRwDAQIvKxkKCBmDAgGCOgM3AxG8L?=
 =?us-ascii?q?hs3gXkzgQGDKQE/AkNQ2UqBaAELFAGBOIVAiCNdGAGCAoJ6JxuBSUSBFYE7g?=
 =?us-ascii?q?Th2gQWBGkIBAQOBNYZtBIMcEoFaGAZllERIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5IUHoJlAXoKCQETFwEXgT0ZHpAFCYMkHQqQHIIhgTWeaXGEKIwij?=
 =?us-ascii?q?0SFdhozhASBV5JAklQLmH2OCoQJkSplN4RpgWg8gUcLBzMaCBsVO4JnCUoZD?=
 =?us-ascii?q?44rAgELC4NggX9ly3YnMgIJMgEBBwIHDgMLgWiQAQEmB4FPAQE?=
IronPort-Data: A9a23:AruhCK5ELXWkAQmCXMbT3gxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mYbCmmDOffcMTH3eYoiaY+z9U9X6JOGn9FmGgVq/ik3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eB6QW4btxC0hy+
 +0xARMpM0+Mlc71+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwaoqNJ4bWFJ89ckCwo
 TLr7WHUBRAhEOOZ6Bumql79obPVgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1q994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:wNVo56BH8MGDSJLlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:Hr0dcGzh/DCVesVyrESFBgUuM84+L3vX5UveMmaRKkI0F7KHZRyprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A7H+G2w/ym/FH4d0UtnuLNOWQf8A4zrarJUcMqrE?=
 =?us-ascii?q?5veilFnRcahDBliviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528052492"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:21:11 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 16A3018000596
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:11 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id AE218CBF202; Thu, 15 Oct 2026 22:21:10 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 3/4] redis: fix CVE-2026-25243
Date: Thu, 15 Oct 2026 22:21:09 -0700
Message-Id: <20261016052110.184934-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016052110.184934-1-yurade@cisco.com>
References: <20261016052110.184934-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131050

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/redis/redis/commit/b9dde6fc25dec6191b18374335a076a7b=
31e3d02
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../redis/redis-8.0.6/CVE-2026-25243.patch    | 275 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-252=
43.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-25243.patc=
h b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-25243.patch
new file mode 100644
index 0000000000..64349b14b3
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-25243.patch
@@ -0,0 +1,275 @@
+From b9dde6fc25dec6191b18374335a076a7b31e3d02 Mon Sep 17 00:00:00 2001
+From: Sergei Georgiev <s_ggeorgiev@yahoo.com>
+Date: Thu, 27 Nov 2025 11:41:11 +0200
+Subject: [PATCH] Invalid Memory Access in Redis RESTORE Command
+ (CVE-2026-25243)
+
+CVE: CVE-2026-25243
+Upstream-Status: Backport [https://github.com/redis/redis/commit/b9dde6fc2=
5dec6191b18374335a076a7b31e3d02]
+
+Backport Changes:
+- In src/rdb.c, the duplicate consumer PEL error path removes
+  streamFreeNACK(nack), using the 8.0.6 function signature; upstream remov=
es
+  streamFreeNACK(s, nack).
+
+(cherry picked from commit b9dde6fc25dec6191b18374335a076a7b31e3d02)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ modules/vector-sets/vset.c         | 46 +++++++++++++++--
+ src/rdb.c                          |  6 +--
+ src/sds.c                          |  9 +++-
+ src/zipmap.c                       |  7 +++
+ tests/integration/corrupt-dump.tcl | 83 ++++++++++++++++++++++++++++++
+ tests/unit/dump.tcl                | 13 +++++
+ 6 files changed, 155 insertions(+), 9 deletions(-)
+
+diff --git a/modules/vector-sets/vset.c b/modules/vector-sets/vset.c
+index 75de69256..ec8e4f0a4 100644
+--- a/modules/vector-sets/vset.c
++++ b/modules/vector-sets/vset.c
+@@ -1797,14 +1797,50 @@ void *VectorSetRdbLoad(RedisModuleIO *rdb, int enc=
ver) {
+         uint32_t input_dim =3D RedisModule_LoadUnsigned(rdb);
+         if (RedisModule_IsIOError(rdb)) goto ioerr;
+         uint32_t output_dim =3D dim;
+-        size_t matrix_size =3D sizeof(float) * input_dim * output_dim;
+=20
+-        vset->proj_matrix =3D RedisModule_Alloc(matrix_size);
+-        vset->proj_input_size =3D input_dim;
++        /* Sanity check dimensions to avoid absurd / degenerate matrices.=
 */
++        if (input_dim =3D=3D 0 || output_dim =3D=3D 0) {
++            RedisModule_LogIOError(rdb, "warning",
++                "Invalid projection matrix dimensions: input_dim=3D%u, ou=
tput_dim=3D%u",
++                (unsigned)input_dim, (unsigned)output_dim);
++            goto ioerr;
++        }
+=20
+-        // Load projection matrix as a binary blob
+-        char *matrix_blob =3D RedisModule_LoadStringBuffer(rdb, NULL);
++        /* Check for overflow in matrix_size =3D sizeof(float) * input_di=
m * output_dim. */
++        #if SIZE_MAX =3D=3D UINT32_MAX
++                if ((size_t)output_dim > SIZE_MAX / sizeof(float)) {
++                    RedisModule_LogIOError(rdb, "warning",
++                        "Projection matrix size overflow (output_dim too =
large): input_dim=3D%u, output_dim=3D%u",
++                        (unsigned)input_dim, (unsigned)output_dim);
++                    goto ioerr;
++                }
++        #endif
++
++        size_t max_input =3D SIZE_MAX / (sizeof(float) * (size_t)output_d=
im);
++        if ((size_t)input_dim > max_input) {
++            RedisModule_LogIOError(rdb, "warning",
++                "Projection matrix size overflow: input_dim=3D%u, output_=
dim=3D%u",
++                (unsigned)input_dim, (unsigned)output_dim);
++            goto ioerr;
++        }
++
++        size_t matrix_size =3D sizeof(float) * (size_t)input_dim * (size_=
t)output_dim;
++
++        /* Load projection matrix as a binary blob and validate length. */
++        size_t blob_len =3D 0;
++        char *matrix_blob =3D RedisModule_LoadStringBuffer(rdb, &blob_len=
);
+         if (matrix_blob =3D=3D NULL) goto ioerr;
++
++        if (blob_len !=3D matrix_size) {
++            RedisModule_LogIOError(rdb, "warning",
++                "Mismatching projection matrix length: expected=3D%zu, go=
t=3D%zu",
++                matrix_size, blob_len);
++            RedisModule_Free(matrix_blob);
++            goto ioerr;
++        }
++
++        vset->proj_matrix =3D RedisModule_Alloc(matrix_size);
++        vset->proj_input_size =3D input_dim;
+         memcpy(vset->proj_matrix, matrix_blob, matrix_size);
+         RedisModule_Free(matrix_blob);
+     }
+diff --git a/src/rdb.c b/src/rdb.c
+index c09cd14bc..371353c2c 100644
+--- a/src/rdb.c
++++ b/src/rdb.c
+@@ -2573,11 +2573,12 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key=
, int dbid, int *error)
+=20
+                         /* search for duplicate records */
+                         sds field =3D sdstrynewlen(fstr, flen);
+-                        if (!field || dictAdd(dupSearchDict, field, NULL)=
 !=3D DICT_OK ||
+-                            !lpSafeToAdd(lp, (size_t)flen + vlen)) {
++                        if (!field || !lpSafeToAdd(lp, (size_t)flen + vle=
n) ||
++                            dictAdd(dupSearchDict, field, NULL) !=3D DICT=
_OK) {
+                             rdbReportCorruptRDB("Hash zipmap with dup ele=
ments, or big length (%u)", flen);
+                             dictRelease(dupSearchDict);
+                             sdsfree(field);
++                            lpFree(lp);
+                             zfree(encoded);
+                             o->ptr =3D NULL;
+                             decrRefCount(o);
+@@ -3068,7 +3069,6 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key, =
int dbid, int *error)
+                                                 " loading a stream consum=
er "
+                                                 "group");
+                         decrRefCount(o);
+-                        streamFreeNACK(nack);
+                         return NULL;
+                     }
+                 }
+diff --git a/src/sds.c b/src/sds.c
+index 7f1429c46..edd0495aa 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -90,7 +90,14 @@ sds _sdsnewlen(const void *init, size_t initlen, int tr=
ymalloc) {
+     unsigned char *fp; /* flags pointer. */
+     size_t usable;
+=20
+-    assert(initlen + hdrlen + 1 > initlen); /* Catch size_t overflow */
++    if (trymalloc) {
++        /* protect against size_t overflow */
++        if (initlen + hdrlen + 1 <=3D initlen)=20
++            return NULL;
++    } else {
++        assert(initlen + hdrlen + 1 > initlen); /* Catch size_t overflow =
*/
++    }
++=20=20=20=20
+     sh =3D trymalloc?
+         s_trymalloc_usable(hdrlen+initlen+1, &usable) :
+         s_malloc_usable(hdrlen+initlen+1, &usable);
+diff --git a/src/zipmap.c b/src/zipmap.c
+index 51c64ca81..e3981d810 100644
+--- a/src/zipmap.c
++++ b/src/zipmap.c
+@@ -387,6 +387,10 @@ int zipmapValidateIntegrity(unsigned char *zm, size_t=
 size, int deep) {
+=20
+         /* read the field name length */
+         l =3D zipmapDecodeLength(p);
++        /* Sanity check: length < 254 must be encoded in 1 byte, not 5 by=
tes */
++        if (l < ZIPMAP_BIGLEN && s !=3D 1)
++            return 0;
++
+         p +=3D s; /* skip the encoded field size */
+         p +=3D l; /* skip the field */
+=20
+@@ -402,6 +406,9 @@ int zipmapValidateIntegrity(unsigned char *zm, size_t =
size, int deep) {
+=20
+         /* read the value length */
+         l =3D zipmapDecodeLength(p);
++        /* Sanity check: length < 254 must be encoded in 1 byte, not 5 by=
tes */
++        if (l < ZIPMAP_BIGLEN && s !=3D 1)
++            return 0;
+         p +=3D s; /* skip the encoded value size*/
+         e =3D *p++; /* skip the encoded free space (always encoded in one=
 byte) */
+         p +=3D l+e; /* skip the value and free space */
+diff --git a/tests/integration/corrupt-dump.tcl b/tests/integration/corrup=
t-dump.tcl
+index ee044c71a..6017723e0 100644
+--- a/tests/integration/corrupt-dump.tcl
++++ b/tests/integration/corrupt-dump.tcl
+@@ -941,6 +941,89 @@ test {corrupt payload: fuzzer findings - vector sets =
with wrong encoding} {
+     }
+ }
+=20
++test {corrupt payload: zipmap - element wouldn't fit in listpack} {
++    # Redis converts legacy zipmap encoded hashes to listpacks.
++    # This test creates a zipmap entry with a 1GB value which cannot
++    # fit into a listpack and verifies that RESTORE fails.
++
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no proto-max-bulk-len 2147483648 client-query-b=
uffer-limit 2147483648]] {
++        proc zipmap_encode_len {len} {
++            if {$len < 254} {
++                return [binary format c $len]
++            } else {
++                return [binary format ci 254 $len]
++            }
++        }
++        r config set sanitize-dump-payload no
++
++        # Generates Zipmap with 1GB value - should fail lpSafeToAdd check
++        set val_len [expr {1024 * 1024 * 1024 + 1}]
++
++        # Zipmap has 1 element
++        set zm [binary format c 1]
++        # Field is 1 byte long
++        append zm [zipmap_encode_len 1]
++        append zm "k"
++        # Value is 1GB long
++        append zm [zipmap_encode_len $val_len]
++        append zm [binary format c 0]
++        append zm [string repeat "A" $val_len]
++        # ZIPMAP_END marker
++        append zm [binary format c 255]
++        # Prepend RDB header
++        set zm_len [string length $zm]
++        set rdb_len [binary format cI 0x80 $zm_len]
++        set dump [binary format c 9]
++        append dump $rdb_len
++        append dump $zm
++        append dump [binary format s 9]
++        append dump [binary format w 0]
++
++        catch {r RESTORE _hash 0 $dump} err
++        assert_match "*Bad data format*" $err
++    }
++} {} {large-memory}
++
++test {corrupt payload: zipmap - 5 bytes length encoding for a small field=
} {
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no]] {
++        catch {
++            r restore key 0 "\x09\x11\x01\xfe\x04\x00\x00\x00\x01\x00\xff=
\x00\x04\x00\x76\x61\x6c\x31\xff\x09\x00\xf9\xd5\xa4\xf7\x7d\x00\x3f\x1b"
++        } err
++        assert_match "*Bad data format*" $err
++        verify_log_message 0 "*integrity check failed*" 0
++    }
++}
++
++test {corrupt payload: zipmap - 5 bytes length encoding for a small value=
} {
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no]] {
++        catch {
++            r restore key 0 "\x09\x0e\x01\x01\x6b\xfe\x04\x00\x00\x00\x00=
\x76\x61\x6c\x31\xff\x09\x00\xd0\xf9\xe4\x1d\xe4\xfb\x11\x4c"
++        } err
++        assert_match "*Bad data format*" $err
++        verify_log_message 0 "*integrity check failed*" 0
++    }
++}
++
++test {corrupt payload: zipmap - 5 bytes length encoding and a huge field}=
 {
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no] ] {
++        catch {
++            r restore key 0 "\x09\x41\x15\x02\x04\x6b\x65\x79\x31\x04\x00=
\x76\x61\x6c\x31\xfe\x04\x00\x00\x00\xfe\xff\xff\xff\xfd\x00\x42\x42\x42\x4=
2\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x=
42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\=
x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42=
\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x4=
2\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x=
42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\=
x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42=
\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x4=
2\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x=
42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\=
x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42=
\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x4=
2\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x42\x=
42\x42\x42\x42\x42\x42\xff\x09\x00\x54\x2f\x0a\xca\x4e\x5c\x49\x9f"
++        } err
++        assert_match "*Bad data format*" $err
++        verify_log_message 0 "*integrity check failed*" 0
++    }
++}
++
++test {corrupt payload: stream - duplicated consumer PEL entry} {
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no] ] {
++        catch {
++            r restore key 0 "\x15\x01\x10\x00\x00\x01\x9b\x0d\x56\xa9\xb7=
\x00\x00\x00\x00\x00\x00\x00\x00\xc3\x39\x40\x42\x15\x42\x00\x00\x00\x11\x0=
0\x02\x01\x00\x01\x01\x01\x86\x66\x69\x65\x6c\x64\x31\x07\x00\x01\x40\x0f\x=
0a\x00\x01\x86\x76\x61\x6c\x75\x65\x31\x07\x04\x20\x0b\x02\xcd\xd9\x02\xe0\=
x01\x22\x01\x32\x07\x80\x1a\x04\x32\x07\x06\x01\xff\x02\x81\x00\x00\x01\x9b=
\x0d\x56\xb7\x90\x00\x81\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x02\x0=
1\x07\x6d\x79\x67\x72\x6f\x75\x70\x81\x00\x00\x01\x9b\x0d\x56\xb7\x90\x00\x=
02\x02\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\x00\x00\x80\=
xd9\x56\x0d\x9b\x01\x00\x00\x01\x00\x00\x01\x9b\x0d\x56\xb7\x90\x00\x00\x00=
\x00\x00\x00\x00\x00\x80\xd9\x56\x0d\x9b\x01\x00\x00\x01\x01\x09\x63\x6f\x6=
e\x73\x75\x6d\x65\x72\x31\x80\xd9\x56\x0d\x9b\x01\x00\x00\x80\xd9\x56\x0d\x=
9b\x01\x00\x00\x02\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\=
x00\x00\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\x00\x00\x0c=
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x09\x00\x4b\xe0\x99\x30\x67\x4d\xe5\x8=
7"
++        } err
++        assert_match "*Bad data format*" $err
++        verify_log_message 0 "*Duplicated consumer PEL entry*" 0
++    }
++}
++
+=20
+ } ;# tags
+=20
+diff --git a/tests/unit/dump.tcl b/tests/unit/dump.tcl
+index 0cd62804a..1ce9bc846 100644
+--- a/tests/unit/dump.tcl
++++ b/tests/unit/dump.tcl
+@@ -140,6 +140,19 @@ start_server {tags {"dump"}} {
+         close_replication_stream $repl
+     } {} {needs:repl}
+=20
++    test {RESTORE fail with invalid payload size} {
++        # Payload with mismatched size: claims 0xFFFFFFFFFFFFFFF7 bytes (=
max uint64 - 8) but provides no data
++        # \x00 =3D String type
++        # \x81 =3D 64-bit length marker
++        # \xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF7 =3D 18446744073709551607 in bi=
g-endian
++        # \x0c\x00 =3D RDB version
++        # \x00... =3D fake CRC64
++        set encoded "\x00\x81\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xF7\x0c\x00\x00=
\x00\x00\x00\x00\x00\x00\x00"
++        r del test
++        catch {r restore test 0 $encoded} e
++        set e
++    } {*Bad data format*}
++
+     test {DUMP of non existing key returns nil} {
+         r dump nonexisting_key
+     } {}
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipe=
s-extended/redis/redis_8.0.6.bb
index a83ffbae48..5d4ca143d1 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.tar.=
gz \
            file://CVE-2026-81934.patch \
            file://CVE-2026-23479.patch \
            file://CVE-2026-23631.patch \
+           file://CVE-2026-25243.patch \
           "
 SRC_URI[sha256sum] =3D "6d0a9913887a4972536f9da226f1575859c34d863541291632=
60a5f9c6bd4229"
=20
--=20
2.35.6


