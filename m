Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015B4C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 07:00:27 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.13831.1746169217574705246
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 May 2025 00:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/v2t1x0;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af589091049so1283674a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746169217; x=1746774017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhekmGT0fOXVgpsE57c0a0c6RfFovAge3qrk4AIcB6A=;
        b=M/v2t1x0SS9HIiu/EXoBA4QtaIQNb/Bs3MdZ4nTNwIXRsPpra6z7wTg8lOOwtVmX43
         PgYSq+5upbtVnSjqCBbrk0gs5mKgXrkqPAFS0Z6rfQGo15vnQ8JNXTpbzKV+yZ+vjlhj
         fThxfIO08PPm759qwLQBi6GiLRjMLaV0Hb2VwgDEaUAvz5SUpgkufXuBNf1ltG9ZWDuM
         9fUqGuOXASHk5yQd0d2ceAL/AMD8taWas8u+rqHeYisVM384Sg4cWFqLwZExy7mrhyQj
         7ziBQlGAEiJOl8A2yTYLb/EJQgjJrunu6XWQctrA8WTOqhrbgeJtZ3I7TyDFQrVZ4y7N
         Crqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169217; x=1746774017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhekmGT0fOXVgpsE57c0a0c6RfFovAge3qrk4AIcB6A=;
        b=NoV3LYdyxTXe9vby4ARM/mcOOhlQOaByCivmt4QjyR1aA0c7hcbYYkdhZOwjcmlFJR
         6ltCt7zJ1pV8LeGCKP1JRg1/glhhedKcZ6leOBig6MMwjTwSoqCl9B8qE0kQHCGdRvu4
         zmrAbch5GKvko+P3rpOc9It6k3KeeBI6Au1McPVzag5YEWakYN4jZ7rfWcIPgJyTMRZJ
         QZPU2vQ0x2JNW+CM4W6fK4RMcySAPKIcZEHSq6lveDS0Mmu9stfDmFRTSSnsTuEdkIWc
         +B/n1VZbRbHH2tJ7S/gbsmz0ugZkyYYXOQIJNVykvpcVnk+SSUs9vQ2EXvF3+0uhTnGz
         Y+Mg==
X-Gm-Message-State: AOJu0Yw7qLCBpDRFXI3fgTx0H5npG7Ewd8lcKBYQqwnwBaW79mUp4M5j
	Qx469WvQJU2irM58bQ4R1mpPDtS4RI8jWfeomHsTP9k5cTmRIX9QcEFDrBtr
X-Gm-Gg: ASbGncubI51E+ofwR8C10egC1Iu3FFw9qI0Qh/imCaJzEPh1p/ekFPYVxOlV+lvmwI8
	7jOYzzSt0QSnekyE27SYtpb4KWn2PwjzL7O+vegKdJvUQ6FQqHptvm9GmDObRas6jv13TxjvTdK
	ADqs4XY6l4/z3JyOgzIAEQjvn6QszTGp2BjKZ29IsqUKs33iCVt1U1iZleUhS6EIg2memSJcXdM
	WcimtIS2cOzIUfb7z3xo7rFiksGT8yNKLVzfvSmFcZ2Txul7En8JtytEXmGxUf7en6VDL63Tbpq
	hKrb8SWthqm4XQKcnw2iisTnAeNacw3e
X-Google-Smtp-Source: AGHT+IEOTqxL6o/9VHH/BkCchtWvVJWE1vrZ+SWe4ZMJJu3KBok93k4zN6eCuoMsXTVZ9k4lIFKEtQ==
X-Received: by 2002:a17:90b:5704:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30a4e6914cemr2912885a91.30.1746169216635;
        Fri, 02 May 2025 00:00:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f920sm2152994a91.8.2025.05.02.00.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:00:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ot-br-posix: Upgrade to latest on top of trunk
Date: Fri,  2 May 2025 00:00:13 -0700
Message-ID: <20250502070013.3637845-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502070013.3637845-1-raj.khem@gmail.com>
References: <20250502070013.3637845-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 07:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117278

Drop a denied patch and use the suggestion to ignore the warning.
Compile with C++20 std, because gcc-15 has started to warn about

recipe-sysroot/usr/include/c++/15.1.0/ciso646:46:4: error: #warning "<ciso646> is deprecated in C++17, use <version> to detect implementation-specific macros" [-Werror=cpp]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-fix-build-on-GCC-14-for-yocto.patch  | 293 ------------------
 .../openthread/ot-br-posix_git.bb             |   8 +-
 2 files changed, 5 insertions(+), 296 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch
