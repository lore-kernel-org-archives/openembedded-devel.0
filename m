Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C924C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 06:51:29 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.30863.1702450286459256316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 22:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EPIlwm+/;
 spf=pass (domain: mvista.com, ip: 209.85.167.180, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b9efed2e6fso3792783b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 22:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702450285; x=1703055085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzfSxlwxKKEAbjFZPxAIQ+YbNsnLt2os6Vm9F0r5TV4=;
        b=EPIlwm+/5Q6bOhRNxYRmNjc3j2X+LECWXIcRCry4bg8Qxf0mjD9H6q8dS3N/kHN+FK
         pv021f06AqIV5o51cF9ht9KYTGEuBE0y5XIbJZixshw3iiMh0CHzHG1joaBpMkEQA1EG
         EqAyktoaJuxHKlHB4+UCsGEPQ6ZqdSyncU/zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450285; x=1703055085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzfSxlwxKKEAbjFZPxAIQ+YbNsnLt2os6Vm9F0r5TV4=;
        b=FPoquwvR3tOlccLrV3OxH0a4BHG5IOtbS72ryWMwt8kP5FWkhctOqlp1qp38Dnsa74
         i7G6YbA1M80c69ajnzA36sjTWooEzWUouB0+U0r+jkW3C41/3OvLSGcb9GnScSjTzE3c
         JXt1yvrmHVIpe6xagx9L2eAuATcsYyfu7WZZ3qZbnSHVa7Kc102dIAsiWI7ib25tFYn/
         GyPL8ki45WDbgjEywSmbOdmMuimz9hiSkVhj5SOWG8rE8aaSRC5/JUIQEUbZuWyspy7Z
         TeFSLRa539rVJ8jUtVghrycfuuWYa5Bsv4O2kMIv2H87/p6tba8OPMTQ2soJvlVpl0xi
         hy9g==
X-Gm-Message-State: AOJu0YyIIPLMVmQ7Ls04a1y6Ftz1tBOHZoe9U5LFALVe0vhanljnsRwe
	XQ8twcXmMn2CYqkcuQmfbzMqwhJng2Lcdy132HCUaQ==
X-Google-Smtp-Source: AGHT+IGSL7rDjsBd3khfjhxY4uuOfJkaabthB4PK9/jWp6gpdZb/cgdQKP1pPKE7LfcZVabn9uU8Gw==
X-Received: by 2002:a05:6808:17a7:b0:3b9:de74:aa5b with SMTP id bg39-20020a05680817a700b003b9de74aa5bmr9500693oib.12.1702450285217;
        Tue, 12 Dec 2023 22:51:25 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.74])
        by smtp.gmail.com with ESMTPSA id z28-20020a62d11c000000b006ce66866226sm9627373pfg.84.2023.12.12.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:51:24 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCHv2] libssh: fix CVE-2023-1667 NULL pointer dereference
Date: Wed, 13 Dec 2023 12:21:19 +0530
Message-Id: <20231213065119.44726-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 06:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107348

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/log/?qt=grep&q=cve-2023-1667

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2023-1667.patch         | 724 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |   1 +
 2 files changed, 725 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-1667.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-1667.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-1667.patch
