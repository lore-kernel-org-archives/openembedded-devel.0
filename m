Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95FEC77D30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 14:10:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7SEAnbV011602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 07:10:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 28 Aug 2017 07:10:48 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 21:59:12 +0800
Message-ID: <20170828135913.7508-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] krb5: fix CVE-2017-11368
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
X-List-Received-Date: Mon, 28 Aug 2017 14:10:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Issue: CVE-2017-11368

Backport patch to fix CVE-2017-11368 for krb5.

(LOCAL REV: NOT UPSTREAM) -- Send to oe-devel on 20170828

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../krb5/krb5/fix-CVE-2017-11368.patch             | 116 +++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb   |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch b/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
new file mode 100644
index 000000000..a2eb7bc02
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/ffb35baac6981f9e8914f8f3bffd37f284b85970]
+
+Backport patch to fix CVE-2017-11368.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From ffb35baac6981f9e8914f8f3bffd37f284b85970 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Thu, 13 Jul 2017 12:14:20 -0400
+Subject: [PATCH] Prevent KDC unset status assertion failures
+
+Assign status values if S4U2Self padata fails to decode, if an
+S4U2Proxy request uses invalid KDC options, or if an S4U2Proxy request
+uses an evidence ticket which does not match the canonicalized request
+server principal name.  Reported by Samuel Cabrero.
+
+If a status value is not assigned during KDC processing, default to
+"UNKNOWN_REASON" rather than failing an assertion.  This change will
+prevent future denial of service bugs due to similar mistakes, and
+will allow us to omit assigning status values for unlikely errors such
+as small memory allocation failures.
+
+CVE-2017-11368:
+
+In MIT krb5 1.7 and later, an authenticated attacker can cause an
+assertion failure in krb5kdc by sending an invalid S4U2Self or
+S4U2Proxy request.
+
+  CVSSv3 Vector: AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H/E:H/RL:O/RC:C
+
+ticket: 8599 (new)
+target_version: 1.15-next
+target_version: 1.14-next
+tags: pullup
+---
+ src/kdc/do_as_req.c  |  4 ++--
+ src/kdc/do_tgs_req.c |  3 ++-
+ src/kdc/kdc_util.c   | 10 ++++++++--
+ 3 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/src/kdc/do_as_req.c b/src/kdc/do_as_req.c
+index 2d3ad13..9b256c8 100644
+--- a/src/kdc/do_as_req.c
++++ b/src/kdc/do_as_req.c
+@@ -366,8 +366,8 @@ finish_process_as_req(struct as_req_state *state, krb5_error_code errcode)
+     did_log = 1;
+ 
+ egress:
+-    if (errcode != 0)
+-        assert (state->status != 0);
++    if (errcode != 0 && state->status == NULL)
++        state->status = "UNKNOWN_REASON";
+ 
+     au_state->status = state->status;
+     au_state->reply = &state->reply;
+diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
+index cdc79ad..d8d6719 100644
+--- a/src/kdc/do_tgs_req.c
++++ b/src/kdc/do_tgs_req.c
+@@ -823,7 +823,8 @@ process_tgs_req(struct server_handle *handle, krb5_data *pkt,
+     free(reply.enc_part.ciphertext.data);
+ 
+ cleanup:
+-    assert(status != NULL);
++    if (status == NULL)
++        status = "UNKNOWN_REASON";
+     if (reply_key)
+         krb5_free_keyblock(kdc_context, reply_key);
+     if (errcode)
+diff --git a/src/kdc/kdc_util.c b/src/kdc/kdc_util.c
+index 778a629..b710aef 100644
+--- a/src/kdc/kdc_util.c
++++ b/src/kdc/kdc_util.c
+@@ -1220,8 +1220,10 @@ kdc_process_for_user(kdc_realm_t *kdc_active_realm,
+     req_data.data = (char *)pa_data->contents;
+ 
+     code = decode_krb5_pa_for_user(&req_data, &for_user);
+-    if (code)
++    if (code) {
++        *status = "DECODE_PA_FOR_USER";
+         return code;
++    }
+ 
+     code = verify_for_user_checksum(kdc_context, tgs_session, for_user);
+     if (code) {
+@@ -1320,8 +1322,10 @@ kdc_process_s4u_x509_user(krb5_context context,
+     req_data.data = (char *)pa_data->contents;
+ 
+     code = decode_krb5_pa_s4u_x509_user(&req_data, s4u_x509_user);
+-    if (code)
++    if (code) {
++        *status = "DECODE_PA_S4U_X509_USER";
+         return code;
++    }
+ 
+     code = verify_s4u_x509_user_checksum(context,
+                                          tgs_subkey ? tgs_subkey :
+@@ -1624,6 +1628,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t *kdc_active_realm,
+      * that is validated previously in validate_tgs_request().
+      */
+     if (request->kdc_options & (NON_TGT_OPTION | KDC_OPT_ENC_TKT_IN_SKEY)) {
++        *status = "INVALID_S4U2PROXY_OPTIONS";
+         return KRB5KDC_ERR_BADOPTION;
+     }
+ 
+@@ -1631,6 +1636,7 @@ kdc_process_s4u2proxy_req(kdc_realm_t *kdc_active_realm,
+     if (!krb5_principal_compare(kdc_context,
+                                 server->princ, /* after canon */
+                                 server_princ)) {
++        *status = "EVIDENCE_TICKET_MISMATCH";
+         return KRB5KDC_ERR_SERVER_NOMATCH;
+     }
+ 
+-- 
+2.10.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
index 1de884d03..b515eb5dc 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://fix-CVE-2017-11368.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "8022f3a1cde8463e44fd35ef42731f85"
 SRC_URI[sha256sum] = "437c8831ddd5fde2a993fef425dedb48468109bb3d3261ef838295045a89eb45"
-- 
2.14.1


