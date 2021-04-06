Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.1083.1617744613710082021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 14:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XheurMxr;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id z1so18271240edb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMDK83SUWrIeB+MFh5NDl3y9AVlxbZ/snim3gJWvBlc=;
        b=XheurMxrt0zehmsT3iWSGr5nQ7qPtduhDkzT7zrOG9fg8iaIyqI+M4Gwc1/5HsosFY
         VE04VnQQXaL3aH3M89XXElrR7ePBx9WkXQE79P+ftsfJRhwUJS6pLcjfbKZvf3EN5YDx
         axH7CAf42SlUbUMvonfwRLwK50xlUihIzzUdHxfrqwvPuX+sQMeWngazIUh+CbzVtUhF
         w0H6wgOtTWglCrk4rH3RAtFq96rZjhXAs8spGe7WjGwVcztYnIepbzrR8143kuPS/wfb
         N4HKOG3NHcqFQh0vXKIxYrilGqdemeeeqhI++KIJjv02GdIEF4AzD8giX0Q8SE1IfupW
         5n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMDK83SUWrIeB+MFh5NDl3y9AVlxbZ/snim3gJWvBlc=;
        b=R3lu0KhK2aJKp46FdGb8A3f+UsjWa5hfjOTlAJOj9vFJ8M+MbCGKaNsAU+6pBhM/6H
         7gXQBGSw5oSiWWjP+YYYR+iOhm5fxoJR/LRaH/qhR+A4j4STYdbaJSerBNJSxm5y0dcJ
         jtiL/KQdRLht5dSX0FZw65uxegqP86Ae+cLsu5YXHixZmwAIpUWVZHnfxc5C77Kfqn4u
         2RvI8xPcbQEE9C9H/7d0pIKg2Bh4PdIGHchPft6NYL2SITlu/2WVszIhHksOBIFzuTvR
         LXECtPSUhaDHzzAewzsZlE5ZFXgjjQE6ojvOBJAB9w994ZG+nEKsrXHMto5HgEnIVbIX
         4/aQ==
X-Gm-Message-State: AOAM531isZylqIBS5PAEJ0MKbzXZmWWTPut9nm3MzLNOY5xBPWGGOe8+
	oh1NTFUksWMF8Qd8Dn7hgGFWUvl1JLP7mXhaauM=
X-Google-Smtp-Source: ABdhPJyz/oTDkPESoI0q/1KR7xgUDSuM7UyTyCvmnMmyE8IoXZPkSK9pPtrFDzXh+Y/yk65UV9oW9qACAuTKs6KEg1g=
X-Received: by 2002:a05:6402:1848:: with SMTP id v8mr429368edy.388.1617744612196;
 Tue, 06 Apr 2021 14:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210405184059.3123800-1-raj.khem@gmail.com>
In-Reply-To: <20210405184059.3123800-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 6 Apr 2021 23:30:01 +0200
Message-ID: <CA+chaQeMbwwBX_6ZsDusi+oUkHiL6qd=6GputFK_1nr-qkCOsg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] pidgin-sipe: Fix build with glib-2.0 >= 2.68
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f284e105bf54847f"

--000000000000f284e105bf54847f
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing this, unfortunatelly it isn't backwards compatible with
glib-2.0-1.66.7 currently in oe-core master and hardknott and now fails
with:
| ../../../pidgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19: error:
conflicting types for 'g_memdup'
|    56 | #define g_memdup2 g_memdup
|       |                   ^~~~~~~~

Can we revert this from meta-oe master branch and re-apply it once 1.68
version hits oe-core/master possibly only for honister?

Thanks


