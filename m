Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B62C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 05:25:35 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.7027.1752211527935783137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 22:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q8mNmrb3;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b34c068faf8so1937078a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752211527; x=1752816327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYsuyruuEXtHfF7c8+Ja4Cp/JxOFXqF4xZu9Yr8jjQ8=;
        b=Q8mNmrb3STdxc6CjFFAZI8+NNq31OhIRRFBSLUhPlfXBJvnwT5fpI86uZefl7rz82e
         3hxWVqT8IZZ2Gi+CeQ0ZLutoIuGdOFI+kCN2tq77E0V8jCWXMhAsAL4odhw/rRqEbWhw
         wPhEPrggNGA3XjowibkxwehHR4UI/XN2AHhCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752211527; x=1752816327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYsuyruuEXtHfF7c8+Ja4Cp/JxOFXqF4xZu9Yr8jjQ8=;
        b=Q/mLer62SkSr3ooSEzr6JbHpc7YpniyTS4EhVeI+obfl5vYqHEqSjPHsG2XcRnfjWl
         43RO30HSHIJle108FFSD6I7DR7Wa84qxEPCmU6eR5riuqHCh/kKf3ylbdStIy7s5LN/u
         bpWarwu7G4YtIJQy5TpcBaNE2TYMSX1YpXxCv9X1rmcZNvLPzE0sUnIoCC27V2zM7vhe
         L3lBmcVlsEI+UacGjHaEQbqhcWTXgB4lc0iB+lP/g27uGXU03er07NA8/2rVHnpaFhCY
         5aiE665RIfdtf5tuJqX1mP/r+csLdusXFhloyX+QSalaz3V8gJcithaMcWplcy0h/EsL
         UnIQ==
X-Gm-Message-State: AOJu0Yw0Sf2g0i062J2Ppcd0JkE/cS4fo76w+XZIfRuityUisp/Pve1+
	UVCq/m6qAChZWhZD2HKzYbeXW0WCnHvR/DzfjuwOqWMAVbmIMh/BdbiVCNSv5avuUP4uSaUhGPQ
	MUj9n
X-Gm-Gg: ASbGncuJDT/X98+3tHRqXukL9294E8LZdNcP6Txotc5Myf2RPA+HGP62JcMdpvOugKa
	YF/FlXYUu/tZhMfXBw5FztHiGAWXKA8p1cv31IwkdqcqHlU6VJCJbXpPIaFo6+N/zK5Z6ZhQJ/W
	mgamBBlHqL6+iEhngEOsFmdcUjlbpeJUMYfmBL5rEaALfomU6yrsGreDM2CNaPBBtiYRf56L4yl
	CihaOFdiPUgHfPaJCSlbG4AooG2YNNYcEZkJkaaIsa4s+o9BV/qYoXIN3RHKYIEdIYQMh4gSKsr
	+0tF7wSBb+0Cqrb8JoNBMHWBOMsChMnsdHhasC6RIoR18sEXc+zVPaU6wiLx+hO0yTrdYbud8oC
	4vi1J2+6NW2Gti9muxp7kVtBo4aMxJ1MPpzM=
X-Google-Smtp-Source: AGHT+IFCEmywFqt0aCz4wj9YDhyxt0WX+oiBONxJa/PpEC9tvw7Oi1cjmYXLPkx15JASpshDPDwAXA==
X-Received: by 2002:a05:6a21:6d8d:b0:203:bb65:995a with SMTP id adf61e73a8af0-231202f2489mr3694434637.30.1752211526780;
        Thu, 10 Jul 2025 22:25:26 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5a7csm3843754b3a.28.2025.07.10.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 22:25:26 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] open-vm-tools: fix CVE-2025-22247
Date: Fri, 11 Jul 2025 10:55:13 +0530
Message-ID: <20250711052513.195261-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 05:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118428

Upstream-Status: Backport from https://github.com/vmware/open-vm-tools/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../open-vm-tools/CVE-2025-22247.patch        | 383 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |   1 +
 2 files changed, 384 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
