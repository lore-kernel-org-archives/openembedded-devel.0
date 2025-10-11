Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD878CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 22:39:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.9280.1760222344570367545
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 15:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WgEwO3J9;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78af743c232so2853466b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760222344; x=1760827144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KD/5Gg+JfxNGyOQfP+qAdzm9iNEkFeeoOqilS2AsN+4=;
        b=WgEwO3J9eDJ5wsoBmYULRX0B3fZXJis3RPw397UFXo5SZduJRk9/i1gfltZJRcZCEf
         JjSxeM34IgRcHv6lBSSLgnGYItAXa9ozzvGZxQW97aa7XB6WxqZQiDAS+YRCvqS8Ff8p
         N1Cc/Oc2lxGeTJBayR5CoBZTXI27xOJ8Mtj+he2j0BulEvQIjkFjePzDItZgs2vFB3Sy
         FNOJP5iCeDygDASzZI28waSniu1Ughhgc+aS3esatwdjunIwrPRhynTWHdvMzSWlzKht
         3FKYlbK/3qGCMFWfbQYDwQNPO1G8WuPfjTKC9P0UbAaMJgs/gtPzUFmof+cZs0rfHLoG
         EQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760222344; x=1760827144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KD/5Gg+JfxNGyOQfP+qAdzm9iNEkFeeoOqilS2AsN+4=;
        b=oGnlsOmceyabju8nl0OdTWrkr0JfgnfG9x3gWGNyHVKZPdTwnIsNqDmvM0tvhG8iJr
         3D1zVxW6fnBGrx5gRj/4hGhpUvY+0Mj2iC4N7CJBvKEMYE7oLlQRHhnUPtAnf9doRTeC
         8V+U8wnMMGoC/PfdNepFVptkegF5MTDyyysmjSscISG8SImztcMvzBqo1rXidsagCxwp
         BbdJreBekQyNR5s8lGkX7LBVsb6slObDsUW021/+XQngNFx/zKr9xLCThrn8Z9emRKTW
         jhW1lCOTtRcnAVHV1SSG272vTdDXO4Sf23l1Kpg4MNkmegxdgGk3yS8hjuxRdgw5bjHk
         zosw==
X-Gm-Message-State: AOJu0Yw2WAeT9DenLpKI10Ur3L1v5bGrsvgT4cGNZYbnalGFYnicn8C9
	QXAfeXNLA5LwWihmSX7DVyj9dJsSEfZ6PusJ6mRUQQxFl1BR8nbv+XL4B5aUeDgN
X-Gm-Gg: ASbGncsVJGoAMNkIduOi2bSW+XBXLfAvx5IMxtkrBWiW3bvxZHEuvvlJC19iEDepmyU
	UWFdAUba1eHsZs9dQ4Exdkr34nEZP22CgaL0j3WC2S0ICYHOx5ag++G3VnsNlmA+LvwvmehFiH4
	/JVyLtZClFmBuaioHYos8NmqXx8tkXzgDVNBIxpXIFgeg0BXOGyLPLFJWRuFNXFpnuB/zmugj2b
	tYcE6AtJMpH0GcilWTSDGof2wfrarPhR+C6QoDx5PFNLmqUF+jei9sUVuZX5kfkYSCWhdXmo6C7
	99aoLdD+LTNpJeDl0HMG6i390J89VkI5b3eAlDNCD/8kS38gC0rTri8+N3bTMkwKmoA6eOZIlNI
	zGqLulaBRAzQkvbdnUvQSLt9StgosKXeVSDjbr0c12w==
X-Google-Smtp-Source: AGHT+IGfun9rVM8F+nEprodZXsYkeQuv7cS/6eneJ5l3Ruu9JtqTTY0Ff7GjuCTLNXmu0ZH54CZePg==
X-Received: by 2002:a05:6a20:939e:b0:24d:301a:79d0 with SMTP id adf61e73a8af0-32da83db599mr22661465637.38.1760222343389;
        Sat, 11 Oct 2025 15:39:03 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4a63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a392cdsm7574152a91.7.2025.10.11.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 15:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] webrtc-audio-processing-2: Fix build with abseil-cpp 202508
