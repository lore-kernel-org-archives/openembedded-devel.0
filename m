Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79EED7F081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:58:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id u17so996311pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GkpluMQ3FMHJkSVxUgcxIdqLS5bJYK7q47qTq0L/WE4=;
	b=ZGzN/rCOeg14QPpXlVS9o0q2pWwE06DXjLWyseomUBxflMa6JXvkiwij4KGxeenVkc
	PYAvrei/Oeg8+p3i0V1bnPtTrKAzbjfwAi2CKf9OrfjqJDQ3DeArafAYtxDEACbV7+K7
	4k7Wyk9wAprdpug75i8M0He2K3SV9lUrx6uCprJehsOuR0uLv7jw3C/fPfZ/f1Gw3NqM
	Lj7G3qOu1IHjxzBhW27SMTgYP4u4nLbV5bad3dyZhl3n3/CA8AH7YQU7VRV6JatdMyu5
	7BNTqHLomDVLCxl2aQ/q9oyIuFqhTcPgErDeAtHBAU4apEQzgl2JDsT/oRj9SH704ZRn
	4dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GkpluMQ3FMHJkSVxUgcxIdqLS5bJYK7q47qTq0L/WE4=;
	b=arU1HqH+JSEc4Wt7eMZcdIEn5SexWB1L2w3BJGsHAfC3ciWRwV2VyGDSGgNPELofNg
	8OrxZ92e+faXN5TmUVq82bxMi1KFn3WSPE4pzxSuk1HvUNIkDUu+iqd2ftFj94l3w19X
	/6qV5e/KXpZCjHrUecmcCoNwRym+/eLhX3k5gS1YF5wyCaqNA0uiZGEYodQzL9ZvovZw
	J47TUlYk6emJZz54SM6bLEUSOSYV7ylsWMDv8jurAaW/WAOE+SqE63vuiZ6Yo/u2DmCU
	3WHcwFUgLKTKPogSLF9J1iPxvL9OLlwjSKcVc1834dubF4wXTRX0hn7whG/sFtkiAhu5
	a25g==
X-Gm-Message-State: APjAAAUHXB12jc2gAwAt83FyzLYn/EnTyNWKv11bnjd8BtVvC9nW+r5k
	U57t6vUIZUG57NvjM+HTQja/ke7eL1U=
X-Google-Smtp-Source: APXvYqw+hX0euz9H4xUvkCWoJIrgcajQIN+ONDRGVNCrkTWHN/ajjTz5KvP5lX3IN/vA403BWoJZRQ==
X-Received: by 2002:a17:90a:b393:: with SMTP id
	e19mr8306994pjr.118.1567058315520; 
	Wed, 28 Aug 2019 22:58:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id t9sm981824pgj.89.2019.08.28.22.58.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 22:58:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 22:58:24 -0700
Message-Id: <20190829055824.18826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oee][PATCH] websocketpp_0.8.1.bb: Fix build with asio from boost 1.70+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2019 05:58:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch is cherry-picked from
https://github.com/zaphoyd/websocketpp/pull/814

