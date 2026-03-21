Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554C7109449E
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 21:47:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19780.1774129662010470554
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 14:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJPVsiaS;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b45bb7548so2122353f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774129660; x=1774734460; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6p2o1RbFJhL/BoUUvix8HvQPOE8Xas4oAm8VLO5K0E=;
        b=lJPVsiaS7YaWmJpwerkUX4OHMkEI5OdrdplZsrjV5lyENiVsJDoSJmCddmdj7ffZqJ
         53ELVFNwM8U6TeFsE9SK4HHh9su7R2fJfFSgu7C7EbJMrZpn8Udn77+t8lsCJVm1g+cB
         v7QATCuazyGDxbPJR1+2nQSC2iLc/HpaT9y6OADmn9PLOu7O7avnLweYXtJfhVslLI36
         qtERVF49t1y+TRZKNS0BwtvkF6uawGBKqxg6aMb43+juS1SMQ7JKeNwjbYejExqoTXFW
         lmbjwpnRC+KeRJXniObvEZsd5BTrz/BDyB7eQjrOf6AE+woY+7Q7JyMeHigGDUapsOsp
         qchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774129660; x=1774734460;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6p2o1RbFJhL/BoUUvix8HvQPOE8Xas4oAm8VLO5K0E=;
        b=NiYi+Ye+1PUltOaRxssyRumHRyVI0Iy3VidejHOXYZdORpTaWeVdnDtIE79dE75N1C
         Y6fkwiT4ukzJtV8lx39A48kCsikanPLqAPtykjkncYBQ13q7EJ1mm9kLCO3I+GKyKg8T
         OxFEIPZ2JbcbQ6UACHVqfNwjh4ExwqfGR7VW/DyqQsWeG8RLJeGwpWVg6Z/yxQQoycJb
         3pDkx0XMQLs+PfAwOXPA/Lp+fszps1OaxIsB5wV/div87xdnKOqqwHetITmf4d/aBYMr
         o9bGNOphf6GorQKJljZPqtqL0am+oM3S1X5f8vDmmks1nCYKvvuJ6htb9BKTUrpgCzyj
         HrbA==
X-Gm-Message-State: AOJu0YxkBxHPxhCM7ZU14mzNDBcV7Ok0/w2rc41AHWY8JgrXPDNCj8MT
	EDps6Z6yEbctBSPDLI5/OnRVsXd3X7EJwvqiXZuD6FrUfhw2TheSCTrkDP3FKQ==
X-Gm-Gg: ATEYQzy82sA6pU41ZVOQ3tb2UhBAie0rd+gnWo+IQxGlVCZT95fGL+IOLWN0TZrSDaI
	w3u2zGcwLSnZPSFXJSixRpF8cj5x+HBvqxMBt2lrKx0Ai/5nEye+hBMvNsQkTkH2aPj4je94oxf
	eYRtnFaoX8CX73QbIuJKDmoPiNAu+Au31KQU++5LsCd0yiEZIND/T8b3Jt8NiEDpEUbdZ35f0Rc
	nh9k2bzxIJkulKnboID4wNTSonIAoKRA5q3Yxz/aZTgVaGy7kwgcrsWmHKcPmuPLxPamV9KDznY
	9o6Zq7WWqKsZS4WeOq+rokIcIMYsI+JT6ZPyWHglfy4DSb3iJwksSTUVc/a1nmMJNvk749XlfdQ
	/Mh2TGNvrihmsQzHqwYo1TBFSlPXu0WCMoafbAno2+EnTHw0IYNslQU7/KlcXLPgMC3/o0klgOB
	FnY34amxjQYThgbc/RCql0v6rHcIOAckmhk3dN/fCNONdVHTdrlgvvGuku8cpeTvIKFovNtNcfy
	g==
X-Received: by 2002:a05:6000:4382:b0:439:c5c5:4146 with SMTP id ffacd0b85a97d-43b64240753mr12082526f8f.11.1774129659869;
        Sat, 21 Mar 2026 14:47:39 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm17418324f8f.22.2026.03.21.14.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:47:39 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 21 Mar 2026 21:47:10 +0000
Subject: [meta-networking][PATCH] mdns: Upgrade 2881.0.25 -> 2881.80.4.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-master-v1-1-527a93a26936@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN4Rv2kC/yXM2w6CMBCE4Vche22TdokEfBXCRcURV0Mxu/WQE
 N7dqpdf8s+sZFCB0aFaSfEUkyUVhF1F4yWmCU5OxcSeG19zcHO0DHWNj4HbruZu31KJ74qzvH9
 H/fC3PY5XjPm77mfk6BLya9GbpGmgbfsA+8qn+XsAAAA=
X-Change-ID: 20260321-master-60a128932958
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.15.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 21:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125472

Add new patch to fix breakage from Apple Wireless Direct Link support on
macOS.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/mdns/0001-Fix-build-with-gcc-15.patch     |  2 +-
 .../mdns/0001-dns-sd-Include-missing-headers.patch |  2 +-
 ...02-make-Set-libdns_sd.so-soname-correctly.patch |  4 ++--
 ...-make-Separate-TLS-targets-from-libraries.patch |  4 ++--
 .../0005-mDNSCore-Fix-broken-debug-parameter.patch | 12 +++++-----
 .../mdns/0006-make-Add-top-level-Makefile.patch    |  2 +-
 ...Make-Apple-Wireless-Direct-Link-depend-on.patch | 27 ++++++++++++++++++++++
 .../{mdns_2881.0.25.bb => mdns_2881.80.4.0.1.bb}   |  5 ++--
 8 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
