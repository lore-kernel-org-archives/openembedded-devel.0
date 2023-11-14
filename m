Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D40CC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 05:49:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7234.1699940972968552019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 21:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ex3ZtAIf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96829e2cb8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AE4BhOB015516
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 05:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=r8+hc
	JejoQlrP3QP0WsgqtpOaCTj9ixK+c6GV6csAyo=; b=Ex3ZtAIfF7vzxqxpKUSir
	0JuQd7Gr+T0UThzLPM0TbBpyB767Zhsv9tLQvWsd8y0D514gs9rGtyXV3teo/gxd
	Z4oKF6JR260rZTV3uvqW8/9yRYnIZbwWjzXuZGoqcCKBitm6HYJ6R8E/fzLigsuz
	7zFfwxdGfAqNCjXOpxptLdtaqjBMGRMnatCmozK3420+Ikd+Eig8717yzD5WX4b9
	falSLu3o+5dtB6qFCP1zu+Yxp2Ugkecc93BxR8r7ihXLknMvDvFfHrnUXhwKt/7u
	/gS88YLAZh4ofNVoPahHykplFR8HlRjJhzbiiPpWogawg3P7fA5a8qB9esTf1WCd
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxaar8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 05:49:31 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 21:49:33 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][mickledore][PATCH 1/1] open-vm-tools: fix CVE-2023-34058
Date: Tue, 14 Nov 2023 05:49:15 +0000
Message-ID: <20231114054915.729691-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 4lm7yqX5SyMwk37Hon3zaRUOInVLJFf7
X-Proofpoint-GUID: 4lm7yqX5SyMwk37Hon3zaRUOInVLJFf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_04,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311140042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 05:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106699

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in open-vm-tools. This flaw allows a malicious actor that
has been granted Guest Operation Privileges in a target virtual machine to
elevate their privileges if that target virtual machine has been assigned
a more privileged Guest Alias.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-34058

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../open-vm-tools/CVE-2023-34058.patch        | 241 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.1.5.bb     |   1 +
 2 files changed, 242 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch
