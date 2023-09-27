Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E1CE810D6
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:02:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15720.1695816149441588346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jLDd53+k;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32164a6af64so9500354f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695816147; x=1696420947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScUHgjc9ktnqvK0zasQBi2OoxtrDax3B/VZqwjatz/0=;
        b=jLDd53+kzGXbNAOxlad+43SfetV0SsjwAq6qmN0g1IB6NmQNgfmmuQG67xCEd+ljUB
         HLfWAo+nFUr8DWaH0zN1Ejjp2zZNTf6Yhs2VJJTJZVvZUlK0AcAtao14R1JEiOpqBRt1
         YyrI55FKNd3TVJxMxV30WsQzZ682Xkp0VBmn9x7zS2DgutRp5U4eBzFGV9aS0TGiCfNe
         AsK9rB6G5Vw+eSK6i8TnLuobq+KK5L8Ths0oaHPNbdagNYmXycn5UtC8IxWmy4+Z7O6I
         dlAvFkKbuPpiLgoS4HG2A2FLsSl8PgxCcD7a1UX1H4W1Lo4BCs/7gUEIsYxKuqHbfPXH
         3epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695816147; x=1696420947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScUHgjc9ktnqvK0zasQBi2OoxtrDax3B/VZqwjatz/0=;
        b=t8xMbRYh/3qfVI6Kl4e482JBPAajVlmkNhq9jlw4bW04kfMSNPcFhgCi5KpddajIF5
         IjysyjRUNQs1Q/dM2xQs0hagOceSLGNcvWbexcJdUJmFB+NsAtPA+D778T2XNpUz6IUc
         B8uU+3/1C2YRYgj2PY/ChxMtRTXsziA6I+7B6nJIU+FKTOPb3/Nm2t6B2pd4rSa//gd8
         miveuuxpJud3I8O3yh4q7xx7YPUB7H1grmXvd4kja4Y0kI5daOZhETcXGEy8le5vy0hd
         4hX+viDeWxzWvnqNnPXtZnWzf8JVgGMNhKJZiK2roQdaHMfbQkyMptwDxo24G5Z6mgaV
         9HnA==
X-Gm-Message-State: AOJu0YwQBBsg/xyAROXRznx/T7r6Ayhqs8M3cH4lKu/a79kMmbBjFWHa
	88sVoAqzQFajWQE0QluQIVAe8Q/gW6k=
X-Google-Smtp-Source: AGHT+IGhaJWkw67j76DoNp4jyxaq3+38FkHGi/GCUPV365aQ4klBM5iaQ/hsZvTJtU88oJIpaSFVPA==
X-Received: by 2002:a5d:63cf:0:b0:320:896:5ea0 with SMTP id c15-20020a5d63cf000000b0032008965ea0mr1534819wrw.31.1695816147233;
        Wed, 27 Sep 2023 05:02:27 -0700 (PDT)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id r2-20020adfe682000000b0031ff89af0e4sm16963732wrm.99.2023.09.27.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:02:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 1790.80.10 -> 2200.0.8