deleted file mode 100644
index dc09527cd7..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From b34d0665b790016165b4a9b565f462712057b2b5 Mon Sep 17 00:00:00 2001
-From: "deepan.shivap" <deepan.shivap@lge.com>
-Date: Wed, 13 Nov 2024 21:30:38 +0900
-Subject: [PATCH] fix build on GCC 14 for yocto
-
-GCC 14 compiler uses -fvisibility-inlines-hidden by default and
-it creates visibility conflicts.
-
-Compilation error:
-
-error: 'ot::BorderRouter::RoutingManager::RxRaTracker' declared with
-greater visibility than the type of its field 'ot::BorderRouter::
-RoutingManager::RxRaTracker::mSignalTask' [-Werror=attributes]
-| 814 | class RxRaTracker : public InstanceLocator
-| | ^~~~~~~~~~~
-| compilation terminated due to -Wfatal-errors.
-| cc1: all warnings being treated as errors
-
-In addition, for below error I have added changes refering -
-https://github.com/openwrt/openwrt/blob/main/package/libs/mbedtls/patches/100-fix-gcc14-build.patch
-
-error: array subscript 48 is outside array bounds of 'unsigned char[48]' [-Werror=array-bounds=]
-| 235 | r[i] = a[i] ^ b[i];
-| | ~^~~
-| compilation terminated due to -Wfatal-errors.
-| cc1: all warnings being treated as errors
-
----
-Upstream-Status: Denied [Reason -  https://github.com/openthread/openthread/pull/10925]
-Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
-
- src/core/border_router/routing_manager.cpp | 58 ++++++++++++++++++++++
- src/core/border_router/routing_manager.hpp | 18 +++----
- src/core/mac/data_poll_sender.cpp          |  5 ++
- src/core/mac/data_poll_sender.hpp          |  2 +-
- src/core/net/srp_client.cpp                |  2 +
- src/core/net/srp_client.hpp                |  2 +-
- src/core/thread/mle.cpp                    | 10 ++++
- src/core/thread/mle.hpp                    |  4 +-
- third_party/mbedtls/repo/library/common.h  |  2 +-
- 9 files changed, 89 insertions(+), 14 deletions(-)
-
-diff --git a/src/core/border_router/routing_manager.cpp b/src/core/border_router/routing_manager.cpp
-index 5f7916ba4..664963757 100644
---- a/src/core/border_router/routing_manager.cpp
-+++ b/src/core/border_router/routing_manager.cpp
-@@ -806,6 +806,64 @@ bool RoutingManager::NetworkDataContainsUlaRoute(void) const
-     return contains;
- }
-
-+void RoutingManager::HandleRxRaTrackerSignalTask(void)
-+{
-+    mRxRaTracker.HandleSignalTask();
-+}
-+
-+void RoutingManager::HandleRxRaTrackerExpirationTimer(void)
-+{
-+    mRxRaTracker.HandleExpirationTimer();
-+}
-+
-+void RoutingManager::HandleRxRaTrackerStaleTimer(void)
-+{
-+    mRxRaTracker.HandleStaleTimer();
-+}
-+
-+void RoutingManager::HandleRxRaTrackerRouterTimer(void)
-+{
-+    mRxRaTracker.HandleRouterTimer();
-+}
-+
-+void RoutingManager::HandleOnLinkPrefixManagerTimer(void)
-+{
-+    mOnLinkPrefixManager.HandleTimer();
-+}
-+
-+void RoutingManager::HandleRioAdvertiserimer(void)
-+{
-+    mRioAdvertiser.HandleTimer();
-+}
-+
-+#if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
-+
-+void RoutingManager::HandleNat64PrefixManagerTimer(void)
-+{
-+    mNat64PrefixManager.HandleTimer();
-+}
-+
-+#endif // OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
-+
-+void RoutingManager::HandleRoutePublisherTimer(void)
-+{
-+    mRoutePublisher.HandleTimer();
-+}
-+
-+void RoutingManager::HandleRsSenderTimer(void)
-+{
-+    mRsSender.HandleTimer();
-+}
-+
-+#if OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
-+
-+void HandlePdPrefixManagerTimer(void)
-+{
-+    mPdPrefixManager.HandleTimer();
-+}
-+
-+#endif // OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
-+
- #if OPENTHREAD_CONFIG_BORDER_ROUTING_REACHABILITY_CHECK_ICMP6_ERROR_ENABLE
-
- void RoutingManager::CheckReachabilityToSendIcmpError(const Message &aMessage, const Ip6::Header &aIp6Header)
-diff --git a/src/core/border_router/routing_manager.hpp b/src/core/border_router/routing_manager.hpp
-index bfc138957..cc866e308 100644
---- a/src/core/border_router/routing_manager.hpp
-+++ b/src/core/border_router/routing_manager.hpp
-@@ -804,10 +804,10 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleRxRaTrackerSignalTask(void) { mRxRaTracker.HandleSignalTask(); }
--    void HandleRxRaTrackerExpirationTimer(void) { mRxRaTracker.HandleExpirationTimer(); }
--    void HandleRxRaTrackerStaleTimer(void) { mRxRaTracker.HandleStaleTimer(); }
--    void HandleRxRaTrackerRouterTimer(void) { mRxRaTracker.HandleRouterTimer(); }
-+    void HandleRxRaTrackerSignalTask(void);
-+    void HandleRxRaTrackerExpirationTimer(void);
-+    void HandleRxRaTrackerStaleTimer(void);
-+    void HandleRxRaTrackerRouterTimer(void);
-
-     class RxRaTracker : public InstanceLocator
-     {
-@@ -1144,7 +1144,7 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleOnLinkPrefixManagerTimer(void) { mOnLinkPrefixManager.HandleTimer(); }
-+    void HandleOnLinkPrefixManagerTimer(void);
-
-     class OnLinkPrefixManager : public InstanceLocator
-     {
-@@ -1215,7 +1215,7 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleRioAdvertiserimer(void) { mRioAdvertiser.HandleTimer(); }
-+    void HandleRioAdvertiserimer(void);
-
-     class RioAdvertiser : public InstanceLocator
-     {
-@@ -1278,7 +1278,7 @@ private:
-
- #if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
-
--    void HandleNat64PrefixManagerTimer(void) { mNat64PrefixManager.HandleTimer(); }
-+    void HandleNat64PrefixManagerTimer(void);
-
-     class Nat64PrefixManager : public InstanceLocator
-     {
-@@ -1326,7 +1326,7 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleRoutePublisherTimer(void) { mRoutePublisher.HandleTimer(); }
-+    void HandleRoutePublisherTimer(void);
-
-     class RoutePublisher : public InstanceLocator // Manages the routes that are published in net data
-     {
-@@ -1411,7 +1411,7 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleRsSenderTimer(void) { mRsSender.HandleTimer(); }
-+    void HandleRsSenderTimer(void);
-
-     class RsSender : public InstanceLocator
-     {
-diff --git a/src/core/mac/data_poll_sender.cpp b/src/core/mac/data_poll_sender.cpp
-index c21bbacfe..6b974e164 100644
---- a/src/core/mac/data_poll_sender.cpp
-+++ b/src/core/mac/data_poll_sender.cpp
-@@ -517,6 +517,11 @@ uint32_t DataPollSender::CalculatePollPeriod(void) const
-     return period;
- }
-
-+void DataPollSender::HandlePollTimer(void)
-+{
-+    IgnoreError(SendDataPoll());
-+}
-+
- uint32_t DataPollSender::GetDefaultPollPeriod(void) const
- {
-     uint32_t pollAhead = static_cast<uint32_t>(kRetxPollPeriod) * kMaxPollRetxAttempts;
-diff --git a/src/core/mac/data_poll_sender.hpp b/src/core/mac/data_poll_sender.hpp
-index 1c532ab51..4db8e5923 100644
---- a/src/core/mac/data_poll_sender.hpp
-+++ b/src/core/mac/data_poll_sender.hpp
-@@ -257,7 +257,7 @@ private:
-     void            ScheduleNextPoll(PollPeriodSelector aPollPeriodSelector);
-     uint32_t        CalculatePollPeriod(void) const;
-     const Neighbor &GetParent(void) const;
--    void            HandlePollTimer(void) { IgnoreError(SendDataPoll()); }
-+    void            HandlePollTimer(void);
- #if OPENTHREAD_CONFIG_MULTI_RADIO
-     Error GetPollDestinationAddress(Mac::Address &aDest, Mac::RadioType &aRadioType) const;
- #else
-diff --git a/src/core/net/srp_client.cpp b/src/core/net/srp_client.cpp
-index b7150ff7f..12b8f0b4f 100644
---- a/src/core/net/srp_client.cpp
-+++ b/src/core/net/srp_client.cpp
-@@ -2444,6 +2444,8 @@ exit:
-     return error;
- }
-
-+void Client::HandleGuardTimer(void){}
-+
- #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
- void Client::SelectNextServer(bool aDisallowSwitchOnRegisteredHost)
- {
-diff --git a/src/core/net/srp_client.hpp b/src/core/net/srp_client.hpp
-index 8f5891bd0..367b1d280 100644
---- a/src/core/net/srp_client.hpp
-+++ b/src/core/net/srp_client.hpp
-@@ -1052,7 +1052,7 @@ private:
-     void  ApplyAutoStartGuardOnAttach(void);
-     void  ProcessAutoStart(void);
-     Error SelectUnicastEntry(DnsSrpUnicastType aType, DnsSrpUnicastInfo &aInfo) const;
--    void  HandleGuardTimer(void) {}
-+    void  HandleGuardTimer(void);
- #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
-     void SelectNextServer(bool aDisallowSwitchOnRegisteredHost);
- #endif
-diff --git a/src/core/thread/mle.cpp b/src/core/thread/mle.cpp
-index 4de4705be..2e07222fc 100644
---- a/src/core/thread/mle.cpp
-+++ b/src/core/thread/mle.cpp
-@@ -3853,6 +3853,11 @@ exit:
-
- #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
-
-+void Mle::HandleParentSearchTimer(void)
-+{
-+    mParentSearch.HandleTimer();
-+}
-+
- void Mle::ParentSearch::SetEnabled(bool aEnabled)
- {
-     VerifyOrExit(mEnabled != aEnabled);
-@@ -4423,6 +4428,11 @@ void Mle::TlvList::AddElementsFrom(const TlvList &aTlvList)
- //---------------------------------------------------------------------------------------------------------------------
- // DelayedSender
-
-+void Mle::HandleDelayedSenderTimer(void)
-+{
-+    mDelayedSender.HandleTimer();
-+}
-+
- Mle::DelayedSender::DelayedSender(Instance &aInstance)
-     : InstanceLocator(aInstance)
-     , mTimer(aInstance)
-diff --git a/src/core/thread/mle.hpp b/src/core/thread/mle.hpp
-index 58dcea1e7..613334896 100644
---- a/src/core/thread/mle.hpp
-+++ b/src/core/thread/mle.hpp
-@@ -1087,7 +1087,7 @@ private:
-
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
--    void HandleDelayedSenderTimer(void) { mDelayedSender.HandleTimer(); }
-+    void HandleDelayedSenderTimer(void);
-
-     class DelayedSender : public InstanceLocator
-     {
-@@ -1210,7 +1210,7 @@ private:
-     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-
- #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
--    void HandleParentSearchTimer(void) { mParentSearch.HandleTimer(); }
-+    void HandleParentSearchTimer(void);
-
-     class ParentSearch : public InstanceLocator
-     {
-diff --git a/third_party/mbedtls/repo/library/common.h b/third_party/mbedtls/repo/library/common.h
-index 3936ffdfe..ce4dc1130 100644
---- a/third_party/mbedtls/repo/library/common.h
-+++ b/third_party/mbedtls/repo/library/common.h
-@@ -199,7 +199,7 @@ static inline void mbedtls_xor(unsigned char *r,
-         uint8x16_t x = veorq_u8(v1, v2);
-         vst1q_u8(r + i, x);
-     }
--#if defined(__IAR_SYSTEMS_ICC__)
-+#if defined(__IAR_SYSTEMS_ICC__) || (defined(MBEDTLS_COMPILER_IS_GCC) && MBEDTLS_GCC_VERSION >= 140100)
-     /* This if statement helps some compilers (e.g., IAR) optimise out the byte-by-byte tail case
-      * where n is a constant multiple of 16.
-      * For other compilers (e.g. recent gcc and clang) it makes no difference if n is a compile-time
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index f4c193a8e8..3bca9df5ab 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -5,20 +5,19 @@ SUMMARY = "OpenThread Border Router"
 SECTION = "net"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
-                    file://third_party/Simple-web-server/repo/LICENSE;md5=091ac9fd29d87ad1ae5bf765d95278b0 \
                     file://third_party/cJSON/repo/LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0 \
+                    file://third_party/cpp-httplib/repo/LICENSE;md5=1321bdf796c67e3a8ab8e352dd81474b \
                     file://third_party/http-parser/repo/LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778 \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "b041fa52daaa4dfbf6aa4665d8925c1be0350ca5"
+SRCREV = "fe5855332e8f804944d737c65b75cf9a89c35e77"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
-           file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=third_party/openthread/repo \
            file://0001-Musl-build-fix.patch;patchdir=third_party/openthread/repo \
            "
 
@@ -27,6 +26,9 @@ SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
 
 inherit pkgconfig cmake systemd
 
+# Use -std=c++20 for fixing
+# recipe-sysroot/usr/include/c++/15.1.0/ciso646:46:4: error: #warning "<ciso646> is deprecated in C++17, use <version> to detect implementation-specific macros" [-Werror=cpp]
+CXXFLAGS += "-std=c++20 -Wno-error=attributes"
 LDFLAGS:append:riscv32 = " -latomic"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \

