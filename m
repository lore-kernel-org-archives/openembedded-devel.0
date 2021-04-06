Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1278.1617745566716012354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JJ71R5d9;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id i190so3146775pfc.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rF5Ggya88s1c3fSJSwn4/3kxACUoEtz/LoZZuvEoJmg=;
        b=JJ71R5d9GucD+0Op4K7QEecdmdPqXgmBqmcCx7990vu6Y0eaEhVLtRB8s5SjODEV4/
         gU8Q602Er2xzdYsskCcA45WALlpkUClRuBpNQDoDxcbOHfKhwTRgTnDGFuH6vkRmI2BG
         M+1Ir2q7sunLN2e4tGcRoc9NAX8zZ0815DKqe+bMbFgO56ZbZfbC8XRBaF/9SLmi6QLm
         uen0uT2T2Zd4ag6L8gXA34YzBeo/KGAx7uFS8O/wGdS9wGol/KWOy/DhP92/NcopFbg7
         +IUL2XQP4SK1grK6+bwQ6laNgCVcgiyJ3kuVTa0KcpZSuUflszdsmHhpig81cd8Q49+Z
         BzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rF5Ggya88s1c3fSJSwn4/3kxACUoEtz/LoZZuvEoJmg=;
        b=GyQp87rA5cZ8qYVyhEBYfx7AzSKmZLUuRGP4oNJfeL4TnPA5MSECD57MQ1oU6A3k3V
         1dl1zKB8zJulYij28rpas1ew9mTATxnhY5JMhtHGbjMFzaqG+yjBYc2x1qC2Sw9/furn
         sz7EfR0rzzGZlLx6GLH/gfB6C/F5FXXVdUqzny+0MZmEt1Nr8GBBBrKOMp5FkyZmViZN
         hxh9yPeT07kNNis18Dk7ml6ygLYAydbYrfOeHx93gRZQkxAbzlyItUdz25q/E3JYWVF7
         bOwLPVD4dqlFkgy+v67JcL3bt4DSnEkF+Ui+NIcxRySD40xtI3q9O2kBpdoCzjybw8HU
         qLUA==
X-Gm-Message-State: AOAM532i3DZ+mMVK2IXi0MPg5GFG0deIEmCqu2AVo/aQUM0I3pQF4Pzs
	K/NNf3OCiG6x4VU2QztT6tMTWI3mjb/79A==
X-Google-Smtp-Source: ABdhPJwTYg/NgHXbCgGGWLjYGo0Haf865K03S8GG8vwSduSJCcbJjt+YCLGkVnBJFlL/fncVPRlXgA==
X-Received: by 2002:a65:4c0c:: with SMTP id u12mr223796pgq.122.1617745565708;
        Tue, 06 Apr 2021 14:46:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6? ([2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6])
        by smtp.gmail.com with ESMTPSA id b140sm20120835pfb.98.2021.04.06.14.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 14:46:05 -0700 (PDT)
Subject: Re: [meta-oe][PATCH] pidgin-sipe: Fix build with glib-2.0 >= 2.68
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210405184059.3123800-1-raj.khem@gmail.com>
 <CA+chaQeMbwwBX_6ZsDusi+oUkHiL6qd=6GputFK_1nr-qkCOsg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <82b4d1c6-3c69-3218-dad8-82f7d8dca622@gmail.com>
Date: Tue, 6 Apr 2021 14:46:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeMbwwBX_6ZsDusi+oUkHiL6qd=6GputFK_1nr-qkCOsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/6/21 2:30 PM, Martin Jansa wrote:
> Thanks for fixing this, unfortunatelly it isn't backwards compatible 
> with glib-2.0-1.66.7 currently in oe-core master and hardknott and now 
> fails with:
> | ../../../pidgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19: 
> error: conflicting types for 'g_memdup'
> |    56 | #define g_memdup2 g_memdup
> |       |                   ^~~~~~~~
> 
> Can we revert this from meta-oe master branch and re-apply it once 1.68 
> version hits oe-core/master possibly only for honister?
> 

