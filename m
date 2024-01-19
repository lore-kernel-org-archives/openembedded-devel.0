Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DFBC47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 03:28:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.13714.1705634917478228035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 19:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WgOkUmZC;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d70c3c2212so2786695ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705634916; x=1706239716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryb0oPREfNUh2HnGBFxIdBc4j8Pq34e0Nta+RgkY5A8=;
        b=WgOkUmZCWgu14Z3m01yLtUpPKLLs0bcrexJSivXhhO9JJhotffJETMjByJs+IKm0xn
         FokkMIBojqHxjgqFb1OHrwIEZlIElWFeyr3CEd5ncnalluXVRyQ9Hm4sV8Zt247AN76B
         AKtBEC5E20KPSxbB6FKUBqdL2MRatd3Bk2crU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705634916; x=1706239716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ryb0oPREfNUh2HnGBFxIdBc4j8Pq34e0Nta+RgkY5A8=;
        b=xR7a0jVQtJGxqACIY0tSZ5LPNeiXEV4N7tSlJvm0oWueVR2TRjGTXjYi5NGdx6O649
         /3rcPPek0HdQKsSDjGZHsBWgeudKnraBu4sb9cv3mh/t4jMrbjPYj4tDpgt6Rsn5q6+k
         nMakeZ6zosbiydciXJizROiLnfHNb6LX4/r/FdrdSgeVqpAln6mcWgUq/tqCAM7xEki9
         Ye2981Wafaop+UaB+iiwdvh/Kra9FJjEDYvWlTAYzbKMlhn076lZo4VP5Hg8/46uhLVq
         /f4NTDQecfulv4PEGEhLvBbbqwtXX01G3w2mfBIQ84kS6qhbk9nrzHdAv25VNkgvUKzS
         DuXw==
X-Gm-Message-State: AOJu0YxH9ggIWPl0WVpLBLQ5ggu9DHLM+LXq0NSeXXCdwVC1LLj33bbz
	6YnbTWVOVROMX7m2uxxb7Oa9wvTlCbqZ95QBAEOj49p2guTQPVnP06xMUJNYWR7A7TSLmIkUEHB
	G
X-Google-Smtp-Source: AGHT+IG/Pm3K20TiPNiZTYQxDhTqLR76uR4bjhmehKKe3QEYihLTZLHRAElprwh/hB+Yef+S34IZjg==
X-Received: by 2002:a17:902:7596:b0:1d4:bd1f:e4b7 with SMTP id j22-20020a170902759600b001d4bd1fe4b7mr469633pll.24.1705634915902;
        Thu, 18 Jan 2024 19:28:35 -0800 (PST)
Received: from MVIN00020.mvista.com ([106.212.247.212])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001d5e340d979sm2057126plw.6.2024.01.18.19.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 19:28:35 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] libssh: Backport fix for CVE-2023-48795
Date: Fri, 19 Jan 2024 08:56:19 +0530
Message-Id: <20240119032619.6888-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 03:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108354

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.com/libssh/libssh-mirror/-/commit/4cef5e965a46e9271aed62631b152e4bd23c1e3c
&
https://gitlab.com/libssh/libssh-mirror/-/commit/0870c8db28be9eb457ee3d4f9a168959d9507efd
&
https://gitlab.com/libssh/libssh-mirror/-/commit/5846e57538c750c5ce67df887d09fa99861c79c6]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2023-48795-1.patch      | 385 ++++++++++++++++++
 .../libssh/libssh/CVE-2023-48795-2.patch      | 126 ++++++
 .../libssh/libssh/CVE-2023-48795-3.patch      |  47 +++
 .../recipes-support/libssh/libssh_0.8.9.bb    |   3 +
 4 files changed, 561 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
