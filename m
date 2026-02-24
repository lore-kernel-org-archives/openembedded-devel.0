Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EBDF55431
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:59:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34654.1771977581316870996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ptxw6q+x;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3549bba5302so3827439a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 15:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771977580; x=1772582380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=six00ZaTE+c796NEgwFoO7G9Q7JhaC+4f6+yhnaMp9I=;
        b=Ptxw6q+xvPX1C9rlsJTXCoU7rcNNLPaHdJ8n1RH8YKYNfrSaHK7603cZTVF4Au+v16
         43uVAX5MTLr1S0EUcDlBfviCrIvYMpmSpagS6PnKRDlJrhOVrh0UQzcLOPcI/740EwBO
         x974zZexzvHPgnUA+c9CQEGIY3xcw4XNHwtYa8JV6Kc8YzLt4qVi9t/e7TDWJ6oL9GHC
         kkAgGxKc9jDKvFAl7dEaDny0o11SzEumd7b8CrcTuDAQi5LyC+wZNIOeoeQj28AgGjPR
         Ql+eKRJrDrH7UAu70GqJnaLs6xfbMCI/Hu+6Y8qQZ7fUGFbCvyNMvM/PKOWDddsu10Ky
         lUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771977580; x=1772582380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=six00ZaTE+c796NEgwFoO7G9Q7JhaC+4f6+yhnaMp9I=;
        b=gnmK7g7JXL6DjvXlxt4nZOR7aOWFJdDqRD1H6858DCZBnyfvLxsYg79sNe089vkUnh
         Gs1Yf8K2oFcfi6jCl008p4lV9Kw2qRc2JVNJHh+zPPkWN/2/0IixztkJyXXLdbc5kHP9
         hhN5Nk8woBxfxDtMGcDBGdz/RVZSUN+Ism2FOA2kjncWiLomuFL6tbjM/hbwc4Z2Yysk
         +eEYWkFcmjY6DNJ0e5MYQ/42izDkm8TNPGu5dzcAc65muVKGlOeP+VTZXiZ9mkL56h2T
         QxYzFN4tRJL1R99iLYfUlPjA+k733kFEpht6jeH/mCLd8o5zk9xN14MSPqrp4SBzXwYK
         xX2Q==
X-Gm-Message-State: AOJu0YxMQMOcoJdkLVcSHOp3TUPe+Xi5JZPHi6oSvBAhXNbA220W3KFB
	L3Ca4tjTydkmsX8EN2iJtBsB+88XhDG72mbFdHO9W2cM96xNDZxt5VFZgLE50u+q
X-Gm-Gg: ATEYQzxhQzXUehVrRdkjqRjAMCvQCyw7sj7WgfELj6FOGQDepYI3qstkGNwfLVlCdTn
	9rBBcaS5L00q3O9DLbU4ENuMryIZveJKAd4FgvUsuSmtYJ890swvVyIRJ0F+GDyRRVl0beoyTBt
	8JrNpRgwzYdzlhM6LqCBniApo3Bf+TkGF5uWtetHlVYN1R5H85HI/YDYHp25VEHiZJkyz5COspp
	TqLPn3fVSiSCbfoF+2EvD6gO9ZOsZz23KTBolodJkPH7N2iD3Bz6tYtjjdEFzs9A0IeV5hHshRA
	7Ewu3++Knte2WHdSm+rt1gDnhfL7t/ya9SZLw1HwpuON7HEzhLqadwBdMR/bDztzHRrUXrDoFDn
	UWcXpGA0ew/xw5KDVVzFjqKSh12Y9+CNFjfDR5agKLcaHgUvCD7xeaVt7AcrxcsplkSJQreUI0+
	gXZpv6sfJ5xKKen3Yf/sGEWcZgv5UrRlgJZf0=
X-Received: by 2002:a17:90b:38c4:b0:359:1063:6af2 with SMTP id 98e67ed59e1d1-35910637202mr239218a91.20.1771977580436;
        Tue, 24 Feb 2026 15:59:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f8afsm911866a91.3.2026.02.24.15.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:59:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH] xrdp: patch CVE-2025-68670
