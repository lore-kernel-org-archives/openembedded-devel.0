Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25F8C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 03:59:42 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.52535.1707710373877929530
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Feb 2024 19:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eVn0bXn6;
 spf=pass (domain: mvista.com, ip: 209.85.167.175, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3beb504c985so1140601b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Feb 2024 19:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707710372; x=1708315172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOu5MaoZ8l8jOQV2423DUCQzQlj7CovdslCNxJEpHkw=;
        b=eVn0bXn6QINjXUboL42luM/8zTdHDjtvzf7EOVPFOzWqkHDNW8zhc1h5GkqExyYy4a
         ATpNe4U+nvFke+fsyOuor1i3aeeDUMbsSYbA/2wvqsXDsw3qg011YjeVzg/o+f+yyAWY
         iuevt/kqY+HYfdlyRFrqJpEBbOCOL68hGp/5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707710372; x=1708315172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOu5MaoZ8l8jOQV2423DUCQzQlj7CovdslCNxJEpHkw=;
        b=BXuqNMFrcK1YjQ4oC9Oru5ZLnrtzj22HsL6OaYxMGhFwX71fF0HwjsBZ7PB6bTogQ4
         fQX707Tg3WIbq9F+SMGy7SfAYpz+Xn2A+vXnuVqnz4DIgwnOqJJMZbWrosMs8ol6c6Ka
         B4N/f2Jj5e8CHX5S24aZHhRtRz2+80z33zG02lSBJpI2b7jl5fJ653hB6F37zl0Ki70q
         OxdnflTYPn2/lHl9QFHGjiBYl8Ut2/c9mDbOio6aG0oMK9yoROaO8T3BH4ppRdYUHnTc
         syzouLfXgcQEpYHfKvPO3z3L24iSKZ+R/V1QnlpdhbOQhWkcWFn+TeP22Snr4PiQVjSm
         c88w==
X-Gm-Message-State: AOJu0YxQPBANsOsN/neV9w+JtTK505WtFzTfkz6kwP0fT4ZAyjBEhvPm
	yjN07TGqvDAmqVdX8/p8kirEUHFI2UsNpDbpGjY25RYxQn5j9RrjjcvvQu3dSMasLFpNyi7135z
	f
X-Google-Smtp-Source: AGHT+IHk12M9uVpxTxJ0wQ6eQDjY5Phms/DaMHqC1CdQGsEI0lA7+t35d0+MNSZPYMmwo6QWWfBaWA==
X-Received: by 2002:aca:2803:0:b0:3bf:e41d:143d with SMTP id 3-20020aca2803000000b003bfe41d143dmr5766112oix.27.1707710372212;
        Sun, 11 Feb 2024 19:59:32 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:2806:d73:94e:9363])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b006e080bbc92dsm4546045pff.177.2024.02.11.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 19:59:31 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] squid: Backport fix for CVE-2023-49286 and CVE-2023-50269
Date: Mon, 12 Feb 2024 09:29:19 +0530
Message-Id: <20240212035919.14550-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 03:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108703

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-49286
 CVE-2023-50269

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
Upstream commit
https://github.com/squid-cache/squid/commit/6014c6648a2a54a4ecb7f952ea1163e0798f9264
&
https://github.com/squid-cache/squid/commit/9f7136105bff920413042a8806cc5de3f6086d6d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../squid/files/CVE-2023-49286.patch          | 87 +++++++++++++++++++
 .../squid/files/CVE-2023-50269.patch          | 62 +++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
