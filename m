Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5091.1793909167897505969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UGAwadAw;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so3504319c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909167; x=1794513967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdZ5Po0dH9j4Xncp7g8j7RBPkW4chm+yQm+3V2nprJY=;
        b=UGAwadAwqFocqd7PiXzurf4uAkIJD1NymgNFeuiJVYl8r+KQfrbewcT1dAtjKTmIwa
         Yec+F1dUnZ0oBGkt2etXLdqUaZ1fQfa4aQ2YQ8E1bQZrAqvc/fHXPjum2AdCgyKa5aB/
         Ai1bqvjUBK4un+4UvBNIeUHLZv8FcXQU/fSk9RcZy1/0/qlaYCyfaMy0efgXhba/UHCy
         n0Y3QOjggLkhSGNANVdHQF33TnzauGRlxtXvECXQQWIGHlGV+2X3NA5qtk1Nnsdk1RQv
         iNSwZCoD64mmcDRzdFnD/NTYff+XPzTYbWmo0PjENVCfmZZACa0EJjwdUmVAktHVPj3S
         BfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909167; x=1794513967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdZ5Po0dH9j4Xncp7g8j7RBPkW4chm+yQm+3V2nprJY=;
        b=SQuXskqJjM+eHINEweFOInLJ34mTpnsVJ5FI82vBbyuQe/OCAQmR2ljWuZ2HhFPuuc
         B89mkoKFcZCjmRl43Hh8ojEESrL/KiBK5vpUJiVdT7xs2wCdj9SUvfFHj3Hyt4eThSj1
         1UzdWXSKrXEeUok/XiIYxuJje2itJLHKpGr9bEaYn9Iv0Qn87zHu2UYujUgZ/0snm+LB
         qZUazFSPwFBqg+6P7hT/SnUX+d+NUP5uku1yRbg0vVQwdWk8fffAkUzwx4i3xa0OzVn3
         pboghycHNBXDxNkMkqBt6BV71zXQfMmgcosktOne6+DCuwzy8QETqgL1bH/BnlCY7ojr
         BNHA==
X-Gm-Message-State: APuU4Z8DsKC37qgwVW7IjtnKiwiNBfjKbA9DbHDw7darNraC2aWGzdEi
	u1CBXwYMeakrir7YOiocd3Ewz4uVN9DoCy7l6AK7HSuQGGZpFB8oc2snFClbZQ==
X-Gm-Gg: AYBFou1n143RULGsXs/6C+lXgvplAEvGtISQnOl95e3orMXCM9Rhf2UUphw0oLhb6BN
	xY4y1cUyGn834iBqNr+jvp1Htats8+pr4ifBA7in6HR9lFKn0axRIQ7odg44ES7Hp2QHkivwAoR
	zjQgA45pPgWJ1xrAvMci3uFi3ybuZOYYohAQdSiVdJQI0G60U7HJSzFUXxlqkKBtEaf50cRln4O
	bN4CbjSRxm4n7Alvbx5/g+iJywAmNQgygynvqnIQVqft9891sRCkv5V/SzDBoQtKHGKPsOse4OU
	INZgioSwOo1yFG3JMB1NhUPkCjeqiySP78tTdqarIKChVsRUfgICKGpRRxuc1Y0OwuI3M7TTDT0
	G2WUTzohY6W9c22hCFC0gwfLitC2XvyUEEWEOOCe1UQJUUBG5/V//OTDr4ZSuSMoyB68BosirhI
	Ng5QgkZyY8RioDRRPMS8WOxp2kiqO/4m+VbDKBXmYFzxf1jGc1wcXW1jlOH+1BMrCMGqFCC0B9U
	NJZqJKo2ZZI39k+DHVjcIbs8/CCwA6HXofc289qGjkrjMf4TbeAmuJmhGc8ixgZz8OqjTiG5Ua8
	rUxW+rmXeleljhtnaXdFcoPZdcWlZOdhDnYyST+e5UYPwnHd3NaeZMRWyWIkKg==
X-Received: by 2002:a05:701b:4515:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b25d31edc9mr73787c88.7.1793909167077;
        Thu, 05 Nov 2026 12:06:07 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/9] hdf5: patch CVE-2026-120756
Date: Fri,  6 Nov 2026 09:05:48 +1300
Message-ID: <20261105200552.81303-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131933
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120756

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120756.patch          | 45 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
new file mode 100644
index 0000000000..28bd658598
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
@@ -0,0 +1,45 @@
+From 43855883c1ea10a072b7e7cf2dbc5a29ab411a8f Mon Sep 17 00:00:00 2001
+From: Nayyar <nayyar@bugqore.com>
+Date: Sat, 12 Sep 2026 16:37:49 +0530
+Subject: [PATCH] check object header message size after decoding its header
+ (#6589)
+
+(cherry picked from commit 10f1af5528168c5a71a58eba0b486e0677f3aaa3)
+
+CVE: CVE-2026-120756
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/10f1af5528168c5a71a58eba0b486e0677f3aaa3]
+
+Dropped changes to the test and CHANGELOG file.
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Ocache.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 8f0928f290e..9dc6a2e21bb 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1270,9 +1270,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
+             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
+ 
+-        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
+-            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
+-
+         /* Message flags */
+         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
+@@ -1305,6 +1302,13 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             }
+         }
+ 
++        /* The message body starts after the message header, so its size can
++         * only be checked against the buffer once the whole header has been
++         * decoded
++         */
++        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
++            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
++
+         /* Increment count of null messages */
+         if (H5O_NULL_ID == id)
+             nullcnt++;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 7642beb675..7afba18084 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19023-CVE-2026-19024.patch \
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
+           file://CVE-2026-120756.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
