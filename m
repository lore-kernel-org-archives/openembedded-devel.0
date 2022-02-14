Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F18C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 13:19:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.33545.1644844782052594757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 05:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dpk8nZYV;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso10838169wme.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=//lvUmycc+nI39xy+Jwke7WNpvolT3l5XDQGPKUfBEs=;
        b=Dpk8nZYV1QFigNrZ0w2tPMMkcV8pEUynlRFbksaWnshD1rLjjJez7PkxZ4h5l1yuVw
         I09BnlBqZBAkljGsxOSVf2Z4g/dScEcFflKV5djEOy/el/KuPRgT8UWcwmK2U4nWfw4H
         njjjex0D77KwXM8W9275lU6/TFlhH8EBcQhdzkR677OZbeKpYHgzChP7KXftp4fkaYEk
         jcpj5S5u1XW+7NKoUyIKDH6bFzIXoHhrVI6aH91+ugBhnNA8LqTCbfHAr0lQ0bn/5Wtq
         RZrtsknME3wwo1en6oshko9wT6SwuvYPqUbF3QeSMHdhvj9S0SIWxKYgZMUMHzraldFm
         80tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=//lvUmycc+nI39xy+Jwke7WNpvolT3l5XDQGPKUfBEs=;
        b=qtvgPQUhcpNakHe/FBwgfrLdB6NmWAvMefejozFZbL6dD0tuvN7CrA4qr0tsM2/l0i
         DZhE/e2Ec4wMns54+oBaWl1tRfl7wBM46X3sCiFz09oZbTKy7LzyDyI29EZ/Odg/JH2V
         as2LNZfdXAW3hL+9D07a5xL6fYzMe+012JZ13OgqvrkQ8SY7Sjprtfvks3QnPuMxzjwh
         rJoAOTxrHIXaaXIdbgJAWjXifbwqPu6hBBCzLXet+tkd8CxfDGb+/1hIUOi3DWTFoEax
         uV2hL5YUPVv2nJ9+XKka4ciysSQqXmUDJ+nD+Ox5MApcjCHZbhS1LYPZnKZsuZes3IS0
         dREA==
X-Gm-Message-State: AOAM530OL/p+HVbxDw8Mr0yw5uYH2d7PWREW2YUVmM32QZYGZEVz7Leg
	uFS+bjvtDt1z9iBmzdQ3G+fhW3RYQSnilw==
X-Google-Smtp-Source: 
 ABdhPJwxL4dNCHNmfM10ZKGoGM3iWo2QnJjLUzO5MPB2RLJs8ZnUKCPpHqz4x2oITyOjsImBW1Sfqg==
X-Received: by 2002:a05:600c:3ce:: with SMTP id
 z14mr10711843wmd.184.1644844779766;
        Mon, 14 Feb 2022 05:19:39 -0800 (PST)
Received: from Unimatrix08-Focal.lan ([2.198.230.143])
        by smtp.gmail.com with ESMTPSA id
 h4sm35407177wre.0.2022.02.14.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 05:19:39 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] websocketpp: Apply upstream proposed patch to fix a
 Scons 4.2.0+ build failure
Date: Mon, 14 Feb 2022 14:19:36 +0100
Message-Id: <20220214131936.883461-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 13:19:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95309

See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1003022

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../websocketpp/websocketpp-0.8.2/1024.patch  | 506 ++++++++++++++++++
 .../websocketpp/websocketpp_0.8.2.bb          |   1 +
 2 files changed, 507 insertions(+)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