Date: Wed, 27 Sep 2023 13:02:18 +0100
Message-Id: <20230927120218.26586-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105191

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...01-Handle-interface-without-ifa_addr.patch | 38 +++++++++++++++++++
 ...rop-MacOS-specific-__block-qualifier.patch | 30 ---------------
 ...-mDNSCore-Fix-broken-debug-parameter.patch | 17 ++++-----
 .../mdns/mdns/0015-Add-missing-limits.h.patch | 23 +++++++++++
 .../{mdns_1790.80.10.bb => mdns_2200.0.8.bb}  |  7 ++--
 5 files changed, 72 insertions(+), 43 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_1790.80.10.bb => mdns_2200.0.8.bb} (96%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
new file mode 100644
index 000000000000..daee318ae4a3
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
@@ -0,0 +1,38 @@
+From 1cc54320306e07c1fc0eed98e7fbcbb07a2f3b28 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan@agner.ch>
+Date: Fri, 23 Jun 2023 10:10:00 +0200
+Subject: [PATCH] Handle interface without `ifa_addr`
+
+It seems that certain interface types may have `ifa_addr` set to null.
+Handle this case gracefully.
+
+Upstream-Status: Submitted [https://github.com/apple-oss-distributions/mDNSResponder/pull/2/commits/11b410d4d683c90e693c40315997bb3e8ec90e9a]
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/mDNSPosix.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index d7f31cc4d5cf..f10301253f58 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+ 	    continue;
+ 
+         if ((ifa_loop4 == NULL) &&
++            ((*ifi)->ifa_addr != NULL) &&
+             ((*ifi)->ifa_addr->sa_family == AF_INET) &&
+             ((*ifi)->ifa_flags & IFF_UP) &&
+             ((*ifi)->ifa_flags & IFF_LOOPBACK))
+@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+             continue;
+         }
+ 
+-        if (     (((*ifi)->ifa_addr->sa_family == AF_INET)
++        if (     ((*ifi)->ifa_addr != NULL) &&
++                 (((*ifi)->ifa_addr->sa_family == AF_INET)
+ #if HAVE_IPV6
+                   || ((*ifi)->ifa_addr->sa_family == AF_INET6)
+ #endif
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
deleted file mode 100644
index 0ac0bb6a4587..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4c0954f77ba05d77192ee1519929a39fbc978321 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Mon, 5 Dec 2022 15:14:22 +0000
-Subject: [PATCH 3/6] mDNSShared: Drop MacOS specific __block qualifier
-
-Support for this extension only exists in MacOS/Clang, also it's not
-actually used here, so we can just drop it.
-
-Upstream-Status: Pending
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/uds_daemon.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mDNSShared/uds_daemon.c b/mDNSShared/uds_daemon.c
-index 9ae5f78542d6..8c006b71a4ea 100644
---- a/mDNSShared/uds_daemon.c
-+++ b/mDNSShared/uds_daemon.c
-@@ -2912,7 +2912,7 @@ exit:
- mDNSlocal mStatus add_domain_to_browser(request_state *info, const domainname *d)
- {
-     browser_t *b, *p;
--    __block mStatus err;
-+    mStatus err;
- 
-     for (p = info->u.browser.browsers; p; p = p->next)
-     {
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 39e67cdf4884..4cda71bdb1bc 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,28 +1,25 @@
-From 60533a8947af714cc593bae6b20d47f3a4828589 Mon Sep 17 00:00:00 2001
+From 764b6202402e9e5687ff873330e5ad6be6f69df7 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
-Subject: [PATCH 5/6] mDNSCore: Fix broken debug parameter
+Subject: [PATCH] mDNSCore: Fix broken debug parameter
 
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 
+---
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index 66979587ee82..e0a982fa1762 100644
+index eecd7daa724e..1e843c081938 100644
 --- a/mDNSCore/mDNS.c
 +++ b/mDNSCore/mDNS.c
-@@ -9831,7 +9831,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
+@@ -10210,7 +10210,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
  #else
                              const DNSServRef dnsserv = qptr->qDNSServer;
  #endif
--                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, name->c, DNSTypeName(q.qtype));
+-                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, currentQName, DNSTypeName(q.qtype));
 +                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, currentQName->c, DNSTypeName(q.qtype));
                              // Create a negative record for the current name in the CNAME chain.
                              MakeNegativeCacheRecord(m, &m->rec.r, currentQName, currentQNameHash, q.qtype, q.qclass, negttl, mDNSInterface_Any,
                                  dnsserv, response->h.flags);
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
new file mode 100644
index 000000000000..9fe721ff0759
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
@@ -0,0 +1,23 @@
+From 9fc45a2cf3b78573a568abf538a6e6f4bd30b2d7 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 27 Sep 2023 11:45:26 +0100
+Subject: [PATCH] Add missing limits.h
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/PlatformCommon.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mDNSShared/PlatformCommon.c b/mDNSShared/PlatformCommon.c
+index 9ce15468e217..c308af3e8b0e 100644
+--- a/mDNSShared/PlatformCommon.c
++++ b/mDNSShared/PlatformCommon.c
+@@ -32,6 +32,7 @@
+ #include <time.h>
+ #include <sys/time.h>           // Needed for #include <sys/time.h>().
+ #include <assert.h>
++#include <limits.h>
+ 
+ 
+ #include "mDNSEmbeddedAPI.h"    // Defines the interface provided to the client layer above
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
similarity index 96%
rename from meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
index aff7954f507b..8370ed50c08c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=rel/mDNSResponder-1790 \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=main \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
-           file://0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch \
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
            file://0005-mDNSCore-Fix-broken-debug-parameter.patch \
            file://0006-make-Add-top-level-Makefile.patch \
@@ -23,8 +22,10 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0008-Handle-errors-from-socket-calls.patch \
            file://0009-remove-unneeded-headers.patch \
            file://mdns.service \
+           file://0015-Add-missing-limits.h.patch \
+           file://0001-Handle-interface-without-ifa_addr.patch \
            "
-SRCREV = "8769ab51605e465425d33d757f602ce5905ca639"
+SRCREV = "d5029b5dff8aa59d1fc07ed796e994106ef58dee"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.39.0


