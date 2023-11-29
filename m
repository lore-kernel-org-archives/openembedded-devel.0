Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E78C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 09:51:52 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.28690.1701251502207613986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 01:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I0XzKtXJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cdd9c53282so136865b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 01:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701251500; x=1701856300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMVKlk7vlJuDqqEiS5tbWEMxgzHEueaTnDBXzTb8rNU=;
        b=I0XzKtXJhDPJEQFqnkHriz8CeJxACRdr5dltubhzLpKsfokNnh2zlzPUvUfeDYymo1
         TeEaOsg9XNOMVZ3jjenvK5GauKVeiLnwZij2fQnBA5lDXnDfRGYxSI/XsWwKvnandGyA
         F58kIQlHiClz8QCXWEMn8TvpvjAVfqwqAyH4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701251500; x=1701856300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMVKlk7vlJuDqqEiS5tbWEMxgzHEueaTnDBXzTb8rNU=;
        b=HT1ELyF185XjJuXN9SYoUSQSWBpaKPwURWIXqFuTkGqYNmWIMPed8i43o0uwsIfGj7
         9/fYwTetvKDg9zfERmDf17GEMJI2pM7djD1Y8yR1HTguVR0of4/VnHP6pCLzMnjimiEv
         LTs9nKdTR06y/lUE+aIyX6NAojMH1x09dn4yfeDIzUP9zKpYbib37R4HZf7hMH30WdFO
         M58DsZWPgvEt+o331KU8gXpG68l7MQSMJmYfsMqF/OheoDGwfZYA9aJulgaUZRw2jG4b
         9cWUxC8guu4mn2zzIKCnrd4hmnLQfETuINVMXyGIx4cTgrRKezqZLzzWhF5Ywu2xoPm0
         e8zQ==
X-Gm-Message-State: AOJu0YzVlr3HMYoVF8q+9+/Ox8XcS9lntmvtt5LLZdIq/F89qeFLw4S3
	nuEqj4/xg56YNH+1R9nMHl53APDwOspmg+GbNVw=
X-Google-Smtp-Source: AGHT+IEmz4M3ZUFfwhQD4I29dkEwWQr4uoaETK4mc4r0C6rfOcxhUMLqbuCCfzjwWl+yovzYIykuZg==
X-Received: by 2002:a05:6a20:7352:b0:18b:94c5:257c with SMTP id v18-20020a056a20735200b0018b94c5257cmr18715942pzc.16.1701251500502;
        Wed, 29 Nov 2023 01:51:40 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.75.29.105])
        by smtp.googlemail.com with ESMTPSA id fv8-20020a17090b0e8800b00285994be9easm629382pjb.1.2023.11.29.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 01:51:40 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] squid: fix CVE-2023-46847 Denial of Service in HTTP Digest Authentication
Date: Wed, 29 Nov 2023 15:21:21 +0530
Message-Id: <20231129095121.1534484-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 09:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107134

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../squid/files/CVE-2023-46847.patch          | 47 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
new file mode 100644
index 0000000000..9071872c01
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
+index 6a9736f..0a883fa 100644
+--- a/src/auth/digest/Config.cc
++++ b/src/auth/digest/Config.cc
+@@ -847,11 +847,15 @@ Auth::Digest::Config::decode(char const *proxy_auth, const char *aRequestRealm)
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
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index a1122a3cd4..3027806742 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
            file://0001-Fix-build-on-Fedora-Rawhide-772.patch \
+           file://CVE-2023-46847.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.40.1


