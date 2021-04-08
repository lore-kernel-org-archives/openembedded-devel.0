Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.268.1617899831065971464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B78MSqpc;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2903284otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uq/w+Q4zZWMmiIsVJPT3ypa6DFLhNKqwZfc5DorZkOc=;
        b=B78MSqpcjGk0Ghw6CiEqZIHtFEMA2FfKuthq12g9UIIH/GsWUTQ3LjPSb7aYlAbagk
         wGVqPInOYozggaYah4FJUIpHOB0eorkP/Rkk9p6/xZeK3gk4wNjwZBUrDwMj1Z9LIkMy
         1Wbk4wLVnp5T9YUBuvmOn695YiyUlMXScNECthtDdEVv4zN6FpvMoQWudH3FPhlmG0Sd
         urcGq8/bplashmslzzq4Xm6KpKbdSf2osrcw+VaFUqCWcaSbUzpFJSeyC+O+EXVbwMSV
         fS+H0RJ+5gBQ1RZDmrdR2L1x0/tEychaaDWRaFOhcXjAwCtJZgyMFCpZviP4Gx1xcRPf
         Tqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uq/w+Q4zZWMmiIsVJPT3ypa6DFLhNKqwZfc5DorZkOc=;
        b=XVNkUpNtL+zEk24VUlN+lZeP6U/PyyaDdxxkWt1r07z/ab9t/HmIGqaPHBiKs+9VBr
         fUmseDF9HINZkzE7oqfZlvBpQam+crrxSKninTxgdgSKd78+t5YKJphzopA3MjWH62UF
         lPDxkGTafK6Kt8POs1G0hj9N4ObHSiwCz8LTstc+qHHIKKVjTp0hf5kCsig7qsOOlxgC
         jUU9jX/GKvzv8eROR+u3vXzR6+82klXmWRgL1VUvqxz9LWte/NmkXSb5CZtiqqXBEzrF
         Kyy66OgrjWTYbTQOxe/KbYnrPJCKn3TYzm315uFOjRp/4rO9rruEsutWhd0BqRfxfVrJ
         UDNg==
X-Gm-Message-State: AOAM531RyeCrnWr06urqjisG5u088jHV9+re1opBYmb+sRLGnRacziIW
	YLPqmSQiJrP3iWHJE2b8Fg5QpDSXfpQ=
X-Google-Smtp-Source: ABdhPJzF1lxD3Djrzn6FCKzro8RDoc6VacnVBfm3ueFvGv5MkPCF155/NhirR8H6mqvRSYZ8ya4Hqw==
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr8344972otq.189.1617899830165;
        Thu, 08 Apr 2021 09:37:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 61/64] pidgin-sipe: Fix build with glib-2.0 >= 2.68
