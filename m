Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C71F8DFCD
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:59:44 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27763.1776376773528460218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VLDBB8is;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202604162159302c277d90a7000207d4-jyygm_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202604162159302c277d90a7000207d4
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Apr 2026 23:59:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QYnF6MnkeLL8GdlZpKVRv96w5hmBkArU8mXF/DtOSAg=;
 b=VLDBB8isV3nq8616yO8i1q/AsYhK0YobjS/qCA/OR42Qe3FkDg3he+33httiMGqtmyk55F
 N9IAPlKhNx+SbSjybSCbxgZqeVKRngj2ZKjjQp2y9NudoSy6o4iBjqpwZNMz5l8gvhRgr2Yg
 nstTLt0nBo87L7lRbuKbpEg3l9R9DniJZP5CymDSnyIk2EJiejJJjtg47RpaeNGQO0WVeimW
 LHHlN88tkjX9PHHZH6JIHe687egnY2Z6zhj3O1nBnMcXGPVHHKlVdZ0Rrot2AkZ7KFRvB8hE
 9Us9cFCedv0ZALosW5EG0yglXl7lGwTulI4+sNy8mBS1KmTur16fZlrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] poco: upgrade 1.15.1 -> 1.15.2
Date: Thu, 16 Apr 2026 23:59:20 +0200
Message-ID: <20260416215920.1988641-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126418

From: Peter Marko <peter.marko@siemens.com>

Remove explicit libatomic code from recipe as upstream has implemented
it in cmake. Tested build with all 4 qemu<arch> machines.

Release notes [1]:

Release 1.15.2 (2026-04-16)
===========================

Summary of Changes:

This release focuses on security hardening and bug fixes. Key changes include
TLS 1.3 support for NetSSL_Win, building Crypto and NetSSL with
OPENSSL_NO_DEPRECATED, removal of deprecated non-EVP OpenSSL code (breaking
change), significant multipart parsing performance improvements, Prometheus
thread/CPU metrics, GNU Hurd platform support, and numerous bug fixes across
networking, cryptography, and data handling. All bundled third-party libraries
have been updated to their latest releases.

Breaking Changes:

- GH #4602 OpenSSL: Remove deprecated non EVP code

Security Fixes:

- PR #5306 chore(dependencies): refresh bundled third-party libraries
- GH #5296 Crypto and NetSSL_OpenSSL should build with OPENSSL_NO_DEPRECATED defined
- GH #5278 NetSSL_Win does not support TLS 1.3

Bundled Third-Party Library Upgrades:

- libpng 1.6.55 -> 1.6.57 - security fixes
- libharu (hpdf) 2.4.5 -> 2.4.6 - security (TTF fixes) + memory alloc / Windows build fixes
- SQLite 3.51.2 -> 3.53.0 - WAL-reset database corruption fix, query planner improvements
- Quill 11.0.2 -> 11.1.0 - thread-local context fix, nullptr checks, backend poll hooks

Features and Enhancements:

- PR #5305 enh(Foundation): auto-disable FastLogger on unsupported platforms
- PR #5303 enh: bump macOS deployment target to 15.0 (Sequoia)
- PR #5300 chore(PropertyConfigurationFile): use '=' as default separator
- PR #5298 Foundation: Fix sign-compare warnings in StreamConverter
- PR #5294 Link with atomic library on architectures that need it
- GH #5292 enh: reduce binary size growth since 1.14.2
- GH #5291 Component Install Support
- PR #5286 fix(cmake,DNSSD): build fixes and cmake dependency resolution
- GH #5280 Remove WinDriver.cpp files
- GH #5275 Prometheus: add memory and thread metrics
- GH #5266 PropertyFileConfiguration: add include file capability
- GH #5250 Poco::Net::Context::addCertificateAuthority() could include a call to SSL_CTX_load_verify_locations()
- GH #4846 NetSSL/Crypto: Replace deprecated OpenSSL features

Bug Fixes and Improvements:

- PR #5309 fix(Redis,XML,CppParser): replace dynamic_cast with static_cast for hidden visibility
- GH #5308 Net: SocketProactor reports success on TCP write after non-blocking connect refusal
- PR #5304 fix(MongoDB): suppress false topology change notifications on heartbeat
- PR #5293 Port library to GNU Hurd
- GH #5288 Fuzzing Issue in MailMessage
- GH #5287 Fuzzing Issue in DateTime
- PR #5284 fix(Redis): use shared_ptr for NotificationCenter, harden AsyncNotificationCenter::stop()
- PR #5283 fix(ApacheConnector,Foundation): fix compile warnings with GCC 15
- GH #5269 Pipe close deadlocks on
- PR #5264 fix(Data): Robust date/time parsing in SQLite/PostgreSQL extractor
- GH #5263 X509Certificate validFrom method throws exception for timestamps ending with Z
- GH #4883 SecureSocketImpl::shutdown() regression since 1.14.0
- GH #4772 InvalidCertificateHandler onInvalidCertificate wrong exception
- GH #4118 Poco Multipart parsing is 10x slower than its Boost/beat or restinio equivalent
- GH #1097 Process::isRunning returns true for defunct tagged process

[1] https://github.com/pocoproject/poco/blob/poco-1.15.2-release/CHANGELOG

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch     | 2 +-
 .../poco/{poco_1.15.1.bb => poco_1.15.2.bb}                | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.15.1.bb => poco_1.15.2.bb} (92%)

diff --git a/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
index 734b65efa2..293321bfa8 100644
--- a/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
+++ b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
@@ -22,7 +22,7 @@ diff --git a/dependencies/quill/include/quill/core/Rdtsc.h b/dependencies/quill/
 index 3d0ae9f26..67f26cb89 100644
 --- a/dependencies/quill/include/quill/core/Rdtsc.h
 +++ b/dependencies/quill/include/quill/core/Rdtsc.h
-@@ -100,7 +100,7 @@ QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
+@@ -95,7 +95,7 @@ QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
    __asm__ volatile("stck %0" : "=Q"(tsc) : : "cc");
    return tsc;
  }
diff --git a/meta-oe/recipes-support/poco/poco_1.15.1.bb b/meta-oe/recipes-support/poco/poco_1.15.2.bb
similarity index 92%
rename from meta-oe/recipes-support/poco/poco_1.15.1.bb
rename to meta-oe/recipes-support/poco/poco_1.15.2.bb
index b50d1ee4ec..5a873a1d85 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
            file://run-ptest \
            "
-SRCREV = "a1aacbba1bda4301db01bb1a2c2ab80677756b90"
+SRCREV = "afbb1ab68f29eec7079e2fdfa04b3efdbec6529d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
@@ -76,11 +76,6 @@ EXTRA_OECMAKE:append:class-native = " -DPOCO_UNBUNDLED=OFF"
 # do not use rpath
 EXTRA_OECMAKE:append = " -DCMAKE_SKIP_RPATH=ON"
 
-LDFLAGS:append:riscv32 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
-LDFLAGS:append:mips = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
-LDFLAGS:append:powerpc = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
-LDFLAGS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
-
 python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
     pn = d.getVar("PN")