Date: Sat, 11 Oct 2025 15:39:00 -0700
Message-ID: <20251011223900.1907272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 22:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120511

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webrtc-audio-processing-2/60.patch        | 619 ++++++++++++++++++
 .../webrtc-audio-processing-2_2.1.bb          |   1 +
 2 files changed, 620 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2/60.patch

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2/60.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2/60.patch
new file mode 100644
index 0000000000..5a4c154060
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2/60.patch
@@ -0,0 +1,619 @@
+From c8896801dfbfe03b56f85c1533abc077ff74a533 Mon Sep 17 00:00:00 2001
+From: Reilly Brogan <reilly@reillybrogan.com>
+Date: Tue, 19 Aug 2025 14:47:03 -0500
+Subject: [PATCH 1/2] Fix build with abseil-cpp 202508
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/60]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ webrtc/api/audio/audio_processing.h           | 12 +++++++++
+ webrtc/api/make_ref_counted.h                 | 13 ++++++++++
+ webrtc/api/scoped_refptr.h                    | 15 +++++++++++
+ .../aec_dump/aec_dump_factory.h               | 15 +++++++++++
+ .../aec_dump/null_aec_dump_factory.cc         | 25 +++++++++++++++++++
+ .../audio_processing/audio_processing_impl.cc |  9 +++++++
+ .../audio_processing/audio_processing_impl.h  |  9 +++++++
+ 7 files changed, 98 insertions(+)
+
+diff --git a/webrtc/api/audio/audio_processing.h b/webrtc/api/audio/audio_processing.h
+index dca75f2..4580ba9 100644
+--- a/webrtc/api/audio/audio_processing.h
++++ b/webrtc/api/audio/audio_processing.h
+@@ -28,6 +28,7 @@
+ #include <string>
+ #include <utility>
+ 
++#include "absl/base/config.h"
+ #include "absl/base/nullability.h"
+ #include "absl/strings/string_view.h"
+ #include "api/array_view.h"
+@@ -632,6 +633,7 @@ class RTC_EXPORT AudioProcessing : public RefCountInterface {
+   // return value of true indicates that the file has been
+   // sucessfully opened, while a value of false indicates that
+   // opening the file failed.
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   virtual bool CreateAndAttachAecDump(
+       absl::string_view file_name,
+       int64_t max_log_size_bytes,
+@@ -640,6 +642,16 @@ class RTC_EXPORT AudioProcessing : public RefCountInterface {
+       absl::Nonnull<FILE*> handle,
+       int64_t max_log_size_bytes,
+       absl::Nonnull<TaskQueueBase*> worker_queue) = 0;
++#else
++  virtual bool CreateAndAttachAecDump(absl::string_view file_name,
++                                      int64_t max_log_size_bytes,
++                                      TaskQueueBase* absl_nonnull
++                                          worker_queue) = 0;
++  virtual bool CreateAndAttachAecDump(FILE* absl_nonnull handle,
++                                      int64_t max_log_size_bytes,
++                                      TaskQueueBase* absl_nonnull
++                                          worker_queue) = 0;
++#endif
+ 
+   // TODO(webrtc:5298) Deprecated variant.
+   // Attaches provided webrtc::AecDump for recording debugging
+diff --git a/webrtc/api/make_ref_counted.h b/webrtc/api/make_ref_counted.h
+index b5f4e99..080023a 100644
+--- a/webrtc/api/make_ref_counted.h
++++ b/webrtc/api/make_ref_counted.h
+@@ -13,6 +13,7 @@
+ #include <type_traits>
+ #include <utility>
+ 
++#include "absl/base/config.h"
+ #include "absl/base/nullability.h"
+ #include "api/ref_count.h"
+ #include "api/scoped_refptr.h"
+@@ -86,7 +87,11 @@ template <
+     typename std::enable_if<std::is_convertible_v<T*, RefCountInterface*> &&
+                                 std::is_abstract_v<T>,
+                             T>::type* = nullptr>
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+ absl::Nonnull<scoped_refptr<T>> make_ref_counted(Args&&... args) {
++#else
++absl_nonnull scoped_refptr<T> make_ref_counted(Args&&... args) {
++#endif
+   return scoped_refptr<T>(new RefCountedObject<T>(std::forward<Args>(args)...));
+ }
+ 
+@@ -99,7 +104,11 @@ template <
+         !std::is_convertible_v<T*, RefCountInterface*> &&
+             webrtc_make_ref_counted_internal::HasAddRefAndRelease<T>::value,
+         T>::type* = nullptr>
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+ absl::Nonnull<scoped_refptr<T>> make_ref_counted(Args&&... args) {
++#else
++absl_nonnull scoped_refptr<T> make_ref_counted(Args&&... args) {
++#endif
+   return scoped_refptr<T>(new T(std::forward<Args>(args)...));
+ }
+ 
+@@ -113,7 +122,11 @@ template <
+             !webrtc_make_ref_counted_internal::HasAddRefAndRelease<T>::value,
+ 
+         T>::type* = nullptr>
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+ absl::Nonnull<scoped_refptr<FinalRefCountedObject<T>>> make_ref_counted(
++#else
++absl_nonnull scoped_refptr<FinalRefCountedObject<T>> make_ref_counted(
++#endif
+     Args&&... args) {
+   return scoped_refptr<FinalRefCountedObject<T>>(
+       new FinalRefCountedObject<T>(std::forward<Args>(args)...));
+diff --git a/webrtc/api/scoped_refptr.h b/webrtc/api/scoped_refptr.h
+index c6fb560..8c441ff 100644
+--- a/webrtc/api/scoped_refptr.h
++++ b/webrtc/api/scoped_refptr.h
+@@ -66,6 +66,7 @@
+ #include <cstddef>
+ #include <utility>
+ 
++#include "absl/base/config.h"
+ #include "absl/base/nullability.h"
+ 
+ namespace webrtc {
+@@ -73,13 +74,19 @@ namespace webrtc {
+ template <class T>
+ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
+  public:
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   using absl_nullability_compatible = void;
++#endif
+   using element_type = T;
+ 
+   scoped_refptr() : ptr_(nullptr) {}
+   scoped_refptr(std::nullptr_t) : ptr_(nullptr) {}  // NOLINT(runtime/explicit)
+ 
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   explicit scoped_refptr(absl::Nullable<T*> p) : ptr_(p) {
++#else
++  explicit scoped_refptr(T* absl_nullable p) : ptr_(p) {
++#endif
+     if (ptr_)
+       ptr_->AddRef();
+   }
+@@ -122,7 +129,11 @@ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
+     return retVal;
+   }
+ 
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   scoped_refptr<T>& operator=(absl::Nullable<T*> p) {
++#else
++  scoped_refptr<T>& operator=(T* absl_nullable p) {
++#endif
+     // AddRef first so that self assignment should work
+     if (p)
+       p->AddRef();
+@@ -152,7 +163,11 @@ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
+     return *this;
+   }
+ 
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   void swap(absl::Nonnull<T**> pp) noexcept {
++#else
++  void swap(T** absl_nonnull pp) noexcept {
++#endif
+     T* p = ptr_;
+     ptr_ = *pp;
+     *pp = p;
+diff --git a/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h b/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
+index 0d258a9..14d8b39 100644
+--- a/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
++++ b/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
+@@ -29,6 +29,7 @@ class RTC_EXPORT AecDumpFactory {
+   // The AecDump takes responsibility for `handle` and closes it in the
+   // destructor. A non-null return value indicates that the file has been
+   // sucessfully opened.
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+   static absl::Nullable<std::unique_ptr<AecDump>> Create(
+       FileWrapper file,
+       int64_t max_log_size_bytes,
+@@ -41,6 +42,20 @@ class RTC_EXPORT AecDumpFactory {
+       absl::Nonnull<FILE*> handle,
+       int64_t max_log_size_bytes,
+       absl::Nonnull<TaskQueueBase*> worker_queue);
++#else
++  static absl_nullable std::unique_ptr<AecDump> Create(
++      FileWrapper file,
++      int64_t max_log_size_bytes,
++      TaskQueueBase* absl_nonnull worker_queue);
++  static absl_nullable std::unique_ptr<AecDump> Create(
++      absl::string_view file_name,
++      int64_t max_log_size_bytes,
++      TaskQueueBase* absl_nonnull worker_queue);
++  static absl_nullable std::unique_ptr<AecDump> Create(
++      FILE* absl_nonnull handle,
++      int64_t max_log_size_bytes,
++      TaskQueueBase* absl_nonnull worker_queue);
++#endif
+ };
+ 
+ }  // namespace webrtc
+diff --git a/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc b/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
+index 63929af..658bcee 100644
+--- a/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
++++ b/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
+@@ -16,6 +16,7 @@
+ 
+ namespace webrtc {
+ 
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+ absl::Nullable<std::unique_ptr<AecDump>> AecDumpFactory::Create(
+     FileWrapper file,
+     int64_t max_log_size_bytes,
+@@ -37,3 +38,27 @@ absl::Nullable<std::unique_ptr<AecDump>> AecDumpFactory::Create(
+   return nullptr;
+ }
+ }  // namespace webrtc
++#else
++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
++    FileWrapper file,
++    int64_t max_log_size_bytes,
++    TaskQueueBase* absl_nonnull worker_queue) {
++  return nullptr;
++}
++
++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
++    absl::string_view file_name,
++    int64_t max_log_size_bytes,
++    TaskQueueBase* absl_nonnull worker_queue) {
++  return nullptr;
++}
++
++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
++    FILE* absl_nonnull handle,
++    int64_t max_log_size_bytes,
++    TaskQueueBase* absl_nonnull worker_queue) {
++  return nullptr;
++}
++}  // namespace webrtc
++
++#endif
+diff --git a/webrtc/modules/audio_processing/audio_processing_impl.cc b/webrtc/modules/audio_processing/audio_processing_impl.cc
+index a1cba51..1dfe26d 100644
+--- a/webrtc/modules/audio_processing/audio_processing_impl.cc
++++ b/webrtc/modules/audio_processing/audio_processing_impl.cc
+@@ -19,6 +19,7 @@
+ #include <type_traits>
+ #include <utility>
+ 
++#include "absl/base/config.h"
+ #include "absl/base/nullability.h"
+ #include "absl/strings/match.h"
+ #include "absl/strings/string_view.h"
+@@ -1787,7 +1788,11 @@ void AudioProcessingImpl::UpdateRecommendedInputVolumeLocked() {
+ bool AudioProcessingImpl::CreateAndAttachAecDump(
+     absl::string_view file_name,
+     int64_t max_log_size_bytes,
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+     absl::Nonnull<TaskQueueBase*> worker_queue) {
++#else
++    TaskQueueBase* absl_nonnull worker_queue) {
++#endif
+   std::unique_ptr<AecDump> aec_dump =
+       AecDumpFactory::Create(file_name, max_log_size_bytes, worker_queue);
+   if (!aec_dump) {
+@@ -1801,7 +1806,11 @@ bool AudioProcessingImpl::CreateAndAttachAecDump(
+ bool AudioProcessingImpl::CreateAndAttachAecDump(
+     FILE* handle,
+     int64_t max_log_size_bytes,
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+     absl::Nonnull<TaskQueueBase*> worker_queue) {
++#else
++    TaskQueueBase* absl_nonnull worker_queue) {
++#endif
+   std::unique_ptr<AecDump> aec_dump =
+       AecDumpFactory::Create(handle, max_log_size_bytes, worker_queue);
+   if (!aec_dump) {
+diff --git a/webrtc/modules/audio_processing/audio_processing_impl.h b/webrtc/modules/audio_processing/audio_processing_impl.h
+index ecdc055..51a2bfb 100644
+--- a/webrtc/modules/audio_processing/audio_processing_impl.h
++++ b/webrtc/modules/audio_processing/audio_processing_impl.h
+@@ -20,6 +20,7 @@
+ #include <string>
+ #include <vector>
+ 
++#include "absl/base/config.h"
+ #include "absl/base/nullability.h"
+ #include "absl/strings/string_view.h"
+ #include "api/array_view.h"
+@@ -74,11 +75,19 @@ class AudioProcessingImpl : public AudioProcessing {
+   bool CreateAndAttachAecDump(
+       absl::string_view file_name,
+       int64_t max_log_size_bytes,
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+       absl::Nonnull<TaskQueueBase*> worker_queue) override;
++#else
++      TaskQueueBase* absl_nonnull worker_queue) override;
++#endif
+   bool CreateAndAttachAecDump(
+       FILE* handle,
+       int64_t max_log_size_bytes,
++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
+       absl::Nonnull<TaskQueueBase*> worker_queue) override;
++#else
++      TaskQueueBase* absl_nonnull worker_queue) override;
++#endif
+   // TODO(webrtc:5298) Deprecated variant.
+   void AttachAecDump(std::unique_ptr<AecDump> aec_dump) override;
+   void DetachAecDump() override;
+-- 
+GitLab
+
+
+From bc838790eeb6066d30f019c2a3516bd2b824a5c8 Mon Sep 17 00:00:00 2001
+From: Reilly Brogan <reilly@reillybrogan.com>
+Date: Tue, 19 Aug 2025 15:25:51 -0500
+Subject: [PATCH 2/2] patches: Track abseil-cpp 202508 support patch
+
+---
+ ...001-Fix-build-with-abseil-cpp-202508.patch | 297 ++++++++++++++++++
+ 1 file changed, 297 insertions(+)
+ create mode 100644 patches/0001-Fix-build-with-abseil-cpp-202508.patch
+
+diff --git a/patches/0001-Fix-build-with-abseil-cpp-202508.patch b/patches/0001-Fix-build-with-abseil-cpp-202508.patch
+new file mode 100644
+index 0000000..06c3794
+--- /dev/null
++++ b/patches/0001-Fix-build-with-abseil-cpp-202508.patch
+@@ -0,0 +1,297 @@
++From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
++From: Reilly Brogan <reilly@reillybrogan.com>
++Date: Tue, 19 Aug 2025 14:47:03 -0500
++Subject: [PATCH] Fix build with abseil-cpp 202508
++
++---
++ webrtc/api/audio/audio_processing.h           | 12 +++++++++
++ webrtc/api/make_ref_counted.h                 | 13 ++++++++++
++ webrtc/api/scoped_refptr.h                    | 15 +++++++++++
++ .../aec_dump/aec_dump_factory.h               | 15 +++++++++++
++ .../aec_dump/null_aec_dump_factory.cc         | 25 +++++++++++++++++++
++ .../audio_processing/audio_processing_impl.cc |  9 +++++++
++ .../audio_processing/audio_processing_impl.h  |  9 +++++++
++ 7 files changed, 98 insertions(+)
++
++diff --git a/webrtc/api/audio/audio_processing.h b/webrtc/api/audio/audio_processing.h
++index dca75f2..4580ba9 100644
++--- a/webrtc/api/audio/audio_processing.h
+++++ b/webrtc/api/audio/audio_processing.h
++@@ -28,6 +28,7 @@
++ #include <string>
++ #include <utility>
++ 
+++#include "absl/base/config.h"
++ #include "absl/base/nullability.h"
++ #include "absl/strings/string_view.h"
++ #include "api/array_view.h"
++@@ -632,6 +633,7 @@ class RTC_EXPORT AudioProcessing : public RefCountInterface {
++   // return value of true indicates that the file has been
++   // sucessfully opened, while a value of false indicates that
++   // opening the file failed.
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   virtual bool CreateAndAttachAecDump(
++       absl::string_view file_name,
++       int64_t max_log_size_bytes,
++@@ -640,6 +642,16 @@ class RTC_EXPORT AudioProcessing : public RefCountInterface {
++       absl::Nonnull<FILE*> handle,
++       int64_t max_log_size_bytes,
++       absl::Nonnull<TaskQueueBase*> worker_queue) = 0;
+++#else
+++  virtual bool CreateAndAttachAecDump(absl::string_view file_name,
+++                                      int64_t max_log_size_bytes,
+++                                      TaskQueueBase* absl_nonnull
+++                                          worker_queue) = 0;
+++  virtual bool CreateAndAttachAecDump(FILE* absl_nonnull handle,
+++                                      int64_t max_log_size_bytes,
+++                                      TaskQueueBase* absl_nonnull
+++                                          worker_queue) = 0;
+++#endif
++ 
++   // TODO(webrtc:5298) Deprecated variant.
++   // Attaches provided webrtc::AecDump for recording debugging
++diff --git a/webrtc/api/make_ref_counted.h b/webrtc/api/make_ref_counted.h
++index b5f4e99..080023a 100644
++--- a/webrtc/api/make_ref_counted.h
+++++ b/webrtc/api/make_ref_counted.h
++@@ -13,6 +13,7 @@
++ #include <type_traits>
++ #include <utility>
++ 
+++#include "absl/base/config.h"
++ #include "absl/base/nullability.h"
++ #include "api/ref_count.h"
++ #include "api/scoped_refptr.h"
++@@ -86,7 +87,11 @@ template <
++     typename std::enable_if<std::is_convertible_v<T*, RefCountInterface*> &&
++                                 std::is_abstract_v<T>,
++                             T>::type* = nullptr>
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++ absl::Nonnull<scoped_refptr<T>> make_ref_counted(Args&&... args) {
+++#else
+++absl_nonnull scoped_refptr<T> make_ref_counted(Args&&... args) {
+++#endif
++   return scoped_refptr<T>(new RefCountedObject<T>(std::forward<Args>(args)...));
++ }
++ 
++@@ -99,7 +104,11 @@ template <
++         !std::is_convertible_v<T*, RefCountInterface*> &&
++             webrtc_make_ref_counted_internal::HasAddRefAndRelease<T>::value,
++         T>::type* = nullptr>
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++ absl::Nonnull<scoped_refptr<T>> make_ref_counted(Args&&... args) {
+++#else
+++absl_nonnull scoped_refptr<T> make_ref_counted(Args&&... args) {
+++#endif
++   return scoped_refptr<T>(new T(std::forward<Args>(args)...));
++ }
++ 
++@@ -113,7 +122,11 @@ template <
++             !webrtc_make_ref_counted_internal::HasAddRefAndRelease<T>::value,
++ 
++         T>::type* = nullptr>
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++ absl::Nonnull<scoped_refptr<FinalRefCountedObject<T>>> make_ref_counted(
+++#else
+++absl_nonnull scoped_refptr<FinalRefCountedObject<T>> make_ref_counted(
+++#endif
++     Args&&... args) {
++   return scoped_refptr<FinalRefCountedObject<T>>(
++       new FinalRefCountedObject<T>(std::forward<Args>(args)...));
++diff --git a/webrtc/api/scoped_refptr.h b/webrtc/api/scoped_refptr.h
++index c6fb560..8c441ff 100644
++--- a/webrtc/api/scoped_refptr.h
+++++ b/webrtc/api/scoped_refptr.h
++@@ -66,6 +66,7 @@
++ #include <cstddef>
++ #include <utility>
++ 
+++#include "absl/base/config.h"
++ #include "absl/base/nullability.h"
++ 
++ namespace webrtc {
++@@ -73,13 +74,19 @@ namespace webrtc {
++ template <class T>
++ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
++  public:
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   using absl_nullability_compatible = void;
+++#endif
++   using element_type = T;
++ 
++   scoped_refptr() : ptr_(nullptr) {}
++   scoped_refptr(std::nullptr_t) : ptr_(nullptr) {}  // NOLINT(runtime/explicit)
++ 
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   explicit scoped_refptr(absl::Nullable<T*> p) : ptr_(p) {
+++#else
+++  explicit scoped_refptr(T* absl_nullable p) : ptr_(p) {
+++#endif
++     if (ptr_)
++       ptr_->AddRef();
++   }
++@@ -122,7 +129,11 @@ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
++     return retVal;
++   }
++ 
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   scoped_refptr<T>& operator=(absl::Nullable<T*> p) {
+++#else
+++  scoped_refptr<T>& operator=(T* absl_nullable p) {
+++#endif
++     // AddRef first so that self assignment should work
++     if (p)
++       p->AddRef();
++@@ -152,7 +163,11 @@ class ABSL_NULLABILITY_COMPATIBLE scoped_refptr {
++     return *this;
++   }
++ 
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   void swap(absl::Nonnull<T**> pp) noexcept {
+++#else
+++  void swap(T** absl_nonnull pp) noexcept {
+++#endif
++     T* p = ptr_;
++     ptr_ = *pp;
++     *pp = p;
++diff --git a/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h b/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
++index 0d258a9..14d8b39 100644
++--- a/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
+++++ b/webrtc/modules/audio_processing/aec_dump/aec_dump_factory.h
++@@ -29,6 +29,7 @@ class RTC_EXPORT AecDumpFactory {
++   // The AecDump takes responsibility for `handle` and closes it in the
++   // destructor. A non-null return value indicates that the file has been
++   // sucessfully opened.
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++   static absl::Nullable<std::unique_ptr<AecDump>> Create(
++       FileWrapper file,
++       int64_t max_log_size_bytes,
++@@ -41,6 +42,20 @@ class RTC_EXPORT AecDumpFactory {
++       absl::Nonnull<FILE*> handle,
++       int64_t max_log_size_bytes,
++       absl::Nonnull<TaskQueueBase*> worker_queue);
+++#else
+++  static absl_nullable std::unique_ptr<AecDump> Create(
+++      FileWrapper file,
+++      int64_t max_log_size_bytes,
+++      TaskQueueBase* absl_nonnull worker_queue);
+++  static absl_nullable std::unique_ptr<AecDump> Create(
+++      absl::string_view file_name,
+++      int64_t max_log_size_bytes,
+++      TaskQueueBase* absl_nonnull worker_queue);
+++  static absl_nullable std::unique_ptr<AecDump> Create(
+++      FILE* absl_nonnull handle,
+++      int64_t max_log_size_bytes,
+++      TaskQueueBase* absl_nonnull worker_queue);
+++#endif
++ };
++ 
++ }  // namespace webrtc
++diff --git a/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc b/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
++index 63929af..658bcee 100644
++--- a/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
+++++ b/webrtc/modules/audio_processing/aec_dump/null_aec_dump_factory.cc
++@@ -16,6 +16,7 @@
++ 
++ namespace webrtc {
++ 
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++ absl::Nullable<std::unique_ptr<AecDump>> AecDumpFactory::Create(
++     FileWrapper file,
++     int64_t max_log_size_bytes,
++@@ -37,3 +38,27 @@ absl::Nullable<std::unique_ptr<AecDump>> AecDumpFactory::Create(
++   return nullptr;
++ }
++ }  // namespace webrtc
+++#else
+++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
+++    FileWrapper file,
+++    int64_t max_log_size_bytes,
+++    TaskQueueBase* absl_nonnull worker_queue) {
+++  return nullptr;
+++}
+++
+++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
+++    absl::string_view file_name,
+++    int64_t max_log_size_bytes,
+++    TaskQueueBase* absl_nonnull worker_queue) {
+++  return nullptr;
+++}
+++
+++absl_nullable std::unique_ptr<AecDump> AecDumpFactory::Create(
+++    FILE* absl_nonnull handle,
+++    int64_t max_log_size_bytes,
+++    TaskQueueBase* absl_nonnull worker_queue) {
+++  return nullptr;
+++}
+++}  // namespace webrtc
+++
+++#endif
++diff --git a/webrtc/modules/audio_processing/audio_processing_impl.cc b/webrtc/modules/audio_processing/audio_processing_impl.cc
++index a1cba51..1dfe26d 100644
++--- a/webrtc/modules/audio_processing/audio_processing_impl.cc
+++++ b/webrtc/modules/audio_processing/audio_processing_impl.cc
++@@ -19,6 +19,7 @@
++ #include <type_traits>
++ #include <utility>
++ 
+++#include "absl/base/config.h"
++ #include "absl/base/nullability.h"
++ #include "absl/strings/match.h"
++ #include "absl/strings/string_view.h"
++@@ -1787,7 +1788,11 @@ void AudioProcessingImpl::UpdateRecommendedInputVolumeLocked() {
++ bool AudioProcessingImpl::CreateAndAttachAecDump(
++     absl::string_view file_name,
++     int64_t max_log_size_bytes,
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++     absl::Nonnull<TaskQueueBase*> worker_queue) {
+++#else
+++    TaskQueueBase* absl_nonnull worker_queue) {
+++#endif
++   std::unique_ptr<AecDump> aec_dump =
++       AecDumpFactory::Create(file_name, max_log_size_bytes, worker_queue);
++   if (!aec_dump) {
++@@ -1801,7 +1806,11 @@ bool AudioProcessingImpl::CreateAndAttachAecDump(
++ bool AudioProcessingImpl::CreateAndAttachAecDump(
++     FILE* handle,
++     int64_t max_log_size_bytes,
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++     absl::Nonnull<TaskQueueBase*> worker_queue) {
+++#else
+++    TaskQueueBase* absl_nonnull worker_queue) {
+++#endif
++   std::unique_ptr<AecDump> aec_dump =
++       AecDumpFactory::Create(handle, max_log_size_bytes, worker_queue);
++   if (!aec_dump) {
++diff --git a/webrtc/modules/audio_processing/audio_processing_impl.h b/webrtc/modules/audio_processing/audio_processing_impl.h
++index ecdc055..51a2bfb 100644
++--- a/webrtc/modules/audio_processing/audio_processing_impl.h
+++++ b/webrtc/modules/audio_processing/audio_processing_impl.h
++@@ -20,6 +20,7 @@
++ #include <string>
++ #include <vector>
++ 
+++#include "absl/base/config.h"
++ #include "absl/base/nullability.h"
++ #include "absl/strings/string_view.h"
++ #include "api/array_view.h"
++@@ -74,11 +75,19 @@ class AudioProcessingImpl : public AudioProcessing {
++   bool CreateAndAttachAecDump(
++       absl::string_view file_name,
++       int64_t max_log_size_bytes,
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++       absl::Nonnull<TaskQueueBase*> worker_queue) override;
+++#else
+++      TaskQueueBase* absl_nonnull worker_queue) override;
+++#endif
++   bool CreateAndAttachAecDump(
++       FILE* handle,
++       int64_t max_log_size_bytes,
+++#if defined(ABSL_LTS_RELEASE_VERSION) && ABSL_LTS_RELEASE_VERSION < 20250512
++       absl::Nonnull<TaskQueueBase*> worker_queue) override;
+++#else
+++      TaskQueueBase* absl_nonnull worker_queue) override;
+++#endif
++   // TODO(webrtc:5298) Deprecated variant.
++   void AttachAecDump(std::unique_ptr<AecDump> aec_dump) override;
++   void DetachAecDump() override;
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
index 9aab57a089..4d076630aa 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2"
 SRC_URI = " \
     http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/webrtc-audio-processing-${PV}.tar.xz \
     file://e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch \
+    file://60.patch \
 "
 SRC_URI[sha256sum] = "ae9302824b2038d394f10213cab05312c564a038434269f11dbf68f511f9f9fe"
 S = "${UNPACKDIR}/webrtc-audio-processing-${PV}"

