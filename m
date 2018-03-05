Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D26378A56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 05:48:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37468211"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 13:48:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D10748AE761
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:48:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:48:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Mar 2018 13:48:03 +0800
Message-ID: <1520228885-9939-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 5D10748AE761.A7EFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] krb5: 1.15.1 -> 1.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 05:48:22 -0000
Content-Type: text/plain

1.Upgrade krb5 from 1.15.1 to 1.16
2.Update the checksum of LIC_FILES_CHKSUM, since krb5 has been changed. But lincese remains the same.just modify the following.
  -Copyright (C) 1985-2016 by the Massachusetts Institute of Technology.
  +Copyright (C) 1985-2017 by the Massachusetts Institute of Technology.

  -The KCM Mach RPC definition file used on OS X has the following
  +The KCM Mach RPC definition file used on macOS has the following

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../krb5/krb5/CVE-2017-11462.patch                 | 419 ---------------------
 .../krb5/krb5/fix-CVE-2017-11368.patch             | 116 ------
 .../krb5/{krb5_1.15.1.bb => krb5_1.16.bb}          |   8 +-
 3 files changed, 3 insertions(+), 540 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2017-11462.patch
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.15.1.bb => krb5_1.16.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2017-11462.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2017-11462.patch
deleted file mode 100644
index 4b82f02..0000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2017-11462.patch
+++ /dev/null
@@ -1,419 +0,0 @@
-From 56f7b1bc95a2a3eeb420e069e7655fb181ade5cf Mon Sep 17 00:00:00 2001
-From: Greg Hudson <ghudson@mit.edu>
-Date: Fri, 14 Jul 2017 13:02:46 -0400
-Subject: [PATCH] Preserve GSS context on init/accept failure
-
-After gss_init_sec_context() or gss_accept_sec_context() has created a
-context, don't delete the mechglue context on failures from subsequent
-calls, even if the mechanism deletes the mech-specific context (which
-is allowed by RFC 2744 but not preferred).  Check for union contexts
-with no mechanism context in each GSS function which accepts a
-gss_ctx_id_t.
-
-CVE-2017-11462:
-
-RFC 2744 permits a GSS-API implementation to delete an existing
-security context on a second or subsequent call to
-gss_init_sec_context() or gss_accept_sec_context() if the call results
-in an error.  This API behavior has been found to be dangerous,
-leading to the possibility of memory errors in some callers.  For
-safety, GSS-API implementations should instead preserve existing
-security contexts on error until the caller deletes them.
-
-All versions of MIT krb5 prior to this change may delete acceptor
-contexts on error.  Versions 1.13.4 through 1.13.7, 1.14.1 through
-1.14.5, and 1.15 through 1.15.1 may also delete initiator contexts on
-error.
-
-ticket: 8598 (new)
-target_version: 1.15-next
-target_version: 1.14-next
-tags: pullup
-
-Upstream-Status: Backport
-CVE: CVE-2017-11462
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/lib/gssapi/mechglue/g_accept_sec_context.c  | 22 +++++++++++++++-------
- src/lib/gssapi/mechglue/g_complete_auth_token.c |  2 ++
- src/lib/gssapi/mechglue/g_context_time.c        |  2 ++
- src/lib/gssapi/mechglue/g_delete_sec_context.c  | 14 ++++++++------
- src/lib/gssapi/mechglue/g_exp_sec_context.c     |  2 ++
- src/lib/gssapi/mechglue/g_init_sec_context.c    | 19 +++++++++++--------
- src/lib/gssapi/mechglue/g_inq_context.c         |  2 ++
- src/lib/gssapi/mechglue/g_prf.c                 |  2 ++
- src/lib/gssapi/mechglue/g_process_context.c     |  2 ++
- src/lib/gssapi/mechglue/g_seal.c                |  4 ++++
- src/lib/gssapi/mechglue/g_sign.c                |  2 ++
- src/lib/gssapi/mechglue/g_unseal.c              |  2 ++
- src/lib/gssapi/mechglue/g_unwrap_aead.c         |  2 ++
- src/lib/gssapi/mechglue/g_unwrap_iov.c          |  4 ++++
- src/lib/gssapi/mechglue/g_verify.c              |  2 ++
- src/lib/gssapi/mechglue/g_wrap_aead.c           |  2 ++
- src/lib/gssapi/mechglue/g_wrap_iov.c            |  8 ++++++++
- 17 files changed, 72 insertions(+), 21 deletions(-)
-
-diff --git a/src/lib/gssapi/mechglue/g_accept_sec_context.c b/src/lib/gssapi/mechglue/g_accept_sec_context.c
-index ddaf874..f28e2b1 100644
---- a/src/lib/gssapi/mechglue/g_accept_sec_context.c
-+++ b/src/lib/gssapi/mechglue/g_accept_sec_context.c
-@@ -216,6 +216,8 @@ gss_cred_id_t *		d_cred;
-     } else {
- 	union_ctx_id = (gss_union_ctx_id_t)*context_handle;
- 	selected_mech = union_ctx_id->mech_type;
-+	if (union_ctx_id->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	    return (GSS_S_NO_CONTEXT);
-     }
- 
-     /* Now create a new context if we didn't get one. */
-@@ -234,9 +236,6 @@ gss_cred_id_t *		d_cred;
- 	    free(union_ctx_id);
- 	    return (status);
- 	}
--
--	/* set the new context handle to caller's data */
--	*context_handle = (gss_ctx_id_t)union_ctx_id;
-     }
- 
-     /*
-@@ -277,8 +276,10 @@ gss_cred_id_t *		d_cred;
- 					d_cred ? &tmp_d_cred : NULL);
- 
- 	    /* If there's more work to do, keep going... */
--	    if (status == GSS_S_CONTINUE_NEEDED)
-+	    if (status == GSS_S_CONTINUE_NEEDED) {
-+		*context_handle = (gss_ctx_id_t)union_ctx_id;
- 		return GSS_S_CONTINUE_NEEDED;
-+	    }
- 
- 	    /* if the call failed, return with failure */
- 	    if (status != GSS_S_COMPLETE) {
-@@ -364,14 +365,22 @@ gss_cred_id_t *		d_cred;
- 		*mech_type = gssint_get_public_oid(actual_mech);
- 	    if (ret_flags != NULL)
- 		*ret_flags = temp_ret_flags;
--	    return	(status);
-+	    *context_handle = (gss_ctx_id_t)union_ctx_id;
-+	    return GSS_S_COMPLETE;
-     } else {
- 
- 	status = GSS_S_BAD_MECH;
-     }
- 
- error_out:
--    if (union_ctx_id) {
-+	/*
-+	 * RFC 2744 5.1 requires that we not create a context on a failed first
-+	 * call to accept, and recommends that on a failed subsequent call we
-+	 * make the caller responsible for calling gss_delete_sec_context.
-+	 * Even if the mech deleted its context, keep the union context around
-+	 * for the caller to delete.
-+	 */
-+    if (union_ctx_id && *context_handle == GSS_C_NO_CONTEXT) {
- 	if (union_ctx_id->mech_type) {
- 	    if (union_ctx_id->mech_type->elements)
- 		free(union_ctx_id->mech_type->elements);
-@@ -384,7 +393,6 @@ error_out:
- 					 GSS_C_NO_BUFFER);
- 	}
- 	free(union_ctx_id);
--	*context_handle = GSS_C_NO_CONTEXT;
-     }
- 
-     if (src_name)
-diff --git a/src/lib/gssapi/mechglue/g_complete_auth_token.c b/src/lib/gssapi/mechglue/g_complete_auth_token.c
-index 9181551..4bcb47e 100644
---- a/src/lib/gssapi/mechglue/g_complete_auth_token.c
-+++ b/src/lib/gssapi/mechglue/g_complete_auth_token.c
-@@ -52,6 +52,8 @@ gss_complete_auth_token (OM_uint32 *minor_status,
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return GSS_S_NO_CONTEXT;
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech != NULL) {
-diff --git a/src/lib/gssapi/mechglue/g_context_time.c b/src/lib/gssapi/mechglue/g_context_time.c
-index 2ff8d09..c947e76 100644
---- a/src/lib/gssapi/mechglue/g_context_time.c
-+++ b/src/lib/gssapi/mechglue/g_context_time.c
-@@ -58,6 +58,8 @@ OM_uint32 *		time_rec;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-diff --git a/src/lib/gssapi/mechglue/g_delete_sec_context.c b/src/lib/gssapi/mechglue/g_delete_sec_context.c
-index 4bf0dec..574ff02 100644
---- a/src/lib/gssapi/mechglue/g_delete_sec_context.c
-+++ b/src/lib/gssapi/mechglue/g_delete_sec_context.c
-@@ -87,12 +87,14 @@ gss_buffer_t		output_token;
-     if (GSSINT_CHK_LOOP(ctx))
- 	return (GSS_S_CALL_INACCESSIBLE_READ | GSS_S_NO_CONTEXT);
- 
--    status = gssint_delete_internal_sec_context(minor_status,
--						ctx->mech_type,
--						&ctx->internal_ctx_id,
--						output_token);
--    if (status)
--	return status;
-+    if (ctx->internal_ctx_id != GSS_C_NO_CONTEXT) {
-+	status = gssint_delete_internal_sec_context(minor_status,
-+						    ctx->mech_type,
-+						    &ctx->internal_ctx_id,
-+						    output_token);
-+	if (status)
-+	    return status;
-+    }
- 
-     /* now free up the space for the union context structure */
-     free(ctx->mech_type->elements);
-diff --git a/src/lib/gssapi/mechglue/g_exp_sec_context.c b/src/lib/gssapi/mechglue/g_exp_sec_context.c
-index b637452..1d7990b 100644
---- a/src/lib/gssapi/mechglue/g_exp_sec_context.c
-+++ b/src/lib/gssapi/mechglue/g_exp_sec_context.c
-@@ -95,6 +95,8 @@ gss_buffer_t		interprocess_token;
-      */
- 
-     ctx = (gss_union_ctx_id_t) *context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
-     if (!mech)
- 	return GSS_S_BAD_MECH;
-diff --git a/src/lib/gssapi/mechglue/g_init_sec_context.c b/src/lib/gssapi/mechglue/g_init_sec_context.c
-index 9f154b8..e2df1ce 100644
---- a/src/lib/gssapi/mechglue/g_init_sec_context.c
-+++ b/src/lib/gssapi/mechglue/g_init_sec_context.c
-@@ -192,8 +192,13 @@ OM_uint32 *		time_rec;
- 
- 	/* copy the supplied context handle */
- 	union_ctx_id->internal_ctx_id = GSS_C_NO_CONTEXT;
--    } else
-+    } else {
- 	union_ctx_id = (gss_union_ctx_id_t)*context_handle;
-+	if (union_ctx_id->internal_ctx_id == GSS_C_NO_CONTEXT) {
-+	    status = GSS_S_NO_CONTEXT;
-+	    goto end;
-+	}
-+    }
- 
-     /*
-      * get the appropriate cred handle from the union cred struct.
-@@ -224,15 +229,13 @@ OM_uint32 *		time_rec;
- 
-     if (status != GSS_S_COMPLETE && status != GSS_S_CONTINUE_NEEDED) {
- 	/*
--	 * The spec says the preferred method is to delete all context info on
--	 * the first call to init, and on all subsequent calls make the caller
--	 * responsible for calling gss_delete_sec_context.  However, if the
--	 * mechanism decided to delete the internal context, we should also
--	 * delete the union context.
-+	 * RFC 2744 5.19 requires that we not create a context on a failed
-+	 * first call to init, and recommends that on a failed subsequent call
-+	 * we make the caller responsible for calling gss_delete_sec_context.
-+	 * Even if the mech deleted its context, keep the union context around
-+	 * for the caller to delete.
- 	 */
- 	map_error(minor_status, mech);
--	if (union_ctx_id->internal_ctx_id == GSS_C_NO_CONTEXT)
--	    *context_handle = GSS_C_NO_CONTEXT;
- 	if (*context_handle == GSS_C_NO_CONTEXT) {
- 	    free(union_ctx_id->mech_type->elements);
- 	    free(union_ctx_id->mech_type);
-diff --git a/src/lib/gssapi/mechglue/g_inq_context.c b/src/lib/gssapi/mechglue/g_inq_context.c
-index 6f1c71e..6c0d98d 100644
---- a/src/lib/gssapi/mechglue/g_inq_context.c
-+++ b/src/lib/gssapi/mechglue/g_inq_context.c
-@@ -104,6 +104,8 @@ gss_inquire_context(
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (!mech || !mech->gss_inquire_context || !mech->gss_display_name ||
-diff --git a/src/lib/gssapi/mechglue/g_prf.c b/src/lib/gssapi/mechglue/g_prf.c
-index fcca3e4..9e168ad 100644
---- a/src/lib/gssapi/mechglue/g_prf.c
-+++ b/src/lib/gssapi/mechglue/g_prf.c
-@@ -59,6 +59,8 @@ gss_pseudo_random (OM_uint32 *minor_status,
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return GSS_S_NO_CONTEXT;
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech != NULL) {
-diff --git a/src/lib/gssapi/mechglue/g_process_context.c b/src/lib/gssapi/mechglue/g_process_context.c
-index bc260ae..3968b5d 100644
---- a/src/lib/gssapi/mechglue/g_process_context.c
-+++ b/src/lib/gssapi/mechglue/g_process_context.c
-@@ -61,6 +61,8 @@ gss_buffer_t		token_buffer;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-diff --git a/src/lib/gssapi/mechglue/g_seal.c b/src/lib/gssapi/mechglue/g_seal.c
-index f17241c..3db1ee0 100644
---- a/src/lib/gssapi/mechglue/g_seal.c
-+++ b/src/lib/gssapi/mechglue/g_seal.c
-@@ -92,6 +92,8 @@ gss_wrap( OM_uint32 *minor_status,
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+        return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-@@ -226,6 +228,8 @@ gss_wrap_size_limit(OM_uint32  *minor_status,
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+        return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (!mech)
-diff --git a/src/lib/gssapi/mechglue/g_sign.c b/src/lib/gssapi/mechglue/g_sign.c
-index 86d641a..03fbd8c 100644
---- a/src/lib/gssapi/mechglue/g_sign.c
-+++ b/src/lib/gssapi/mechglue/g_sign.c
-@@ -94,6 +94,8 @@ gss_buffer_t		msg_token;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-diff --git a/src/lib/gssapi/mechglue/g_unseal.c b/src/lib/gssapi/mechglue/g_unseal.c
-index 3e8053c..c208635 100644
---- a/src/lib/gssapi/mechglue/g_unseal.c
-+++ b/src/lib/gssapi/mechglue/g_unseal.c
-@@ -76,6 +76,8 @@ gss_qop_t *		qop_state;
-      * call it.
-      */
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-diff --git a/src/lib/gssapi/mechglue/g_unwrap_aead.c b/src/lib/gssapi/mechglue/g_unwrap_aead.c
-index e78bff2..0682bd8 100644
---- a/src/lib/gssapi/mechglue/g_unwrap_aead.c
-+++ b/src/lib/gssapi/mechglue/g_unwrap_aead.c
-@@ -186,6 +186,8 @@ gss_qop_t		*qop_state;
-      * call it.
-      */
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (!mech)
-diff --git a/src/lib/gssapi/mechglue/g_unwrap_iov.c b/src/lib/gssapi/mechglue/g_unwrap_iov.c
-index c0dd314..599be2c 100644
---- a/src/lib/gssapi/mechglue/g_unwrap_iov.c
-+++ b/src/lib/gssapi/mechglue/g_unwrap_iov.c
-@@ -89,6 +89,8 @@ int			iov_count;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-@@ -128,6 +130,8 @@ gss_verify_mic_iov(OM_uint32 *minor_status, gss_ctx_id_t context_handle,
- 
-     /* Select the approprate underlying mechanism routine and call it. */
-     ctx = (gss_union_ctx_id_t)context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return GSS_S_NO_CONTEXT;
-     mech = gssint_get_mechanism(ctx->mech_type);
-     if (mech == NULL)
- 	return GSS_S_BAD_MECH;
-diff --git a/src/lib/gssapi/mechglue/g_verify.c b/src/lib/gssapi/mechglue/g_verify.c
-index 1578ae1..8996fce 100644
---- a/src/lib/gssapi/mechglue/g_verify.c
-+++ b/src/lib/gssapi/mechglue/g_verify.c
-@@ -65,6 +65,8 @@ gss_qop_t *		qop_state;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-diff --git a/src/lib/gssapi/mechglue/g_wrap_aead.c b/src/lib/gssapi/mechglue/g_wrap_aead.c
-index 96cdf3c..7fe3b7b 100644
---- a/src/lib/gssapi/mechglue/g_wrap_aead.c
-+++ b/src/lib/gssapi/mechglue/g_wrap_aead.c
-@@ -256,6 +256,8 @@ gss_buffer_t		output_message_buffer;
-      * call it.
-      */
-     ctx = (gss_union_ctx_id_t)context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
-     if (!mech)
- 	return (GSS_S_BAD_MECH);
-diff --git a/src/lib/gssapi/mechglue/g_wrap_iov.c b/src/lib/gssapi/mechglue/g_wrap_iov.c
-index 40cd98f..14447c4 100644
---- a/src/lib/gssapi/mechglue/g_wrap_iov.c
-+++ b/src/lib/gssapi/mechglue/g_wrap_iov.c
-@@ -93,6 +93,8 @@ int			iov_count;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-@@ -151,6 +153,8 @@ int			iov_count;
-      */
- 
-     ctx = (gss_union_ctx_id_t) context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return (GSS_S_NO_CONTEXT);
-     mech = gssint_get_mechanism (ctx->mech_type);
- 
-     if (mech) {
-@@ -190,6 +194,8 @@ gss_get_mic_iov(OM_uint32 *minor_status, gss_ctx_id_t context_handle,
- 
-     /* Select the approprate underlying mechanism routine and call it. */
-     ctx = (gss_union_ctx_id_t)context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return GSS_S_NO_CONTEXT;
-     mech = gssint_get_mechanism(ctx->mech_type);
-     if (mech == NULL)
- 	return GSS_S_BAD_MECH;
-@@ -218,6 +224,8 @@ gss_get_mic_iov_length(OM_uint32 *minor_status, gss_ctx_id_t context_handle,
- 
-     /* Select the approprate underlying mechanism routine and call it. */
-     ctx = (gss_union_ctx_id_t)context_handle;
-+    if (ctx->internal_ctx_id == GSS_C_NO_CONTEXT)
-+	return GSS_S_NO_CONTEXT;
-     mech = gssint_get_mechanism(ctx->mech_type);
-     if (mech == NULL)
- 	return GSS_S_BAD_MECH;
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch b/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
deleted file mode 100644
index a2eb7bc..0000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-Upstream-Status: Backport [https://github.com/krb5/krb5/commit/ffb35baac6981f9e8914f8f3bffd37f284b85970]
-
-Backport patch to fix CVE-2017-11368.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From ffb35baac6981f9e8914f8f3bffd37f284b85970 Mon Sep 17 00:00:00 2001
-From: Greg Hudson <ghudson@mit.edu>
-Date: Thu, 13 Jul 2017 12:14:20 -0400
-Subject: [PATCH] Prevent KDC unset status assertion failures
-
-Assign status values if S4U2Self padata fails to decode, if an
-S4U2Proxy request uses invalid KDC options, or if an S4U2Proxy request
-uses an evidence ticket which does not match the canonicalized request
-server principal name.  Reported by Samuel Cabrero.
-
-If a status value is not assigned during KDC processing, default to
-"UNKNOWN_REASON" rather than failing an assertion.  This change will
-prevent future denial of service bugs due to similar mistakes, and
-will allow us to omit assigning status values for unlikely errors such
-as small memory allocation failures.
-
-CVE-2017-11368:
-
-In MIT krb5 1.7 and later, an authenticated attacker can cause an
-assertion failure in krb5kdc by sending an invalid S4U2Self or
-S4U2Proxy request.
-
-  CVSSv3 Vector: AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H/E:H/RL:O/RC:C
-
-ticket: 8599 (new)
-target_version: 1.15-next
-target_version: 1.14-next
-tags: pullup
----
- src/kdc/do_as_req.c  |  4 ++--
- src/kdc/do_tgs_req.c |  3 ++-
- src/kdc/kdc_util.c   | 10 ++++++++--
- 3 files changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/src/kdc/do_as_req.c b/src/kdc/do_as_req.c
-index 2d3ad13..9b256c8 100644
---- a/src/kdc/do_as_req.c
-+++ b/src/kdc/do_as_req.c
-@@ -366,8 +366,8 @@ finish_process_as_req(struct as_req_state *state, krb5_error_code errcode)
-     did_log = 1;
- 
- egress:
--    if (errcode != 0)
--        assert (state->status != 0);
-+    if (errcode != 0 && state->status == NULL)
-+        state->status = "UNKNOWN_REASON";
- 
-     au_state->status = state->status;
-     au_state->reply = &state->reply;
-diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
-index cdc79ad..d8d6719 100644
---- a/src/kdc/do_tgs_req.c
-+++ b/src/kdc/do_tgs_req.c
-@@ -823,7 +823,8 @@ process_tgs_req(struct server_handle *handle, krb5_data *pkt,
-     free(reply.enc_part.ciphertext.data);
- 
- cleanup:
--    assert(status != NULL);
-+    if (status == NULL)
-+        status = "UNKNOWN_REASON";
-     if (reply_key)
-         krb5_free_keyblock(kdc_context, reply_key);
-     if (errcode)
-diff --git a/src/kdc/kdc_util.c b/src/kdc/kdc_util.c
-index 778a629..b710aef 100644
---- a/src/kdc/kdc_util.c
-+++ b/src/kdc/kdc_util.c
-@@ -1220,8 +1220,10 @@ kdc_process_for_user(kdc_realm_t *kdc_active_realm,
-     req_data.data = (char *)pa_data->contents;
- 
-     code = decode_krb5_pa_for_user(&req_data, &for_user);
--    if (code)
-+    if (code) {
-+        *status = "DECODE_PA_FOR_USER";
-         return code;
-+    }
- 
-     code = verify_for_user_checksum(kdc_context, tgs_session, for_user);
-     if (code) {
-@@ -1320,8 +1322,10 @@ kdc_process_s4u_x509_user(krb5_context context,
-     req_data.data = (char *)pa_data->contents;
- 
-     code = decode_krb5_pa_s4u_x509_user(&req_data, s4u_x509_user);
--    if (code)
-+    if (code) {
-+        *status = "DECODE_PA_S4U_X509_USER";
-         return code;
-+    }
- 
-     code = verify_s4u_x509_user_checksum(context,
-                                          tgs_subkey ? tgs_subkey :
-@@ -1624,6 +1628,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t *kdc_active_realm,
-      * that is validated previously in validate_tgs_request().
-      */
-     if (request->kdc_options & (NON_TGT_OPTION | KDC_OPT_ENC_TKT_IN_SKEY)) {
-+        *status = "INVALID_S4U2PROXY_OPTIONS";
-         return KRB5KDC_ERR_BADOPTION;
-     }
- 
-@@ -1631,6 +1636,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t *kdc_active_realm,
-     if (!krb5_principal_compare(kdc_context,
-                                 server->princ, /* after canon */
-                                 server_princ)) {
-+        *status = "EVIDENCE_TICKET_MISMATCH";
-         return KRB5KDC_ERR_SERVER_NOMATCH;
-     }
- 
--- 
-2.10.1
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index e75e861..3bdb090 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=3e12b8a065cca25dfdcac734fb3ec0b9"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=59b8da652f07186b44782a8454574f30"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
@@ -30,11 +30,9 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
-           file://fix-CVE-2017-11368.patch;striplevel=2 \
-           file://CVE-2017-11462.patch;striplevel=2 \
 "
-SRC_URI[md5sum] = "8022f3a1cde8463e44fd35ef42731f85"
-SRC_URI[sha256sum] = "437c8831ddd5fde2a993fef425dedb48468109bb3d3261ef838295045a89eb45"
+SRC_URI[md5sum] = "23c5e9f07642db4a67f7a5b6168b1319"
+SRC_URI[sha256sum] = "faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08"
 
 CVE_PRODUCT = "kerberos"
 
-- 
2.7.4