new file mode 100644
index 000000000..7506d8bb2
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
@@ -0,0 +1,506 @@
+From 05d1189ffce562560da90056d96fe2084d84654a Mon Sep 17 00:00:00 2001
+From: "Laszlo Boszormenyi (GCS)" <gcs@debian.org>
+Date: Mon, 14 Feb 2022 14:13:13 +0100
+Subject: [PATCH] SCons 4.2.0 no longer has env_cpp11.has_key() Check env_cpp11
+ as an array.
+
+This fixes https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1003022
+---
+ examples/broadcast_server/SConscript    | 2 +-
+ examples/debug_client/SConscript        | 2 +-
+ examples/debug_server/SConscript        | 2 +-
+ examples/dev/SConscript                 | 2 +-
+ examples/echo_client/SConscript         | 2 +-
+ examples/echo_server/SConscript         | 2 +-
+ examples/echo_server_both/SConscript    | 2 +-
+ examples/echo_server_tls/SConscript     | 2 +-
+ examples/external_io_service/SConscript | 2 +-
+ examples/iostream_server/SConscript     | 2 +-
+ examples/print_client/SConscript        | 2 +-
+ examples/print_client_tls/SConscript    | 2 +-
+ examples/print_server/SConscript        | 2 +-
+ examples/scratch_client/SConscript      | 2 +-
+ examples/scratch_server/SConscript      | 2 +-
+ examples/sip_client/SConscript          | 2 +-
+ examples/subprotocol_server/SConscript  | 2 +-
+ examples/telemetry_client/SConscript    | 2 +-
+ examples/telemetry_server/SConscript    | 2 +-
+ examples/testee_client/SConscript       | 2 +-
+ examples/testee_server/SConscript       | 2 +-
+ examples/utility_client/SConscript      | 4 ++--
+ test/connection/SConscript              | 2 +-
+ test/endpoint/SConscript                | 2 +-
+ test/extension/SConscript               | 2 +-
+ test/http/SConscript                    | 2 +-
+ test/logger/SConscript                  | 2 +-
+ test/message_buffer/SConscript          | 2 +-
+ test/processors/SConscript              | 2 +-
+ test/random/SConscript                  | 2 +-
+ test/roles/SConscript                   | 2 +-
+ test/transport/SConscript               | 2 +-
+ test/transport/asio/SConscript          | 2 +-
+ test/transport/iostream/SConscript      | 2 +-
+ test/utility/SConscript                 | 2 +-
+ 35 files changed, 36 insertions(+), 36 deletions(-)
+
+diff --git a/examples/broadcast_server/SConscript b/examples/broadcast_server/SConscript
+index 5786f570d..06c55c147 100644
+--- a/examples/broadcast_server/SConscript
++++ b/examples/broadcast_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('broadcast_server', ["broadcast_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/debug_client/SConscript b/examples/debug_client/SConscript
+index 781db8371..b92b14653 100644
+--- a/examples/debug_client/SConscript
++++ b/examples/debug_client/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    prgs += env_cpp11.Program('debug_client', ["debug_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/debug_server/SConscript b/examples/debug_server/SConscript
+index 4d02261c6..7e24b07c8 100644
+--- a/examples/debug_server/SConscript
++++ b/examples/debug_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('debug_server', ["debug_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/dev/SConscript b/examples/dev/SConscript
+index 34ddac2d5..31062fee9 100644
+--- a/examples/dev/SConscript
++++ b/examples/dev/SConscript
+@@ -11,7 +11,7 @@ env_cpp11 = env_cpp11.Clone ()
+ 
+ prgs = []
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system','timer','chrono'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('main', ["main.cpp"], LIBS = BOOST_LIBS_CPP11)
+ 
+diff --git a/examples/echo_client/SConscript b/examples/echo_client/SConscript
+index 0e4110822..2adf1166d 100644
+--- a/examples/echo_client/SConscript
++++ b/examples/echo_client/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
+    prgs += env_cpp11.Program('echo_client', ["echo_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/echo_server/SConscript b/examples/echo_server/SConscript
+index a2978852e..a48724155 100644
+--- a/examples/echo_server/SConscript
++++ b/examples/echo_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('echo_server', ["echo_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/echo_server_both/SConscript b/examples/echo_server_both/SConscript
+index d1ecf202f..32f4c8c55 100644
+--- a/examples/echo_server_both/SConscript
++++ b/examples/echo_server_both/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    prgs += env_cpp11.Program('echo_server_both', ["echo_server_both.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/echo_server_tls/SConscript b/examples/echo_server_tls/SConscript
+index e24cc4ce8..688bf7c14 100644
+--- a/examples/echo_server_tls/SConscript
++++ b/examples/echo_server_tls/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    prgs += env_cpp11.Program('echo_server_tls', ["echo_server_tls.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/external_io_service/SConscript b/examples/external_io_service/SConscript
+index beb7c1c42..0abf3e175 100644
+--- a/examples/external_io_service/SConscript
++++ b/examples/external_io_service/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('external_io_service', ["external_io_service.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/iostream_server/SConscript b/examples/iostream_server/SConscript
+index dc90834cf..304142082 100644
+--- a/examples/iostream_server/SConscript
++++ b/examples/iostream_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('iostream_server', ["iostream_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/print_client/SConscript b/examples/print_client/SConscript
+index 8da4ce5b2..79fdea0fd 100644
+--- a/examples/print_client/SConscript
++++ b/examples/print_client/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('print_client', ["print_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/print_client_tls/SConscript b/examples/print_client_tls/SConscript
+index 01b011473..e57b9d691 100644
+--- a/examples/print_client_tls/SConscript
++++ b/examples/print_client_tls/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    prgs += env_cpp11.Program('print_client_tls', ["print_client_tls.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/print_server/SConscript b/examples/print_server/SConscript
+index 4f0e492be..454dcf01b 100644
+--- a/examples/print_server/SConscript
++++ b/examples/print_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('print_server', ["print_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/scratch_client/SConscript b/examples/scratch_client/SConscript
+index 6e7b2ef07..4be98f437 100644
+--- a/examples/scratch_client/SConscript
++++ b/examples/scratch_client/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    prgs += env_cpp11.Program('scratch_client', ["scratch_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/scratch_server/SConscript b/examples/scratch_server/SConscript
+index bf90f7433..cc495ba5c 100644
+--- a/examples/scratch_server/SConscript
++++ b/examples/scratch_server/SConscript
+@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs] + ['z']
+    prgs += env_cpp11.Program('scratch_server', ["scratch_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/sip_client/SConscript b/examples/sip_client/SConscript
+index fafe7b4ff..e2afefe73 100644
+--- a/examples/sip_client/SConscript
++++ b/examples/sip_client/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('sip_client', ["sip_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/subprotocol_server/SConscript b/examples/subprotocol_server/SConscript
+index e97535ca5..299af43c5 100644
+--- a/examples/subprotocol_server/SConscript
++++ b/examples/subprotocol_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('subprotocol_server', ["subprotocol_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/telemetry_client/SConscript b/examples/telemetry_client/SConscript
+index 62396a5e3..ac0e6daba 100644
+--- a/examples/telemetry_client/SConscript
++++ b/examples/telemetry_client/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('telemetry_client', ["telemetry_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/telemetry_server/SConscript b/examples/telemetry_server/SConscript
+index 1b8ff2295..c620f38a4 100644
+--- a/examples/telemetry_server/SConscript
++++ b/examples/telemetry_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('telemetry_server', ["telemetry_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/testee_client/SConscript b/examples/testee_client/SConscript
+index 64f0ef1f3..6154bb966 100644
+--- a/examples/testee_client/SConscript
++++ b/examples/testee_client/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
+    prgs += env_cpp11.Program('testee_client', ["testee_client.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/testee_server/SConscript b/examples/testee_server/SConscript
+index 3c75f4ff2..ca8ffb7d7 100644
+--- a/examples/testee_server/SConscript
++++ b/examples/testee_server/SConscript
+@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
+    prgs += env_cpp11.Program('testee_server', ["testee_server.cpp"], LIBS = ALL_LIBS)
+ else:
+diff --git a/examples/utility_client/SConscript b/examples/utility_client/SConscript
+index 6e6cd8c9d..f6d673a43 100644
+--- a/examples/utility_client/SConscript
++++ b/examples/utility_client/SConscript
+@@ -13,11 +13,11 @@ env_cpp11 = env_cpp11.Clone ()
+ prgs = []
+ 
+ # if a C++11 environment is available build using that, otherwise use boost
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    prgs += env_cpp11.Program('utility_client', ["utility_client.cpp"], LIBS = ALL_LIBS)
+ else:
+    ALL_LIBS = boostlibs(['system','random'],env) + [platform_libs] + [polyfill_libs]
+    prgs += env.Program('utility_client', ["utility_client.cpp"], LIBS = ALL_LIBS)
+ 
+-Return('prgs')
+\ No newline at end of file
++Return('prgs')
+diff --git a/test/connection/SConscript b/test/connection/SConscript
+index 4ed7a4e69..b79876bf1 100644
+--- a/test/connection/SConscript
++++ b/test/connection/SConscript
+@@ -16,7 +16,7 @@ objs = env.Object('connection_boost.o', ["connection.cpp"], LIBS = BOOST_LIBS)
+ objs = env.Object('connection_tu2_boost.o', ["connection_tu2.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_connection_boost', ["connection_boost.o","connection_tu2_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('connection_stl.o', ["connection.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('connection_tu2_stl.o', ["connection_tu2.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/endpoint/SConscript b/test/endpoint/SConscript
+index 5cb3ede91..74912865e 100644
+--- a/test/endpoint/SConscript
++++ b/test/endpoint/SConscript
+@@ -16,7 +16,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system'],env) + [platform_libs] +
+ objs = env.Object('endpoint_boost.o', ["endpoint.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_endpoint_boost', ["endpoint_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    objs += env_cpp11.Object('endpoint_stl.o', ["endpoint.cpp"], LIBS = BOOST_LIBS_CPP11)
+    prgs += env_cpp11.Program('test_endpoint_stl', ["endpoint_stl.o"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/extension/SConscript b/test/extension/SConscript
+index d8b425fda..0cb813856 100644
+--- a/test/extension/SConscript
++++ b/test/extension/SConscript
+@@ -17,7 +17,7 @@ objs += env.Object('permessage_deflate_boost.o', ["permessage_deflate.cpp"], LIB
+ prgs = env.Program('test_extension_boost', ["extension_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_permessage_deflate_boost', ["permessage_deflate_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
+    objs += env_cpp11.Object('extension_stl.o', ["extension.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('permessage_deflate_stl.o', ["permessage_deflate.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/http/SConscript b/test/http/SConscript
+index 0a24a8774..422998e24 100644
+--- a/test/http/SConscript
++++ b/test/http/SConscript
+@@ -15,7 +15,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework'],env) + [platform_libs]
+ objs = env.Object('parser_boost.o', ["parser.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_http_boost', ["parser_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('parser_stl.o', ["parser.cpp"], LIBS = BOOST_LIBS_CPP11)
+    prgs += env_cpp11.Program('test_http_stl', ["parser_stl.o"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/logger/SConscript b/test/logger/SConscript
+index 81d607601..0ccbbc5df 100644
+--- a/test/logger/SConscript
++++ b/test/logger/SConscript
+@@ -15,7 +15,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system'],env) + [platform_libs]
+ objs = env.Object('logger_basic_boost.o', ["basic.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('logger_basic_boost', ["logger_basic_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('logger_basic_stl.o', ["basic.cpp"], LIBS = BOOST_LIBS_CPP11)
+    prgs += env_cpp11.Program('logger_basic_stl', ["logger_basic_stl.o"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/message_buffer/SConscript b/test/message_buffer/SConscript
+index 2ef6d71f3..89785cb3e 100644
+--- a/test/message_buffer/SConscript
++++ b/test/message_buffer/SConscript
+@@ -17,7 +17,7 @@ objs += env.Object('alloc_boost.o', ["alloc.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_message_boost', ["message_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_alloc_boost', ["alloc_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('message_stl.o', ["message.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('alloc_stl.o', ["alloc.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/processors/SConscript b/test/processors/SConscript
+index 406a7edc9..1b40d0b1d 100644
+--- a/test/processors/SConscript
++++ b/test/processors/SConscript
+@@ -26,7 +26,7 @@ prgs += env.Program('test_hybi07_boost', ["test_hybi07_boost.o"], LIBS = BOOST_L
+ prgs += env.Program('test_hybi00_boost', ["test_hybi00_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_extension_permessage_compress_boost', ["test_extension_permessage_compress_boost.o"], LIBS = BOOST_LIBS + ['z'])
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
+    # no C++11 features are used in processor so there are no C++11 versions of
+    # these tests.
+diff --git a/test/random/SConscript b/test/random/SConscript
+index 3cadc9e97..4a11b0ce5 100644
+--- a/test/random/SConscript
++++ b/test/random/SConscript
+@@ -17,7 +17,7 @@ objs += env.Object('random_device_boost.o', ["random_device.cpp"], LIBS = BOOST_
+ prgs = env.Program('test_random_none_boost', ["random_none_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_random_device_boost', ["random_device_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('random_none_stl.o', ["none.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('random_device_stl.o', ["random_device.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/roles/SConscript b/test/roles/SConscript
+index e86107ece..17b3be105 100644
+--- a/test/roles/SConscript
++++ b/test/roles/SConscript
+@@ -17,7 +17,7 @@ objs += env.Object('server_boost.o', ["server.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_client_boost', ["client_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_server_boost', ["server_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('client_stl.o', ["client.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('server_stl.o', ["server.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/transport/SConscript b/test/transport/SConscript
+index 71b31b6c5..aa9b719ec 100644
+--- a/test/transport/SConscript
++++ b/test/transport/SConscript
+@@ -16,7 +16,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system','thread','random','chrono
+ objs = env.Object('boost_integration.o', ["integration.cpp"], LIBS = BOOST_LIBS)
+ prgs = env.Program('test_boost_integration', ["boost_integration.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    objs += env_cpp11.Object('stl_integration.o', ["integration.cpp"], LIBS = BOOST_LIBS_CPP11)
+    prgs += env_cpp11.Program('test_stl_integration', ["stl_integration.o"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/transport/asio/SConscript b/test/transport/asio/SConscript
+index f8185e57e..518d362b1 100644
+--- a/test/transport/asio/SConscript
++++ b/test/transport/asio/SConscript
+@@ -20,7 +20,7 @@ prgs = env.Program('test_base_boost', ["base_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_timers_boost', ["timers_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_security_boost', ["security_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
+    objs += env_cpp11.Object('base_stl.o', ["base.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('timers_stl.o', ["timers.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/transport/iostream/SConscript b/test/transport/iostream/SConscript
+index 9e74c2f15..dcaf9f2d9 100644
+--- a/test/transport/iostream/SConscript
++++ b/test/transport/iostream/SConscript
+@@ -19,7 +19,7 @@ prgs = env.Program('test_iostream_base_boost', ["iostream_base_boost.o"], LIBS =
+ prgs += env.Program('test_iostream_connection_boost', ["iostream_connection_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_iostream_endpoint_boost', ["iostream_endpoint_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('iostream_base_stl.o', ["base.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('iostream_connection_stl.o', ["connection.cpp"], LIBS = BOOST_LIBS_CPP11)
+diff --git a/test/utility/SConscript b/test/utility/SConscript
+index 80e9ef6c8..6f19aa52a 100644
+--- a/test/utility/SConscript
++++ b/test/utility/SConscript
+@@ -24,7 +24,7 @@ prgs += env.Program('test_close_boost', ["close_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_sha1_boost', ["sha1_boost.o"], LIBS = BOOST_LIBS)
+ prgs += env.Program('test_error_boost', ["error_boost.o"], LIBS = BOOST_LIBS)
+ 
+-if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
++if 'WSPP_CPP11_ENABLED' in env_cpp11:
+    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
+    objs += env_cpp11.Object('utilities_stl.o', ["utilities.cpp"], LIBS = BOOST_LIBS_CPP11)
+    objs += env_cpp11.Object('uri_stl.o', ["uri.cpp"], LIBS = BOOST_LIBS_CPP11)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index a6f2186e4..f437accc5 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https;branch=master
            file://855.patch \
            file://857.patch \
            file://0001-Correct-clang-compiler-flags.patch \
+           file://1024.patch \
           "
 
 EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
-- 
2.25.1