one point of the fix was to keep it working with older releases, I just 
realized that the build I did on AB did not really build with master but 
with master-next. anyway now you have it reproduced can you try 
reversing the define to

#define g_memdup g_memdup2


and see if that helps ?

> Thanks
> 
> 
> On Mon, Apr 5, 2021 at 8:41 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     Cc: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     ---
>       .../0001-Migrate-to-use-g_memdup2.patch       | 192 ++++++++++++++++++
>       .../pidgin/pidgin-sipe_1.25.0.bb <http://pidgin-sipe_1.25.0.bb>   
>                |   1 +
>       2 files changed, 193 insertions(+)
>       create mode 100644
>     meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
> 
>     diff --git
>     a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>     b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>     new file mode 100644
>     index 0000000000..4f5c0bd1f6
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>     @@ -0,0 +1,192 @@
>     +From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 2001
>     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     +Date: Mon, 5 Apr 2021 11:36:50 -0700
>     +Subject: [PATCH] Migrate to use g_memdup2
>     +
>     +g_memdup has been deprecated for long and latest glib-2.0 2.68+ has
>     +turned it int an error to use old function. Add a fall back to
>     +older versions of GLib, fall back to g_memdup with a #define
>     +
>     +Upstream-Status: Pending
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>     + configure.ac <http://configure.ac>                       |  3 +++
>     + src/api/sipe-common.h              |  5 +++++
>     + src/core/sip-sec-gssapi.c          |  4 ++--
>     + src/core/sip-sec-ntlm.c            | 12 ++++++------
>     + src/core/sip-sec-tls-dsk.c         |  4 ++--
>     + src/core/sipe-media.c              |  2 +-
>     + src/core/sipe-tls-tester.c         |  2 +-
>     + src/core/sipe-tls.c                |  4 ++--
>     + src/telepathy/telepathy-protocol.c |  2 +-
>     + 9 files changed, 23 insertions(+), 15 deletions(-)
>     +
>     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     +index 2481153..efe01b4 100644
>     +--- a/configure.ac <http://configure.ac>
>     ++++ b/configure.ac <http://configure.ac>
>     +@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test
>     "x$enable_openssl" != xno])
>     + dnl check for libxml2
>     + PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])
>     +
>     ++# dnl check for g_memdup2 in glib-2.0
>     ++AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS="$GLIB_CFLAGS
>     -DHAVE_G_MEMDUP2=1"])
>     ++
>     + dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)
>     + AC_MSG_CHECKING([that sizeof(uuid_t) is 16])
>     + ac_save_CFLAGS="$CFLAGS"
>     +diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h
>     +index c964f15..e114fdc 100644
>     +--- a/src/api/sipe-common.h
>     ++++ b/src/api/sipe-common.h
>     +@@ -51,3 +51,8 @@
>     + #ifdef _MSC_VER
>     + typedef long ssize_t;
>     + #endif
>     ++
>     ++#ifndef HAVE_G_MEMDUP2
>     ++#define g_memdup2 g_memdup
>     ++#endif
>     ++
>     +diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c
>     +index 873080f..4c63868 100644
>     +--- a/src/core/sip-sec-gssapi.c
>     ++++ b/src/core/sip-sec-gssapi.c
>     +@@ -602,7 +602,7 @@ sip_sec_init_sec_context__gssapi(SipSecContext
>     context,
>     +
>     +       out_buff->length = output_token.length;
>     +       if (out_buff->length)
>     +-              out_buff->value = g_memdup(output_token.value,
>     output_token.length);
>     ++              out_buff->value = g_memdup2(output_token.value,
>     output_token.length);
>     +       else
>     +               /* Special case: empty token */
>     +               out_buff->value = (guint8 *) g_strdup("");
>     +@@ -653,7 +653,7 @@ sip_sec_make_signature__gssapi(SipSecContext
>     context,
>     +               return FALSE;
>     +       } else {
>     +               signature->length = output_token.length;
>     +-              signature->value  = g_memdup(output_token.value,
>     ++              signature->value  = g_memdup2(output_token.value,
>     +                                            output_token.length);
>     +               gss_release_buffer(&minor, &output_token);
>     +               return TRUE;
>     +diff --git a/src/core/sip-sec-ntlm.c b/src/core/sip-sec-ntlm.c
>     +index 2e2354f..1fa4daa 100644
>     +--- a/src/core/sip-sec-ntlm.c
>     ++++ b/src/core/sip-sec-ntlm.c
>     +@@ -951,7 +951,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
>     +
>     +       /* server challenge (nonce) */
>     +       if (server_challenge) {
>     +-              *server_challenge = g_memdup(cmsg->nonce, 8);
>     ++              *server_challenge = g_memdup2(cmsg->nonce, 8);
>     +       }
>     +
>     +       /* flags */
>     +@@ -984,7 +984,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
>     +                       *target_info_len = len;
>     +               }
>     +               if (target_info) {
>     +-                      *target_info = g_memdup(content, len);
>     ++                      *target_info = g_memdup2(content, len);
>     +               }
>     +       }
>     + }
>     +@@ -1117,13 +1117,13 @@ sip_sec_ntlm_gen_authenticate(guchar
>     **client_sign_key,
>     +                  Set ServerSigningKey to
>     SIGNKEY(ExportedSessionKey, "Server")
>     +               */
>     +               SIGNKEY(exported_session_key, TRUE, key);
>     +-              *client_sign_key = g_memdup(key, 16);
>     ++              *client_sign_key = g_memdup2(key, 16);
>     +               SIGNKEY(exported_session_key, FALSE, key);
>     +-              *server_sign_key = g_memdup(key, 16);
>     ++              *server_sign_key = g_memdup2(key, 16);
>     +               SEALKEY(neg_flags, exported_session_key, TRUE, key);
>     +-              *client_seal_key = g_memdup(key, 16);
>     ++              *client_seal_key = g_memdup2(key, 16);
>     +               SEALKEY(neg_flags, exported_session_key, FALSE, key);
>     +-              *server_seal_key = g_memdup(key, 16);
>     ++              *server_seal_key = g_memdup2(key, 16);
>     +       }
>     +
>     +       /* @TODO: */
>     +diff --git a/src/core/sip-sec-tls-dsk.c b/src/core/sip-sec-tls-dsk.c
>     +index 70433ea..2d3f2db 100644
>     +--- a/src/core/sip-sec-tls-dsk.c
>     ++++ b/src/core/sip-sec-tls-dsk.c
>     +@@ -88,9 +88,9 @@ sip_sec_init_sec_context__tls_dsk(SipSecContext
>     context,
>     +                       /* copy key pair */
>     +                       ctx->algorithm  = state->algorithm;
>     +                       ctx->key_length = state->key_length;
>     +-                      ctx->client_key = g_memdup(state->client_key,
>     ++                      ctx->client_key = g_memdup2(state->client_key,
>     +                                                  state->key_length);
>     +-                      ctx->server_key = g_memdup(state->server_key,
>     ++                      ctx->server_key = g_memdup2(state->server_key,
>     +                                                  state->key_length);
>     +
>     +                       /* extract certicate expiration time */
>     +diff --git a/src/core/sipe-media.c b/src/core/sipe-media.c
>     +index e9c4b8a..936e31c 100644
>     +--- a/src/core/sipe-media.c
>     ++++ b/src/core/sipe-media.c
>     +@@ -578,7 +578,7 @@ media_stream_to_sdpmedia(struct
>     sipe_media_call_private *call_private,
>     +       // Set our key if encryption is enabled.
>     +       if (stream_private->encryption_key &&
>     +           encryption_policy != SIPE_ENCRYPTION_POLICY_REJECTED) {
>     +-              sdpmedia->encryption_key =
>     g_memdup(stream_private->encryption_key,
>     ++              sdpmedia->encryption_key =
>     g_memdup2(stream_private->encryption_key,
>     +                                                   SIPE_SRTP_KEY_LEN);
>     +               sdpmedia->encryption_key_id =
>     stream_private->encryption_key_id;
>     +       }
>     +diff --git a/src/core/sipe-tls-tester.c b/src/core/sipe-tls-tester.c
>     +index e80d715..5fbb5f8 100644
>     +--- a/src/core/sipe-tls-tester.c
>     ++++ b/src/core/sipe-tls-tester.c
>     +@@ -155,7 +155,7 @@ static guchar *read_tls_record(int fd,
>     +               printf("received %d bytes from server\n", result);
>     +               record = g_new0(struct record, 1);
>     +               record->length  = result;
>     +-              record->msg     = g_memdup(buffer, result);
>     ++              record->msg     = g_memdup2(buffer, result);
>     +               length         += result;
>     +               fragments = g_slist_append(fragments, record);
>     +       }
>     +diff --git a/src/core/sipe-tls.c b/src/core/sipe-tls.c
>     +index b0235d5..020aedb 100644
>     +--- a/src/core/sipe-tls.c
>     ++++ b/src/core/sipe-tls.c
>     +@@ -427,7 +427,7 @@ static guchar
>     *sipe_tls_prf(SIPE_UNUSED_PARAMETER struct tls_internal_state *sta
>     +       gsize half           = (secret_length + 1) / 2;
>     +       gsize newseed_length = label_length + seed_length;
>     +       /* secret: used as S1; secret2: last half of original secret
>     (S2) */
>     +-      guchar *secret2 = g_memdup(secret + secret_length - half, half);
>     ++      guchar *secret2 = g_memdup2(secret + secret_length - half,
>     half);
>     +       guchar *newseed = g_malloc(newseed_length);
>     +       guchar *md5, *dest;
>     +       guchar *sha1, *src;
>     +@@ -1525,7 +1525,7 @@ static struct tls_compiled_message
>     *tls_client_key_exchange(struct tls_internal_
>     +
>     +       /* found all the required fields */
>     +       state->server_random.length = server_random->length;
>     +-      state->server_random.buffer = g_memdup(server_random->data,
>     ++      state->server_random.buffer = g_memdup2(server_random->data,
>     +                                              server_random->length);
>     +       tls_calculate_secrets(state);
>     +
>     +diff --git a/src/telepathy/telepathy-protocol.c
>     b/src/telepathy/telepathy-protocol.c
>     +index f6e5337..1dde579 100644
>     +--- a/src/telepathy/telepathy-protocol.c
>     ++++ b/src/telepathy/telepathy-protocol.c
>     +@@ -237,7 +237,7 @@ static void
>     get_connection_details(SIPE_UNUSED_PARAMETER TpBaseProtocol *self,
>     +                       SIPE_TYPE_SEARCH_MANAGER,
>     +                       G_TYPE_INVALID
>     +               };
>     +-              *channel_managers = g_memdup(types, sizeof(types));
>     ++              *channel_managers = g_memdup2(types, sizeof(types));
>     +       }
>     +       if (icon_name)
>     +               *icon_name    = g_strdup("im-" SIPE_TELEPATHY_DOMAIN);
>     +--
>     +2.31.1
>     +
>     diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
>     <http://pidgin-sipe_1.25.0.bb>
>     b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
>     <http://pidgin-sipe_1.25.0.bb>
>     index f6b4c7cee1..5a96bec90a 100644
>     --- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
>     <http://pidgin-sipe_1.25.0.bb>
>     +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
>     <http://pidgin-sipe_1.25.0.bb>
>     @@ -11,6 +11,7 @@ SRC_URI =
>     "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
>                 
>     file://0001-sipe-consider-64bit-time_t-when-printing.patch \
>                 
>     file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
>                 
>     file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch \
>     +           file://0001-Migrate-to-use-g_memdup2.patch \
>       "
> 
>       SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
>     -- 
>     2.31.1
> 
