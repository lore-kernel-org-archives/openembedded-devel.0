Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4925B77381
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 10:22:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAEAMbCS007653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 02:22:37 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 02:22:37 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Nov 2015 05:22:29 -0500
Message-ID: <1d810abdf712771ce3672c8a3a3be0beb14dcce1.1447495903.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447495903.git.wenzong.fan@windriver.com>
References: <cover.1447495903.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4][meta-oe] krb5: fix CVE-2015-2698
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Nov 2015 10:22:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The iakerb_gss_export_sec_context function in lib/gssapi/krb5/iakerb.c
in MIT Kerberos 5 (aka krb5) 1.14 pre-release 2015-09-14 improperly
accesses a certain pointer, which allows remote authenticated users
to cause a denial of service (memory corruption) or possibly have
unspecified other impact by interacting with an application that calls
the gss_export_sec_context function. NOTE: this vulnerability exists
because of an incorrect fix for CVE-2015-2696.

Backport upstream commit to fix it:
https://github.com/krb5/krb5/commit/3db8dfec1ef50ddd78d6ba9503185995876a39fd

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...AKERB-context-export-import-CVE-2015-2698.patch | 134 +++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch b/meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch
new file mode 100644
index 0000000..2f45d30
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch
@@ -0,0 +1,134 @@
+From aa769c8c6905d1abfac66d4d1b0fc73740ccbe7d Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Sat, 14 Nov 2015 02:47:04 -0500
+Subject: [PATCH 4/4] Fix IAKERB context export/import [CVE-2015-2698]
+
+The patches for CVE-2015-2696 contained a regression in the newly
+added IAKERB iakerb_gss_export_sec_context() function, which could
+cause it to corrupt memory.  Fix the regression by properly
+dereferencing the context_handle pointer before casting it.
+
+Also, the patches did not implement an IAKERB gss_import_sec_context()
+function, under the erroneous belief that an exported IAKERB context
+would be tagged as a krb5 context.  Implement it now to allow IAKERB
+contexts to be successfully exported and imported after establishment.
+
+CVE-2015-2698:
+
+In any MIT krb5 release with the patches for CVE-2015-2696 applied, an
+application which calls gss_export_sec_context() may experience memory
+corruption if the context was established using the IAKERB mechanism.
+Historically, some vulnerabilities of this nature can be translated
+into remote code execution, though the necessary exploits must be
+tailored to the individual application and are usually quite
+complicated.
+
+    CVSSv2 Vector: AV:N/AC:H/Au:S/C:C/I:C/A:C/E:POC/RL:OF/RC:C
+
+ticket: 8273 (new)
+target_version: 1.14
+tags: pullup
+
+Backport upstream commit:
+https://github.com/krb5/krb5/commit/3db8dfec1ef50ddd78d6ba9503185995876a39fd
+
+Upstream-Status: Backport
+---
+ src/lib/gssapi/krb5/gssapiP_krb5.h |  5 +++++
+ src/lib/gssapi/krb5/gssapi_krb5.c  |  2 +-
+ src/lib/gssapi/krb5/iakerb.c       | 42 +++++++++++++++++++++++++++++++-------
+ 3 files changed, 41 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib/gssapi/krb5/gssapiP_krb5.h b/src/lib/gssapi/krb5/gssapiP_krb5.h
+index 05dc321..ac53662 100644
+--- a/src/lib/gssapi/krb5/gssapiP_krb5.h
++++ b/src/lib/gssapi/krb5/gssapiP_krb5.h
+@@ -1396,6 +1396,11 @@ OM_uint32 KRB5_CALLCONV
+ iakerb_gss_export_sec_context(OM_uint32 *minor_status,
+                               gss_ctx_id_t *context_handle,
+                               gss_buffer_t interprocess_token);
++
++OM_uint32 KRB5_CALLCONV
++iakerb_gss_import_sec_context(OM_uint32 *minor_status,
++                              const gss_buffer_t interprocess_token,
++                              gss_ctx_id_t *context_handle);
+ #endif /* LEAN_CLIENT */
+ 
+ OM_uint32 KRB5_CALLCONV
+diff --git a/src/lib/gssapi/krb5/gssapi_krb5.c b/src/lib/gssapi/krb5/gssapi_krb5.c
+index 9a23656..d7ba279 100644
+--- a/src/lib/gssapi/krb5/gssapi_krb5.c
++++ b/src/lib/gssapi/krb5/gssapi_krb5.c
+@@ -945,7 +945,7 @@ static struct gss_config iakerb_mechanism = {
+     NULL,
+ #else
+     iakerb_gss_export_sec_context,
+-    NULL,
++    iakerb_gss_import_sec_context,
+ #endif
+     krb5_gss_inquire_cred_by_mech,
+     krb5_gss_inquire_names_for_mech,
+diff --git a/src/lib/gssapi/krb5/iakerb.c b/src/lib/gssapi/krb5/iakerb.c
+index 4662bd9..48beaee 100644
+--- a/src/lib/gssapi/krb5/iakerb.c
++++ b/src/lib/gssapi/krb5/iakerb.c
+@@ -1061,7 +1061,7 @@ iakerb_gss_export_sec_context(OM_uint32 *minor_status,
+                               gss_buffer_t interprocess_token)
+ {
+     OM_uint32 maj;
+-    iakerb_ctx_id_t ctx = (iakerb_ctx_id_t)context_handle;
++    iakerb_ctx_id_t ctx = (iakerb_ctx_id_t)*context_handle;
+ 
+     /* We don't currently support exporting partially established contexts. */
+     if (!ctx->established)
+@@ -1076,13 +1076,41 @@ iakerb_gss_export_sec_context(OM_uint32 *minor_status,
+     return maj;
+ }
+ 
+-/*
+- * Until we implement partial context exports, there are no SPNEGO exported
+- * context tokens, only tokens for the underlying krb5 context.  So we do not
+- * need to implement an iakerb_gss_import_sec_context() yet; it would be
+- * unreachable except via a manually constructed token.
+- */
++OM_uint32 KRB5_CALLCONV
++iakerb_gss_import_sec_context(OM_uint32 *minor_status,
++                              gss_buffer_t interprocess_token,
++                              gss_ctx_id_t *context_handle)
++{
++    OM_uint32 maj, tmpmin;
++    krb5_error_code code;
++    gss_ctx_id_t gssc;
++    krb5_gss_ctx_id_t kctx;
++    iakerb_ctx_id_t ctx;
++
++    maj = krb5_gss_import_sec_context(minor_status, interprocess_token, &gssc);
++    if (maj != GSS_S_COMPLETE)
++        return maj;
++    kctx = (krb5_gss_ctx_id_t)gssc;
++
++    if (!kctx->established) {
++        /* We don't currently support importing partially established
++         * contexts. */
++        krb5_gss_delete_sec_context(&tmpmin, &gssc, GSS_C_NO_BUFFER);
++        return GSS_S_FAILURE;
++    }
+ 
++    code = iakerb_alloc_context(&ctx, kctx->initiate);
++    if (code != 0) {
++        krb5_gss_delete_sec_context(&tmpmin, &gssc, GSS_C_NO_BUFFER);
++        *minor_status = code;
++        return GSS_S_FAILURE;
++    }
++
++    ctx->gssc = gssc;
++    ctx->established = 1;
++    *context_handle = (gss_ctx_id_t)ctx;
++    return GSS_S_COMPLETE;
++}
+ #endif /* LEAN_CLIENT */
+ 
+ OM_uint32 KRB5_CALLCONV
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index c6b873a..ecb4eda 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
            file://Fix-SPNEGO-context-aliasing-bugs-CVE-2015-2695.patch;striplevel=2 \
            file://Fix-IAKERB-context-aliasing-bugs-CVE-2015-2696.patch;striplevel=2 \
            file://Fix-build_principal-memory-bug-CVE-2015-2697.patch;striplevel=2 \
+           file://Fix-IAKERB-context-export-import-CVE-2015-2698.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
-- 
1.9.1


