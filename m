Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E741BC54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:34:38 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.863.1663882472713118452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oMWMgtu5;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id bj12so23853637ejb.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OojaIsv00MfeLsJhuXCtpnepMTUjkxkq1yTt/2D/VSc=;
        b=oMWMgtu5jmXILdlsanOPg0KZjeQvmE89A9nK1w7uOzhpj11ZkODx5Zs19liLbXvb+f
         voUhf1CiqjKwlxaTWKGXFvtzyIGn980QEiUP1W4CUoQB6NR3XDYzdCfZYTY/j1q3EXb4
         Mjx7KPS96iIBJ3qlIEOdz8cjrE/q+r1fGU5pB9ZUl9TZjXD73EkiF7iP2uHnsMYK4ivj
         LDaam5F86MDR6CpZI3lYWsGSunDPzdP+vX1yOAZ3ljziCDC2yz9MRf4SAXuIIWnlsheu
         eOEOyDDzFHdszsmfM75u5ACss/+EHQoSQk1dHV+OLvdjKrnAk4PV5SnDURENjnqMwnAv
         Rw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OojaIsv00MfeLsJhuXCtpnepMTUjkxkq1yTt/2D/VSc=;
        b=05kgCZgK92X/vi2CL3olCouEjp6z1DX6qGTztNM3nkbki6oG0OCb/h95kSmYNXdLge
         7hz55XjpYMRdnzVx55a93zXrsQXnImxpIRx8sy1JATFBZdW8ihMUyECj28PiuR5T1/0+
         GKUcS77g0t8gQB9KNcLSK4CNUw0M4VASJd+2FwXTvOHcwQP3ihlnVb/0t7V3yeWcBZjf
         gDwHvAJsUbP4iGAUYUNk6vljPH2N/mpHjvaGdoelrgpj/Mefcf9kT69TB2ZF4h0cva1I
         mIqkr1ETZs4YT2xj8UxKq1R1bz88vU5GrDb8KFp3wylSkBriZYOtf2LpW7DDXgMEE8OX
         xfjA==
X-Gm-Message-State: ACrzQf2b4/y8QxDeHFw5FBf0U05E0wx/VS0oGwmyZcCljPV+KsOigtHR
	AIjeD+G/vh7de9yblCIR4fAG11EmP1A=
X-Google-Smtp-Source: 
 AMsMyM7xuQVQMXqNq/evCKly+Mah/eeWUH62ODy6j5MUHTZ2j70tIJkZLMv1U+T6LVlc26hkXOJLRA==
X-Received: by 2002:a17:906:cc4b:b0:772:3844:6ab2 with SMTP id
 mm11-20020a170906cc4b00b0077238446ab2mr4326885ejb.211.1663882470502;
        Thu, 22 Sep 2022 14:34:30 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 s18-20020a1709060c1200b00780f24b797dsm3214411ejf.108.2022.09.22.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:34:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] libcoap: Upgrade 4.3.0 -> 4.3.1
Date: Thu, 22 Sep 2022 22:34:22 +0100
Message-Id: <20220922213422.19210-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 21:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98932

