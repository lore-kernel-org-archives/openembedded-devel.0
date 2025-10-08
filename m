Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACC3CCD187
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.554.1759945900831145395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 10:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eD0m95O1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23769bf0b3=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598BQkXm1706499
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 17:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=H05WMi5ifUIJ41wxUkWG
	IXZD+NAGqVxqke40QDr1j+U=; b=eD0m95O1LwB53oUgNpcqDsCGaDQOMvvch9J3
	/3T2zoKUuDTwWpNclgm+eLzwWqFkk4+cyU9QL1zh6YqatkJVBJSaWFD/pAI9o3LO
	/lQKyu1dVgbDLG9cLrgIM6um1Nr6GLeyIl6zQ0cPxQJMz5iY0Q0CCdJMiejKaLtZ
	Hs2cCtcEC9nWnJJdp7fm5R3qr/bduE8ExY4t6+7ofDAXBDzZ5St72EXI67I5gqbH
	X5q6MS2awK/ztWzRrzDnevrobFVTv1xnpsu9RpyWmyUtMeU5XVek1A6XHOyYpQaP
	7I+BXF4SLnlkv8x3Nf7XEhRvYSeYGZOsQuMK8N1+BWpxPDXgYg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgvvsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:51:39 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 10:51:37 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][walnascar][PATCH  1/1] open-vm-tools: upgrade 12.5.0 -> 12.5.4
Date: Wed, 8 Oct 2025 23:21:23 +0530
Message-ID: <20251008175123.2756523-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: JRgOih7eVCv0jQasmccCzsBm42wo_pmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyNSBTYWx0ZWRfX5VTq0M2ziPb+
 cX+wKS1eihurCPIeeUqnURaeKNrMc/GQ+kQHe3oYMWPdNTG+BofyNwTOsxXxgACk4E2SIHMcb4R
 4t/ezGgFhgbzPR6h6Hz7aW8NLxpSfCbe+6kabaVD8V6a/p5nKMOueT1pKHwLh7yXco4L3G0pnt4
 IdiMSzT7f8AWkv57tEhR8bZLzABKC943UFcJDj1/r26oFMYjNRWCsBYCIPnplzNPT0wwJi/t9Hi
 oTL0JLWYxqX6biT9Lx7OxXhA0pFIcQ/itsXh9L+1lfABrX7CjjSPK14WT8aOHHLmuu9nPbDFRSg
 advj+PhSVFBWpPR8KQ1GZ5WFPfnSiHdUNX6GRRL2H/fJLQ3whc3Zvopn8fGJ2Q0qHj8O/s9Ve25
 4zK9vZEGMxjAmWDUJgYlWQsdE4GO9Q==
X-Proofpoint-ORIG-GUID: JRgOih7eVCv0jQasmccCzsBm42wo_pmI
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e6a4ab cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=4appmw-hzXQA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8 a=oj5DXHB4kklBcQX0flkA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120375

this release addressed below CVEs:
CVE-2025-22247
CVE-2025-41244