new file mode 100644
index 0000000000..e70fd9b7d7
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
@@ -0,0 +1,383 @@
+From 2a2607c6bd94ae22a937fd2adde7472d9a6d506c Mon Sep 17 00:00:00 2001
+From: John Wolfe <john.wolfe@broadcom.com>
+Date: Mon, 5 May 2025 16:10:07 -0700
+Subject: [PATCH] Validate user names and file paths
+
+Prevent usage of illegal characters in user names and file paths.
+Also, disallow unexpected symlinks in file paths.
+
+This patch contains changes to common source files not applicable
+to open-vm-tools.
+
+All files being updated should be consider to have the copyright to
+be updated to:
+
+ * Copyright (c) XXXX-2025 Broadcom. All Rights Reserved.
+ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+
+The 2025 Broadcom copyright information update is not part of this
+patch set to allow the patch to be easily applied to previous
+open-vm-tools source releases.
+
+Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch]
+CVE: CVE-2025-22247
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ open-vm-tools/vgauth/common/VGAuthUtil.c      | 33 +++++++++
+ open-vm-tools/vgauth/common/VGAuthUtil.h      |  2 +
+ open-vm-tools/vgauth/common/prefs.h           |  3 +
+ open-vm-tools/vgauth/common/usercheck.c       | 28 +++++--
+ open-vm-tools/vgauth/serviceImpl/alias.c      | 74 ++++++++++++++++++-
+ open-vm-tools/vgauth/serviceImpl/service.c    | 27 +++++++
+ open-vm-tools/vgauth/serviceImpl/serviceInt.h |  1 +
+ 7 files changed, 160 insertions(+), 8 deletions(-)
+
+diff --git a/open-vm-tools/vgauth/common/VGAuthUtil.c b/open-vm-tools/vgauth/common/VGAuthUtil.c
+index 76383c462..9c2adb8d0 100644
+--- a/open-vm-tools/vgauth/common/VGAuthUtil.c
++++ b/open-vm-tools/vgauth/common/VGAuthUtil.c
+@@ -309,3 +309,36 @@ Util_Assert(const char *cond,
+ #endif
+    g_assert(0);
+ }
++
++
++/*
++ ******************************************************************************
++ * Util_Utf8CaseCmp --                                                   */ /**
++ *
++ * Case insensitive comparison for utf8 strings which can have non-ascii
++ * characters.
++ *
++ * @param[in]  str1      Null terminated utf8 string.
++ * @param[in]  str2      Null terminated utf8 string.
++ *
++ ******************************************************************************
++ */
++
++int
++Util_Utf8CaseCmp(const gchar *str1,
++                 const gchar *str2)
++{
++   int ret;
++   gchar *str1Case;
++   gchar *str2Case;
++
++   str1Case = g_utf8_casefold(str1, -1);
++   str2Case = g_utf8_casefold(str2, -1);
++
++   ret = g_strcmp0(str1Case, str2Case);
++
++   g_free(str1Case);
++   g_free(str2Case);
++
++   return ret;
++}
+diff --git a/open-vm-tools/vgauth/common/VGAuthUtil.h b/open-vm-tools/vgauth/common/VGAuthUtil.h
+index f7f3aa216..ef32a91da 100644
+--- a/open-vm-tools/vgauth/common/VGAuthUtil.h
++++ b/open-vm-tools/vgauth/common/VGAuthUtil.h
+@@ -105,4 +105,6 @@ gboolean Util_CheckExpiration(const GTimeVal *start, unsigned int duration);
+ 
+ void Util_Assert(const char *cond, const char *file, int lineNum);
+ 
++int Util_Utf8CaseCmp(const gchar *str1, const gchar *str2);
++
+ #endif
+diff --git a/open-vm-tools/vgauth/common/prefs.h b/open-vm-tools/vgauth/common/prefs.h
+index 87ccc9b37..689b9e2cf 100644
+--- a/open-vm-tools/vgauth/common/prefs.h
++++ b/open-vm-tools/vgauth/common/prefs.h
+@@ -167,6 +167,9 @@ msgCatalog = /etc/vmware-tools/vgauth/messages
+ /** Where the localized version of the messages were installed. */
+ #define VGAUTH_PREF_LOCALIZATION_DIR        "msgCatalog"
+ 
++/** If symlinks or junctions are allowed in alias store file path */
++#define VGAUTH_PREF_ALLOW_SYMLINKS  "allowSymlinks"
++
+ /*
+  * Pref values
+  */
+diff --git a/open-vm-tools/vgauth/common/usercheck.c b/open-vm-tools/vgauth/common/usercheck.c
+index 31eeb5a77..145f1f056 100644
+--- a/open-vm-tools/vgauth/common/usercheck.c
++++ b/open-vm-tools/vgauth/common/usercheck.c
+@@ -78,6 +78,8 @@
+  * Solaris as well, but that path is untested.
+  */
+ 
++#define MAX_USER_NAME_LEN 256
++
+ /*
+  * A single retry works for the LDAP case, but try more often in case NIS
+  * or something else has a related issue.  Note that a bad username/uid won't
+@@ -354,17 +356,29 @@ Usercheck_UsernameIsLegal(const gchar *userName)
+     *
+     */
+    size_t len;
+-#ifdef _WIN32
+-   // allow '\' in for Windows domain usernames
+-   char *illegalChars = "<>/";
+-#else
+-   char *illegalChars = "\\<>/";
+-#endif
++   size_t i = 0;
++   int backSlashCnt = 0;
++   /*
++    * As user names are used to generate its alias store file name/path, it
++    * should not contain path traversal characters ('/' and '\').
++    */
++   char *illegalChars = "<>/\\";
+ 
+    len = strlen(userName);
+-   if (strcspn(userName, illegalChars) != len) {
++   if (len > MAX_USER_NAME_LEN) {
+       return FALSE;
+    }
++
++   while ((i += strcspn(userName + i, illegalChars)) < len) {
++      /*
++       * One backward slash is allowed for domain\username separator.
++       */
++      if (userName[i] != '\\' || ++backSlashCnt > 1) {
++         return FALSE;
++      }
++      ++i;
++   }
++
+    return TRUE;
+ }
+ 
+diff --git a/open-vm-tools/vgauth/serviceImpl/alias.c b/open-vm-tools/vgauth/serviceImpl/alias.c
+index b28351eea..687d1b373 100644
+--- a/open-vm-tools/vgauth/serviceImpl/alias.c
++++ b/open-vm-tools/vgauth/serviceImpl/alias.c
+@@ -41,6 +41,7 @@
+ #include "certverify.h"
+ #include "VGAuthProto.h"
+ #include "vmxlog.h"
++#include "VGAuthUtil.h"
+ 
+ // puts the identity store in an easy to find place
+ #undef WIN_TEST_MODE
+@@ -66,6 +67,7 @@
+ #define ALIASSTORE_FILE_PREFIX   "user-"
+ #define ALIASSTORE_FILE_SUFFIX   ".xml"
+ 
++static gboolean allowSymlinks = FALSE;
+ static gchar *aliasStoreRootDir = DEFAULT_ALIASSTORE_ROOT_DIR;
+ 
+ #ifdef _WIN32
+@@ -252,6 +254,12 @@ mapping file layout:
+ 
+  */
+ 
++#ifdef _WIN32
++#define ISPATHSEP(c)  ((c) == '\\' || (c) == '/')
++#else
++#define ISPATHSEP(c)  ((c) == '/')
++#endif
++
+ 
+ /*
+  ******************************************************************************
+@@ -466,6 +474,7 @@ ServiceLoadFileContentsWin(const gchar *fileName,
+    gunichar2 *fileNameW = NULL;
+    BOOL ok;
+    DWORD bytesRead;
++   gchar *realPath = NULL;
+ 
+    *fileSize = 0;
+    *contents = NULL;
+@@ -622,6 +631,22 @@ ServiceLoadFileContentsWin(const gchar *fileName,
+       goto done;
+    }
+ 
++   if (!allowSymlinks) {
++      /*
++       * Check if fileName is real path.
++       */
++      if ((realPath = ServiceFileGetPathByHandle(hFile)) == NULL) {
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++      if (Util_Utf8CaseCmp(realPath, fileName) != 0) {
++         Warning("%s: Real path (%s) is not same as file path (%s)\n",
++                 __FUNCTION__, realPath, fileName);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++   }
++
+    /*
+     * Now finally read the contents.
+     */
+@@ -650,6 +675,7 @@ done:
+       CloseHandle(hFile);
+    }
+    g_free(fileNameW);
++   g_free(realPath);
+ 
+    return err;
+ }
+@@ -672,6 +698,7 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
+    gchar *buf;
+    gchar *bp;
+    int fd = -1;
++   gchar realPath[PATH_MAX] = { 0 };
+ 
+    *fileSize = 0;
+    *contents = NULL;
+@@ -817,6 +844,23 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
+       goto done;
+    }
+ 
++   if (!allowSymlinks) {
++      /*
++       * Check if fileName is real path.
++       */
++      if (realpath(fileName, realPath) == NULL) {
++         Warning("%s: realpath() failed. errno (%d)\n", __FUNCTION__, errno);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++      if (g_strcmp0(realPath, fileName) != 0) {
++         Warning("%s: Real path (%s) is not same as file path (%s)\n",
++                 __FUNCTION__, realPath, fileName);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++   }
++
+    /*
+     * All sanity checks passed; read the bits.
+     */
+@@ -2803,8 +2847,13 @@ ServiceAliasRemoveAlias(const gchar *reqUserName,
+ 
+    /*
+     * We don't verify the user exists in a Remove operation, to allow
+-    * cleanup of deleted user's stores.
++    * cleanup of deleted user's stores, but we do check whether the
++    * user name is legal or not.
+     */
++   if (!Usercheck_UsernameIsLegal(userName)) {
++      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
++      return VGAUTH_E_FAIL;
++   }
+ 
+    if (!CertVerify_IsWellFormedPEMCert(pemCert)) {
+       return VGAUTH_E_INVALID_CERTIFICATE;
+@@ -3036,6 +3085,16 @@ ServiceAliasQueryAliases(const gchar *userName,
+    }
+ #endif
+ 
++   /*
++    * We don't verify the user exists in a Query operation to allow
++    * cleaning up after a deleted user, but we do check whether the
++    * user name is legal or not.
++    */
++   if (!Usercheck_UsernameIsLegal(userName)) {
++      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
++      return VGAUTH_E_FAIL;
++   }
++
+    err = AliasLoadAliases(userName, num, aList);
+    if (VGAUTH_E_OK != err) {
+       Warning("%s: failed to load Aliases for '%s'\n", __FUNCTION__, userName);
+@@ -3294,6 +3353,7 @@ ServiceAliasInitAliasStore(void)
+    VGAuthError err = VGAUTH_E_OK;
+    gboolean saveBadDir = FALSE;
+    char *defaultDir = NULL;
++   size_t len;
+ 
+ #ifdef _WIN32
+    {
+@@ -3324,6 +3384,10 @@ ServiceAliasInitAliasStore(void)
+    defaultDir = g_strdup(DEFAULT_ALIASSTORE_ROOT_DIR);
+ #endif
+ 
++   allowSymlinks = Pref_GetBool(gPrefs,
++                                VGAUTH_PREF_ALLOW_SYMLINKS,
++                                VGAUTH_PREF_GROUP_NAME_SERVICE,
++                                FALSE);
+    /*
+     * Find the alias store directory.  This allows an installer to put
+     * it somewhere else if necessary.
+@@ -3337,6 +3401,14 @@ ServiceAliasInitAliasStore(void)
+                                       VGAUTH_PREF_GROUP_NAME_SERVICE,
+                                       defaultDir);
+ 
++   /*
++    * Remove the trailing separator if any from aliasStoreRootDir path.
++    */
++   len = strlen(aliasStoreRootDir);
++   if (ISPATHSEP(aliasStoreRootDir[len - 1])) {
++      aliasStoreRootDir[len - 1] = '\0';
++   }
++
+    Log("Using '%s' for alias store root directory\n", aliasStoreRootDir);
+ 
+    g_free(defaultDir);
+diff --git a/open-vm-tools/vgauth/serviceImpl/service.c b/open-vm-tools/vgauth/serviceImpl/service.c
+index d4716526c..e053ed0fa 100644
+--- a/open-vm-tools/vgauth/serviceImpl/service.c
++++ b/open-vm-tools/vgauth/serviceImpl/service.c
+@@ -28,6 +28,7 @@
+ #include "VGAuthUtil.h"
+ #ifdef _WIN32
+ #include "winUtil.h"
++#include <glib.h>
+ #endif
+ 
+ static ServiceStartListeningForIOFunc startListeningIOFunc = NULL;
+@@ -283,9 +284,35 @@ static gchar *
+ ServiceUserNameToPipeName(const char *userName)
+ {
+    gchar *escapedName = ServiceEncodeUserName(userName);
++#ifdef _WIN32
++   /*
++    * Adding below pragma only in windows to suppress the compile time warning
++    * about unavailability of g_uuid_string_random() since compiler flag
++    * GLIB_VERSION_MAX_ALLOWED is defined to GLIB_VERSION_2_34.
++    * TODO: Remove below pragma when GLIB_VERSION_MAX_ALLOWED is bumped up to
++    * or greater than GLIB_VERSION_2_52.
++    */
++#pragma warning(suppress : 4996)
++   gchar *uuidStr = g_uuid_string_random();
++   /*
++    * Add a unique suffix to avoid a name collision with an existing named pipe
++    * created by someone else (intentionally or by accident).
++    * This is not needed for Linux; name collisions on sockets are already
++    * avoided there since (1) file system paths to VGAuthService sockets are in
++    * a directory that is writable only by root and (2) VGAuthService unlinks a
++    * socket path before binding it to a newly created socket.
++    */
++   gchar *pipeName = g_strdup_printf("%s-%s-%s",
++                                     SERVICE_PUBLIC_PIPE_NAME,
++                                     escapedName,
++                                     uuidStr);
++
++   g_free(uuidStr);
++#else
+    gchar *pipeName = g_strdup_printf("%s-%s",
+                                      SERVICE_PUBLIC_PIPE_NAME,
+                                      escapedName);
++#endif
+ 
+    g_free(escapedName);
+    return pipeName;
+diff --git a/open-vm-tools/vgauth/serviceImpl/serviceInt.h b/open-vm-tools/vgauth/serviceImpl/serviceInt.h
+index ef49f42c2..c37f42fa6 100644
+--- a/open-vm-tools/vgauth/serviceImpl/serviceInt.h
++++ b/open-vm-tools/vgauth/serviceImpl/serviceInt.h
+@@ -441,6 +441,7 @@ VGAuthError ServiceFileVerifyAdminGroupOwnedByHandle(const HANDLE hFile);
+ VGAuthError ServiceFileVerifyEveryoneReadableByHandle(const HANDLE hFile);
+ VGAuthError ServiceFileVerifyUserAccessByHandle(const HANDLE hFile,
+                                                 const char *userName);
++gchar *ServiceFileGetPathByHandle(HANDLE hFile);
+ #else
+ VGAuthError ServiceFileVerifyFileOwnerAndPerms(const char *fileName,
+                                                const char *userName,
+-- 
+2.49.0
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 762ac4c0e9..b58b3ddb90 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://CVE-2023-20900.patch;patchdir=.. \
            file://CVE-2023-34058.patch;patchdir=.. \
            file://CVE-2023-34059.patch;patchdir=.. \
+           file://CVE-2025-22247.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