new file mode 100644
index 0000000000..9be713f5e5
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2023-1667.patch
@@ -0,0 +1,724 @@
+commit b733df6ddca80b11c2548ca88821b1c353480901
+Author: Jakub Jelen <jjelen@redhat.com>
+Date: Fri Mar 17 14:09:14 2023 +0100
+Subject: [PATCH] libssh: A NULL pointer dereference was found In libssh
+during re-keying with algorithm guessing. This issue may allow an authenticated
+client to cause a denial of service.
+
+Origin: See below commits ids, adapted for buster.
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/log/?qt=grep&q=cve-2023-1667]
+CVE: CVE-2023-1667
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ include/libssh/curve25519.h |   1 +
+ include/libssh/dh.h         |   3 +
+ include/libssh/ecdh.h       |   1 +
+ include/libssh/kex.h        |   2 +-
+ include/libssh/session.h    |  19 ++-
+ src/client.c                |  18 ++-
+ src/curve25519.c            |   5 +
+ src/dh.c                    |  32 +----
+ src/ecdh.c                  |   5 +
+ src/kex.c                   | 270 +++++++++++++++++++++++++++++-------
+ src/packet.c                |   5 +
+ src/server.c                |   8 +-
+ 12 files changed, 278 insertions(+), 91 deletions(-)
+
+diff --git a/include/libssh/curve25519.h b/include/libssh/curve25519.h
+index 0406b9ee..9a896c06 100644
+--- a/include/libssh/curve25519.h
++++ b/include/libssh/curve25519.h
+@@ -48,6 +48,7 @@ typedef unsigned char ssh_curve25519_privkey[CURVE25519_PRIVKEY_SIZE];
+ 
+ 
+ int ssh_client_curve25519_init(ssh_session session);
++void ssh_client_curve25519_remove_callbacks(ssh_session session);
+ int ssh_client_curve25519_reply(ssh_session session, ssh_buffer packet);
+ 
+ #ifdef WITH_SERVER
+diff --git a/include/libssh/dh.h b/include/libssh/dh.h
+index cfdcfeec..ad6d22db 100644
+--- a/include/libssh/dh.h
++++ b/include/libssh/dh.h
+@@ -41,8 +41,11 @@ int ssh_dh_import_e(ssh_session session, ssh_string e_string);
+ int ssh_dh_import_pubkey_blob(ssh_session session, ssh_string pubkey_blob);
+ int ssh_dh_import_next_pubkey_blob(ssh_session session, ssh_string pubkey_blob);
+ 
++int dh_handshake(ssh_session session);
++
+ int ssh_dh_build_k(ssh_session session);
+ int ssh_client_dh_init(ssh_session session);
++void ssh_client_dh_remove_callbacks(ssh_session session);
+ int ssh_client_dh_reply(ssh_session session, ssh_buffer packet);
+ 
+ ssh_key ssh_dh_get_current_server_publickey(ssh_session session);
+diff --git a/include/libssh/ecdh.h b/include/libssh/ecdh.h
+index 66659b85..3f9d6014 100644
+--- a/include/libssh/ecdh.h
++++ b/include/libssh/ecdh.h
+@@ -46,6 +46,7 @@ int ssh_client_ecdh_reply(ssh_session session, ssh_buffer packet);
+ 
+ /* Backend-specific functions.  */
+ int ssh_client_ecdh_init(ssh_session session);
++void ssh_client_ecdh_remove_callbacks(ssh_session session);
+ int ecdh_build_k(ssh_session session);
+ 
+ #ifdef WITH_SERVER
+diff --git a/include/libssh/kex.h b/include/libssh/kex.h
+index a626d105..8c1302a0 100644
+--- a/include/libssh/kex.h
++++ b/include/libssh/kex.h
+@@ -33,7 +33,7 @@ struct ssh_kex_struct {
+ 
+ SSH_PACKET_CALLBACK(ssh_packet_kexinit);
+ 
+-int ssh_send_kex(ssh_session session, int server_kex);
++int ssh_send_kex(ssh_session session);
+ void ssh_list_kex(struct ssh_kex_struct *kex);
+ int ssh_set_client_kex(ssh_session session);
+ int ssh_kex_select_methods(ssh_session session);
+diff --git a/include/libssh/session.h b/include/libssh/session.h
+index 23633cc2..3e681c2d 100644
+--- a/include/libssh/session.h
++++ b/include/libssh/session.h
+@@ -27,6 +27,7 @@
+ #include "libssh/auth.h"
+ #include "libssh/channels.h"
+ #include "libssh/poll.h"
++#include <stdbool.h>
+ 
+ /* These are the different states a SSH session can be into its life */
+ enum ssh_session_state_e {
+@@ -69,6 +70,11 @@ enum ssh_pending_call_e {
+ /* Client successfully authenticated */
+ #define SSH_SESSION_FLAG_AUTHENTICATED 2
+ 
++/* The KEXINIT message can be sent first by either of the parties so this flag
++ * indicates that the message was already sent to make sure it is sent and avoid
++ * sending it twice during key exchange to simplify the state machine. */
++#define SSH_SESSION_FLAG_KEXINIT_SENT 4
++
+ /* codes to use with ssh_handle_packets*() */
+ /* Infinite timeout */
+ #define SSH_TIMEOUT_INFINITE -1
+@@ -149,14 +155,21 @@ struct ssh_session_struct {
+         uint32_t current_method;
+     } auth;
+ 
++    /* Sending this flag before key exchange to save one round trip during the
++     * key exchange. This might make sense on high-latency connections.
++     * So far internal only for testing. Usable only on the client side --
++     * there is no key exchange method that would start with server message */
++    bool send_first_kex_follows;
+     /*
+      * RFC 4253, 7.1: if the first_kex_packet_follows flag was set in
+      * the received SSH_MSG_KEXINIT, but the guess was wrong, this
+      * field will be set such that the following guessed packet will
+-     * be ignored.  Once that packet has been received and ignored,
+-     * this field is cleared.
++     * be ignored on the receiving side.  Once that packet has been received and
++     * ignored, this field is cleared.
++     * On the sending side, this is set after we got peer KEXINIT message and we
++     * need to resend the initial message of the negotiated KEX algorithm.
+      */
+-    int first_kex_follows_guess_wrong;
++    bool first_kex_follows_guess_wrong;
+ 
+     ssh_buffer in_hashbuf;
+     ssh_buffer out_hashbuf;
+diff --git a/src/client.c b/src/client.c
+index 1132c0a0..9c640364 100644
+--- a/src/client.c
++++ b/src/client.c
+@@ -241,10 +241,13 @@ end:
+  * @warning this function returning is no proof that DH handshake is
+  * completed
+  */
+-static int dh_handshake(ssh_session session) {
+-
++int dh_handshake(ssh_session session)
++{
+   int rc = SSH_AGAIN;
+ 
++  SSH_LOG(SSH_LOG_TRACE, "dh_handshake_state = %d, kex_type = %d",
++          session->dh_handshake_state,  session->next_crypto->kex_type);
++
+   switch (session->dh_handshake_state) {
+     case DH_STATE_INIT:
+       switch(session->next_crypto->kex_type){
+@@ -380,6 +383,8 @@ pending:
+ static void ssh_client_connection_callback(ssh_session session)
+ {
+     int rc;
++    
++    SSH_LOG(SSH_LOG_DEBUG, "session_state=%d", session->session_state);
+ 
+     switch(session->session_state) {
+         case SSH_SESSION_STATE_NONE:
+@@ -415,7 +420,7 @@ static void ssh_client_connection_callback(ssh_session session)
+             if (rc != SSH_OK) {
+                 goto error;
+             }
+-            rc = ssh_send_kex(session, 0);
++            rc = ssh_send_kex(session);
+             if (rc < 0) {
+                 goto error;
+             }
+@@ -428,13 +433,13 @@ static void ssh_client_connection_callback(ssh_session session)
+         case SSH_SESSION_STATE_KEXINIT_RECEIVED:
+             set_status(session,0.6f);
+             ssh_list_kex(&session->next_crypto->server_kex);
+-            if (session->next_crypto->client_kex.methods[0] == NULL) {
++            if ((session->flags & SSH_SESSION_FLAG_KEXINIT_SENT) == 0) {
+                 /* in rekeying state if next_crypto client_kex is empty */
+                 rc = ssh_set_client_kex(session);
+                 if (rc != SSH_OK) {
+                     goto error;
+                 }
+-                rc = ssh_send_kex(session, 0);
++                rc = ssh_send_kex(session);
+                 if (rc < 0) {
+                     goto error;
+                 }
+@@ -443,6 +448,9 @@ static void ssh_client_connection_callback(ssh_session session)
+                 goto error;
+             set_status(session,0.8f);
+             session->session_state=SSH_SESSION_STATE_DH;
++
++            /* If the init packet was already sent in previous step, this will be no
++             * operation */
+             if (dh_handshake(session) == SSH_ERROR) {
+                 goto error;
+             }
+diff --git a/src/curve25519.c b/src/curve25519.c
+index 167209f4..837bc1d9 100644
+--- a/src/curve25519.c
++++ b/src/curve25519.c
+@@ -70,6 +70,11 @@ int ssh_client_curve25519_init(ssh_session session){
+   return rc;
+ }
+ 
++void ssh_client_curve25519_remove_callbacks(ssh_session session)
++{
++    // ssh_packet_remove_callbacks(session, &ssh_curve25519_client_callbacks);
++}
++
+ static int ssh_curve25519_build_k(ssh_session session) {
+   ssh_curve25519_pubkey k;
+ 
+diff --git a/src/dh.c b/src/dh.c
+index cc12fd46..a2ceac3c 100644
+--- a/src/dh.c
++++ b/src/dh.c
+@@ -691,6 +691,11 @@ int ssh_client_dh_init(ssh_session session){
+   return SSH_ERROR;
+ }
+ 
++void ssh_client_dh_remove_callbacks(ssh_session session)
++{
++    //ssh_packet_remove_callbacks(session, &ssh_dh_client_callbacks);
++}
++
+ int ssh_client_dh_reply(ssh_session session, ssh_buffer packet){
+   ssh_string f;
+   ssh_string pubkey_blob = NULL;
+@@ -775,33 +780,6 @@ int ssh_make_sessionid(ssh_session session) {
+         client_hash = session->in_hashbuf;
+     }
+ 
+-    /*
+-     * Handle the two final fields for the KEXINIT message (RFC 4253 7.1):
+-     *
+-     *      boolean      first_kex_packet_follows
+-     *      uint32       0 (reserved for future extension)
+-     */
+-    rc = ssh_buffer_add_u8(server_hash, 0);
+-    if (rc < 0) {
+-        goto error;
+-    }
+-    rc = ssh_buffer_add_u32(server_hash, 0);
+-    if (rc < 0) {
+-        goto error;
+-    }
+-
+-    /* These fields are handled for the server case in ssh_packet_kexinit. */
+-    if (session->client) {
+-        rc = ssh_buffer_add_u8(client_hash, 0);
+-        if (rc < 0) {
+-            goto error;
+-        }
+-        rc = ssh_buffer_add_u32(client_hash, 0);
+-        if (rc < 0) {
+-            goto error;
+-        }
+-    }
+-
+     rc = ssh_dh_get_next_server_publickey_blob(session, &server_pubkey_blob);
+     if (rc != SSH_OK) {
+         goto error;
+diff --git a/src/ecdh.c b/src/ecdh.c
+index f7fcaf13..7c568db4 100644
+--- a/src/ecdh.c
++++ b/src/ecdh.c
+@@ -30,6 +30,11 @@
+ 
+ #ifdef HAVE_ECDH
+ 
++void ssh_client_ecdh_remove_callbacks(ssh_session session)
++{
++    //ssh_packet_remove_callbacks(session, &ssh_ecdh_client_callbacks);
++}
++
+ /** @internal
+  * @brief parses a SSH_MSG_KEX_ECDH_REPLY packet and sends back
+  * a SSH_MSG_NEWKEYS
+diff --git a/src/kex.c b/src/kex.c
+index 82686e4b..0695c643 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -28,6 +28,7 @@
+ #include <stdio.h>
+ #include <stdbool.h>
+ 
++#include "libssh/libssh.h"
+ #include "libssh/priv.h"
+ #include "libssh/buffer.h"
+ #include "libssh/dh.h"
+@@ -416,7 +417,10 @@ out:
+     return is_wrong;
+ }
+ 
++extern int server_set_kex(ssh_session session);
++
+ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
++    struct ssh_crypto_struct *crypto = session->next_crypto;
+     int i, ok;
+     int server_kex=session->server;
+     ssh_string str = NULL;
+@@ -429,15 +433,32 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+ 
+     (void)type;
+     (void)user;
++    
++    SSH_LOG(SSH_LOG_TRACE, "KEXINIT received");
+ 
+     if (session->session_state == SSH_SESSION_STATE_AUTHENTICATED){
+         SSH_LOG(SSH_LOG_WARNING, "Other side initiating key re-exchange");
++        if (session->dh_handshake_state == DH_STATE_FINISHED) {
++            SSH_LOG(SSH_LOG_DEBUG, "Peer initiated key re-exchange");
++            /* Reset the sent flag if the re-kex was initiated by the peer */
++            session->flags &= ~SSH_SESSION_FLAG_KEXINIT_SENT;
++        } else if (session->flags & SSH_SESSION_FLAG_KEXINIT_SENT &&
++                   session->dh_handshake_state == DH_STATE_INIT_SENT) {
++            /* This happens only when we are sending our-guessed first kex
++             * packet right after our KEXINIT packet. */
++            SSH_LOG(SSH_LOG_DEBUG, "Received peer kexinit answer.");
++        } else if (session->session_state != SSH_SESSION_STATE_INITIAL_KEX) {
++            ssh_set_error(session, SSH_FATAL,
++                          "SSH_KEXINIT received in wrong state");
++            goto error;
++        }
+     } else if(session->session_state != SSH_SESSION_STATE_INITIAL_KEX){
+         ssh_set_error(session,SSH_FATAL,"SSH_KEXINIT received in wrong state");
+         goto error;
+     }
+ 
+     if (server_kex) {
++#ifdef WITH_SERVER
+         rc = ssh_buffer_get_data(packet,session->next_crypto->client_kex.cookie, 16);
+         if (rc != 16) {
+             ssh_set_error(session, SSH_FATAL, "ssh_packet_kexinit: no cookie in packet");
+@@ -449,6 +470,12 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+             ssh_set_error(session, SSH_FATAL, "ssh_packet_kexinit: adding cookie failed");
+             goto error;
+         }
++
++        ok = server_set_kex(session);
++        if (ok == SSH_ERROR) {
++            goto error;
++        }
++#endif
+     } else {
+         rc = ssh_buffer_get_data(packet,session->next_crypto->server_kex.cookie, 16);
+         if (rc != 16) {
+@@ -461,6 +488,11 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+             ssh_set_error(session, SSH_FATAL, "ssh_packet_kexinit: adding cookie failed");
+             goto error;
+         }
++
++        ok = ssh_set_client_kex(session);
++        if (ok == SSH_ERROR) {
++            goto error;
++        }
+     }
+ 
+     for (i = 0; i < KEX_METHODS_SIZE; i++) {
+@@ -505,22 +537,40 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+      * that its value is included when computing the session ID (see
+      * 'make_sessionid').
+      */
+-    if (server_kex) {
+-        rc = ssh_buffer_get_u8(packet, &first_kex_packet_follows);
+-        if (rc != 1) {
+-            goto error;
+-        }
++    rc = ssh_buffer_get_u8(packet, &first_kex_packet_follows);
++    if (rc != 1) {
++        goto error;
++    }
+ 
+-        rc = ssh_buffer_add_u8(session->in_hashbuf, first_kex_packet_follows);
+-        if (rc < 0) {
+-            goto error;
+-        }
++    rc = ssh_buffer_add_u8(session->in_hashbuf, first_kex_packet_follows);
++    if (rc < 0) {
++        goto error;
++    }
+ 
+-        rc = ssh_buffer_add_u32(session->in_hashbuf, kexinit_reserved);
+-        if (rc < 0) {
+-            goto error;
+-        }
++    rc = ssh_buffer_add_u32(session->in_hashbuf, kexinit_reserved);
++    if (rc < 0) {
++        goto error;
++    }
+ 
++    /*
++     * Remember whether 'first_kex_packet_follows' was set and the client
++     * guess was wrong: in this case the next SSH_MSG_KEXDH_INIT message
++     * must be ignored on the server side.
++     * Client needs to start the Key exchange over with the correct method
++     */
++    if (first_kex_packet_follows || session->send_first_kex_follows) {
++        char **client_methods = crypto->client_kex.methods;
++        char **server_methods = crypto->server_kex.methods;
++        session->first_kex_follows_guess_wrong =
++            cmp_first_kex_algo(client_methods[SSH_KEX],
++                               server_methods[SSH_KEX]) ||
++            cmp_first_kex_algo(client_methods[SSH_HOSTKEYS],
++                               server_methods[SSH_HOSTKEYS]);
++            SSH_LOG(SSH_LOG_DEBUG, "The initial guess was %s.",
++                    session->first_kex_follows_guess_wrong ? "wrong" : "right");
++    }
++
++    if (server_kex) {
+         /*
+          * If client sent a ext-info-c message in the kex list, it supports
+          * RFC 8308 extension negotiation.
+@@ -575,23 +625,15 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+                     session->extensions & SSH_EXT_SIG_RSA_SHA256 ? "SHA256" : "",
+                     session->extensions & SSH_EXT_SIG_RSA_SHA512 ? " SHA512" : "");
+         }
+-
+-        /*
+-         * Remember whether 'first_kex_packet_follows' was set and the client
+-         * guess was wrong: in this case the next SSH_MSG_KEXDH_INIT message
+-         * must be ignored.
+-         */
+-        if (first_kex_packet_follows) {
+-          session->first_kex_follows_guess_wrong =
+-            cmp_first_kex_algo(session->next_crypto->client_kex.methods[SSH_KEX],
+-                               session->next_crypto->server_kex.methods[SSH_KEX]) ||
+-            cmp_first_kex_algo(session->next_crypto->client_kex.methods[SSH_HOSTKEYS],
+-                               session->next_crypto->server_kex.methods[SSH_HOSTKEYS]);
+-        }
+     }
+ 
+     session->session_state = SSH_SESSION_STATE_KEXINIT_RECEIVED;
+-    session->dh_handshake_state = DH_STATE_INIT;
++    /* if we already sent our initial key exchange packet, do not reset the
++     * DH state. We will know if we were right with our guess only in
++     * dh_handshake_state() */
++    if (session->send_first_kex_follows == false) {
++        session->dh_handshake_state = DH_STATE_INIT;
++    }
+     session->ssh_connection_callback(session);
+     return SSH_PACKET_USED;
+ 
+@@ -747,6 +789,12 @@ int ssh_set_client_kex(ssh_session session)
+     int ok;
+     int i;
+     size_t kex_len, len;
++    
++    /* Skip if already set, for example for the rekey or when we do the guessing
++     * it could have been already used to make some protocol decisions. */
++    if (client->methods[0] != NULL) {
++        return SSH_OK;
++    }
+ 
+     ok = ssh_get_random(client->cookie, 16, 0);
+     if (!ok) {
+@@ -798,15 +846,89 @@ int ssh_set_client_kex(ssh_session session)
+     return SSH_OK;
+ }
+ 
++static enum ssh_key_exchange_e
++kex_select_kex_type(const char *kex)
++{
++    if (strcmp(kex, "diffie-hellman-group1-sha1") == 0) {
++        return SSH_KEX_DH_GROUP1_SHA1;
++    } else if (strcmp(kex, "diffie-hellman-group14-sha1") == 0) {
++        return SSH_KEX_DH_GROUP14_SHA1;
++//    } else if (strcmp(kex, "diffie-hellman-group14-sha256") == 0) {
++//        return SSH_KEX_DH_GROUP14_SHA256;
++    } else if (strcmp(kex, "diffie-hellman-group16-sha512") == 0) {
++        return SSH_KEX_DH_GROUP16_SHA512;
++    } else if (strcmp(kex, "diffie-hellman-group18-sha512") == 0) {
++        return SSH_KEX_DH_GROUP18_SHA512;
++#ifdef WITH_GEX
++    } else if (strcmp(kex, "diffie-hellman-group-exchange-sha1") == 0) {
++        return SSH_KEX_DH_GEX_SHA1;
++    } else if (strcmp(kex, "diffie-hellman-group-exchange-sha256") == 0) {
++        return SSH_KEX_DH_GEX_SHA256;
++#endif /* WITH_GEX */
++    } else if (strcmp(kex, "ecdh-sha2-nistp256") == 0) {
++        return SSH_KEX_ECDH_SHA2_NISTP256;
++    } else if (strcmp(kex, "ecdh-sha2-nistp384") == 0) {
++        return SSH_KEX_ECDH_SHA2_NISTP384;
++    } else if (strcmp(kex, "ecdh-sha2-nistp521") == 0) {
++        return SSH_KEX_ECDH_SHA2_NISTP521;
++    } else if (strcmp(kex, "curve25519-sha256@libssh.org") == 0) {
++        return SSH_KEX_CURVE25519_SHA256_LIBSSH_ORG;
++    } else if (strcmp(kex, "curve25519-sha256") == 0) {
++        return SSH_KEX_CURVE25519_SHA256;
++    }
++    /* should not happen. We should be getting only valid names at this stage */
++    return 0;
++}
++
++
++/** @internal
++ * @brief Reverts guessed callbacks set during the dh_handshake()
++ * @param session session handle
++ * @returns void
++ */
++static void revert_kex_callbacks(ssh_session session)
++{
++    switch (session->next_crypto->kex_type) {
++    case SSH_KEX_DH_GROUP1_SHA1:
++    case SSH_KEX_DH_GROUP14_SHA1:
++//    case SSH_KEX_DH_GROUP14_SHA256:
++    case SSH_KEX_DH_GROUP16_SHA512:
++    case SSH_KEX_DH_GROUP18_SHA512:
++        ssh_client_dh_remove_callbacks(session);
++        break;
++#ifdef WITH_GEX
++    case SSH_KEX_DH_GEX_SHA1:
++    case SSH_KEX_DH_GEX_SHA256:
++        ssh_client_dhgex_remove_callbacks(session);
++        break;
++#endif /* WITH_GEX */
++#ifdef HAVE_ECDH
++    case SSH_KEX_ECDH_SHA2_NISTP256:
++    case SSH_KEX_ECDH_SHA2_NISTP384:
++    case SSH_KEX_ECDH_SHA2_NISTP521:
++        ssh_client_ecdh_remove_callbacks(session);
++        break;
++#endif
++#ifdef HAVE_CURVE25519
++    case SSH_KEX_CURVE25519_SHA256:
++    case SSH_KEX_CURVE25519_SHA256_LIBSSH_ORG:
++        ssh_client_curve25519_remove_callbacks(session);
++        break;
++#endif
++    }
++}
++
+ /** @brief Select the different methods on basis of client's and
+  * server's kex messages, and watches out if a match is possible.
+  */
+ int ssh_kex_select_methods (ssh_session session){
+-    struct ssh_kex_struct *server = &session->next_crypto->server_kex;
++     struct ssh_crypto_struct *crypto = session->next_crypto;
++     struct ssh_kex_struct *server = &session->next_crypto->server_kex;
+     struct ssh_kex_struct *client = &session->next_crypto->client_kex;
+     char *ext_start = NULL;
+     int i;
+-
++    enum ssh_key_exchange_e kex_type;
++    
+     /* Here we should drop the  ext-info-c  from the list so we avoid matching.
+      * it. We added it to the end, so we can just truncate the string here */
+     ext_start = strstr(client->methods[SSH_KEX], ","KEX_EXTENSION_CLIENT);
+@@ -825,25 +947,21 @@ int ssh_kex_select_methods (ssh_session session){
+             session->next_crypto->kex_methods[i] = strdup("");
+         }
+     }
+-    if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "diffie-hellman-group1-sha1") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_DH_GROUP1_SHA1;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "diffie-hellman-group14-sha1") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_DH_GROUP14_SHA1;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "diffie-hellman-group16-sha512") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_DH_GROUP16_SHA512;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "diffie-hellman-group18-sha512") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_DH_GROUP18_SHA512;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "ecdh-sha2-nistp256") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_ECDH_SHA2_NISTP256;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "ecdh-sha2-nistp384") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_ECDH_SHA2_NISTP384;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "ecdh-sha2-nistp521") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_ECDH_SHA2_NISTP521;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "curve25519-sha256@libssh.org") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_CURVE25519_SHA256_LIBSSH_ORG;
+-    } else if(strcmp(session->next_crypto->kex_methods[SSH_KEX], "curve25519-sha256") == 0){
+-      session->next_crypto->kex_type=SSH_KEX_CURVE25519_SHA256;
+-    }
++
++    /* We can not set this value directly as the old value is needed to revert
++     * callbacks if we are client */
++    kex_type = kex_select_kex_type(crypto->kex_methods[SSH_KEX]);
++    if (session->client && session->first_kex_follows_guess_wrong) {
++        SSH_LOG(SSH_LOG_DEBUG, "Our guess was wrong. Restarting the KEX");
++        /* We need to remove the wrong callbacks and start kex again */
++        revert_kex_callbacks(session);
++        session->dh_handshake_state = DH_STATE_INIT;
++        session->first_kex_follows_guess_wrong = false;
++     }
++    crypto->kex_type = kex_type;
++
++
++
+     SSH_LOG(SSH_LOG_INFO, "Negotiated %s,%s,%s,%s,%s,%s,%s,%s,%s,%s",
+             session->next_crypto->kex_methods[SSH_KEX],
+             session->next_crypto->kex_methods[SSH_HOSTKEYS],
+@@ -861,13 +979,26 @@ int ssh_kex_select_methods (ssh_session session){
+ 
+ 
+ /* this function only sends the predefined set of kex methods */
+-int ssh_send_kex(ssh_session session, int server_kex) {
+-  struct ssh_kex_struct *kex = (server_kex ? &session->next_crypto->server_kex :
++int ssh_send_kex(ssh_session session) {
++  struct ssh_kex_struct *kex = (session->server ? &session->next_crypto->server_kex :
+       &session->next_crypto->client_kex);
+   ssh_string str = NULL;
+   int i;
+   int rc;
++  int first_kex_packet_follows = 0;
++
++  /* Only client can initiate the handshake methods we implement. If we
++   * already received the peer mechanisms, there is no point in guessing */
++  if (session->client &&
++      session->session_state != SSH_SESSION_STATE_KEXINIT_RECEIVED &&
++      session->send_first_kex_follows) {
++      first_kex_packet_follows = 1;
++  }
+ 
++  SSH_LOG(SSH_LOG_TRACE,
++          "Sending KEXINIT packet, first_kex_packet_follows = %d",
++          first_kex_packet_follows);
++ 
+   rc = ssh_buffer_pack(session->out_buffer,
+                        "bP",
+                        SSH2_MSG_KEXINIT,
+@@ -899,15 +1030,52 @@ int ssh_send_kex(ssh_session session, int server_kex) {
+ 
+   rc = ssh_buffer_pack(session->out_buffer,
+                        "bd",
+-                       0,
++                       first_kex_packet_follows,
+                        0);
+   if (rc != SSH_OK) {
+     goto error;
+   }
++  
++  /* Prepare also the first_kex_packet_follows and reserved to 0 */
++  rc = ssh_buffer_add_u8(session->out_hashbuf, first_kex_packet_follows);
++  if (rc < 0) {
++      goto error;
++  }
++  rc = ssh_buffer_add_u32(session->out_hashbuf, 0);
++  if (rc < 0) {
++      goto error;
++  }
+ 
+   if (ssh_packet_send(session) == SSH_ERROR) {
+     return -1;
+   }
++  
++  session->flags |= SSH_SESSION_FLAG_KEXINIT_SENT;
++  SSH_LOG(SSH_LOG_PACKET, "SSH_MSG_KEXINIT sent");
++
++  /* If we indicated that we are sending the guessed key exchange packet,
++   * do it now. The packet is simple, but we need to do some preparations */
++  if (first_kex_packet_follows) {
++      char *list = kex->methods[SSH_KEX];
++      char *colon = strchr(list, ',');
++      size_t kex_name_len = colon ? (size_t)(colon - list) : strlen(list);
++      char *kex_name = calloc(kex_name_len + 1, 1);
++      if (kex_name == NULL) {
++          ssh_set_error_oom(session);
++          goto error;
++      }
++      snprintf(kex_name, kex_name_len + 1, "%.*s", (int)kex_name_len, list);
++      SSH_LOG(SSH_LOG_TRACE, "Sending the first kex packet for %s", kex_name);
++
++      session->next_crypto->kex_type = kex_select_kex_type(kex_name);
++       free(kex_name);
++
++      /* run the first step of the DH handshake */
++      session->dh_handshake_state = DH_STATE_INIT;
++      if (dh_handshake(session) == SSH_ERROR) {
++          goto error;
++      }
++  }
+ 
+   return 0;
+ error:
+diff --git a/src/packet.c b/src/packet.c
+index 61a44237..932ef7ba 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -362,6 +362,11 @@ static enum ssh_packet_filter_result_e ssh_packet_incoming_filter(ssh_session se
+          * - session->dh_handhsake_state = DH_STATE_NEWKEYS_SENT
+          * */
+ 
++        if (!session->server) {
++            rc = SSH_PACKET_DENIED;
++            break;
++        }
++
+         if (session->session_state != SSH_SESSION_STATE_DH) {
+             rc = SSH_PACKET_DENIED;
+             break;
+diff --git a/src/server.c b/src/server.c
+index bc98da4f..68b25a97 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -82,7 +82,7 @@ static int dh_handshake_server(ssh_session session);
+  * options that are currently set in the given ssh_session structure.
+  */
+ 
+-static int server_set_kex(ssh_session session) {
++int server_set_kex(ssh_session session) {
+   struct ssh_kex_struct *server = &session->next_crypto->server_kex;
+   int i, j, rc;
+   const char *wanted;
+@@ -458,7 +458,7 @@ static void ssh_server_connection_callback(ssh_session session){
+             ssh_packet_set_default_callbacks(session);
+             set_status(session, 0.5f);
+             session->session_state=SSH_SESSION_STATE_INITIAL_KEX;
+-            if (ssh_send_kex(session, 1) < 0) {
++            if (ssh_send_kex(session) < 0) {
+                 goto error;
+             }
+             break;
+@@ -467,11 +467,11 @@ static void ssh_server_connection_callback(ssh_session session){
+             break;
+         case SSH_SESSION_STATE_KEXINIT_RECEIVED:
+             set_status(session,0.6f);
+-            if(session->next_crypto->server_kex.methods[0]==NULL){
++            if ((session->flags & SSH_SESSION_FLAG_KEXINIT_SENT) == 0) {
+                 if(server_set_kex(session) == SSH_ERROR)
+                     goto error;
+                 /* We are in a rekeying, so we need to send the server kex */
+-                if(ssh_send_kex(session, 1) < 0)
++                if(ssh_send_kex(session) < 0)
+                     goto error;
+             }
+             ssh_list_kex(&session->next_crypto->client_kex); // log client kex
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 061f13912f..cad552e78a 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -8,6 +8,7 @@ DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
            file://CVE-2020-16135.patch \
+           file://CVE-2023-1667.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1