Drop merged backport of 7e20aa9ef172 ("coap_session.c: Balance
SESSIONS_ADD and SESSIONS_DELETE usage").

  c694baead2f9 Update version to release 4.3.1
  ab9488559f5e Doxygen: Fix missing links for later versions of asciidoc
  144f9c4381c1 Manual pages: Update NAME section to contain all of the alternative names
  707aed35d39b Doxygen: Hyperlink man page functions
  46feac2455ab Misc: Tidy up documentation and space usage
  d09204e24aba Doxygen: Add in individual man pages for the ease of finding the functions
  09aab40d14f9 Tag release candidate 2 for version 4.3.1
  2755af4d1a16 block.c: Clarify ignored result from coap_get_data()
  5f0eea8dbbc4 coap_session.c: Fix adding NULL pointer on error in coap_new_server_session()
  ea89cb842cf6 coap_cache.txt.in: Fix typo in function name
  922e81a0d21f Doc: Include statement about upgrading to 4.3.1
  5c498249e7e7 ChangeLog: Add summary for version update to 4.3.1
  4f12b9be1b7b coap_event.h: Clean up Doxygen documentation for coap_event_t
  43bfbea924e0 Copyright: Update dates to 2022 where appropriate
  37731524a0ad RFC8516: Document support
  a7b2f2b4901b block.c: Timeout coap_lg_crcv_t structures correctly
  f4507e6e9adb Block: Report event on large xmit failures
  3d387a5be485 block.c: Correct size of allocated PDU buffer
  6a9a787503ec Observe: Clean up server timing out after observe failures
  725e464421e0 mcast: Tidy up logging
  381ff3d94da2 PDU Data: Clean up internal usage of PDU data
  0f0cac71f5e5 Observe: Support disabling observe cancellation on session close
  bc4c75060b86 coap_mbedtls.c: Fix output type of a log message
  b8f01cef06f0 net.c: Move variable into correct block
  58a8b338045b net.c: Send appropriate delayqueue entries in coap_cancel_all_messages()
  b4306bb79162 observe: Make sure the correct token in used for cancellation
  c68d1e9fe785 mutex: Do not output mutex warnings for LwIP and Contiki
  7f551fcea56b coap_mbedtls.c: Upgrade to mbedTLS v3.2.1 - Updated the deprecated APIs with the respective alternatives   - `mbedtls_ssl_conf_min_version` => `mbedtls_ssl_conf_min_tls_version` - Updated fields for `mbedtls_ssl_ciphersuite_t`   - `max_major_version`/`max_minor_version` => `max_tls_version` - Added macros for backward compatibility
  8c15b896ef30 esp-idf: Stop -Wformat errors for uint32_t variables
  0ca2fd4a90b5 Tag release candidate 1 for version 4.3.1
  9962bab56f6b Updated tinydtls to current develop HEAD
  8fbe440f8aaa coap_io.c: Updates for esp-idf port
  d2306569d16a proxy: Make proxy requests separate responses
  98ecf5a2a166 tinydtls: Update submodule to latest version
  8c973a454e73 mid_duplicates: Drop general responses duplicates
  dc92fe5e1ea6 coap.h.windows.in: Fix missing file renames
  347270b9abc4 file naming: Rename files to have coap_ prefix
  8b9377ef2ad4 coap_mbedtls.c: Fix memory leak
  e8052b3988ec resource.c: Further fix making subscribers iteration safe
  f93b9a3e37cf coap_mbedtls.c: Catch connection reset in coap_tls_write
  d5bcb8159b73 resource.c: Make subscribers iteration safe in coap_notify_observers
  0d9f2531e5dd coap_session.c: Free off session's last_token on session deletion
  415fbdb7cddf RFC9175: Add in support for the Echo and Request-Tag options
  88ae9563e665 mcast support: Support multicast granular to the resource level
  73565196a8f3 block.c: Fix error handling with Block transfers
  132c72619032 net.c: Handle multiple same token request/responses
  d68f5d6f5713 net.c: Handle well_known requests when there is no libcoap block support
  fe51d3335e81 lwip: Fix minor issues
  6046dcbd5589 net.c: Fix broken client only build
  20f15a17d698 Large Observes: Prevent server sending new response if active response
  5a10ce4890ff Congestion Control: add in RFC7252 configuration flexibility
  41afb92141c5 net.c: Update .well-known/core handling to use common logic
  6b32ed3de2fb coap_io.c: Track ICMP Host Administravely Prohibited error
  279755b1df9e coap_send: Make error checks for coap_send() more rigorous
  925d39fd8cfb coap-server.c: Cleanup misplaced comment
  c77176714770 coap_gnutls.c: Handle another error in do_gnutls_handshake()
  801e5492f2e6 CSM: Move coap_client_delay_first() to later in code processing
  346a831cd604 block.c: Correctly preset updated_block variable
  56db248daba6 async.c: Remove white space
  256a758e0273 TLS SIGPIPE: Stop programs exiting with code 141 (128 + 13:SIGPIPE)
  6649bdef39db net.c: fix null pointer exception
  03a9059439d0 BERT: Support block BERT szx of 7 for reliable protocols
  445a9481deca RFC7390: Update support for RFC7390
  428f759659a4 coap_mbedtls.c: Fix coap_rng() return for 3.x code
  1b2668f562e9 CMakeLists.txt: Correctly determine cmsghdr support for determining addresses
  21fd838dc781 coap_io_prepare_io: Re-order function code for correctly updating sockets[]
  cfbf3ab617f8 doc/main.md: Update copyright year
  f28044303abe net.c: Make sure separate response is CON for CON requests
  069a0786ce85 CSM: Support different XMT and RCV Max-Message-Size
  9cbe5757cb69 recursive mutex: Stop recursive Mutex when doing handler callbacks
  d9c19c378f3f event.h: Add events for server session state management
  7e20aa9ef172 coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE usage
  806861359b81 configure.ac: Allow using non-vendored TinyDTLS with autotools build
  6c8b76d534a0 tinydtls: Update to latest version
  aa391b5b7601 async: Handle changes to delay when using epoll
  65cba25cc7e5 coap-client.c: Delay sending each request using -G by 1 second
  d57d44aa142a block.c: Fix data leak in coap_add_data_large_internal
  eb7656850f1c pdu.h: Add Content-Format for application/ace+cbor
  c8458f262ab8 coap_mbedtls.c: Fix return brace location
  583c29fd47d9 coap_mbedtls.c: Make TLS error recovery more rigorous
  02deef8da6ac coap_prng.c: Added alternate RNG implementation - For targets having their own hardware entropy/RNG implementation   using mbedtls_hardware_poll() - This change was made as since mbedtls-3.x, passing a RNG function   to all functions that accept a f_rng parameter is mandatory
  916a534e170b coap_mbedtls.c: Upgrade to mbedTLS v3.x - Added MBEDTLS_ALLOW_PRIVATE_ACCESS to access private struct   members wherever required - Updated deprecated functions from hashing module   (E.g. mbedtls_sha256_starts_ret() -> mbedtls_sha256_starts()) - Added mandatory RNG parameter for some functions   (mbedtls_pk_parse_keyfile(), mbedtls_pk_parse_key()) - Remove support for parsing SSLv2 ClientHello
  b42c184f74a6 block.c: Fix possible null-pointer dereference
  df72a53f2d66 coap_openssl.c: Support Microsoft VS builds
  0f76881802af autogen.sh: Fix missing file ar-lib
  19928e81bd42 builds: Set CFLAGS += -Werror in all linux subdirectory compilations
  b2ad43319a0f doc/Makefile.am: Include module_api_wrap.h in a distribution
  dfc678c33bd1 Proxy: Support unknown Critical but Safe-To-Forward options
  93f2738c451d coap_pdu_setup.txt.in: Clarify / more make readable the pdu setup information
  5b32d716fa03 github workflow: Support windows-2022
  bd9ced550e07 pdu.c: Fix coap_insert_option with delta = 269
  ba585f848ff5 [OSS-Fuzz] pdu_parse_target.c: Check result of coap_pdu_parse()
  a2e0046c802f [OSS-Fuzz] pdu_parse_target.c: Fix compiler warning
  b3d503cbff07 sessions: Prevent multiple client session confusion
  726b9630e51f coap_block.txt.in: Clarify / more make readable the block handling information
  756bb042395d pdu building: Enforce the application order of building a PDU
  c02ca5f097d6 coap_pdu_access.txt.in: Add in documentation for coap_get_uri_path()
  aaf611559482 proxy_uri: Fix handling the resource for uri path in Proxy-Uri
  a8c00f2af9c6 coap_pdu_setup.txt.in: Better document coap_encode_var_safe8()
  64e56410177b versioning: Make current git describe available
  0a16d790ce53 cmake_coap_config.h.in: Fix definitions for when building with tinydtls
  17aaa81b5ad3 Caching: Highlight requirements ignoring certain CoAP Options
  74582eddde28 resource.c: Support deleting resources that have not yet been added
  32d2d0e1c62b request_handler: Report only when app's request handler is actually called
  5dc2dfca86ec block.c: Do not match large response if no Block2 option in request
  18888cd0dde3 cmake: Install example programs if examples enabled
  c0e032ffad0b block: Check block size space correctly
  693a4e231386 net.c: correct return value in coap_send_internal()
  38bffb7f99d9 configure.ac: Fix have mbedtls lib, but no mbedtls-dev issue
  694a205f28dc coap-server.c: Fix proxy response type and code
  e8e33f0424ad coap-server: Add in POST support for unknown request handler
  3f5ec5467a1d coap_cache.c: Correctly build cache key
  e43cf9369ac5 RFC7959: Handle both client and server initiating requests
  bdf7686613ec coap_write_session: Account correctly for partial TCP writes
  76194be8cd3f coap-client.c: Allow time for all server responses to mcast
  d395df1a812f coap_session.c: Do not check for duplicate mids if reliable protocol
  73389b8192e8 handlers: Clarify which handlers are client only, server only or both
  df9071c93eff coap_session.[hc]: Added function to retrieve PSK identity from session
  7791897e8f4c api-version-bump.sh: Added missing changes for win32
  4834b86067ae pkg-config: Don't use hard coded binary
  d139beab67ff pkg-config: Don't use hard coded binary
  166ef51ed155 Windows: Update libcoap-2 objects to libcoap-3
  31722c208ac9 PSK: Make PSK hint / key / identity retrieval simpler
  d746fc24e5a7 coap_pdu_parse: Add to public API
  0aeb0d624797 doxygen: Tidy up Modules and Files tab information
  f026f5701ece client+server: Reduce code size by building libcoap for client or server only
  a7f53b4d6b0a coap_debug.h: Allow <syslog.h> to be included before and after <coap3/coap.h>
  77f8cf59702e DTLS/TLS: Support TLS when DTLS is not enabled
  587de900c2cc coap_mbedtls.c: Add in TLS support
  94b297aae7a5 coap_mbedtls.c: Fix build fail for client only mbedtls
  cc2648aef685 net.c: Protect against session release in coap_io_do_io()
  ca44071b8afe net.h: do not include sys/select.h in Windows builds
  e984f38b8fd6 [DTLS] make buffer sizes for psk and psk_identity configurable
  54dbc3eeb815 [RIOT] coap_time.h: fix COAP_TICKS_PER_SECOND for undefined XTIMER_HZ
  05e7f12d7ca8 net.h: Include sys/select.h for fd_set
  25a59905792f doxygen: Fix summary output for manual pages
  a5c0d12354ed doc: Document the coap_can_exit() function
  a1d78d505d98 tiny.c: Fix message id generation
  67f189f134a2 CMakeLists.txt: Fix macOS builds by checking for if_nametoindex support
  8ce139d349bc coap_event.h: Make coap_event_t an enum
  b0ca3ae643d1 resource.c: Delete previous subscription correctly
  98b9179d5666 async: Correct MID usage in response
  c61748f4dd33 RFC7959: session->lg_xmit not being released for a server
  482be755fe29 gnutls:  GNUTLS_CRT_RAW not defined
  e0d6477b5ec9 man: Update man page documentation
  d52986f00459 coap_resource_init: Leading '/' is not required for uri_path
  60c69557f3d5 pdu.h: Remove unassigned response code COAP_RESPONSE_CODE_OK
  87fab6d573cf coap_mbedtls.c: Allow ESP-IDF systems to be compiled without PSK support
  77d1aae06b17 Fix condition for MBEDTLS_INCLUDE_DIRS
  4bbf25ba338a coap-client: Add in support for generating multiple requests
  50530704df9a tinydtls: update to latest version

License-Update: Update year
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...alance-SESSIONS_ADD-and-SESSIONS_DEL.patch | 51 -------------------
 ...0001-libcoap-Fix-gnu-configize-error.patch | 44 ----------------
 .../{libcoap_4.3.0.bb => libcoap_4.3.1.bb}    |  8 ++-
 3 files changed, 3 insertions(+), 100 deletions(-)
 delete mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
 delete mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.0.bb => libcoap_4.3.1.bb} (86%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
deleted file mode 100644
index c8ac8485a0a1..000000000000
--- a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c56a64ff4df7eecb6c88ff929497bcd0d65934f2 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Fri, 22 Apr 2022 13:15:39 +0100
-Subject: [PATCH] coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE
- usage
-
-Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/7e20aa9ef17277f39203334404e6c776b1171a7d]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- src/coap_session.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/coap_session.c b/src/coap_session.c
-index 77cae598f0af..536e57573361 100644
---- a/src/coap_session.c
-+++ b/src/coap_session.c
-@@ -813,6 +813,12 @@ coap_session_create_client(
-   return session;
- 
- error:
-+  /*
-+   * Need to add in the session as coap_session_release()
-+   * will call SESSIONS_DELETE in coap_session_free().
-+   */
-+  if (session)
-+    SESSIONS_ADD(ctx->sessions, session);
-   coap_session_release(session);
-   return NULL;
- }
-@@ -1133,11 +1139,17 @@ coap_session_t *coap_new_server_session(
-   if (session) {
-     coap_log(LOG_DEBUG, "***%s: new incoming session\n",
-              coap_session_str(session));
-+    /* Returned session may already have been released and is now NULL */
-     session = coap_session_accept(session);
-   }
-   return session;
- 
- error:
-+  /*
-+   * Need to add in the session as coap_session_release()
-+   * will call SESSIONS_DELETE in coap_session_free().
-+   */
-+  SESSIONS_ADD(ep->sessions, session);
-   coap_session_free(session);
-   return NULL;
- }
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
deleted file mode 100644
index 64f8d3acc812..000000000000
--- a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 25f1bebf1bc4c8da47f976d24a7a424253744e2e Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Wed, 24 Mar 2021 09:10:17 +0000
-Subject: [PATCH] libcoap: Fix gnu-configize error
-
-Fix:
-
-  autoreconf: running: gnu-configize
-  gnu-configize: 'configure.ac' or 'configure.in' is required
-  autoreconf: gnu-configize failed with exit status: 1
-
-We're not pulling in the ext/tinydtls submodule, so this fails.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- configure.ac | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9f51f4c67557..559808e03aa2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -472,19 +472,6 @@ if test "x$build_dtls" = "xyes"; then
-         have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
-     fi
- 
--    # The user wants to use explicit TinyDTLS if '--with-tinydtls was set'.
--    if test "x$with_tinydtls" = "xyes" ; then
--        if test -d "$srcdir/ext/tinydtls"; then
--           AC_CONFIG_SUBDIRS([ext/tinydtls])
--           have_tinydtls="yes"
--         else
--           have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
--         fi
--         have_gnutls="no" # don't confuse AC_MSG_RESULT at the end of the script
--         have_openssl="no" # don't confuse AC_MSG_RESULT at the end of the script
--         have_mbedtls="no" # don't confuse AC_MSG_RESULT at the end of the script
--    fi
--
-     if test "$TLSCOUNT" -eq 0; then
-       # The user hasn't requested the use of a specific cryptography library
-       # we try first GnuTLS for usability ...
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
similarity index 86%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
index 4b467d212f03..0fc342560aa7 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
@@ -5,14 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE ="https://libcoap.net/"
 
 LICENSE = "BSD-2-Clause & BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e44b3af4925ec58e9f49b9ff143b5493"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fbe4435d52b2d27a16f980ffc8ffc80"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
-           file://0001-libcoap-Fix-gnu-configize-error.patch \
-           file://0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch \
            file://run-ptest \
            "
-SRCREV = "1da37b9abbe871675d5939395b498324ccc8ecfe"
+SRCREV = "02b76470ab9168947152c78ad50835bf043d7c84"
 
 S = "${WORKDIR}/git"
 
@@ -33,7 +31,7 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
 
 EXTRA_OECONF = "\
     --with-epoll --enable-add-default-names \
-    --without-tinydtls \
+    --without-tinydtls --without-submodule-tinydtls \
     ${@bb.utils.contains_any('PACKAGECONFIG', 'gnutls openssl mbedtls', '--enable-dtls', '--disable-dtls', d)} \
 "
 
-- 
2.35.1