Removed unused patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-issue-599.patch                  |  31 -
 ...e-make_shared-with-new-in-some-cases.patch |  78 +++
 .../0002-Fix-missed-entries-fix-testing.patch |  66 ++
 ...5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch | 155 -----
 ...300d874a30db35e3ad58f188944bef0bf31b.patch | 600 ------------------
 .../websocketpp-0.8.1/disable-tests.patch     |  51 --
 .../websocketpp/websocketpp_0.8.1.bb          |   5 +-
 7 files changed, 148 insertions(+), 838 deletions(-)
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch
deleted file mode 100644
index 2a9ea74cd0..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1dd07113f2a7489444a8990a95be42e035f8e9df Mon Sep 17 00:00:00 2001
-From: Kurt Roeckx <kroeckx@debian.org>
-Date: Tue, 1 Nov 2016 12:57:35 +0100
-Subject: [PATCH] Fix issue #599
-Forwarded: https://github.com/zaphoyd/websocketpp/pull/600
-
----
- websocketpp/transport/asio/security/tls.hpp | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/websocketpp/transport/asio/security/tls.hpp b/websocketpp/transport/asio/security/tls.hpp
-index 7b32db8..a8aafec 100644
---- a/websocketpp/transport/asio/security/tls.hpp
-+++ b/websocketpp/transport/asio/security/tls.hpp
-@@ -355,13 +355,9 @@ protected:
-     template <typename ErrorCodeType>
-     lib::error_code translate_ec(ErrorCodeType ec) {
-         if (ec.category() == lib::asio::error::get_ssl_category()) {
--            if (ERR_GET_REASON(ec.value()) == SSL_R_SHORT_READ) {
--                return make_error_code(transport::error::tls_short_read);
--            } else {
-                 // We know it is a TLS related error, but otherwise don't know
-                 // more. Pass through as TLS generic.
-                 return make_error_code(transport::error::tls_error);
--            }
-         } else {
-             // We don't know any more information about this error so pass
-             // through
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
new file mode 100644
index 0000000000..0c8285df98
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Replace-make_shared-with-new-in-some-cases.patch
@@ -0,0 +1,78 @@
+From 080fc37949114184d4832f7acffe2613745833f3 Mon Sep 17 00:00:00 2001
+From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
+Date: Tue, 16 Apr 2019 08:38:01 +0200
+Subject: [PATCH 1/2] Replace make_shared with new in some cases
+
+Replace make_shared for asio types that take a lib::ref as a parameter.
+This should fix the ASIO change (boostorg/asio@59066d8) for 1.70,
+while keeping it backwards compatible to older boost versions.
+---
+ websocketpp/transport/asio/connection.hpp    | 7 ++++---
+ websocketpp/transport/asio/endpoint.hpp      | 3 +--
+ websocketpp/transport/asio/security/none.hpp | 3 +--
+ websocketpp/transport/asio/security/tls.hpp  | 3 +--
+ 4 files changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
+index 60f88a7..1ccda8f 100644
+--- a/websocketpp/transport/asio/connection.hpp
++++ b/websocketpp/transport/asio/connection.hpp
+@@ -311,9 +311,10 @@ public:
+      * needed.
+      */
+     timer_ptr set_timer(long duration, timer_handler callback) {
+-        timer_ptr new_timer = lib::make_shared<lib::asio::steady_timer>(
+-            lib::ref(*m_io_service),
+-            lib::asio::milliseconds(duration)
++        timer_ptr new_timer(
++            new lib::asio::steady_timer(
++                *m_io_service,
++                lib::asio::milliseconds(duration))
+         );
+ 
+         if (config::enable_multithreading) {
+diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
+index ddab2c7..4b719a9 100644
+--- a/websocketpp/transport/asio/endpoint.hpp
++++ b/websocketpp/transport/asio/endpoint.hpp
+@@ -195,8 +195,7 @@ public:
+ 
+         m_io_service = ptr;
+         m_external_io_service = true;
+-        m_acceptor = lib::make_shared<lib::asio::ip::tcp::acceptor>(
+-            lib::ref(*m_io_service));
++        m_acceptor.reset(new lib::asio::ip::tcp::acceptor(*m_io_service));
+ 
+         m_state = READY;
+         ec = lib::error_code();
+diff --git a/websocketpp/transport/asio/security/none.hpp b/websocketpp/transport/asio/security/none.hpp
+index 5c8293d..6c7d352 100644
+--- a/websocketpp/transport/asio/security/none.hpp
++++ b/websocketpp/transport/asio/security/none.hpp
+@@ -168,8 +168,7 @@ protected:
+             return socket::make_error_code(socket::error::invalid_state);
+         }
+ 
+-        m_socket = lib::make_shared<lib::asio::ip::tcp::socket>(
+-            lib::ref(*service));
++        m_socket.reset(new lib::asio::ip::tcp::socket(*service));
+ 
+         if (m_socket_init_handler) {
+             m_socket_init_handler(m_hdl, *m_socket);
+diff --git a/websocketpp/transport/asio/security/tls.hpp b/websocketpp/transport/asio/security/tls.hpp
+index c76fd9a..04ac379 100644
+--- a/websocketpp/transport/asio/security/tls.hpp
++++ b/websocketpp/transport/asio/security/tls.hpp
+@@ -193,8 +193,7 @@ protected:
+         if (!m_context) {
+             return socket::make_error_code(socket::error::invalid_tls_context);
+         }
+-        m_socket = lib::make_shared<socket_type>(
+-            _WEBSOCKETPP_REF(*service),lib::ref(*m_context));
++        m_socket.reset(new socket_type(*service, *m_context));
+ 
+         if (m_socket_init_handler) {
+             m_socket_init_handler(m_hdl, get_socket());
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
new file mode 100644
index 0000000000..962d089679
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0002-Fix-missed-entries-fix-testing.patch
@@ -0,0 +1,66 @@
+From 12ab603ca962e83591985a585451d33544d75d56 Mon Sep 17 00:00:00 2001
+From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
+Date: Wed, 17 Apr 2019 10:06:18 +0000
+Subject: [PATCH 2/2] Fix missed entries; fix testing
+
+---
+ CMakeLists.txt                            | 2 +-
+ websocketpp/transport/asio/connection.hpp | 3 +--
+ websocketpp/transport/asio/endpoint.hpp   | 7 ++-----
+ 3 files changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2786aba..951de97 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -202,7 +202,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+ 	endif ()
+ 
+     if (NOT Boost_USE_STATIC_LIBS)
+-        add_definitions (/DBOOST_TEST_DYN_LINK)
++        add_definitions (-DBOOST_TEST_DYN_LINK)
+     endif ()
+ 
+     set (Boost_FIND_REQUIRED TRUE)
+diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
+index 1ccda8f..57dda74 100644
+--- a/websocketpp/transport/asio/connection.hpp
++++ b/websocketpp/transport/asio/connection.hpp
+@@ -462,8 +462,7 @@ protected:
+         m_io_service = io_service;
+ 
+         if (config::enable_multithreading) {
+-            m_strand = lib::make_shared<lib::asio::io_service::strand>(
+-                lib::ref(*io_service));
++            m_strand.reset(new lib::asio::io_service::strand(*io_service));
+         }
+ 
+         lib::error_code ec = socket_con_type::init_asio(io_service, m_strand,
+diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
+index 4b719a9..94509ad 100644
+--- a/websocketpp/transport/asio/endpoint.hpp
++++ b/websocketpp/transport/asio/endpoint.hpp
+@@ -687,9 +687,7 @@ public:
+      * @since 0.3.0
+      */
+     void start_perpetual() {
+-        m_work = lib::make_shared<lib::asio::io_service::work>(
+-            lib::ref(*m_io_service)
+-        );
++        m_work.reset(new lib::asio::io_service::work(*m_io_service));
+     }
+ 
+     /// Clears the endpoint's perpetual flag, allowing it to exit when empty
+@@ -853,8 +851,7 @@ protected:
+ 
+         // Create a resolver
+         if (!m_resolver) {
+-            m_resolver = lib::make_shared<lib::asio::ip::tcp::resolver>(
+-                lib::ref(*m_io_service));
++            m_resolver.reset(new lib::asio::ip::tcp::resolver(*m_io_service));
+         }
+ 
+         tcon->set_uri(u);
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
deleted file mode 100644
index 530c960ce5..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4 Mon Sep 17 00:00:00 2001
-From: Peter Thorson <git@zaphoyd.com>
-Date: Sun, 11 Jun 2017 16:13:25 -0500
-Subject: [PATCH] minor adjustments to recent extension negotiation related
- fixes, refactor a bit more extension negotiation code to be simpler
-
----
- websocketpp/impl/connection_impl.hpp |  6 +--
- websocketpp/processors/hybi13.hpp    | 92 ++++++++++++++++++------------------
- 2 files changed, 49 insertions(+), 49 deletions(-)
-
-Index: websocketpp-0.7.0/websocketpp/impl/connection_impl.hpp
-===================================================================
---- websocketpp-0.7.0.orig/websocketpp/impl/connection_impl.hpp
-+++ websocketpp-0.7.0/websocketpp/impl/connection_impl.hpp
-@@ -1222,17 +1222,17 @@
-     std::pair<lib::error_code,std::string> neg_results;
-     neg_results = m_processor->negotiate_extensions(m_request);
- 
--    if (neg_results.first == error::make_error_code(error::extension_parse_error)) {
-+    if (neg_results.first == processor::error::make_error_code(processor::error::extension_parse_error)) {
-         // There was a fatal error in extension parsing that should result in
-         // a failed connection attempt.
--        m_alog.write(log::alevel::info, "Bad request: " + neg_results.first.message());
-+        m_elog.write(log::elevel::info, "Bad request: " + neg_results.first.message());
-         m_response.set_status(http::status_code::bad_request);
-         return neg_results.first;
-     } else if (neg_results.first) {
-         // There was a fatal error in extension processing that is probably our
-         // fault. Consider extension negotiation to have failed and continue as
-         // if extensions were not supported
--        m_alog.write(log::alevel::info, 
-+        m_elog.write(log::elevel::info, 
-             "Extension negotiation failed: " + neg_results.first.message());
-     } else {
-         // extension negotiation succeeded, set response header accordingly
-Index: websocketpp-0.7.0/websocketpp/processors/hybi13.hpp
-===================================================================
---- websocketpp-0.7.0.orig/websocketpp/processors/hybi13.hpp
-+++ websocketpp-0.7.0/websocketpp/processors/hybi13.hpp
-@@ -97,11 +97,6 @@
-     /**
-      * This exists mostly because the code for requests and responses is
-      * identical and I can't have virtual template methods.
--     *
--     * NOTE: this method makes assumptions that the permessage-deflate
--     * extension is the only one supported. If additional extensions are
--     * ever supported it should be reviewed carefully. Most cases where
--     * that assumption is made are explicitly noted.
-      */
-     template <typename header_type>
-     err_str_pair negotiate_extensions_helper(header_type const & header) {
-@@ -130,55 +125,60 @@
- 
-         http::parameter_list::const_iterator it;
- 
-+        // look through the list of extension requests to find the first
-+        // one that we can accept.
-         if (m_permessage_deflate.is_implemented()) {
-             err_str_pair neg_ret;
-             for (it = p.begin(); it != p.end(); ++it) {
--                // look through each extension, if the key is permessage-deflate
--                if (it->first == "permessage-deflate") {
--                    // if we have already successfully negotiated this extension
--                    // then skip any other requests to negotiate the same one
--                    // with different parameters 
--                    if (m_permessage_deflate.is_enabled()) {
--                        continue;
--                    }
--                    
--                    
--                    neg_ret = m_permessage_deflate.negotiate(it->second);
--
--                    if (neg_ret.first) {
--                        // Figure out if this is an error that should halt all
--                        // extension negotiations or simply cause negotiation of
--                        // this specific extension to fail.
--                        //std::cout << "permessage-compress negotiation failed: "
--                        //          << neg_ret.first.message() << std::endl;
--                    } else {
--                        // Note: this list will need commas if WebSocket++ ever
--                        // supports more than one extension
--                        
--                        // Actually try to initialize the extension before we
--                        // deem negotiation complete
--                        ret.first = m_permessage_deflate.init(base::m_server);
--                        if (!ret.first) {
--
--                            // TODO: support multiple extensions.
--                            // right now, because there is only one extension 
--                            // supported, it failing to negotiate means we are
--                            // done with all negotiating. In the future if more
--                            // extensions are supported a better solution will
--                            // be needed here.
--                            break;
--                        } else {
--                            ret.second += neg_ret.second;
--
--                            // continue looking for more extensions
--                            continue;
--                        }
--                        
--                    }
-+                // not a permessage-deflate extension request, ignore
-+                if (it->first != "permessage-deflate") {
-+                    continue;
-+                }
-+
-+                // if we have already successfully negotiated this extension
-+                // then skip any other requests to negotiate the same one
-+                // with different parameters 
-+                if (m_permessage_deflate.is_enabled()) {
-+                    continue;
-+                }
-+                
-+                // attempt to negotiate this offer
-+                neg_ret = m_permessage_deflate.negotiate(it->second);
-+
-+                if (neg_ret.first) {
-+                    // negotiation offer failed. Do nothing. We will continue
-+                    // searching for a permessage-deflate config that succeeds
-+                    continue;
-+                }
-+
-+                // Negotiation tentatively succeeded
-+
-+                // Actually try to initialize the extension before we
-+                // deem negotiation complete
-+                lib::error_code ec = m_permessage_deflate.init(base::m_server);
-+
-+                if (ec) {
-+                    // Negotiation succeeded but initialization failed this is 
-+                    // an error that should stop negotiation of permessage 
-+                    // deflate. Return the reason for the init failure
-+
-+                    ret.first = ec;
-+                    break;
-+                } else {
-+                    // Successfully initialized, push the negotiated response into
-+                    // the reply and stop looking for additional permessage-deflate
-+                    // extensions
-+                    ret.second += neg_ret.second;
-+                    break;
-                 }
-             }
-         }
- 
-+        // support for future extensions would go here. Should check the value of 
-+        // ret.first before continuing. Might need to consider whether failure of
-+        // negotiation of an earlier extension should stop negotiation of subsequent
-+        // ones
-+
-         return ret;
-     }
- 
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
deleted file mode 100644
index 94bfeb2fd4..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
+++ /dev/null
@@ -1,600 +0,0 @@
-## Description: add some description
-## Origin/Author: add some origin or author
-## Bug: bug URL
-From 9ddb300d874a30db35e3ad58f188944bef0bf31b Mon Sep 17 00:00:00 2001
-From: Peter Thorson <git@zaphoyd.com>
-Date: Sun, 11 Jun 2017 15:24:43 -0500
-Subject: [PATCH] Update permessage-deflate support to reflect that zlib
- doesn't support a 256 bit window. Improve extension negotiation error
- checking and documentation. fixes #596 fixes #653
-
----
- changelog.md                                       |   8 ++
- test/extension/permessage_deflate.cpp              | 153 +++++++++++++++++----
- .../extensions/permessage_deflate/enabled.hpp      |  94 ++++++++++---
- websocketpp/impl/connection_impl.hpp               |  10 +-
- websocketpp/processors/hybi13.hpp                  |  28 +++-
- 5 files changed, 247 insertions(+), 46 deletions(-)
-
-diff --git a/changelog.md b/changelog.md
-index bba753cb..de98edd2 100644
-#--- a/changelog.md
-#+++ b/changelog.md
-#@@ -17,6 +17,14 @@ HEAD
-# - Compatibility: Update `telemetry_client` to use a slightly more cross platform
-#   method of sleeping. Should work on windows now. Thank you Meir Yanovich for
-#   reporting.
-#+- Compatibility: Updated permessage-deflate support to reflect that the zlib
-#+  library does not actually support a sliding window size of 256 bits. 
-#+  WebSocket++ will no longer negotiate 256 bit deflate windows. If the user
-#+  of the library tries to request a 256 bit window a 512 bit window will be
-#+  specified instead (This was the previous behavior). #596 #653 Thank you 
-#+  Vinnie Falco and Gianfranco Costamagna for reporting.
-#+- Compatibility: Better error handling and logging in cases where extension
-#+  requests parse correctly but negotiation fails. 
-# - Bug: Store loggers in shared pointers to avoid crashes related to connections
-#   trying to write logs entries after their respective endpoint has been
-#   deallocated. Thank you Thalhammer for reporting and Jupp Müller for the 
-diff --git a/test/extension/permessage_deflate.cpp b/test/extension/permessage_deflate.cpp
-index 4cd3e7b6..805afcc3 100644
---- a/test/extension/permessage_deflate.cpp
-+++ b/test/extension/permessage_deflate.cpp
-@@ -186,15 +186,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_invalid ) {
- 
- BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_valid ) {
-     ext_vars v;
-+    
-+    // confirm that a request for a value of 8 is interpreted as 9
-     v.attr["server_max_window_bits"] = "8";
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
- 
-+    v.attr["server_max_window_bits"] = "9";
-     v.esp = v.exts.negotiate(v.attr);
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
- 
--    v.attr["server_max_window_bits"] = "15";
- 
-+    v.attr["server_max_window_bits"] = "15";
-     v.esp = v.exts.negotiate(v.attr);
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-@@ -213,7 +220,7 @@ BOOST_AUTO_TEST_CASE( invalid_set_server_max_window_bits ) {
- 
- BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_decline ) {
-     ext_vars v;
--    v.attr["server_max_window_bits"] = "8";
-+    v.attr["server_max_window_bits"] = "9";
- 
-     v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::decline);
-     v.esp = v.exts.negotiate(v.attr);
-@@ -223,7 +230,7 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_decline ) {
-     BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept_8 ) {
-     ext_vars v;
-     v.attr["server_max_window_bits"] = "8";
- 
-@@ -232,10 +239,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
-+    ext_vars v;
-+    v.attr["server_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::accept);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest_8 ) {
-     ext_vars v;
-     v.attr["server_max_window_bits"] = "8";
- 
-@@ -244,10 +263,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
-+    ext_vars v;
-+    v.attr["server_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::largest);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest_8 ) {
-     ext_vars v;
-     v.attr["server_max_window_bits"] = "8";
- 
-@@ -256,7 +287,19 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
-+    ext_vars v;
-+    v.attr["server_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::smallest);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
- }
- 
- // Negotiate server_max_window_bits
-@@ -292,7 +335,13 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_valid ) {
-     v.esp = v.exts.negotiate(v.attr);
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
-+
-+    v.attr["client_max_window_bits"] = "9";
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
- 
-     v.attr["client_max_window_bits"] = "15";
-     v.esp = v.exts.negotiate(v.attr);
-@@ -311,7 +360,7 @@ BOOST_AUTO_TEST_CASE( invalid_set_client_max_window_bits ) {
-     BOOST_CHECK_EQUAL(v.ec,pmde::make_error_code(pmde::invalid_max_window_bits));
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline_8 ) {
-     ext_vars v;
-     v.attr["client_max_window_bits"] = "8";
- 
-@@ -323,7 +372,19 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
-     BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
-+    ext_vars v;
-+    v.attr["client_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_client_max_window_bits(9,pmd_mode::decline);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept_8 ) {
-     ext_vars v;
-     v.attr["client_max_window_bits"] = "8";
- 
-@@ -332,10 +393,22 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
-+    ext_vars v;
-+    v.attr["client_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::accept);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest_8 ) {
-     ext_vars v;
-     v.attr["client_max_window_bits"] = "8";
- 
-@@ -344,10 +417,22 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
- }
- 
--BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
-+    ext_vars v;
-+    v.attr["client_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::largest);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest_8 ) {
-     ext_vars v;
-     v.attr["client_max_window_bits"] = "8";
- 
-@@ -356,7 +441,19 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
-     BOOST_CHECK( v.exts.is_enabled() );
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
--    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
-+}
-+
-+BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
-+    ext_vars v;
-+    v.attr["client_max_window_bits"] = "9";
-+
-+    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::smallest);
-+    v.esp = v.exts.negotiate(v.attr);
-+    BOOST_CHECK( v.exts.is_enabled() );
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
-+    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
- }
- 
- 
-@@ -507,7 +604,8 @@ BOOST_AUTO_TEST_CASE( compress_data ) {
-     std::string compress_out;
-     std::string decompress_out;
- 
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     v.ec = v.exts.compress(compress_in,compress_out);
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-@@ -520,7 +618,8 @@ BOOST_AUTO_TEST_CASE( compress_data ) {
- BOOST_AUTO_TEST_CASE( compress_data_multiple ) {
-     ext_vars v;
- 
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     for (int i = 0; i < 2; i++) {
-         std::string compress_in = "Hello";
-@@ -545,11 +644,12 @@ BOOST_AUTO_TEST_CASE( compress_data_large ) {
- 
-     websocketpp::http::attribute_list alist;
- 
--    alist["server_max_window_bits"] = "8";
--    v.exts.set_server_max_window_bits(8,websocketpp::extensions::permessage_deflate::mode::smallest);
-+    alist["server_max_window_bits"] = "9";
-+    v.exts.set_server_max_window_bits(9,websocketpp::extensions::permessage_deflate::mode::smallest);
- 
-     v.exts.negotiate(alist);
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     v.ec = v.exts.compress(compress_in,compress_out);
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-@@ -573,7 +673,8 @@ BOOST_AUTO_TEST_CASE( compress_data_no_context_takeover ) {
-     v.exts.enable_server_no_context_takeover();
- 
-     v.exts.negotiate(alist);
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     v.ec = v.exts.compress(compress_in,compress_out1);
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-@@ -609,7 +710,8 @@ BOOST_AUTO_TEST_CASE( compress_empty ) {
-     std::string compress_out;
-     std::string decompress_out;
- 
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     v.ec = v.exts.compress(compress_in,compress_out);
-     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
-@@ -640,7 +742,8 @@ BOOST_AUTO_TEST_CASE( decompress_data ) {
-     std::string out;
-     std::string reference = "Hello";
- 
--    v.exts.init(true);
-+    v.ec = v.exts.init(true);
-+    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
- 
-     v.ec = v.exts.decompress(in,11,out);
- 
-diff --git a/websocketpp/extensions/permessage_deflate/enabled.hpp b/websocketpp/extensions/permessage_deflate/enabled.hpp
-index 1581f14c..f20a1b1d 100644
---- a/websocketpp/extensions/permessage_deflate/enabled.hpp
-+++ b/websocketpp/extensions/permessage_deflate/enabled.hpp
-@@ -46,7 +46,7 @@
- namespace websocketpp {
- namespace extensions {
- 
--/// Implementation of the draft permessage-deflate WebSocket extension
-+/// Implementation of RFC 7692, the permessage-deflate WebSocket extension
- /**
-  * ### permessage-deflate interface
-  *
-@@ -174,18 +174,30 @@ namespace websocketpp {
- namespace extensions {
- namespace permessage_deflate {
- 
--/// Default value for server_max_window_bits as defined by draft 17
-+/// Default value for server_max_window_bits as defined by RFC 7692
- static uint8_t const default_server_max_window_bits = 15;
--/// Minimum value for server_max_window_bits as defined by draft 17
-+/// Minimum value for server_max_window_bits as defined by RFC 7692
-+/**
-+ * NOTE: A value of 8 is not actually supported by zlib, the deflate
-+ * library that WebSocket++ uses. To preserve backwards compatibility
-+ * with RFC 7692 and previous versions of the library a value of 8
-+ * is accepted by the library but will always be negotiated as 9.
-+ */
- static uint8_t const min_server_max_window_bits = 8;
--/// Maximum value for server_max_window_bits as defined by draft 17
-+/// Maximum value for server_max_window_bits as defined by RFC 7692
- static uint8_t const max_server_max_window_bits = 15;
- 
--/// Default value for client_max_window_bits as defined by draft 17
-+/// Default value for client_max_window_bits as defined by RFC 7692
- static uint8_t const default_client_max_window_bits = 15;
--/// Minimum value for client_max_window_bits as defined by draft 17
-+/// Minimum value for client_max_window_bits as defined by RFC 7692
-+/**
-+ * NOTE: A value of 8 is not actually supported by zlib, the deflate
-+ * library that WebSocket++ uses. To preserve backwards compatibility
-+ * with RFC 7692 and previous versions of the library a value of 8
-+ * is accepted by the library but will always be negotiated as 9.
-+ */
- static uint8_t const min_client_max_window_bits = 8;
--/// Maximum value for client_max_window_bits as defined by draft 17
-+/// Maximum value for client_max_window_bits as defined by RFC 7692
- static uint8_t const max_client_max_window_bits = 15;
- 
- namespace mode {
-@@ -372,7 +384,7 @@ class enabled {
-     /**
-      * The bits setting is the base 2 logarithm of the maximum window size that
-      * the server must use to compress outgoing messages. The permitted range
--     * is 8 to 15 inclusive. 8 represents a 256 byte window and 15 a 32KiB
-+     * is 9 to 15 inclusive. 9 represents a 512 byte window and 15 a 32KiB
-      * window. The default setting is 15.
-      *
-      * Mode Options:
-@@ -386,6 +398,14 @@ class enabled {
-      * adjusted by the server. A server may unilaterally set this value without
-      * client support.
-      *
-+     * NOTE: The permessage-deflate spec specifies that a value of 8 is allowed.
-+     * Prior to version 0.8.0 a value of 8 was also allowed by this library.
-+     * zlib, the deflate compression library that WebSocket++ uses has always
-+     * silently adjusted a value of 8 to 9. In recent versions of zlib (1.2.9 
-+     * and greater) a value of 8 is now explicitly rejected. WebSocket++ 0.8.0
-+     * continues to perform the 8->9 conversion for backwards compatibility
-+     * purposes but this should be considered deprecated functionality.
-+     *
-      * @param bits The size to request for the outgoing window size
-      * @param mode The mode to use for negotiating this parameter
-      * @return A status code
-@@ -394,6 +414,12 @@ class enabled {
-         if (bits < min_server_max_window_bits || bits > max_server_max_window_bits) {
-             return error::make_error_code(error::invalid_max_window_bits);
-         }
-+
-+        // See note in doc comment above about what is happening here
-+        if (bits == 8) {
-+            bits = 9;
-+        }
-+
-         m_server_max_window_bits = bits;
-         m_server_max_window_bits_mode = mode;
- 
-@@ -403,8 +429,8 @@ class enabled {
-     /// Limit client LZ77 sliding window size
-     /**
-      * The bits setting is the base 2 logarithm of the window size that the
--     * client must use to compress outgoing messages. The permitted range is 8
--     * to 15 inclusive. 8 represents a 256 byte window and 15 a 32KiB window.
-+     * client must use to compress outgoing messages. The permitted range is 9
-+     * to 15 inclusive. 9 represents a 512 byte window and 15 a 32KiB window.
-      * The default setting is 15.
-      *
-      * Mode Options:
-@@ -417,6 +443,14 @@ class enabled {
-      * outgoing window size unilaterally. A server may only limit the client's
-      * window size if the remote client supports that feature.
-      *
-+     * NOTE: The permessage-deflate spec specifies that a value of 8 is allowed.
-+     * Prior to version 0.8.0 a value of 8 was also allowed by this library.
-+     * zlib, the deflate compression library that WebSocket++ uses has always
-+     * silently adjusted a value of 8 to 9. In recent versions of zlib (1.2.9 
-+     * and greater) a value of 8 is now explicitly rejected. WebSocket++ 0.8.0
-+     * continues to perform the 8->9 conversion for backwards compatibility
-+     * purposes but this should be considered deprecated functionality.
-+     *
-      * @param bits The size to request for the outgoing window size
-      * @param mode The mode to use for negotiating this parameter
-      * @return A status code
-@@ -425,6 +459,12 @@ class enabled {
-         if (bits < min_client_max_window_bits || bits > max_client_max_window_bits) {
-             return error::make_error_code(error::invalid_max_window_bits);
-         }
-+
-+        // See note in doc comment above about what is happening here
-+        if (bits == 8) {
-+            bits = 9;
-+        }
-+
-         m_client_max_window_bits = bits;
-         m_client_max_window_bits_mode = mode;
- 
-@@ -642,11 +682,17 @@ class enabled {
-      * client requested that we use.
-      *
-      * options:
--     * - decline (refuse to use the attribute)
--     * - accept (use whatever the client says)
--     * - largest (use largest possible value)
-+     * - decline (ignore value, offer our default instead)
-+     * - accept (use the value requested by the client)
-+     * - largest (use largest value acceptable to both)
-      * - smallest (use smallest possible value)
-      *
-+     * NOTE: As a value of 8 is no longer explicitly supported by zlib but might
-+     * be requested for negotiation by an older client/server, if the result of
-+     * the negotiation would be to send a value of 8, a value of 9 is offered
-+     * instead. This ensures that WebSocket++ will only ever negotiate connections
-+     * with compression settings explicitly supported by zlib.
-+     *
-      * @param [in] value The value of the attribute from the offer
-      * @param [out] ec A reference to the error code to return errors via
-      */
-@@ -678,6 +724,11 @@ class enabled {
-                 ec = make_error_code(error::invalid_mode);
-                 m_server_max_window_bits = default_server_max_window_bits;
-         }
-+
-+        // See note in doc comment
-+        if (m_server_max_window_bits == 8) {
-+            m_server_max_window_bits = 9;
-+        }
-     }
- 
-     /// Negotiate client_max_window_bits attribute
-@@ -687,11 +738,17 @@ class enabled {
-      * negotiation mode.
-      *
-      * options:
--     * - decline (refuse to use the attribute)
--     * - accept (use whatever the client says)
--     * - largest (use largest possible value)
-+     * - decline (ignore value, offer our default instead)
-+     * - accept (use the value requested by the client)
-+     * - largest (use largest value acceptable to both)
-      * - smallest (use smallest possible value)
-      *
-+     * NOTE: As a value of 8 is no longer explicitly supported by zlib but might
-+     * be requested for negotiation by an older client/server, if the result of
-+     * the negotiation would be to send a value of 8, a value of 9 is offered
-+     * instead. This ensures that WebSocket++ will only ever negotiate connections
-+     * with compression settings explicitly supported by zlib.
-+     *
-      * @param [in] value The value of the attribute from the offer
-      * @param [out] ec A reference to the error code to return errors via
-      */
-@@ -727,6 +784,11 @@ class enabled {
-                 ec = make_error_code(error::invalid_mode);
-                 m_client_max_window_bits = default_client_max_window_bits;
-         }
-+
-+        // See note in doc comment
-+        if (m_client_max_window_bits == 8) {
-+            m_client_max_window_bits = 9;
-+        }
-     }
- 
-     bool m_enabled;
-diff --git a/websocketpp/impl/connection_impl.hpp b/websocketpp/impl/connection_impl.hpp
-index 105911db..ae55c338 100644
---- a/websocketpp/impl/connection_impl.hpp
-+++ b/websocketpp/impl/connection_impl.hpp
-@@ -1222,12 +1222,18 @@ lib::error_code connection<config>::process_handshake_request() {
-     std::pair<lib::error_code,std::string> neg_results;
-     neg_results = m_processor->negotiate_extensions(m_request);
- 
--    if (neg_results.first) {
-+    if (neg_results.first == error::make_error_code(error::extension_parse_error)) {
-         // There was a fatal error in extension parsing that should result in
-         // a failed connection attempt.
--        m_alog.write(log::alevel::devel, "Bad request: " + neg_results.first.message());
-+        m_alog.write(log::alevel::info, "Bad request: " + neg_results.first.message());
-         m_response.set_status(http::status_code::bad_request);
-         return neg_results.first;
-+    } else if (neg_results.first) {
-+        // There was a fatal error in extension processing that is probably our
-+        // fault. Consider extension negotiation to have failed and continue as
-+        // if extensions were not supported
-+        m_alog.write(log::alevel::info, 
-+            "Extension negotiation failed: " + neg_results.first.message());
-     } else {
-         // extension negotiation succeeded, set response header accordingly
-         // we don't send an empty extensions header because it breaks many
-diff --git a/websocketpp/processors/hybi13.hpp b/websocketpp/processors/hybi13.hpp
-index 79486654..a95bc649 100644
---- a/websocketpp/processors/hybi13.hpp
-+++ b/websocketpp/processors/hybi13.hpp
-@@ -97,6 +97,11 @@ class hybi13 : public processor<config> {
-     /**
-      * This exists mostly because the code for requests and responses is
-      * identical and I can't have virtual template methods.
-+     *
-+     * NOTE: this method makes assumptions that the permessage-deflate
-+     * extension is the only one supported. If additional extensions are
-+     * ever supported it should be reviewed carefully. Most cases where
-+     * that assumption is made are explicitly noted.
-      */
-     template <typename header_type>
-     err_str_pair negotiate_extensions_helper(header_type const & header) {
-@@ -149,9 +154,26 @@ class hybi13 : public processor<config> {
-                     } else {
-                         // Note: this list will need commas if WebSocket++ ever
-                         // supports more than one extension
--                        ret.second += neg_ret.second;
--                        m_permessage_deflate.init(base::m_server);
--                        continue;
-+                        
-+                        // Actually try to initialize the extension before we
-+                        // deem negotiation complete
-+                        ret.first = m_permessage_deflate.init(base::m_server);
-+                        if (!ret.first) {
-+
-+                            // TODO: support multiple extensions.
-+                            // right now, because there is only one extension 
-+                            // supported, it failing to negotiate means we are
-+                            // done with all negotiating. In the future if more
-+                            // extensions are supported a better solution will
-+                            // be needed here.
-+                            break;
-+                        } else {
-+                            ret.second += neg_ret.second;
-+
-+                            // continue looking for more extensions
-+                            continue;
-+                        }
-+                        
-                     }
-                 }
-             }
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch
deleted file mode 100644
index 342981d4db..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Description: Disable failing test_transport_asio_timers.
-Because of "address already in use" error
-/«PKGBUILDDIR»/test/transport/asio/timers.cpp(129): error in "tls_handshake_timeout": check ec == make_error_code(tls_handshake_timeout) failed [websocketpp.transport.asio.socket:8 != websocketpp.transport.asio.socket:5]
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-
---- websocketpp-0.7.0.orig/test/transport/CMakeLists.txt
-+++ websocketpp-0.7.0/test/transport/CMakeLists.txt
-@@ -1,24 +1,24 @@
- if (OPENSSL_FOUND)
- 
--# Test transport integration
--file (GLOB SOURCE integration.cpp)
--
--init_target (test_transport)
--build_test (${TARGET_NAME} ${SOURCE})
--link_boost ()
--link_openssl()
--final_target ()
--set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
--
--# Test transport asio timers
--file (GLOB SOURCE asio/timers.cpp)
--
--init_target (test_transport_asio_timers)
--build_test (${TARGET_NAME} ${SOURCE})
--link_boost ()
--link_openssl()
--final_target ()
--set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
-+## Test transport integration
-+#file (GLOB SOURCE integration.cpp)
-+#
-+#init_target (test_transport)
-+#build_test (${TARGET_NAME} ${SOURCE})
-+#link_boost ()
-+#link_openssl()
-+#final_target ()
-+#set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
-+#
-+## Test transport asio timers
-+#file (GLOB SOURCE asio/timers.cpp)
-+#
-+#init_target (test_transport_asio_timers)
-+#build_test (${TARGET_NAME} ${SOURCE})
-+#link_boost ()
-+#link_openssl()
-+#final_target ()
-+#set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
- 
- # Test transport asio security
- file (GLOB SOURCE asio/security.cpp)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 75a5f886ad..551621708c 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -5,7 +5,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
 DEPENDS = "openssl boost zlib"
 
-SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
+           file://0001-Replace-make_shared-with-new-in-some-cases.patch \
+           file://0002-Fix-missed-entries-fix-testing.patch \
+          "
 
 # tag 0.8.1
 SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
-- 
2.23.0


