Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD376C10DCE
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:07:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.70082.1701698821230045858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 06:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HsPug2UM;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ce46470647so566279b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 06:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701698820; x=1702303620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHf+3fdh4GoZ3gamdJxiiLTPRW0lczo6wUtFMMdPHSE=;
        b=HsPug2UMwloJZ6sOnNKGWbB0xvekh3hGtxNan7R1zu5PwFwypWXpexj4imcxtZlL/m
         AVtyEualP0tA1AyryUkIYlRMykEtVR9M9P4PxkfDhJVY/wEmjIL8AYxYjNK+x5cJlQlU
         tXNDo0V8YFfRLT4Gg6k4WRSQ7reOQ0uIxXHSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698820; x=1702303620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHf+3fdh4GoZ3gamdJxiiLTPRW0lczo6wUtFMMdPHSE=;
        b=C+pkNedp6i1jpv4KwbRD84efG5zFUnYf24B3BQi2IGMy6B6DNQM5hbFoVWJuzN5nf2
         MDfDQtMzB8xxhrTzgrSVUdnpFOm2mVmhYl8Hp33FYt7Y88iY7bWRiT3RqaQutKlSktZk
         6OzCe6PsD9yK/OaAB8564kCS/qVhcCNlvJsxPu7JpUI6SknNWND7QDRQCqQfwB27YAdY
         gVwwAFYSG7VGZEXSbvU4AiF1xDtd72SNbUionHHu260cYWf47S80bFTVCk2q3nJvL02J
         FdPZk+3hOlIypeW1fofZQevxjXIEEq27L98p/p+fOWVmZTnrBGBo8kxLYJ+BaXYKeCPl
         jzOw==
X-Gm-Message-State: AOJu0YxLmbnyr0SfhaqQUEJU40V0CTivbmlPiD8oipung61nJ+CERhlE
	TXipuNpy0KS6BpmpiShybpF3BKwCuwmFEdyO6z0=
X-Google-Smtp-Source: AGHT+IG18OjDrwhoA4khnmTUwzMRMAyUNfKobZ3I4jUaZrqmI2qPh5rK21gzeBTK5XGmi/jlXhN6+w==
X-Received: by 2002:a05:6a20:4315:b0:18f:97c:8236 with SMTP id h21-20020a056a20431500b0018f097c8236mr2036456pzk.64.1701698819955;
        Mon, 04 Dec 2023 06:06:59 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.75.29.203])
        by smtp.googlemail.com with ESMTPSA id p22-20020a63e656000000b005bd980cca56sm7588310pgj.29.2023.12.04.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:06:59 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] squid: fix CVE-2023-46847 Denial of Service in HTTP Digest Authentication
Date: Mon,  4 Dec 2023 19:36:48 +0530
Message-Id: <20231204140648.904102-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 14:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107203

Upstream-Status: Backport from https://github.com/squid-cache/squid/commit/052cf082b0faaef4eaaa4e94119d7a1437aac4a3

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../squid/files/CVE-2023-46847.patch          | 47 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.9.bb        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
new file mode 100644
index 0000000000..d9f29569d1
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
@@ -0,0 +1,47 @@
+From 052cf082b0faaef4eaaa4e94119d7a1437aac4a3 Mon Sep 17 00:00:00 2001
+From: squidadm <squidadm@users.noreply.github.com>
+Date: Wed, 18 Oct 2023 04:50:56 +1300
+Subject: [PATCH] Fix stack buffer overflow when parsing Digest Authorization
+ (#1517)
+
+The bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/digest-overflow.html
+where it was filed as "Stack Buffer Overflow in Digest Authentication".
+
+---------
+
+Co-authored-by: Alex Bason <nonsleepr@gmail.com>
+Co-authored-by: Amos Jeffries <yadij@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/052cf082b0faaef4eaaa4e94119d7a1437aac4a3]
+CVE: CVE-2023-46847
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/auth/digest/Config.cc | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/auth/digest/Config.cc b/src/auth/digest/Config.cc
+index 2d25fee..4c206e1 100644
+--- a/src/auth/digest/Config.cc
++++ b/src/auth/digest/Config.cc
+@@ -862,11 +862,15 @@ Auth::Digest::Config::decode(char const *proxy_auth, const char *aRequestRealm)
+             break;
+
+         case DIGEST_NC:
+-            if (value.size() != 8) {
++            if (value.size() == 8) {
++                // for historical reasons, the nc value MUST be exactly 8 bytes
++                static_assert(sizeof(digest_request->nc) == 8 + 1, "bad nc buffer size");
++                xstrncpy(digest_request->nc, value.rawBuf(), value.size() + 1);
++                debugs(29, 9, "Found noncecount '" << digest_request->nc << "'");
++            } else {
+                 debugs(29, 9, "Invalid nc '" << value << "' in '" << temp << "'");
++                digest_request->nc[0] = 0;
+             }
+-            xstrncpy(digest_request->nc, value.rawBuf(), value.size() + 1);
+-            debugs(29, 9, "Found noncecount '" << digest_request->nc << "'");
+             break;
+
+         case DIGEST_CNONCE:
+--
+2.40.1
diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
index 19949acd84..c9a92772d1 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
+           file://CVE-2023-46847.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.40.1