Date: Wed, 25 Feb 2026 12:59:31 +1300
Message-ID: <20260224235931.1964789-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 23:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124602

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68670

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xrdp/xrdp/CVE-2025-68670.patch            | 78 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2025-68670.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2025-68670.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2025-68670.patch
new file mode 100644
index 0000000000..f0aaaf6718
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2025-68670.patch
@@ -0,0 +1,78 @@
+From 2fbc0cde4383a13089ccaddfb7ec60b2f740aab2 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Thu, 18 Dec 2025 11:37:30 +0000
+Subject: [PATCH] CVE-2025-68670: Buffer overflow parsing domain
+
+A potential overflow in xrdp_wm_parse_domain_information() is
+addressed
+
+CVE: CVE-2025-68670
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/dd4b56c9873bd246ba3d815522b27d90c99fcc30]
+(cherry picked from commit dd4b56c9873bd246ba3d815522b27d90c99fcc30)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ xrdp/xrdp_login_wnd.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/xrdp/xrdp_login_wnd.c b/xrdp/xrdp_login_wnd.c
+index 28748676..1fe9ea50 100644
+--- a/xrdp/xrdp_login_wnd.c
++++ b/xrdp/xrdp_login_wnd.c
+@@ -277,7 +277,8 @@ xrdp_wm_ok_clicked(struct xrdp_bitmap *wnd)
+ */
+ static int
+ xrdp_wm_parse_domain_information(char *originalDomainInfo, int comboMax,
+-                                 int decode, char *resultBuffer)
++                                 int decode,
++                                 char *resultBuffer, unsigned int resultSize)
+ {
+     int ret;
+     int pos;
+@@ -287,8 +288,7 @@ xrdp_wm_parse_domain_information(char *originalDomainInfo, int comboMax,
+     /* If the first char in the domain name is '_' we use the domain
+        name as IP*/
+     ret = 0; /* default return value */
+-    /* resultBuffer assumed to be 256 chars */
+-    g_memset(resultBuffer, 0, 256);
++    g_memset(resultBuffer, 0, resultSize);
+     if (originalDomainInfo[0] == '_')
+     {
+         /* we try to locate a number indicating what combobox index the user
+@@ -298,7 +298,7 @@ xrdp_wm_parse_domain_information(char *originalDomainInfo, int comboMax,
+          * Invalid chars are ignored in microsoft client therefore we use '_'
+          * again. this sec '__' contains the split for index.*/
+         pos = g_pos(&originalDomainInfo[1], "__");
+-        if (pos > 0)
++        if (pos > 0 && (unsigned int)pos < resultSize)
+         {
+             /* an index is found we try to use it */
+             LOG(LOG_LEVEL_DEBUG, "domain contains index char __");
+@@ -325,7 +325,7 @@ xrdp_wm_parse_domain_information(char *originalDomainInfo, int comboMax,
+         else
+         {
+             LOG(LOG_LEVEL_DEBUG, "domain does not contain _");
+-            g_strncpy(resultBuffer, &originalDomainInfo[1], 255);
++            g_strncpy(resultBuffer, &originalDomainInfo[1], resultSize - 1);
+         }
+     }
+     return ret;
+@@ -450,7 +450,8 @@ xrdp_wm_show_edits(struct xrdp_wm *self, struct xrdp_bitmap *combo)
+                     {
+                         xrdp_wm_parse_domain_information(
+                             self->session->client_info->domain,
+-                            combo->data_list->count, 0, resultIP);
++                            combo->data_list->count, 0,
++                            resultIP, sizeof(resultIP));
+                         g_strncpy(b->caption1, resultIP, 255);
+                         b->edit_pos = g_mbstowcs(0, b->caption1, 0);
+                     }
+@@ -875,7 +876,8 @@ xrdp_login_wnd_create(struct xrdp_wm *self)
+     combo->item_index = xrdp_wm_parse_domain_information(
+                             self->session->client_info->domain,
+                             combo->data_list->count, 1,
+-                            resultIP /* just a dummy place holder, we ignore */ );
++                            resultIP,/* just a dummy place holder, we ignore */
++                            sizeof(resultIP));
+     xrdp_wm_show_edits(self, combo);
+ 
+     return 0;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index bcadd03adf..ea63b932ae 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23493.patch \
            file://CVE-2023-40184.patch \
            file://CVE-2023-42822.patch \
+           file://CVE-2025-68670.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