On Mon, Apr 5, 2021 at 8:41 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-Migrate-to-use-g_memdup2.patch       | 192 ++++++++++++++++++
>  .../pidgin/pidgin-sipe_1.25.0.bb              |   1 +
>  2 files changed, 193 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>
> diff --git
> a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
> b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
> new file mode 100644
> index 0000000000..4f5c0bd1f6
> --- /dev/null
> +++
> b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
> @@ -0,0 +1,192 @@
> +From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 5 Apr 2021 11:36:50 -0700
> +Subject: [PATCH] Migrate to use g_memdup2
> +
> +g_memdup has been deprecated for long and latest glib-2.0 2.68+ has
> +turned it int an error to use old function. Add a fall back to
> +older versions of GLib, fall back to g_memdup with a #define
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac                       |  3 +++
> + src/api/sipe-common.h              |  5 +++++
> + src/core/sip-sec-gssapi.c          |  4 ++--
> + src/core/sip-sec-ntlm.c            | 12 ++++++------
> + src/core/sip-sec-tls-dsk.c         |  4 ++--
> + src/core/sipe-media.c              |  2 +-
> + src/core/sipe-tls-tester.c         |  2 +-
> + src/core/sipe-tls.c                |  4 ++--
> + src/telepathy/telepathy-protocol.c |  2 +-
> + 9 files changed, 23 insertions(+), 15 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2481153..efe01b4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test "x$enable_openssl"
> != xno])
> + dnl check for libxml2
> + PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])
> +
> ++# dnl check for g_memdup2 in glib-2.0
> ++AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS="$GLIB_CFLAGS
> -DHAVE_G_MEMDUP2=1"])
> ++
> + dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)
> + AC_MSG_CHECKING([that sizeof(uuid_t) is 16])
> + ac_save_CFLAGS="$CFLAGS"
> +diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h
> +index c964f15..e114fdc 100644
> +--- a/src/api/sipe-common.h
> ++++ b/src/api/sipe-common.h
> +@@ -51,3 +51,8 @@
> + #ifdef _MSC_VER
> + typedef long ssize_t;
> + #endif
> ++
> ++#ifndef HAVE_G_MEMDUP2
> ++#define g_memdup2 g_memdup
> ++#endif
> ++
> +diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c
> +index 873080f..4c63868 100644
> +--- a/src/core/sip-sec-gssapi.c
> ++++ b/src/core/sip-sec-gssapi.c
> +@@ -602,7 +602,7 @@ sip_sec_init_sec_context__gssapi(SipSecContext
> context,
> +
> +       out_buff->length = output_token.length;
> +       if (out_buff->length)
> +-              out_buff->value = g_memdup(output_token.value,
> output_token.length);
> ++              out_buff->value = g_memdup2(output_token.value,
> output_token.length);
> +       else
> +               /* Special case: empty token */
> +               out_buff->value = (guint8 *) g_strdup("");
> +@@ -653,7 +653,7 @@ sip_sec_make_signature__gssapi(SipSecContext context,
> +               return FALSE;
> +       } else {
> +               signature->length = output_token.length;
> +-              signature->value  = g_memdup(output_token.value,
> ++              signature->value  = g_memdup2(output_token.value,
> +                                            output_token.length);
> +               gss_release_buffer(&minor, &output_token);
> +               return TRUE;
> +diff --git a/src/core/sip-sec-ntlm.c b/src/core/sip-sec-ntlm.c
> +index 2e2354f..1fa4daa 100644
> +--- a/src/core/sip-sec-ntlm.c
> ++++ b/src/core/sip-sec-ntlm.c
> +@@ -951,7 +951,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
> +
> +       /* server challenge (nonce) */
> +       if (server_challenge) {
> +-              *server_challenge = g_memdup(cmsg->nonce, 8);
> ++              *server_challenge = g_memdup2(cmsg->nonce, 8);
> +       }
> +
> +       /* flags */
> +@@ -984,7 +984,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,
> +                       *target_info_len = len;
> +               }
> +               if (target_info) {
> +-                      *target_info = g_memdup(content, len);
> ++                      *target_info = g_memdup2(content, len);
> +               }
> +       }
> + }
> +@@ -1117,13 +1117,13 @@ sip_sec_ntlm_gen_authenticate(guchar
> **client_sign_key,
> +                  Set ServerSigningKey to SIGNKEY(ExportedSessionKey,
> "Server")
> +               */
> +               SIGNKEY(exported_session_key, TRUE, key);
> +-              *client_sign_key = g_memdup(key, 16);
> ++              *client_sign_key = g_memdup2(key, 16);
> +               SIGNKEY(exported_session_key, FALSE, key);
> +-              *server_sign_key = g_memdup(key, 16);
> ++              *server_sign_key = g_memdup2(key, 16);
> +               SEALKEY(neg_flags, exported_session_key, TRUE, key);
> +-              *client_seal_key = g_memdup(key, 16);
> ++              *client_seal_key = g_memdup2(key, 16);
> +               SEALKEY(neg_flags, exported_session_key, FALSE, key);
> +-              *server_seal_key = g_memdup(key, 16);
> ++              *server_seal_key = g_memdup2(key, 16);
> +       }
> +
> +       /* @TODO: */
> +diff --git a/src/core/sip-sec-tls-dsk.c b/src/core/sip-sec-tls-dsk.c
> +index 70433ea..2d3f2db 100644
> +--- a/src/core/sip-sec-tls-dsk.c
> ++++ b/src/core/sip-sec-tls-dsk.c
> +@@ -88,9 +88,9 @@ sip_sec_init_sec_context__tls_dsk(SipSecContext context,
> +                       /* copy key pair */
> +                       ctx->algorithm  = state->algorithm;
> +                       ctx->key_length = state->key_length;
> +-                      ctx->client_key = g_memdup(state->client_key,
> ++                      ctx->client_key = g_memdup2(state->client_key,
> +                                                  state->key_length);
> +-                      ctx->server_key = g_memdup(state->server_key,
> ++                      ctx->server_key = g_memdup2(state->server_key,
> +                                                  state->key_length);
> +
> +                       /* extract certicate expiration time */
> +diff --git a/src/core/sipe-media.c b/src/core/sipe-media.c
> +index e9c4b8a..936e31c 100644
> +--- a/src/core/sipe-media.c
> ++++ b/src/core/sipe-media.c
> +@@ -578,7 +578,7 @@ media_stream_to_sdpmedia(struct
> sipe_media_call_private *call_private,
> +       // Set our key if encryption is enabled.
> +       if (stream_private->encryption_key &&
> +           encryption_policy != SIPE_ENCRYPTION_POLICY_REJECTED) {
> +-              sdpmedia->encryption_key =
> g_memdup(stream_private->encryption_key,
> ++              sdpmedia->encryption_key =
> g_memdup2(stream_private->encryption_key,
> +                                                   SIPE_SRTP_KEY_LEN);
> +               sdpmedia->encryption_key_id =
> stream_private->encryption_key_id;
> +       }
> +diff --git a/src/core/sipe-tls-tester.c b/src/core/sipe-tls-tester.c
> +index e80d715..5fbb5f8 100644
> +--- a/src/core/sipe-tls-tester.c
> ++++ b/src/core/sipe-tls-tester.c
> +@@ -155,7 +155,7 @@ static guchar *read_tls_record(int fd,
> +               printf("received %d bytes from server\n", result);
> +               record = g_new0(struct record, 1);
> +               record->length  = result;
> +-              record->msg     = g_memdup(buffer, result);
> ++              record->msg     = g_memdup2(buffer, result);
> +               length         += result;
> +               fragments = g_slist_append(fragments, record);
> +       }
> +diff --git a/src/core/sipe-tls.c b/src/core/sipe-tls.c
> +index b0235d5..020aedb 100644
> +--- a/src/core/sipe-tls.c
> ++++ b/src/core/sipe-tls.c
> +@@ -427,7 +427,7 @@ static guchar *sipe_tls_prf(SIPE_UNUSED_PARAMETER
> struct tls_internal_state *sta
> +       gsize half           = (secret_length + 1) / 2;
> +       gsize newseed_length = label_length + seed_length;
> +       /* secret: used as S1; secret2: last half of original secret (S2)
> */
> +-      guchar *secret2 = g_memdup(secret + secret_length - half, half);
> ++      guchar *secret2 = g_memdup2(secret + secret_length - half, half);
> +       guchar *newseed = g_malloc(newseed_length);
> +       guchar *md5, *dest;
> +       guchar *sha1, *src;
> +@@ -1525,7 +1525,7 @@ static struct tls_compiled_message
> *tls_client_key_exchange(struct tls_internal_
> +
> +       /* found all the required fields */
> +       state->server_random.length = server_random->length;
> +-      state->server_random.buffer = g_memdup(server_random->data,
> ++      state->server_random.buffer = g_memdup2(server_random->data,
> +                                              server_random->length);
> +       tls_calculate_secrets(state);
> +
> +diff --git a/src/telepathy/telepathy-protocol.c
> b/src/telepathy/telepathy-protocol.c
> +index f6e5337..1dde579 100644
> +--- a/src/telepathy/telepathy-protocol.c
> ++++ b/src/telepathy/telepathy-protocol.c
> +@@ -237,7 +237,7 @@ static void
> get_connection_details(SIPE_UNUSED_PARAMETER TpBaseProtocol *self,
> +                       SIPE_TYPE_SEARCH_MANAGER,
> +                       G_TYPE_INVALID
> +               };
> +-              *channel_managers = g_memdup(types, sizeof(types));
> ++              *channel_managers = g_memdup2(types, sizeof(types));
> +       }
> +       if (icon_name)
> +               *icon_name    = g_strdup("im-" SIPE_TELEPATHY_DOMAIN);
> +--
> +2.31.1
> +
> diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> index f6b4c7cee1..5a96bec90a 100644
> --- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> @@ -11,6 +11,7 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
>             file://0001-sipe-consider-64bit-time_t-when-printing.patch \
>
> file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
>
> file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch \
> +           file://0001-Migrate-to-use-g_memdup2.patch \
>  "
>
>  SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
> --
> 2.31.1
>
>

--000000000000f284e105bf54847f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for fixing this, unfortunatelly it=
 isn&#39;t backwards compatible with glib-2.0-1.66.7 currently in oe-core m=
aster and hardknott and now fails with:</div><div dir=3D"ltr">| ../../../pi=
dgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19: error: conflicting =
types for &#39;g_memdup&#39;<br>| =C2=A0 =C2=A056 | #define g_memdup2 g_mem=
dup<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br></div><div dir=3D"ltr"><br></div><div>Can =
we revert this from meta-oe master branch and re-apply it once 1.68 version=
 hits oe-core/master possibly only for honister?</div><div><br></div><div>T=
hanks</div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 8:41 PM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Migrate-to-use-g_memdup2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
92 ++++++++++++++++++<br>
=C2=A0.../pidgin/<a href=3D"http://pidgin-sipe_1.25.0.bb" rel=3D"noreferrer=
" target=3D"_blank">pidgin-sipe_1.25.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 193 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Mi=
grate-to-use-g_memdup2.patch<br>
<br>
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use=
-g_memdup2.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-=
to-use-g_memdup2.patch<br>
new file mode 100644<br>
index 0000000000..4f5c0bd1f6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memd=
up2.patch<br>
@@ -0,0 +1,192 @@<br>
+From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Mon, 5 Apr 2021 11:36:50 -0700<br>
+Subject: [PATCH] Migrate to use g_memdup2<br>
+<br>
+g_memdup has been deprecated for long and latest glib-2.0 2.68+ has<br>
+turned it int an error to use old function. Add a fall back to<br>
+older versions of GLib, fall back to g_memdup with a #define<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
+ src/api/sipe-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 +++++<br>
+ src/core/sip-sec-gssapi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++-=
-<br>
+ src/core/sip-sec-ntlm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++=
+++------<br>
+ src/core/sip-sec-tls-dsk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
+ src/core/sipe-media.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ src/core/sipe-tls-tester.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
+ src/core/sipe-tls.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 ++--<br>
+ src/telepathy/telepathy-protocol.c |=C2=A0 2 +-<br>
+ 9 files changed, 23 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 2481153..efe01b4 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test &quot;x$enable_open=
ssl&quot; !=3D xno])<br>
+ dnl check for libxml2<br>
+ PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])<br>
+ <br>
++# dnl check for g_memdup2 in glib-2.0<br>
++AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS=3D&quot;$GLIB_CFLAGS -DHAV=
E_G_MEMDUP2=3D1&quot;])<br>
++<br>
+ dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)<br>
+ AC_MSG_CHECKING([that sizeof(uuid_t) is 16])<br>
+ ac_save_CFLAGS=3D&quot;$CFLAGS&quot;<br>
+diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h<br>
+index c964f15..e114fdc 100644<br>
+--- a/src/api/sipe-common.h<br>
++++ b/src/api/sipe-common.h<br>
+@@ -51,3 +51,8 @@<br>
+ #ifdef _MSC_VER<br>
+ typedef long ssize_t;<br>
+ #endif<br>
++<br>
++#ifndef HAVE_G_MEMDUP2<br>
++#define g_memdup2 g_memdup<br>
++#endif<br>
++<br>
+diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c<br>
+index 873080f..4c63868 100644<br>
+--- a/src/core/sip-sec-gssapi.c<br>
++++ b/src/core/sip-sec-gssapi.c<br>
+@@ -602,7 +602,7 @@ sip_sec_init_sec_context__gssapi(SipSecContext context=
,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0out_buff-&gt;length =3D output_token.length;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (out_buff-&gt;length)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_buff-&gt;value =3D g=
_memdup(output_token.value, output_token.length);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_buff-&gt;value =3D g=
_memdup2(output_token.value, output_token.length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Special case: em=
pty token */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_buff-&gt;value =
=3D (guint8 *) g_strdup(&quot;&quot;);<br>
+@@ -653,7 +653,7 @@ sip_sec_make_signature__gssapi(SipSecContext context,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signature-&gt;lengt=
h =3D output_token.length;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signature-&gt;value=C2=
=A0 =3D g_memdup(output_token.value,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signature-&gt;value=C2=
=A0 =3D g_memdup2(output_token.value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 output_token.length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gss_release_buffer(=
&amp;minor, &amp;output_token);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
+diff --git a/src/core/sip-sec-ntlm.c b/src/core/sip-sec-ntlm.c<br>
+index 2e2354f..1fa4daa 100644<br>
+--- a/src/core/sip-sec-ntlm.c<br>
++++ b/src/core/sip-sec-ntlm.c<br>
+@@ -951,7 +951,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* server challenge (nonce) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (server_challenge) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_challenge =3D g_=
memdup(cmsg-&gt;nonce, 8);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_challenge =3D g_=
memdup2(cmsg-&gt;nonce, 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* flags */<br>
+@@ -984,7 +984,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_buff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*target_info_len =3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (target_info) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *target_info =3D g_memdup(content, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *target_info =3D g_memdup2(content, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+@@ -1117,13 +1117,13 @@ sip_sec_ntlm_gen_authenticate(guchar **client_sign=
_key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Set ServerS=
igningKey to SIGNKEY(ExportedSessionKey, &quot;Server&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIGNKEY(exported_se=
ssion_key, TRUE, key);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *client_sign_key =3D g_m=
emdup(key, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *client_sign_key =3D g_m=
emdup2(key, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIGNKEY(exported_se=
ssion_key, FALSE, key);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_sign_key =3D g_m=
emdup(key, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_sign_key =3D g_m=
emdup2(key, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SEALKEY(neg_flags, =
exported_session_key, TRUE, key);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *client_seal_key =3D g_m=
emdup(key, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *client_seal_key =3D g_m=
emdup2(key, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SEALKEY(neg_flags, =
exported_session_key, FALSE, key);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_seal_key =3D g_m=
emdup(key, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *server_seal_key =3D g_m=
emdup2(key, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* @TODO: */<br>
+diff --git a/src/core/sip-sec-tls-dsk.c b/src/core/sip-sec-tls-dsk.c<br>
+index 70433ea..2d3f2db 100644<br>
+--- a/src/core/sip-sec-tls-dsk.c<br>
++++ b/src/core/sip-sec-tls-dsk.c<br>
+@@ -88,9 +88,9 @@ sip_sec_init_sec_context__tls_dsk(SipSecContext context,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* copy key pair */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctx-&gt;algorithm=C2=A0 =3D state-&gt;algorithm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctx-&gt;key_length =3D state-&gt;key_length;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;client_key =3D g_memdup(state-&gt;client_key,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;client_key =3D g_memdup2(state-&gt;client_key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;key_length);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;server_key =3D g_memdup(state-&gt;server_key,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;server_key =3D g_memdup2(state-&gt;server_key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;key_length);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* extract certicate expiration time */<br>
+diff --git a/src/core/sipe-media.c b/src/core/sipe-media.c<br>
+index e9c4b8a..936e31c 100644<br>
+--- a/src/core/sipe-media.c<br>
++++ b/src/core/sipe-media.c<br>
+@@ -578,7 +578,7 @@ media_stream_to_sdpmedia(struct sipe_media_call_privat=
e *call_private,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Set our key if encryption is enabled.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream_private-&gt;encryption_key &amp;&amp=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encryption_policy !=3D SIPE_ENCRY=
PTION_POLICY_REJECTED) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdpmedia-&gt;encryption_=
key =3D g_memdup(stream_private-&gt;encryption_key,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdpmedia-&gt;encryption_=
key =3D g_memdup2(stream_private-&gt;encryption_key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIPE_SRTP_KEY_LEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdpmedia-&gt;encryp=
tion_key_id =3D stream_private-&gt;encryption_key_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/core/sipe-tls-tester.c b/src/core/sipe-tls-tester.c<br>
+index e80d715..5fbb5f8 100644<br>
+--- a/src/core/sipe-tls-tester.c<br>
++++ b/src/core/sipe-tls-tester.c<br>
+@@ -155,7 +155,7 @@ static guchar *read_tls_record(int fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;receiv=
ed %d bytes from server\n&quot;, result);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0record =3D g_new0(s=
truct record, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0record-&gt;length=
=C2=A0 =3D result;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 record-&gt;msg=C2=A0 =C2=
=A0 =C2=A0=3D g_memdup(buffer, result);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 record-&gt;msg=C2=A0 =C2=
=A0 =C2=A0=3D g_memdup2(buffer, result);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0length=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0+=3D result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fragments =3D g_sli=
st_append(fragments, record);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/core/sipe-tls.c b/src/core/sipe-tls.c<br>
+index b0235d5..020aedb 100644<br>
+--- a/src/core/sipe-tls.c<br>
++++ b/src/core/sipe-tls.c<br>
+@@ -427,7 +427,7 @@ static guchar *sipe_tls_prf(SIPE_UNUSED_PARAMETER stru=
ct tls_internal_state *sta<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gsize half=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D (secret_length + 1) / 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gsize newseed_length =3D label_length + seed_le=
ngth;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* secret: used as S1; secret2: last half of or=
iginal secret (S2) */<br>
+-=C2=A0 =C2=A0 =C2=A0 guchar *secret2 =3D g_memdup(secret + secret_length =
- half, half);<br>
++=C2=A0 =C2=A0 =C2=A0 guchar *secret2 =3D g_memdup2(secret + secret_length=
 - half, half);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *newseed =3D g_malloc(newseed_length);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *md5, *dest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *sha1, *src;<br>
+@@ -1525,7 +1525,7 @@ static struct tls_compiled_message *tls_client_key_e=
xchange(struct tls_internal_<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* found all the required fields */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;server_random.length =3D server_rando=
m-&gt;length;<br>
+-=C2=A0 =C2=A0 =C2=A0 state-&gt;server_random.buffer =3D g_memdup(server_r=
andom-&gt;data,<br>
++=C2=A0 =C2=A0 =C2=A0 state-&gt;server_random.buffer =3D g_memdup2(server_=
random-&gt;data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 server_random-&gt;length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tls_calculate_secrets(state);<br>
+ <br>
+diff --git a/src/telepathy/telepathy-protocol.c b/src/telepathy/telepathy-=
protocol.c<br>
+index f6e5337..1dde579 100644<br>
+--- a/src/telepathy/telepathy-protocol.c<br>
++++ b/src/telepathy/telepathy-protocol.c<br>
+@@ -237,7 +237,7 @@ static void get_connection_details(SIPE_UNUSED_PARAMET=
ER TpBaseProtocol *self,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SIPE_TYPE_SEARCH_MANAGER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0G_TYPE_INVALID<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *channel_managers =3D g_=
memdup(types, sizeof(types));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *channel_managers =3D g_=
memdup2(types, sizeof(types));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (icon_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*icon_name=C2=A0 =
=C2=A0 =3D g_strdup(&quot;im-&quot; SIPE_TELEPATHY_DOMAIN);<br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin-sipe_1=
.25.0.bb" rel=3D"noreferrer" target=3D"_blank">pidgin-sipe_1.25.0.bb</a> b/=
meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin-sipe_1.25.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pidgin-sipe_1.25.0.bb</a><br>
index f6b4c7cee1..5a96bec90a 100644<br>
--- a/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin-sipe_1.25.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pidgin-sipe_1.25.0.bb</a><br>
+++ b/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin-sipe_1.25.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pidgin-sipe_1.25.0.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-=
${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-sipe-consider-64bit-t=
ime_t-when-printing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Align-structs-casts-w=
ith-time_t-elements-to-8byte-bo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Do-not-add-=
native-paths-to-pkgconfig-searc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Migrate-to-use-g_memd=
up2.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;0e742f021dc8c3f17435aea05c3e0314&quot;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000f284e105bf54847f--