Changelog:
https://github.com/vmware/open-vm-tools/releases

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 .../open-vm-tools/CVE-2025-22247.patch        | 378 ------------------
 ...ools_12.5.0.bb => open-vm-tools_12.5.4.bb} |   3 +-
 2 files changed, 1 insertion(+), 380 deletions(-)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.5.0.bb => open-vm-tools_12.5.4.bb} (98%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
deleted file mode 100644
index 2141443a1f..0000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
+++ /dev/null
@@ -1,378 +0,0 @@
-From 7874e572b5aac5a418551dc5e3935c1e74bf6f1f Mon Sep 17 00:00:00 2001
-From: John Wolfe <john.wolfe@broadcom.com>
-Date: Mon, 5 May 2025 15:58:03 -0700
-Subject: [PATCH] Validate user names and file paths
-
-Prevent usage of illegal characters in user names and file paths.
-Also, disallow unexpected symlinks in file paths.
-
-This patch contains changes to common source files not applicable
-to open-vm-tools.
-
-All files being updated should be consider to have the copyright to
-be updated to:
-
- * Copyright (c) XXXX-2025 Broadcom. All Rights Reserved.
- * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
-
-The 2025 Broadcom copyright information update is not part of this
-patch set to allow the patch to be easily applied to previous
-open-vm-tools source releases.
-
-CVE: CVE-2025-22247
-Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/blob/CVE-2025-22247.patch/CVE-2025-22247-1230-1250-VGAuth-updates.patch]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- open-vm-tools/vgauth/common/VGAuthUtil.c      | 33 +++++++++
- open-vm-tools/vgauth/common/VGAuthUtil.h      |  2 +
- open-vm-tools/vgauth/common/prefs.h           |  3 +
- open-vm-tools/vgauth/common/usercheck.c       | 22 +++++-
- open-vm-tools/vgauth/serviceImpl/alias.c      | 74 ++++++++++++++++++-
- open-vm-tools/vgauth/serviceImpl/service.c    | 27 +++++++
- open-vm-tools/vgauth/serviceImpl/serviceInt.h |  1 +
- 7 files changed, 159 insertions(+), 3 deletions(-)
-
-diff --git a/open-vm-tools/vgauth/common/VGAuthUtil.c b/open-vm-tools/vgauth/common/VGAuthUtil.c
-index 76383c46..06f1b51c 100644
---- a/open-vm-tools/vgauth/common/VGAuthUtil.c
-+++ b/open-vm-tools/vgauth/common/VGAuthUtil.c
-@@ -309,3 +309,36 @@ Util_Assert(const char *cond,
- #endif
-    g_assert(0);
- }
-+
-+
-+/*
-++ ******************************************************************************
-+ * Util_Utf8CaseCmp --                                                   */ /**
-+ *
-+ * Case insensitive comparison for utf8 strings which can have non-ascii
-+ * characters.
-+ *
-+ * @param[in]  str1      Null terminated utf8 string.
-+ * @param[in]  str2      Null terminated utf8 string.
-+ *
-+ ******************************************************************************
-+ */
-+
-+int
-+Util_Utf8CaseCmp(const gchar *str1,
-+                 const gchar *str2)
-+{
-+   int ret;
-+   gchar *str1Case;
-+   gchar *str2Case;
-+
-+   str1Case = g_utf8_casefold(str1, -1);
-+   str2Case = g_utf8_casefold(str2, -1);
-+
-+   ret = g_strcmp0(str1Case, str2Case);
-+
-+   g_free(str1Case);
-+   g_free(str2Case);
-+
-+   return ret;
-+}
-diff --git a/open-vm-tools/vgauth/common/VGAuthUtil.h b/open-vm-tools/vgauth/common/VGAuthUtil.h
-index f7f3aa21..ef32a91d 100644
---- a/open-vm-tools/vgauth/common/VGAuthUtil.h
-+++ b/open-vm-tools/vgauth/common/VGAuthUtil.h
-@@ -105,4 +105,6 @@ gboolean Util_CheckExpiration(const GTimeVal *start, unsigned int duration);
- 
- void Util_Assert(const char *cond, const char *file, int lineNum);
- 
-+int Util_Utf8CaseCmp(const gchar *str1, const gchar *str2);
-+
- #endif
-diff --git a/open-vm-tools/vgauth/common/prefs.h b/open-vm-tools/vgauth/common/prefs.h
-index 6c58f3f4..3299eb26 100644
---- a/open-vm-tools/vgauth/common/prefs.h
-+++ b/open-vm-tools/vgauth/common/prefs.h
-@@ -167,6 +167,9 @@ msgCatalog = /etc/vmware-tools/vgauth/messages
- /** Where the localized version of the messages were installed. */
- #define VGAUTH_PREF_LOCALIZATION_DIR        "msgCatalog"
- 
-+/** If symlinks or junctions are allowed in alias store file path */
-+#define VGAUTH_PREF_ALLOW_SYMLINKS  "allowSymlinks"
-+
- /*
-  * Pref values
-  */
-diff --git a/open-vm-tools/vgauth/common/usercheck.c b/open-vm-tools/vgauth/common/usercheck.c
-index 3beede2e..8b4cbacb 100644
---- a/open-vm-tools/vgauth/common/usercheck.c
-+++ b/open-vm-tools/vgauth/common/usercheck.c
-@@ -78,6 +78,8 @@
-  * Solaris as well, but that path is untested.
-  */
- 
-+#define MAX_USER_NAME_LEN 256
-+
- /*
-  * A single retry works for the LDAP case, but try more often in case NIS
-  * or something else has a related issue.  Note that a bad username/uid won't
-@@ -354,12 +356,28 @@ Usercheck_UsernameIsLegal(const gchar *userName)
-     * restricted list for local usernames.
-     */
-    size_t len;
--   char *illegalChars = "<>/";
-+   size_t i = 0;
-+   int backSlashCnt = 0;
-+   /*
-+    * As user names are used to generate its alias store file name/path, it
-+    * should not contain path traversal characters ('/' and '\').
-+    */
-+   char *illegalChars = "<>/\\";
- 
-    len = strlen(userName);
--   if (strcspn(userName, illegalChars) != len) {
-+   if (len > MAX_USER_NAME_LEN) {
-       return FALSE;
-    }
-+
-+   while ((i += strcspn(userName + i, illegalChars)) < len) {
-+      /*
-+       * One backward slash is allowed for domain\username separator.
-+       */
-+      if (userName[i] != '\\' || ++backSlashCnt > 1) {
-+         return FALSE;
-+      }
-+      ++i;
-+   }
-    return TRUE;
- }
- 
-diff --git a/open-vm-tools/vgauth/serviceImpl/alias.c b/open-vm-tools/vgauth/serviceImpl/alias.c
-index 4e170202..c7040ebf 100644
---- a/open-vm-tools/vgauth/serviceImpl/alias.c
-+++ b/open-vm-tools/vgauth/serviceImpl/alias.c
-@@ -41,6 +41,7 @@
- #include "certverify.h"
- #include "VGAuthProto.h"
- #include "vmxlog.h"
-+#include "VGAuthUtil.h"
- 
- // puts the identity store in an easy to find place
- #undef WIN_TEST_MODE
-@@ -66,6 +67,7 @@
- #define ALIASSTORE_FILE_PREFIX   "user-"
- #define ALIASSTORE_FILE_SUFFIX   ".xml"
- 
-+static gboolean allowSymlinks = FALSE;
- static gchar *aliasStoreRootDir = DEFAULT_ALIASSTORE_ROOT_DIR;
- 
- #ifdef _WIN32
-@@ -252,6 +254,12 @@ mapping file layout:
- 
-  */
- 
-+#ifdef _WIN32
-+#define ISPATHSEP(c)  ((c) == '\\' || (c) == '/')
-+#else
-+#define ISPATHSEP(c)  ((c) == '/')
-+#endif
-+
- 
- /*
-  ******************************************************************************
-@@ -466,6 +474,7 @@ ServiceLoadFileContentsWin(const gchar *fileName,
-    gunichar2 *fileNameW = NULL;
-    BOOL ok;
-    DWORD bytesRead;
-+   gchar *realPath = NULL;
- 
-    *fileSize = 0;
-    *contents = NULL;
-@@ -622,6 +631,22 @@ ServiceLoadFileContentsWin(const gchar *fileName,
-       goto done;
-    }
- 
-+   if (!allowSymlinks) {
-+      /*
-+       * Check if fileName is real path.
-+       */
-+      if ((realPath = ServiceFileGetPathByHandle(hFile)) == NULL) {
-+         err = VGAUTH_E_FAIL;
-+         goto done;
-+      }
-+      if (Util_Utf8CaseCmp(realPath, fileName) != 0) {
-+         Warning("%s: Real path (%s) is not same as file path (%s)\n",
-+                 __FUNCTION__, realPath, fileName);
-+         err = VGAUTH_E_FAIL;
-+         goto done;
-+      }
-+   }
-+
-    /*
-     * Now finally read the contents.
-     */
-@@ -650,6 +675,7 @@ done:
-       CloseHandle(hFile);
-    }
-    g_free(fileNameW);
-+   g_free(realPath);
- 
-    return err;
- }
-@@ -672,6 +698,7 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
-    gchar *buf;
-    gchar *bp;
-    int fd = -1;
-+   gchar realPath[PATH_MAX] = { 0 };
- 
-    *fileSize = 0;
-    *contents = NULL;
-@@ -817,6 +844,23 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
-       goto done;
-    }
- 
-+   if (!allowSymlinks) {
-+      /*
-+       * Check if fileName is real path.
-+       */
-+      if (realpath(fileName, realPath) == NULL) {
-+         Warning("%s: realpath() failed. errno (%d)\n", __FUNCTION__, errno);
-+         err = VGAUTH_E_FAIL;
-+         goto done;
-+      }
-+      if (g_strcmp0(realPath, fileName) != 0) {
-+         Warning("%s: Real path (%s) is not same as file path (%s)\n",
-+                 __FUNCTION__, realPath, fileName);
-+         err = VGAUTH_E_FAIL;
-+         goto done;
-+      }
-+   }
-+
-    /*
-     * All confidence checks passed; read the bits.
-     */
-@@ -2803,8 +2847,13 @@ ServiceAliasRemoveAlias(const gchar *reqUserName,
- 
-    /*
-     * We don't verify the user exists in a Remove operation, to allow
--    * cleanup of deleted user's stores.
-+    * cleanup of deleted user's stores, but we do check whether the
-+    * user name is legal or not.
-     */
-+   if (!Usercheck_UsernameIsLegal(userName)) {
-+      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
-+      return VGAUTH_E_FAIL;
-+   }
- 
-    if (!CertVerify_IsWellFormedPEMCert(pemCert)) {
-       return VGAUTH_E_INVALID_CERTIFICATE;
-@@ -3036,6 +3085,16 @@ ServiceAliasQueryAliases(const gchar *userName,
-    }
- #endif
- 
-+   /*
-+    * We don't verify the user exists in a Query operation to allow
-+    * cleaning up after a deleted user, but we do check whether the
-+    * user name is legal or not.
-+    */
-+   if (!Usercheck_UsernameIsLegal(userName)) {
-+      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
-+      return VGAUTH_E_FAIL;
-+   }
-+
-    err = AliasLoadAliases(userName, num, aList);
-    if (VGAUTH_E_OK != err) {
-       Warning("%s: failed to load Aliases for '%s'\n", __FUNCTION__, userName);
-@@ -3294,6 +3353,7 @@ ServiceAliasInitAliasStore(void)
-    VGAuthError err = VGAUTH_E_OK;
-    gboolean saveBadDir = FALSE;
-    char *defaultDir = NULL;
-+   size_t len;
- 
- #ifdef _WIN32
-    {
-@@ -3324,6 +3384,10 @@ ServiceAliasInitAliasStore(void)
-    defaultDir = g_strdup(DEFAULT_ALIASSTORE_ROOT_DIR);
- #endif
- 
-+   allowSymlinks = Pref_GetBool(gPrefs,
-+                                VGAUTH_PREF_ALLOW_SYMLINKS,
-+                                VGAUTH_PREF_GROUP_NAME_SERVICE,
-+                                FALSE);
-    /*
-     * Find the alias store directory.  This allows an installer to put
-     * it somewhere else if necessary.
-@@ -3337,6 +3401,14 @@ ServiceAliasInitAliasStore(void)
-                                       VGAUTH_PREF_GROUP_NAME_SERVICE,
-                                       defaultDir);
- 
-+   /*
-+    * Remove the trailing separator if any from aliasStoreRootDir path.
-+    */
-+   len = strlen(aliasStoreRootDir);
-+   if (ISPATHSEP(aliasStoreRootDir[len - 1])) {
-+      aliasStoreRootDir[len - 1] = '\0';
-+   }
-+
-    Log("Using '%s' for alias store root directory\n", aliasStoreRootDir);
- 
-    g_free(defaultDir);
-diff --git a/open-vm-tools/vgauth/serviceImpl/service.c b/open-vm-tools/vgauth/serviceImpl/service.c
-index d4716526..e053ed0f 100644
---- a/open-vm-tools/vgauth/serviceImpl/service.c
-+++ b/open-vm-tools/vgauth/serviceImpl/service.c
-@@ -28,6 +28,7 @@
- #include "VGAuthUtil.h"
- #ifdef _WIN32
- #include "winUtil.h"
-+#include <glib.h>
- #endif
- 
- static ServiceStartListeningForIOFunc startListeningIOFunc = NULL;
-@@ -283,9 +284,35 @@ static gchar *
- ServiceUserNameToPipeName(const char *userName)
- {
-    gchar *escapedName = ServiceEncodeUserName(userName);
-+#ifdef _WIN32
-+   /*
-+    * Adding below pragma only in windows to suppress the compile time warning
-+    * about unavailability of g_uuid_string_random() since compiler flag
-+    * GLIB_VERSION_MAX_ALLOWED is defined to GLIB_VERSION_2_34.
-+    * TODO: Remove below pragma when GLIB_VERSION_MAX_ALLOWED is bumped up to
-+    * or greater than GLIB_VERSION_2_52.
-+    */
-+#pragma warning(suppress : 4996)
-+   gchar *uuidStr = g_uuid_string_random();
-+   /*
-+    * Add a unique suffix to avoid a name collision with an existing named pipe
-+    * created by someone else (intentionally or by accident).
-+    * This is not needed for Linux; name collisions on sockets are already
-+    * avoided there since (1) file system paths to VGAuthService sockets are in
-+    * a directory that is writable only by root and (2) VGAuthService unlinks a
-+    * socket path before binding it to a newly created socket.
-+    */
-+   gchar *pipeName = g_strdup_printf("%s-%s-%s",
-+                                     SERVICE_PUBLIC_PIPE_NAME,
-+                                     escapedName,
-+                                     uuidStr);
-+
-+   g_free(uuidStr);
-+#else
-    gchar *pipeName = g_strdup_printf("%s-%s",
-                                      SERVICE_PUBLIC_PIPE_NAME,
-                                      escapedName);
-+#endif
- 
-    g_free(escapedName);
-    return pipeName;
-diff --git a/open-vm-tools/vgauth/serviceImpl/serviceInt.h b/open-vm-tools/vgauth/serviceImpl/serviceInt.h
-index 5f420192..f4f88547 100644
---- a/open-vm-tools/vgauth/serviceImpl/serviceInt.h
-+++ b/open-vm-tools/vgauth/serviceImpl/serviceInt.h
-@@ -441,6 +441,7 @@ VGAuthError ServiceFileVerifyAdminGroupOwnedByHandle(const HANDLE hFile);
- VGAuthError ServiceFileVerifyEveryoneReadableByHandle(const HANDLE hFile);
- VGAuthError ServiceFileVerifyUserAccessByHandle(const HANDLE hFile,
-                                                 const char *userName);
-+gchar *ServiceFileGetPathByHandle(HANDLE hFile);
- #else
- VGAuthError ServiceFileVerifyFileOwnerAndPerms(const char *fileName,
-                                                const char *userName,
--- 
-2.40.0
-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.4.bb
similarity index 98%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.4.bb
index 8f7c05b994..34ba7f546f 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.4.bb
@@ -43,7 +43,6 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
-           file://CVE-2025-22247.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
@@ -51,7 +50,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "f2ca37ef3510543172657b82493d1eceefa9a134"
+SRCREV = "49ebc382812d037b185720bd72d56b4ed0f4a7c6"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.48.1