index af33d5444cca..c232685a156e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -1,4 +1,4 @@
-From c84f185f29d0839b97177aecb0a78b9717947973 Mon Sep 17 00:00:00 2001
+From 0ec55ecaa7386f924ee3d64fdfbe1c2d0df1341a Mon Sep 17 00:00:00 2001
 From: Nguyen Dat Tho <tho3.nguyen@lge.com>
 Date: Wed, 9 Apr 2025 13:05:24 +0900
 Subject: [PATCH] Fix build with gcc-15
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 5464e3febe83..c9929db4cabd 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -1,4 +1,4 @@
-From cdbc28c668dd627906f833f9a8e32ac53b0b0139 Mon Sep 17 00:00:00 2001
+From 18b1239b7abd289fe5275fddc2545727a956a4ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 4 Nov 2021 07:31:32 -0700
 Subject: [PATCH] dns-sd: Include missing headers
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index f547c64d9321..5f91e91b1dd9 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -1,4 +1,4 @@
-From dcc1f39a0918cdebf53ac7c105b3d33df960ed14 Mon Sep 17 00:00:00 2001
+From 7319d6c328d7b18a048e9855902e180fe23641a2 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
 Subject: [PATCH] make: Set libdns_sd.so soname correctly
@@ -10,7 +10,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index e05ba10b4340..7c510317f1b6 100755
+index 22789f0368c7..2bb57eae5659 100755
 --- a/mDNSPosix/Makefile
 +++ b/mDNSPosix/Makefile
 @@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index 2969b5e2441f..b6697f0ba6fc 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -1,4 +1,4 @@
-From f7ee12c1f8e85b9d2fe4023b6539c8051dc710c3 Mon Sep 17 00:00:00 2001
+From e27ac4bb6243b33d23ccb7a137983887676fda7f Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:26 +0000
 Subject: [PATCH] make: Separate TLS targets from libraries
@@ -13,7 +13,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 7c510317f1b6..8dd5984020ee 100755
+index 2bb57eae5659..490165561410 100755
 --- a/mDNSPosix/Makefile
 +++ b/mDNSPosix/Makefile
 @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 0c1a9f373f9f..b8929ea4394f 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,4 +1,4 @@
-From e79f75487e32f87677519ec40c021b1623395bde Mon Sep 17 00:00:00 2001
+From ab62d343d7e13ae79b0445a0b3d0954ba3534a0c Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter
@@ -9,11 +9,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: mDNSResponder/mDNSCore/mDNS.c
-===================================================================
---- mDNSResponder.orig/mDNSCore/mDNS.c
-+++ mDNSResponder/mDNSCore/mDNS.c
-@@ -9481,7 +9481,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
+diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
+index 08bfafb11d8d..079c9742e419 100644
+--- a/mDNSCore/mDNS.c
++++ b/mDNSCore/mDNS.c
+@@ -9481,7 +9481,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
                          {
                              CacheRecord *negcr;
                              const DNSServRef dnsserv = qptr->qDNSServer;
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index 5f8f428302da..87b163f1e28b 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -1,4 +1,4 @@
-From a1c982808ebfb71ba7e0f16040013b7127a6e2ab Mon Sep 17 00:00:00 2001
+From a90eacb0f42e4ac63fe8c0ab624e8af7d9d47bd1 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 6 Dec 2022 13:28:31 +0000
 Subject: [PATCH] make: Add top-level Makefile
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch
new file mode 100644
index 000000000000..7a47ddd789dd
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch
@@ -0,0 +1,27 @@
+From eac5e89c884b4dd28a80f77d2c447a398e8db94f Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 21 Mar 2026 20:12:39 +0000
+Subject: [PATCH] mDNSShared: Make Apple Wireless Direct Link depend on macOS
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/uds_daemon.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mDNSShared/uds_daemon.c b/mDNSShared/uds_daemon.c
+index 6486f1ed51dd..3113313191d7 100644
+--- a/mDNSShared/uds_daemon.c
++++ b/mDNSShared/uds_daemon.c
+@@ -3626,7 +3626,11 @@ mDNSlocal void resolve_result_callback(mDNS *const m, DNSQuestion *question, con
+     request_state *const req = question->QuestionContext;
+     const mDNSu32 name_hash = mDNS_DomainNameFNV1aHash(&question->qname);
+     const mDNSBool isMDNSQuestion = mDNSOpaque16IsZero(question->TargetQID);
++#if MDNS_OS(macOS)
+     const mDNSBool is_split_awdl_query = (req->resolve_awdl && question->InterfaceID == AWDLInterfaceID);
++#else
++    const mDNSBool is_split_awdl_query = mDNSfalse;
++#endif
+     UDS_LOG_ANSWER_EVENT(isMDNSQuestion ? MDNS_LOG_CATEGORY_MDNS : MDNS_LOG_CATEGORY_DEFAULT, MDNS_LOG_DEFAULT,
+         req, question, answer, mDNSfalse, "DNSServiceResolve result", AddRecord);
+ 
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb
similarity index 96%
rename from meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb
index d44eb72f67fd..48bf3291b6f5 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb
@@ -14,9 +14,10 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0006-make-Add-top-level-Makefile.patch \
            file://0001-Fix-build-with-gcc-15.patch \
            file://mdns.service \
+           file://0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch \
            "
-BRANCH = "main"
-SRCREV = "d4658af3f5f291311c6aee4210aa6d39bda82bbe"
+BRANCH = "rel/mDNSResponder-2881"
+SRCREV = "e2a1e56a2f8d29640908c48f4de3f1ba65d1af46"
 
 inherit github-releases manpages systemd update-rc.d
 

---
base-commit: b883bd25cdd27560fdebc5a4bf56f90e99964c4c
change-id: 20260321-master-60a128932958

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