new file mode 100644
index 000000000..413e5b3d1
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
@@ -0,0 +1,385 @@
+From 4cef5e965a46e9271aed62631b152e4bd23c1e3c Mon Sep 17 00:00:00 2001
+From: Aris Adamantiadis <aris@0xbadc0de.be>
+Date: Tue, 12 Dec 2023 23:09:57 +0100
+Subject: [PATCH] CVE-2023-48795: client side mitigation
+
+Signed-off-by: Aris Adamantiadis <aris@0xbadc0de.be>
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/4cef5e965a46e9271aed62631b152e4bd23c1e3c]
+CVE: CVE-2023-48795
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/libssh/packet.h  |  1 +
+ include/libssh/session.h |  6 +++++
+ src/curve25519.c         | 18 +++----------
+ src/dh.c                 |  6 +----
+ src/ecdh.c               |  7 +----
+ src/ecdh_crypto.c        | 10 ++-----
+ src/ecdh_gcrypt.c        | 10 +++----
+ src/ecdh_mbedcrypto.c    | 11 +++-----
+ src/kex.c                | 34 ++++++++++++++++++++----
+ src/packet.c             | 56 +++++++++++++++++++++++++++++++++++++++-
+ src/packet_cb.c          | 12 +++++++++
+ 11 files changed, 118 insertions(+), 53 deletions(-)
+
+diff --git a/include/libssh/packet.h b/include/libssh/packet.h
+index fbe09700..8800e16b 100644
+--- a/include/libssh/packet.h
++++ b/include/libssh/packet.h
+@@ -63,6 +63,7 @@ SSH_PACKET_CALLBACK(ssh_packet_ext_info);
+ SSH_PACKET_CALLBACK(ssh_packet_kexdh_init);
+ #endif
+ 
++int ssh_packet_send_newkeys(ssh_session session);
+ int ssh_packet_send_unimplemented(ssh_session session, uint32_t seqnum);
+ int ssh_packet_parse_type(ssh_session session);
+ //int packet_flush(ssh_session session, int enforce_blocking);
+diff --git a/include/libssh/session.h b/include/libssh/session.h
+index 23633cc2..b8810f54 100644
+--- a/include/libssh/session.h
++++ b/include/libssh/session.h
+@@ -69,6 +69,12 @@ enum ssh_pending_call_e {
+ /* Client successfully authenticated */
+ #define SSH_SESSION_FLAG_AUTHENTICATED 2
+ 
++/* The current SSH2 session implements the "strict KEX" feature and should behave
++ * differently on SSH2_MSG_NEWKEYS. */
++#define SSH_SESSION_FLAG_KEX_STRICT 0x0010
++/* Unexpected packets have been sent while the session was still unencrypted */
++#define SSH_SESSION_FLAG_KEX_TAINTED 0x0020
++
+ /* codes to use with ssh_handle_packets*() */
+ /* Infinite timeout */
+ #define SSH_TIMEOUT_INFINITE -1
+diff --git a/src/curve25519.c b/src/curve25519.c
+index 167209f4..6eda5feb 100644
+--- a/src/curve25519.c
++++ b/src/curve25519.c
+@@ -166,12 +166,7 @@ int ssh_client_curve25519_reply(ssh_session session, ssh_buffer packet){
+   }
+ 
+   /* Send the MSG_NEWKEYS */
+-  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
+-    goto error;
+-  }
+-
+-  rc=ssh_packet_send(session);
+-  SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
++  rc = ssh_packet_send_newkeys(session);
+   return rc;
+ error:
+   return SSH_ERROR;
+@@ -297,15 +292,10 @@ int ssh_server_curve25519_init(ssh_session session, ssh_buffer packet){
+         return SSH_ERROR;
+     }
+ 
+-    /* Send the MSG_NEWKEYS */
+-    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
+-    if (rc < 0) {
+-        goto error;
+-    }
+-
+     session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
+-    rc = ssh_packet_send(session);
+-    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
++
++    /* Send the MSG_NEWKEYS */
++    rc = ssh_packet_send_newkeys(session);
+ 
+     return rc;
+ error:
+diff --git a/src/dh.c b/src/dh.c
+index cc12fd46..33883f2d 100644
+--- a/src/dh.c
++++ b/src/dh.c
+@@ -735,11 +735,7 @@ int ssh_client_dh_reply(ssh_session session, ssh_buffer packet){
+   }
+ 
+   /* Send the MSG_NEWKEYS */
+-  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
+-    goto error;
+-  }
+-
+-  rc=ssh_packet_send(session);
++  rc = ssh_packet_send_newkeys(session);
+   SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
+   return rc;
+ error:
+diff --git a/src/ecdh.c b/src/ecdh.c
+index f7fcaf13..1fef7ec9 100644
+--- a/src/ecdh.c
++++ b/src/ecdh.c
+@@ -72,12 +72,7 @@ int ssh_client_ecdh_reply(ssh_session session, ssh_buffer packet){
+   }
+ 
+   /* Send the MSG_NEWKEYS */
+-  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
+-    goto error;
+-  }
+-
+-  rc=ssh_packet_send(session);
+-  SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
++  rc = ssh_packet_send_newkeys(session);
+   return rc;
+ error:
+   return SSH_ERROR;
+diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
+index 24f21c03..7e5f0cc7 100644
+--- a/src/ecdh_crypto.c
++++ b/src/ecdh_crypto.c
+@@ -318,15 +318,9 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet){
+         return SSH_ERROR;
+     }
+ 
+-    /* Send the MSG_NEWKEYS */
+-    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
+-    if (rc < 0) {
+-        return SSH_ERROR;;
+-    }
+-
+     session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
+-    rc = ssh_packet_send(session);
+-    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
++    /* Send the MSG_NEWKEYS */
++    rc = ssh_packet_send_newkeys(session);
+ 
+     return rc;
+ }
+diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
+index e43cacea..c1db7f5d 100644
+--- a/src/ecdh_gcrypt.c
++++ b/src/ecdh_gcrypt.c
+@@ -362,17 +362,13 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet) {
+         goto out;
+     }
+ 
+-
++    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
+     /* Send the MSG_NEWKEYS */
+-    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
+-    if (rc != SSH_OK) {
++    rc = ssh_packet_send_newkeys(session);
++    if (rc == SSH_ERROR) {
+         goto out;
+     }
+ 
+-    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
+-    rc = ssh_packet_send(session);
+-    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
+-
+  out:
+     gcry_sexp_release(param);
+     gcry_sexp_release(key);
+diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
+index fa350028..24924508 100644
+--- a/src/ecdh_mbedcrypto.c
++++ b/src/ecdh_mbedcrypto.c
+@@ -293,16 +293,13 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet)
+         goto out;
+     }
+ 
+-    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
+-    if (rc < 0) {
+-        rc = SSH_ERROR;
++        session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
++	/* Send the MSG_NEWKEYS */
++	rc = ssh_packet_send_newkeys(session);
++	if (rc == SSH_ERROR) {
+         goto out;
+     }
+ 
+-    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
+-    rc = ssh_packet_send(session);
+-    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
+-
+ out:
+     mbedtls_ecp_group_free(&grp);
+     return rc;
+diff --git a/src/kex.c b/src/kex.c
+index 82686e4b..7f1bb324 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -105,6 +105,9 @@
+ 
+ /* RFC 8308 */
+ #define KEX_EXTENSION_CLIENT "ext-info-c"
++/* Strict kex mitigation against CVE-2023-48795 */
++#define KEX_STRICT_CLIENT "kex-strict-c-v00@openssh.com"
++#define KEX_STRICT_SERVER "kex-strict-s-v00@openssh.com"
+ 
+ /* NOTE: This is a fixed API and the index is defined by ssh_kex_types_e */
+ static const char *default_methods[] = {
+@@ -521,6 +524,27 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
+             goto error;
+         }
+ 
++	/*
++	 * handle the "strict KEX" feature. If supported by peer, then set up the
++	 * flag and verify packet sequence numbers.
++	 */
++	if (server_kex) {
++	    ok = ssh_match_group(session->next_crypto->client_kex.methods[SSH_KEX],
++			         KEX_STRICT_CLIENT);
++	    if (ok) {
++		SSH_LOG(SSH_LOG_DEBUG, "Client supports strict kex, enabling.");
++		session->flags |= SSH_SESSION_FLAG_KEX_STRICT;
++	    }
++	} else {
++	    /* client kex */
++	    ok = ssh_match_group(session->next_crypto->server_kex.methods[SSH_KEX],
++			         KEX_STRICT_SERVER);
++	    if (ok) {
++		SSH_LOG(SSH_LOG_DEBUG, "Server supports strict kex, enabling.");
++		session->flags |= SSH_SESSION_FLAG_KEX_STRICT;
++	    }
++	}
++
+         /*
+          * If client sent a ext-info-c message in the kex list, it supports
+          * RFC 8308 extension negotiation.
+@@ -778,21 +802,21 @@ int ssh_set_client_kex(ssh_session session)
+         return SSH_OK;
+     }
+ 
+-    /* Here we append  ext-info-c  to the list of kex algorithms */
++    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com to the list of kex algorithms */
+     kex = client->methods[SSH_KEX];
+     len = strlen(kex);
+-    if (len + strlen(KEX_EXTENSION_CLIENT) + 2 < len) {
++    /* Comma, comma, nul byte */
++    kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 + strlen(KEX_STRICT_CLIENT ) + 1;
++    if (kex_len >= MAX_PACKET_LEN) {
+         /* Overflow */
+         return SSH_ERROR;
+     }
+-    kex_len = len + strlen(KEX_EXTENSION_CLIENT) + 2; /* comma, NULL */
+     kex_tmp = realloc(kex, kex_len);
+     if (kex_tmp == NULL) {
+-        free(kex);
+         ssh_set_error_oom(session);
+         return SSH_ERROR;
+     }
+-    snprintf(kex_tmp + len, kex_len - len, ",%s", KEX_EXTENSION_CLIENT);
++    snprintf(kex_tmp + len, kex_len - len, ",%s,%s", KEX_EXTENSION_CLIENT, KEX_STRICT_CLIENT);
+     client->methods[SSH_KEX] = kex_tmp;
+ 
+     return SSH_OK;
+diff --git a/src/packet.c b/src/packet.c
+index 61a44237..8025a7ff 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -1126,6 +1126,19 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
+             }
+ #endif /* WITH_ZLIB */
+             payloadsize = ssh_buffer_get_len(session->in_buffer);
++	    if (session->recv_seq == UINT32_MAX) {
++		/* Overflowing sequence numbers is always fishy */
++		if (session->current_crypto == NULL) {
++		    /* don't allow sequence number overflow when unencrypted */
++		    ssh_set_error(session,
++				  SSH_FATAL,
++				  "Incoming sequence number overflow");
++		    goto error;
++		} else {
++		    SSH_LOG(SSH_LOG_WARNING,
++			    "Incoming sequence number overflow");
++		}
++	    }
+             session->recv_seq++;
+             if (session->raw_counter != NULL) {
+                 session->raw_counter->in_bytes += payloadsize;
+@@ -1141,7 +1154,19 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
+             SSH_LOG(SSH_LOG_PACKET,
+                     "packet: read type %hhd [len=%d,padding=%hhd,comp=%d,payload=%d]",
+                     session->in_packet.type, packet_len, padding, compsize, payloadsize);
+-
++	    if (session->current_crypto == NULL) {
++		/* In strict kex, only a few packets are allowed. Taint the session
++		 * if we received packets that are normally allowed but to be
++		 * refused if we are in strict kex when KEX is over.
++		 */
++		uint8_t type = session->in_packet.type;
++
++		if (type != SSH2_MSG_KEXINIT && type != SSH2_MSG_NEWKEYS &&
++		    (type < SSH2_MSG_KEXDH_INIT ||
++		     type > SSH2_MSG_KEX_DH_GEX_REQUEST)) {
++		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
++		}
++	    }
+             /* Check if the packet is expected */
+             filter_result = ssh_packet_incoming_filter(session);
+ 
+@@ -1153,6 +1178,9 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
+             case SSH_PACKET_DENIED:
+                 goto error;
+             case SSH_PACKET_UNKNOWN:
++		if (session->current_crypto == NULL) {
++		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
++		}
+                 ssh_packet_send_unimplemented(session, session->recv_seq - 1);
+                 break;
+             }
+@@ -1276,9 +1304,35 @@ void ssh_packet_process(ssh_session session, uint8_t type){
+ 	if(r==SSH_PACKET_NOT_USED){
+ 		SSH_LOG(SSH_LOG_RARE,"Couldn't do anything with packet type %d",type);
+ 		ssh_packet_send_unimplemented(session, session->recv_seq-1);
++		if (session->current_crypto == NULL) {
++		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
++		}
+ 	}
+ }
+ 
++/** @internal
++ * @brief sends a SSH_MSG_NEWKEYS when enabling the new negotiated ciphers
++ * @param session the SSH session
++ * @return SSH_ERROR on error, else SSH_OK
++ */
++int ssh_packet_send_newkeys(ssh_session session)
++{
++    int rc;
++
++    /* Send the MSG_NEWKEYS */
++    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
++    if (rc < 0) {
++	return rc;
++    }
++
++    rc = ssh_packet_send(session);
++    if (rc == SSH_ERROR) {
++	return rc;
++    }
++    SSH_LOG(SSH_LOG_DEBUG, "SSH_MSG_NEWKEYS sent");
++    return rc;
++}
++
+ /** @internal
+  * @brief sends a SSH_MSG_UNIMPLEMENTED answer to an unhandled packet
+  * @param session the SSH session
+diff --git a/src/packet_cb.c b/src/packet_cb.c
+index 6aa64766..de03fb07 100644
+--- a/src/packet_cb.c
++++ b/src/packet_cb.c
+@@ -154,6 +154,18 @@ SSH_PACKET_CALLBACK(ssh_packet_newkeys){
+       goto error;
+   }
+ 
++  if (session->flags & SSH_SESSION_FLAG_KEX_STRICT) {
++      /* reset packet sequence number when running in strict kex mode */
++      session->recv_seq = 0;
++      /* Check that we aren't tainted */
++      if (session->flags & SSH_SESSION_FLAG_KEX_TAINTED) {
++	  ssh_set_error(session,
++			SSH_FATAL,
++			"Received unexpected packets in strict KEX mode.");
++	  goto error;
++      }
++}
++
+   if(session->server){
+     /* server things are done in server.c */
+     session->dh_handshake_state=DH_STATE_FINISHED;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
new file mode 100644
index 000000000..fe3300503
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
@@ -0,0 +1,126 @@
+From 0870c8db28be9eb457ee3d4f9a168959d9507efd Mon Sep 17 00:00:00 2001
+From: Aris Adamantiadis <aris@0xbadc0de.be>
+Date: Tue, 12 Dec 2023 23:30:26 +0100
+Subject: [PATCH] CVE-2023-48795: Server side mitigations
+
+Signed-off-by: Aris Adamantiadis <aris@0xbadc0de.be>
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/0870c8db28be9eb457ee3d4f9a168959d9507efd]
+CVE: CVE-2023-48795
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/libssh/kex.h |  1 +
+ src/kex.c            | 46 ++++++++++++++++++++++++++++++++++----------
+ src/server.c         |  8 +++++++-
+ 3 files changed, 44 insertions(+), 11 deletions(-)
+
+diff --git a/include/libssh/kex.h b/include/libssh/kex.h
+index a626d105..2b1a74d5 100644
+--- a/include/libssh/kex.h
++++ b/include/libssh/kex.h
+@@ -36,6 +36,7 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit);
+ int ssh_send_kex(ssh_session session, int server_kex);
+ void ssh_list_kex(struct ssh_kex_struct *kex);
+ int ssh_set_client_kex(ssh_session session);
++int ssh_kex_append_extensions(ssh_session session, struct ssh_kex_struct *pkex);
+ int ssh_kex_select_methods(ssh_session session);
+ int ssh_verify_existing_algo(enum ssh_kex_types_e algo, const char *name);
+ char *ssh_keep_known_algos(enum ssh_kex_types_e algo, const char *list);
+diff --git a/src/kex.c b/src/kex.c
+index 2ed90235..b03e6484 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -766,11 +766,8 @@ int ssh_set_client_kex(ssh_session session)
+ {
+     struct ssh_kex_struct *client= &session->next_crypto->client_kex;
+     const char *wanted;
+-    char *kex = NULL;
+-    char *kex_tmp = NULL;
+     int ok;
+     int i;
+-    size_t kex_len, len;
+ 
+     ok = ssh_get_random(client->cookie, 16, 0);
+     if (!ok) {
+@@ -802,11 +799,33 @@ int ssh_set_client_kex(ssh_session session)
+         return SSH_OK;
+     }
+ 
+-    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com to the list of kex algorithms */
+-    kex = client->methods[SSH_KEX];
++    ok = ssh_kex_append_extensions(session, client);
++    if (ok != SSH_OK){
++	return ok;
++    }
++
++    return SSH_OK;
++}
++
++int ssh_kex_append_extensions(ssh_session session, struct ssh_kex_struct *pkex)
++{
++    char *kex = NULL;
++    char *kex_tmp = NULL;
++    size_t kex_len, len;
++
++    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com for client
++     * and kex-strict-s-v00@openssh.com for server to the list of kex algorithms
++     */
++    kex = pkex->methods[SSH_KEX];
+     len = strlen(kex);
+-    /* Comma, comma, nul byte */
+-    kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 + strlen(KEX_STRICT_CLIENT ) + 1;
++    if (session->server) {
++	/* Comma, nul byte */
++	kex_len = len + 1 + strlen(KEX_STRICT_SERVER) + 1;
++    } else {
++	/* Comma, comma, nul byte */
++	kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 +
++		  strlen(KEX_STRICT_CLIENT) + 1;
++    }
+     if (kex_len >= MAX_PACKET_LEN) {
+         /* Overflow */
+         return SSH_ERROR;
+@@ -816,9 +835,16 @@ int ssh_set_client_kex(ssh_session session)
+         ssh_set_error_oom(session);
+         return SSH_ERROR;
+     }
+-    snprintf(kex_tmp + len, kex_len - len, ",%s,%s", KEX_EXTENSION_CLIENT, KEX_STRICT_CLIENT);
+-    client->methods[SSH_KEX] = kex_tmp;
+-
++    if (session->server){
++	snprintf(kex_tmp + len, kex_len - len, ",%s", KEX_STRICT_SERVER);
++    } else {
++	snprintf(kex_tmp + len,
++		 kex_len - len,
++		 ",%s,%s",
++		 KEX_EXTENSION_CLIENT,
++		 KEX_STRICT_CLIENT);
++    }
++    pkex->methods[SSH_KEX] = kex_tmp;
+     return SSH_OK;
+ }
+ 
+diff --git a/src/server.c b/src/server.c
+index bc98da4f..f3d24a7b 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -158,7 +158,13 @@ static int server_set_kex(ssh_session session) {
+     }
+   }
+ 
+-  return 0;
++  /* Do not append the extensions during rekey */
++  if (session->flags & SSH_SESSION_FLAG_AUTHENTICATED) {
++      return SSH_OK;
++  }
++
++  rc = ssh_kex_append_extensions(session, server);
++  return rc;
+ }
+ 
+ int ssh_server_init_kex(ssh_session session) {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
new file mode 100644
index 000000000..1635a4c2d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
@@ -0,0 +1,47 @@
+From 5846e57538c750c5ce67df887d09fa99861c79c6 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 14 Dec 2023 12:22:01 +0100
+Subject: [PATCH] CVE-2023-48795: Strip extensions from both kex lists for
+ matching
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/5846e57538c750c5ce67df887d09fa99861c79c6]
+CVE: CVE-2023-48795
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/kex.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index b03e6484..c100d908 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -857,11 +857,19 @@ int ssh_kex_select_methods (ssh_session session){
+     char *ext_start = NULL;
+     int i;
+ 
+-    /* Here we should drop the  ext-info-c  from the list so we avoid matching.
++    /* Here we should drop the extensions from the list so we avoid matching.
+      * it. We added it to the end, so we can just truncate the string here */
+-    ext_start = strstr(client->methods[SSH_KEX], ","KEX_EXTENSION_CLIENT);
+-    if (ext_start != NULL) {
+-        ext_start[0] = '\0';
++    if (session->client) {
++	ext_start = strstr(client->methods[SSH_KEX], "," KEX_EXTENSION_CLIENT);
++	if (ext_start != NULL) {
++	    ext_start[0] = '\0';
++	}
++    }
++    if (session->server) {
++	ext_start = strstr(server->methods[SSH_KEX], "," KEX_STRICT_SERVER);
++	if (ext_start != NULL) {
++	    ext_start[0] = '\0';
++	}
+     }
+ 
+     for (i = 0; i < KEX_METHODS_SIZE; i++) {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 061f13912..530dda1f4 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -8,6 +8,9 @@ DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
            file://CVE-2020-16135.patch \
+           file://CVE-2023-48795-1.patch \
+           file://CVE-2023-48795-2.patch \
+           file://CVE-2023-48795-3.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1