Date: Thu,  8 Apr 2021 09:36:08 -0700
Message-Id: <9cce83e9d8d847a1ca81d7ee09a21d364c2e431c.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit ad8c6ba3110ac345bb89ce4f6a1a98aa16502c81)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Migrate-to-use-g_memdup2.patch       | 192 ++++++++++++++++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
new file mode 100644
index 00000000000..4f5c0bd1f6c
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
@@ -0,0 +1,192 @@
+From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 5 Apr 2021 11:36:50 -0700
+Subject: [PATCH] Migrate to use g_memdup2
+
+g_memdup has been deprecated for long and latest glib-2.0 2.68+ has
+turned it int an error to use old function. Add a fall back to
+older versions of GLib, fall back to g_memdup with a #define
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                       |  3 +++
+ src/api/sipe-common.h              |  5 +++++
+ src/core/sip-sec-gssapi.c          |  4 ++--
+ src/core/sip-sec-ntlm.c            | 12 ++++++------
+ src/core/sip-sec-tls-dsk.c         |  4 ++--
+ src/core/sipe-media.c              |  2 +-
+ src/core/sipe-tls-tester.c         |  2 +-
+ src/core/sipe-tls.c                |  4 ++--
+ src/telepathy/telepathy-protocol.c |  2 +-
+ 9 files changed, 23 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2481153..efe01b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test "x$enable_openssl" != xno])
+ dnl check for libxml2
+ PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])
+ 
++# dnl check for g_memdup2 in glib-2.0
++AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS="$GLIB_CFLAGS -DHAVE_G_MEMDUP2=1"])
++
+ dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)
+ AC_MSG_CHECKING([that sizeof(uuid_t) is 16])
+ ac_save_CFLAGS="$CFLAGS"
+diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h
+index c964f15..e114fdc 100644
+--- a/src/api/sipe-common.h
++++ b/src/api/sipe-common.h
+@@ -51,3 +51,8 @@
+ #ifdef _MSC_VER
+ typedef long ssize_t;
+ #endif
++
++#ifndef HAVE_G_MEMDUP2
++#define g_memdup2 g_memdup
++#endif
++
+diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c
+index 873080f..4c63868 100644
+--- a/src/core/sip-sec-gssapi.c
++++ b/src/core/sip-sec-gssapi.c
+@@ -602,7 +602,7 @@ sip_sec_init_sec_context__gssapi(SipSecContext context,
+ 
+ 	out_buff->length = output_token.length;
+ 	if (out_buff->length)
+-		out_buff->value = g_memdup(output_token.value, output_token.length);
++		out_buff->value = g_memdup2(output_token.value, output_token.length);
+ 	else
+ 		/* Special case: empty token */
+ 		out_buff->value = (guint8 *) g_strdup("");
+@@ -653,7 +653,7 @@ sip_sec_make_signature__gssapi(SipSecContext context,
+ 		return FALSE;
+ 	} else {
+ 		signature->length = output_token.length;
+-		signature->value  = g_memdup(output_token.value,
++		signature->value  = g_memdup2(output_token.value,
+ 					     output_token.length);
+ 		gss_release_buffer(&minor, &output_token);
+ 		return TRUE;
+diff --git a/src/core/sip-sec-ntlm.c b/src/core/sip-sec-ntlm.c
+index 2e2354f..1fa4daa 100644
+--- a/src/core/sip-sec-ntlm.c
++++ b/src/core/sip-sec-ntlm.c
+@@ -951,7 +951,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
+ 
+ 	/* server challenge (nonce) */
+ 	if (server_challenge) {
+-		*server_challenge = g_memdup(cmsg->nonce, 8);
++		*server_challenge = g_memdup2(cmsg->nonce, 8);
+ 	}
+ 
+ 	/* flags */
+@@ -984,7 +984,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
+ 			*target_info_len = len;
+ 		}
+ 		if (target_info) {
+-			*target_info = g_memdup(content, len);
++			*target_info = g_memdup2(content, len);
+ 		}
+ 	}
+ }
+@@ -1117,13 +1117,13 @@ sip_sec_ntlm_gen_authenticate(guchar **client_sign_key,
+ 		   Set ServerSigningKey to SIGNKEY(ExportedSessionKey, "Server")
+ 		*/
+ 		SIGNKEY(exported_session_key, TRUE, key);
+-		*client_sign_key = g_memdup(key, 16);
++		*client_sign_key = g_memdup2(key, 16);
+ 		SIGNKEY(exported_session_key, FALSE, key);
+-		*server_sign_key = g_memdup(key, 16);
++		*server_sign_key = g_memdup2(key, 16);
+ 		SEALKEY(neg_flags, exported_session_key, TRUE, key);
+-		*client_seal_key = g_memdup(key, 16);
++		*client_seal_key = g_memdup2(key, 16);
+ 		SEALKEY(neg_flags, exported_session_key, FALSE, key);
+-		*server_seal_key = g_memdup(key, 16);
++		*server_seal_key = g_memdup2(key, 16);
+ 	}
+ 
+ 	/* @TODO: */
+diff --git a/src/core/sip-sec-tls-dsk.c b/src/core/sip-sec-tls-dsk.c
+index 70433ea..2d3f2db 100644
+--- a/src/core/sip-sec-tls-dsk.c
++++ b/src/core/sip-sec-tls-dsk.c
+@@ -88,9 +88,9 @@ sip_sec_init_sec_context__tls_dsk(SipSecContext context,
+ 			/* copy key pair */
+ 			ctx->algorithm  = state->algorithm;
+ 			ctx->key_length = state->key_length;
+-			ctx->client_key = g_memdup(state->client_key,
++			ctx->client_key = g_memdup2(state->client_key,
+ 						   state->key_length);
+-			ctx->server_key = g_memdup(state->server_key,
++			ctx->server_key = g_memdup2(state->server_key,
+ 						   state->key_length);
+ 
+ 			/* extract certicate expiration time */
+diff --git a/src/core/sipe-media.c b/src/core/sipe-media.c
+index e9c4b8a..936e31c 100644
+--- a/src/core/sipe-media.c
++++ b/src/core/sipe-media.c
+@@ -578,7 +578,7 @@ media_stream_to_sdpmedia(struct sipe_media_call_private *call_private,
+ 	// Set our key if encryption is enabled.
+ 	if (stream_private->encryption_key &&
+ 	    encryption_policy != SIPE_ENCRYPTION_POLICY_REJECTED) {
+-		sdpmedia->encryption_key = g_memdup(stream_private->encryption_key,
++		sdpmedia->encryption_key = g_memdup2(stream_private->encryption_key,
+ 						    SIPE_SRTP_KEY_LEN);
+ 		sdpmedia->encryption_key_id = stream_private->encryption_key_id;
+ 	}
+diff --git a/src/core/sipe-tls-tester.c b/src/core/sipe-tls-tester.c
+index e80d715..5fbb5f8 100644
+--- a/src/core/sipe-tls-tester.c
++++ b/src/core/sipe-tls-tester.c
+@@ -155,7 +155,7 @@ static guchar *read_tls_record(int fd,
+ 		printf("received %d bytes from server\n", result);
+ 		record = g_new0(struct record, 1);
+ 		record->length  = result;
+-		record->msg     = g_memdup(buffer, result);
++		record->msg     = g_memdup2(buffer, result);
+ 		length         += result;
+ 		fragments = g_slist_append(fragments, record);
+ 	}
+diff --git a/src/core/sipe-tls.c b/src/core/sipe-tls.c
+index b0235d5..020aedb 100644
+--- a/src/core/sipe-tls.c
++++ b/src/core/sipe-tls.c
+@@ -427,7 +427,7 @@ static guchar *sipe_tls_prf(SIPE_UNUSED_PARAMETER struct tls_internal_state *sta
+ 	gsize half           = (secret_length + 1) / 2;
+ 	gsize newseed_length = label_length + seed_length;
+ 	/* secret: used as S1; secret2: last half of original secret (S2) */
+-	guchar *secret2 = g_memdup(secret + secret_length - half, half);
++	guchar *secret2 = g_memdup2(secret + secret_length - half, half);
+ 	guchar *newseed = g_malloc(newseed_length);
+ 	guchar *md5, *dest;
+ 	guchar *sha1, *src;
+@@ -1525,7 +1525,7 @@ static struct tls_compiled_message *tls_client_key_exchange(struct tls_internal_
+ 
+ 	/* found all the required fields */
+ 	state->server_random.length = server_random->length;
+-	state->server_random.buffer = g_memdup(server_random->data,
++	state->server_random.buffer = g_memdup2(server_random->data,
+ 					       server_random->length);
+ 	tls_calculate_secrets(state);
+ 
+diff --git a/src/telepathy/telepathy-protocol.c b/src/telepathy/telepathy-protocol.c
+index f6e5337..1dde579 100644
+--- a/src/telepathy/telepathy-protocol.c
++++ b/src/telepathy/telepathy-protocol.c
+@@ -237,7 +237,7 @@ static void get_connection_details(SIPE_UNUSED_PARAMETER TpBaseProtocol *self,
+ 			SIPE_TYPE_SEARCH_MANAGER,
+ 			G_TYPE_INVALID
+ 		};
+-		*channel_managers = g_memdup(types, sizeof(types));
++		*channel_managers = g_memdup2(types, sizeof(types));
+ 	}
+ 	if (icon_name)
+ 		*icon_name    = g_strdup("im-" SIPE_TELEPATHY_DOMAIN);
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index f6b4c7cee11..5a96bec90a4 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-sipe-consider-64bit-time_t-when-printing.patch \
            file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
            file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch \
+           file://0001-Migrate-to-use-g_memdup2.patch \
 "
 
 SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
-- 
2.17.1