new file mode 100644
index 000000000..cb031767a
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch
@@ -0,0 +1,241 @@
+From 6822b5a84f8cfa60d46479d6b8f1c63eb85eac87 Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Wed, 18 Oct 2023 09:04:07 -0700
+Subject: [PATCH] Address CVE-2023-34058
+
+VGAuth: don't accept tokens with unrelated certs.
+
+CVE: CVE-2023-34058
+
+Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/commit/e5be40b9cc025d03ccd5689ef9192d29abd68bfe]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ open-vm-tools/vgauth/common/certverify.c      | 145 +++++++++++++++++
+ open-vm-tools/vgauth/common/certverify.h      |   4 +
+ open-vm-tools/vgauth/common/prefs.h           |   2 +
+ .../vgauth/serviceImpl/saml-xmlsec1.c         |  14 ++
+ 4 files changed, 165 insertions(+), 0 deletions(-)
+
+diff --git a/open-vm-tools/vgauth/common/certverify.c b/open-vm-tools/vgauth/common/certverify.c
+index 0ed78edb..845f59b9 100644
+--- a/open-vm-tools/vgauth/common/certverify.c
++++ b/open-vm-tools/vgauth/common/certverify.c
+@@ -914,3 +914,148 @@ done:
+
+    return err;
+ }
++
++
++/*
++ * Finds a cert with a subject (if checkSubj is set) or issuer (if
++ * checkSUbj is unset), matching 'val' in the list
++ * of certs.  Returns a match or NULL.
++ */
++
++static X509 *
++FindCert(GList *cList,
++         X509_NAME *val,
++         int checkSubj)
++{
++   GList *l;
++   X509 *c;
++   X509_NAME *v;
++
++   l = cList;
++   while (l != NULL) {
++      c = (X509 *) l->data;
++      if (checkSubj) {
++         v = X509_get_subject_name(c);
++      } else {
++         v = X509_get_issuer_name(c);
++      }
++      if (X509_NAME_cmp(val, v) == 0) {
++         return c;
++      }
++      l = l->next;
++   }
++   return NULL;
++}
++
++
++/*
++ ******************************************************************************
++ * CertVerify_CheckForUnrelatedCerts --                                  */ /**
++ *
++ * Looks over a list of certs.  If it finds that they are not all
++ * part of the same chain, returns failure.
++ *
++ * @param[in]     numCerts      The number of certs in the chain.
++ * @param[in]     pemCerts      The chain of certificates to verify.
++ *
++ * @return VGAUTH_E_OK on success, VGAUTH_E_FAIL if unrelated certs are found.
++ *
++ ******************************************************************************
++ */
++
++VGAuthError
++CertVerify_CheckForUnrelatedCerts(int numCerts,
++                                  const char **pemCerts)
++{
++   VGAuthError err = VGAUTH_E_FAIL;
++   int chainLen = 0;
++   int i;
++   X509 **certs = NULL;
++   GList *rawList = NULL;
++   X509 *baseCert;
++   X509 *curCert;
++   X509_NAME *subject;
++   X509_NAME *issuer;
++
++   /* common single cert case; nothing to do */
++   if (numCerts == 1) {
++      return VGAUTH_E_OK;
++   }
++
++   /* convert all PEM to X509 objects */
++   certs = g_malloc0(numCerts * sizeof(X509 *));
++   for (i = 0; i < numCerts; i++) {
++      certs[i] = CertStringToX509(pemCerts[i]);
++      if (NULL == certs[i]) {
++         g_warning("%s: failed to convert cert to X509\n", __FUNCTION__);
++         goto done;
++      }
++   }
++
++   /* choose the cert to start the chain.  shouldn't matter which */
++   baseCert = certs[0];
++
++   /* put the rest into a list */
++   for (i = 1; i < numCerts; i++) {
++      rawList = g_list_append(rawList, certs[i]);
++   }
++
++   /* now chase down to a leaf, looking for certs the baseCert issued */
++   subject = X509_get_subject_name(baseCert);
++   while ((curCert = FindCert(rawList, subject, 0)) != NULL) {
++      /* pull it from the list */
++      rawList = g_list_remove(rawList, curCert);
++      /* set up the next find */
++      subject = X509_get_subject_name(curCert);
++   }
++
++   /*
++    * walk up to the root cert, by finding a cert where the
++    * issuer equals the subject of the current
++    */
++   issuer = X509_get_issuer_name(baseCert);
++   while ((curCert = FindCert(rawList, issuer, 1)) != NULL) {
++      /* pull it from the list */
++      rawList = g_list_remove(rawList, curCert);
++      /* set up the next find */
++      issuer = X509_get_issuer_name(curCert);
++   }
++
++   /*
++    * At this point, anything on the list should be certs that are not part
++    * of the chain that includes the original 'baseCert'.
++    *
++    * For a valid token, the list should be empty.
++    */
++   chainLen = g_list_length(rawList);
++   if (chainLen != 0 ) {
++      GList *l;
++
++      g_warning("%s: %d unrelated certs found in list\n",
++                __FUNCTION__, chainLen);
++
++      /* debug helper */
++      l = rawList;
++      while (l != NULL) {
++         X509* c = (X509 *) l->data;
++         char *s = X509_NAME_oneline(X509_get_subject_name(c), NULL, 0);
++
++         g_debug("%s: unrelated cert subject: %s\n", __FUNCTION__, s);
++         free(s);
++         l = l->next;
++      }
++
++      goto done;
++   }
++
++   g_debug("%s: Success!  no unrelated certs found\n", __FUNCTION__);
++   err = VGAUTH_E_OK;
++
++done:
++   g_list_free(rawList);
++   for (i = 0; i < numCerts; i++) {
++      X509_free(certs[i]);
++   }
++   g_free(certs);
++   return err;
++}
+diff --git a/open-vm-tools/vgauth/common/certverify.h b/open-vm-tools/vgauth/common/certverify.h
+index d7c6410b..89ec97a1 100644
+--- a/open-vm-tools/vgauth/common/certverify.h
++++ b/open-vm-tools/vgauth/common/certverify.h
+@@ -67,6 +67,10 @@ VGAuthError CertVerify_CheckSignatureUsingCert(VGAuthHashAlg hash,
+                                                size_t signatureLen,
+                                                const unsigned char *signature);
+
++
++VGAuthError CertVerify_CheckForUnrelatedCerts(int numCerts,
++                                              const char **pemCerts);
++
+ gchar * CertVerify_StripPEMCert(const gchar *pemCert);
+
+ gchar * CertVerify_CertToX509String(const gchar *pemCert);
+diff --git a/open-vm-tools/vgauth/common/prefs.h b/open-vm-tools/vgauth/common/prefs.h
+index ff116928..6c58f3f4 100644
+--- a/open-vm-tools/vgauth/common/prefs.h
++++ b/open-vm-tools/vgauth/common/prefs.h
+@@ -136,6 +136,8 @@ msgCatalog = /etc/vmware-tools/vgauth/messages
+ #define VGAUTH_PREF_ALIASSTORE_DIR         "aliasStoreDir"
+ /** The number of seconds slack allowed in either direction in SAML token date checks. */
+ #define VGAUTH_PREF_CLOCK_SKEW_SECS        "clockSkewAdjustment"
++/** If unrelated certificates are allowed in a SAML token */
++#define VGAUTH_PREF_ALLOW_UNRELATED_CERTS  "allowUnrelatedCerts"
+
+ /** Ticket group name. */
+ #define VGAUTH_PREF_GROUP_NAME_TICKET      "ticket"
+diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+index 14cba1b5..57e93162 100644
+--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+@@ -49,6 +49,7 @@
+ #include "vmxlog.h"
+
+ static int gClockSkewAdjustment = VGAUTH_PREF_DEFAULT_CLOCK_SKEW_SECS;
++static gboolean gAllowUnrelatedCerts = FALSE;
+ static xmlSchemaPtr gParsedSchemas = NULL;
+ static xmlSchemaValidCtxtPtr gSchemaValidateCtx = NULL;
+
+@@ -369,6 +370,10 @@ LoadPrefs(void)
+                                       VGAUTH_PREF_DEFAULT_CLOCK_SKEW_SECS);
+     Log("%s: Allowing %d of clock skew for SAML date validation\n",
+         __FUNCTION__, gClockSkewAdjustment);
++    gAllowUnrelatedCerts = Pref_GetBool(gPrefs,
++                                        VGAUTH_PREF_ALLOW_UNRELATED_CERTS,
++                                        VGAUTH_PREF_GROUP_NAME_SERVICE,
++                                        FALSE);
+ }
+
+
+@@ -1697,6 +1702,15 @@ SAML_VerifyBearerTokenAndChain(const char *xmlText,
+       return VGAUTH_E_AUTHENTICATION_DENIED;
+    }
+
++   if (!gAllowUnrelatedCerts) {
++      err = CertVerify_CheckForUnrelatedCerts(num, (const char **) certChain);
++      if (err != VGAUTH_E_OK) {
++         VMXLog_Log(VMXLOG_LEVEL_WARNING,
++                    "Unrelated certs found in SAML token, failing\n");
++         return VGAUTH_E_AUTHENTICATION_DENIED;
++      }
++   }
++
+    subj.type = SUBJECT_TYPE_NAMED;
+    subj.name = *subjNameOut;
+    err = ServiceVerifyAndCheckTrustCertChainForSubject(num,
+--
+2.40.0
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
index e12e4be7f..a8e7275c1 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0001-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
            file://CVE-2023-20867.patch;patchdir=.. \
+           file://CVE-2023-34058.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.0