new file mode 100644
index 000000000..8e0bdf387
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
@@ -0,0 +1,87 @@
+From 6014c6648a2a54a4ecb7f952ea1163e0798f9264 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Fri, 27 Oct 2023 21:27:20 +0000
+Subject: [PATCH] Exit without asserting when helper process startup fails
+ (#1543)
+
+... to dup() after fork() and before execvp().
+
+Assertions are for handling program logic errors. Helper initialization
+code already handled system call errors correctly (i.e. by exiting the
+newly created helper process with an error), except for a couple of
+assert()s that could be triggered by dup(2) failures.
+
+This bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/ipc-assert.html
+where it was filed as 'Assertion in Squid "Helper" Process Creator'.
+
+Origin: http://www.squid-cache.org/Versions/v6/SQUID-2023_8.patch
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/6014c6648a2a54a4ecb7f952ea1163e0798f9264]
+CVE: CVE-2023-49286
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ipc.cc | 33 +++++++++++++++++++++++++++------
+ 1 file changed, 27 insertions(+), 6 deletions(-)
+
+--- a/src/ipc.cc
++++ b/src/ipc.cc
+@@ -20,6 +20,12 @@
+ #include "SquidIpc.h"
+ #include "tools.h"
+ 
++#include <cstdlib>
++
++#if HAVE_UNISTD_H
++#include <unistd.h>
++#endif
++
+ static const char *hello_string = "hi there\n";
+ #ifndef HELLO_BUF_SZ
+ #define HELLO_BUF_SZ 32
+@@ -365,6 +371,22 @@
+     }
+ 
+     PutEnvironment();
++
++    // A dup(2) wrapper that reports and exits the process on errors. The
++    // exiting logic is only suitable for this child process context.
++    const auto dupOrExit = [prog,name](const int oldFd) {
++        const auto newFd = dup(oldFd);
++        if (newFd < 0) {
++            const auto savedErrno = errno;
++            debugs(54, DBG_CRITICAL, "ERROR: Helper process initialization failure: " << name);
++            debugs(54, DBG_CRITICAL, "helper (CHILD) PID: " << getpid());
++            debugs(54, DBG_CRITICAL, "helper program name: " << prog);
++            debugs(54, DBG_CRITICAL, "dup(2) system call error for FD " << oldFd << ": " << xstrerr(savedErrno));
++            _exit(1);
++        }
++        return newFd;
++    };
++
+     /*
+      * This double-dup stuff avoids problems when one of
+      *  crfd, cwfd, or debug_log are in the rage 0-2.
+@@ -372,17 +394,16 @@
+ 
+     do {
+         /* First make sure 0-2 is occupied by something. Gets cleaned up later */
+-        x = dup(crfd);
+-        assert(x > -1);
+-    } while (x < 3 && x > -1);
++        x = dupOrExit(crfd);
++    } while (x < 3);
+ 
+     close(x);
+ 
+-    t1 = dup(crfd);
++    t1 = dupOrExit(crfd);
+ 
+-    t2 = dup(cwfd);
++    t2 = dupOrExit(cwfd);
+ 
+-    t3 = dup(fileno(debug_log));
++    t3 = dupOrExit(fileno(debug_log));
+ 
+     assert(t1 > 2 && t2 > 2 && t3 > 2);
+ 
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
new file mode 100644
index 000000000..51c895e0e
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
@@ -0,0 +1,62 @@
+From: Markus Koschany <apo@debian.org>
+Date: Tue, 26 Dec 2023 19:58:12 +0100
+Subject: CVE-2023-50269
+
+Bug-Debian: https://bugs.debian.org/1058721
+Origin: http://www.squid-cache.org/Versions/v5/SQUID-2023_10.patch
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches/CVE-2023-50269.patch?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
+Upstream commit https://github.com/squid-cache/squid/commit/9f7136105bff920413042a8806cc5de3f6086d6d]
+CVE: CVE-2023-50269
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ClientRequestContext.h |  4 ++++
+ src/client_side_request.cc | 17 +++++++++++++++--
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+--- a/src/ClientRequestContext.h
++++ b/src/ClientRequestContext.h
+@@ -81,6 +81,10 @@
+ #endif
+     ErrorState *error; ///< saved error page for centralized/delayed processing
+     bool readNextRequest; ///< whether Squid should read after error handling
++
++#if FOLLOW_X_FORWARDED_FOR
++    size_t currentXffHopNumber = 0; ///< number of X-Forwarded-For header values processed so far
++#endif
+ };
+ 
+ #endif /* SQUID_CLIENTREQUESTCONTEXT_H */
+--- a/src/client_side_request.cc
++++ b/src/client_side_request.cc
+@@ -78,6 +78,11 @@
+ static const char *const crlf = "\r\n";
+ 
+ #if FOLLOW_X_FORWARDED_FOR
++
++#if !defined(SQUID_X_FORWARDED_FOR_HOP_MAX)
++#define SQUID_X_FORWARDED_FOR_HOP_MAX 64
++#endif
++
+ static void clientFollowXForwardedForCheck(allow_t answer, void *data);
+ #endif /* FOLLOW_X_FORWARDED_FOR */
+ 
+@@ -485,8 +490,16 @@
+                 /* override the default src_addr tested if we have to go deeper than one level into XFF */
+                 Filled(calloutContext->acl_checklist)->src_addr = request->indirect_client_addr;
+             }
+-            calloutContext->acl_checklist->nonBlockingCheck(clientFollowXForwardedForCheck, data);
+-            return;
++            if (++calloutContext->currentXffHopNumber < SQUID_X_FORWARDED_FOR_HOP_MAX) {
++                calloutContext->acl_checklist->nonBlockingCheck(clientFollowXForwardedForCheck, data);
++                return;
++            }
++            const auto headerName = Http::HeaderLookupTable.lookup(Http::HdrType::X_FORWARDED_FOR).name;
++            debugs(28, DBG_CRITICAL, "ERROR: Ignoring trailing " << headerName << " addresses");
++            debugs(28, DBG_CRITICAL, "addresses allowed by follow_x_forwarded_for: " << calloutContext->currentXffHopNumber);
++            debugs(28, DBG_CRITICAL, "last/accepted address: " << request->indirect_client_addr);
++            debugs(28, DBG_CRITICAL, "ignored trailing addresses: " << request->x_forwarded_for_iterator);
++            // fall through to resume clientAccessCheck() processing
+         }
+     }
+ 
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index d0cf596fa..69b62aa5a 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-46728.patch \
            file://CVE-2023-46846-pre1.patch \
            file://CVE-2023-46846.patch \
+           file://CVE-2023-49286.patch \
+           file://CVE-2023-50269.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.25.1


