Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF7BC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 03:56:52 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.52410.1707710202934759331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Feb 2024 19:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XgeN6sQs;
 spf=pass (domain: mvista.com, ip: 209.85.166.47, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7bfd527d443so74508839f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Feb 2024 19:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707710201; x=1708315001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SM+YJ3mSEcXaG8atotiKh/HFQmicVn99Xxci0ShGYM=;
        b=XgeN6sQs85kE8cwWz6ymW5HRBpD7A4mqx3AUaWpDAYWarmgpybybHHu7F5DFSf8bPK
         u8YDATVhgDIGlbyACmQSwU/os/POxrG3Q3CEevlQDmT47nO9SpvUHCBK/87zcTagZJVM
         RA8us5EbrLWe6e2+YA6jACinC5hph41V2ieAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707710201; x=1708315001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SM+YJ3mSEcXaG8atotiKh/HFQmicVn99Xxci0ShGYM=;
        b=o7r2w7rZrCR/aNBi68FyhG1oF1gRprlAFMTa+tM+qQcO58AdvkOjPxP3lm2xspiAi/
         SVPHkeSdM8RcJmumHs0M22fyIEcTsg8sNXP5iJ1aeqW6s6WSZXitQ3G+ty5MdXNnukuK
         7xCbAfiRwf/FV4PGkw1wvgnW9peIMRMj0Nc5BdDID2+OMDRommcRP3E2tsLzcHcoFDSr
         I53ixqnL0wZ4/L5flvOnxf+XTv2jnhX8kvf4utrdAsA1wOiWu2O4Z81V9Nb4GrAqnOyp
         hiWqOlvsvOgXvq2IYgClsDY2Ge1gji2vgWACDdOESuLLZwtvfDXbMDWDCCZWWmXISNmc
         kEZQ==
X-Gm-Message-State: AOJu0YxipYAXuc4gPAgsxZKqkW7ad6bManBl8POhi4KDACGYLl/GXsWj
	WiWBmmZuDh3IDPc/pdALGG/xgPVdX2XOjj3O3/WNzIRPi1YbNRF7vLzDa4Ky9WQGiUfOQ6rVD3M
	6
X-Google-Smtp-Source: AGHT+IG3mHTvHnVvWtOYpNZGGpc6zXia0kEdfLCovR/nY2KNdSK8WDhI1vWGSyElyR/oAXPMDMtJmg==
X-Received: by 2002:a92:da50:0:b0:363:dfc7:acc2 with SMTP id p16-20020a92da50000000b00363dfc7acc2mr7190738ilq.12.1707710201218;
        Sun, 11 Feb 2024 19:56:41 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:2806:d73:94e:9363])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f2c900b001d94a461d2dsm4970589plc.73.2024.02.11.19.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 19:56:40 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] squid: Backport fix for CVE-2023-50269
Date: Mon, 12 Feb 2024 09:26:24 +0530
Message-Id: <20240212035624.14404-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 03:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108702

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2023-50269

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
Upstream commit
https://github.com/squid-cache/squid/commit/9f7136105bff920413042a8806cc5de3f6086d6d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../squid/files/CVE-2023-50269.patch          | 62 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.9.bb        |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch

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
diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
index 482ce76d1..09c0a2cd7 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-46846.patch \
            file://CVE-2023-49285.patch \
            file://CVE-2023-49286.patch \
+           file://CVE-2023-50269.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.25.1


