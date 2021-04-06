Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.1692.1617747347960569448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 15:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b89DU52l;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id hq27so24308113ejc.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SDX6OAWIWPI/rsKZDETAJQY0SzCX0l3xm1KZisYYpVM=;
        b=b89DU52lcqOS50zLluWFOwH13rf/UHH1OaNcMudlXbvY5TIve2sh2PI3U5fwNi/LkI
         Sagbx5EtaDWvG37Koy12OR/Z0e9q+YMSEse7+sXZZcHyl0FfPaXslIhhGi2hmrwBbp2v
         AYvS/4SlmrqQzFylepOYwDmd+yRhdCDLcx0C9EU2XHVvBf0mL4hT1JI+NjGXKHQjl+gn
         kVF2ycArs6iQsxBMeDN32sWYC7lSp4aROBYgq12Ptl2gQXpWHZAgstEhrMAVqBKANsVS
         Dfxx8yRikVsiB4Ox2PD+XJfWUWPMSJESXX6HTqobIiqy6e1rQ3j15ED7w4p/zsF7ISL+
         c2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SDX6OAWIWPI/rsKZDETAJQY0SzCX0l3xm1KZisYYpVM=;
        b=aZ8rWmSKHmthYqZ8eyREsnQpOXRB8nSViTCT7/vu8B7R8pNMJtN8634EI0spm0Nf4f
         85VyiHeQhmEeS4E5NQC53PrqCgLWcTHK+hWBevM1G43pgxOlPWFEsAYLd9oo8LVK3cem
         OskvcGWlFi5N5D3xc6nk5u1PXD4vY1e9Q21Acd2xWFkGJY2zKB0POiOyyxsY6D1fTMbq
         CHUYdQntYLdK5GZubAJGHpUtaLFJ95YboGthks1IBxqc0lavMlY9CvR8prhyKSl4Ym8R
         mwjKsHyEL63dmtNgs94Svq1xQXZlBb0KFXVRZDi2BPDpiCoGJaStgBP86xpLFrpymyN1
         tJEg==
X-Gm-Message-State: AOAM530u4Kj1jBcU9toPieNwOpMMQxuBvtrhqo4vXssIGB2l6ugtnEcH
	2xmQbzdde0VLO62tuMZK5aw=
X-Google-Smtp-Source: ABdhPJzLpnNvyJrcE0dwVFdZ5H4BHrmSyatZLeIE9SSRLQ9R1hrT4Pao+8vmEHDscr24xVWL5X83NA==
X-Received: by 2002:a17:906:4805:: with SMTP id w5mr173736ejq.545.1617747346370;
        Tue, 06 Apr 2021 15:15:46 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j7sm7704291ejf.74.2021.04.06.15.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 15:15:45 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Apr 2021 00:15:44 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pidgin-sipe: Fix build with glib-2.0 >= 2.68
Message-ID: <20210406221544.nkgpcrcy4qwizhfx@jama>
References: <20210405184059.3123800-1-raj.khem@gmail.com>
 <CA+chaQeMbwwBX_6ZsDusi+oUkHiL6qd=6GputFK_1nr-qkCOsg@mail.gmail.com>
 <82b4d1c6-3c69-3218-dad8-82f7d8dca622@gmail.com>
MIME-Version: 1.0
In-Reply-To: <82b4d1c6-3c69-3218-dad8-82f7d8dca622@gmail.com>
X-Groupsio-MsgNum: 90592
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yiuhsawf6jttu7i7"
Content-Disposition: inline

--yiuhsawf6jttu7i7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 02:46:04PM -0700, Khem Raj wrote:
>=20
>=20
> On 4/6/21 2:30 PM, Martin Jansa wrote:
> > Thanks for fixing this, unfortunatelly it isn't backwards compatible
> > with glib-2.0-1.66.7 currently in oe-core master and hardknott and now
> > fails with:
> > | ../../../pidgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19:
> > error: conflicting types for 'g_memdup'
> > | =A0 =A056 | #define g_memdup2 g_memdup
> > | =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^~~~~~~~
> >=20
> > Can we revert this from meta-oe master branch and re-apply it once 1.68
> > version hits oe-core/master possibly only for honister?
> >=20
>=20
> one point of the fix was to keep it working with older releases, I just
> realized that the build I did on AB did not really build with master but
> with master-next. anyway now you have it reproduced can you try reversing
> the define to
>=20
> #define g_memdup g_memdup2
>=20
>=20
> and see if that helps ?

It doesn't.

with this swap:
http://errors.yoctoproject.org/Errors/Details/575673/

without:
http://errors.yoctoproject.org/Errors/Details/575672/

I'm sending slightly simpler fix.

Thanks

>=20
> > Thanks
> >=20
> >=20
> > On Mon, Apr 5, 2021 at 8:41 PM Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >=20
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
> >     Cc: Martin Jansa <Martin.Jansa@gmail.com
> >     <mailto:Martin.Jansa@gmail.com>>
> >     ---
> >      =A0.../0001-Migrate-to-use-g_memdup2.patch=A0 =A0 =A0 =A0| 192 +++=
+++++++++++++++
> >      =A0.../pidgin/pidgin-sipe_1.25.0.bb <http://pidgin-sipe_1.25.0.bb>
> > =A0 =A0 =A0 =A0 =A0 |=A0 =A01 +
> >      =A02 files changed, 193 insertions(+)
> >      =A0create mode 100644
> >     meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_me=
mdup2.patch
> >=20
> >     diff --git
> >     a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_=
memdup2.patch
> >     b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_=
memdup2.patch
> >     new file mode 100644
> >     index 0000000000..4f5c0bd1f6
> >     --- /dev/null
> >     +++
> >     b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_=
memdup2.patch
> >     @@ -0,0 +1,192 @@
> >     +From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 =
2001
> >     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> >     +Date: Mon, 5 Apr 2021 11:36:50 -0700
> >     +Subject: [PATCH] Migrate to use g_memdup2
> >     +
> >     +g_memdup has been deprecated for long and latest glib-2.0 2.68+ has
> >     +turned it int an error to use old function. Add a fall back to
> >     +older versions of GLib, fall back to g_memdup with a #define
> >     +
> >     +Upstream-Status: Pending
> >     +Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >     +---
> >     + configure.ac <http://configure.ac>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|=A0 3 +++
> >     + src/api/sipe-common.h=A0 =A0 =A0 =A0 =A0 =A0 =A0 |=A0 5 +++++
> >     + src/core/sip-sec-gssapi.c=A0 =A0 =A0 =A0 =A0 |=A0 4 ++--
> >     + src/core/sip-sec-ntlm.c=A0 =A0 =A0 =A0 =A0 =A0 | 12 ++++++------
> >     + src/core/sip-sec-tls-dsk.c=A0 =A0 =A0 =A0 =A0|=A0 4 ++--
> >     + src/core/sipe-media.c=A0 =A0 =A0 =A0 =A0 =A0 =A0 |=A0 2 +-
> >     + src/core/sipe-tls-tester.c=A0 =A0 =A0 =A0 =A0|=A0 2 +-
> >     + src/core/sipe-tls.c=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=A0 4 ++--
> >     + src/telepathy/telepathy-protocol.c |=A0 2 +-
> >     + 9 files changed, 23 insertions(+), 15 deletions(-)
> >     +
> >     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
> >     <http://configure.ac>
> >     +index 2481153..efe01b4 100644
> >     +--- a/configure.ac <http://configure.ac>
> >     ++++ b/configure.ac <http://configure.ac>
> >     +@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test
> >     "x$enable_openssl" !=3D xno])
> >     + dnl check for libxml2
> >     + PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])
> >     +
> >     ++# dnl check for g_memdup2 in glib-2.0
> >     ++AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS=3D"$GLIB_CFLAGS
> >     -DHAVE_G_MEMDUP2=3D1"])
> >     ++
> >     + dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)
> >     + AC_MSG_CHECKING([that sizeof(uuid_t) is 16])
> >     + ac_save_CFLAGS=3D"$CFLAGS"
> >     +diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h
> >     +index c964f15..e114fdc 100644
> >     +--- a/src/api/sipe-common.h
> >     ++++ b/src/api/sipe-common.h
> >     +@@ -51,3 +51,8 @@
> >     + #ifdef _MSC_VER
> >     + typedef long ssize_t;
> >     + #endif
> >     ++
> >     ++#ifndef HAVE_G_MEMDUP2
> >     ++#define g_memdup2 g_memdup
> >     ++#endif
> >     ++
> >     +diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c
> >     +index 873080f..4c63868 100644
> >     +--- a/src/core/sip-sec-gssapi.c
> >     ++++ b/src/core/sip-sec-gssapi.c
> >     +@@ -602,7 +602,7 @@ sip_sec_init_sec_context__gssapi(SipSecContext
> >     context,
> >     +
> >     +=A0 =A0 =A0 =A0out_buff->length =3D output_token.length;
> >     +=A0 =A0 =A0 =A0if (out_buff->length)
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 out_buff->value =3D g_memdup(output_t=
oken.value,
> >     output_token.length);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 out_buff->value =3D g_memdup2(output_=
token.value,
> >     output_token.length);
> >     +=A0 =A0 =A0 =A0else
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Special case: empty token */
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0out_buff->value =3D (guint8 *) g_st=
rdup("");
> >     +@@ -653,7 +653,7 @@ sip_sec_make_signature__gssapi(SipSecContext
> >     context,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
> >     +=A0 =A0 =A0 =A0} else {
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0signature->length =3D output_token.=
length;
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 signature->value=A0 =3D g_memdup(outp=
ut_token.value,
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 signature->value=A0 =3D g_memdup2(out=
put_token.value,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 output_token.length);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gss_release_buffer(&minor, &output_=
token);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return TRUE;
> >     +diff --git a/src/core/sip-sec-ntlm.c b/src/core/sip-sec-ntlm.c
> >     +index 2e2354f..1fa4daa 100644
> >     +--- a/src/core/sip-sec-ntlm.c
> >     ++++ b/src/core/sip-sec-ntlm.c
> >     +@@ -951,7 +951,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_b=
uff,
> >     +
> >     +=A0 =A0 =A0 =A0/* server challenge (nonce) */
> >     +=A0 =A0 =A0 =A0if (server_challenge) {
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_challenge =3D g_memdup(cmsg->=
nonce, 8);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_challenge =3D g_memdup2(cmsg-=
>nonce, 8);
> >     +=A0 =A0 =A0 =A0}
> >     +
> >     +=A0 =A0 =A0 =A0/* flags */
> >     +@@ -984,7 +984,7 @@ sip_sec_ntlm_parse_challenge(SipSecBuffer in_b=
uff,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*target_info_len =
=3D len;
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (target_info) {
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *target_info =3D g_me=
mdup(content, len);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *target_info =3D g_me=
mdup2(content, len);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> >     +=A0 =A0 =A0 =A0}
> >     + }
> >     +@@ -1117,13 +1117,13 @@ sip_sec_ntlm_gen_authenticate(guchar
> >     **client_sign_key,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Set ServerSigningKey to
> >     SIGNKEY(ExportedSessionKey, "Server")
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SIGNKEY(exported_session_key, TRUE,=
 key);
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *client_sign_key =3D g_memdup(key, 16=
);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *client_sign_key =3D g_memdup2(key, 1=
6);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SIGNKEY(exported_session_key, FALSE=
, key);
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_sign_key =3D g_memdup(key, 16=
);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_sign_key =3D g_memdup2(key, 1=
6);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SEALKEY(neg_flags, exported_session=
_key, TRUE, key);
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *client_seal_key =3D g_memdup(key, 16=
);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *client_seal_key =3D g_memdup2(key, 1=
6);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SEALKEY(neg_flags, exported_session=
_key, FALSE, key);
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_seal_key =3D g_memdup(key, 16=
);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *server_seal_key =3D g_memdup2(key, 1=
6);
> >     +=A0 =A0 =A0 =A0}
> >     +
> >     +=A0 =A0 =A0 =A0/* @TODO: */
> >     +diff --git a/src/core/sip-sec-tls-dsk.c b/src/core/sip-sec-tls-dsk=
=2Ec
> >     +index 70433ea..2d3f2db 100644
> >     +--- a/src/core/sip-sec-tls-dsk.c
> >     ++++ b/src/core/sip-sec-tls-dsk.c
> >     +@@ -88,9 +88,9 @@ sip_sec_init_sec_context__tls_dsk(SipSecContext
> >     context,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* copy key pair */
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctx->algorithm=A0 =
=3D state->algorithm;
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctx->key_length =3D=
 state->key_length;
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->client_key =3D g=
_memdup(state->client_key,
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->client_key =3D g=
_memdup2(state->client_key,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 state->key_length);
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->server_key =3D g=
_memdup(state->server_key,
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->server_key =3D g=
_memdup2(state->server_key,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 state->key_length);
> >     +
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* extract certicat=
e expiration time */
> >     +diff --git a/src/core/sipe-media.c b/src/core/sipe-media.c
> >     +index e9c4b8a..936e31c 100644
> >     +--- a/src/core/sipe-media.c
> >     ++++ b/src/core/sipe-media.c
> >     +@@ -578,7 +578,7 @@ media_stream_to_sdpmedia(struct
> >     sipe_media_call_private *call_private,
> >     +=A0 =A0 =A0 =A0// Set our key if encryption is enabled.
> >     +=A0 =A0 =A0 =A0if (stream_private->encryption_key &&
> >     +=A0 =A0 =A0 =A0 =A0 =A0encryption_policy !=3D SIPE_ENCRYPTION_POLI=
CY_REJECTED) {
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 sdpmedia->encryption_key =3D
> >     g_memdup(stream_private->encryption_key,
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 sdpmedia->encryption_key =3D
> >     g_memdup2(stream_private->encryption_key,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SIPE_SRTP_KEY_LEN);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sdpmedia->encryption_key_id =3D
> >     stream_private->encryption_key_id;
> >     +=A0 =A0 =A0 =A0}
> >     +diff --git a/src/core/sipe-tls-tester.c b/src/core/sipe-tls-tester=
=2Ec
> >     +index e80d715..5fbb5f8 100644
> >     +--- a/src/core/sipe-tls-tester.c
> >     ++++ b/src/core/sipe-tls-tester.c
> >     +@@ -155,7 +155,7 @@ static guchar *read_tls_record(int fd,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("received %d bytes from serv=
er\n", result);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0record =3D g_new0(struct record, 1);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0record->length=A0 =3D result;
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 record->msg=A0 =A0 =A0=3D g_memdup(bu=
ffer, result);
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 record->msg=A0 =A0 =A0=3D g_memdup2(b=
uffer, result);
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0length=A0 =A0 =A0 =A0 =A0+=3D resul=
t;
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fragments =3D g_slist_append(fragme=
nts, record);
> >     +=A0 =A0 =A0 =A0}
> >     +diff --git a/src/core/sipe-tls.c b/src/core/sipe-tls.c
> >     +index b0235d5..020aedb 100644
> >     +--- a/src/core/sipe-tls.c
> >     ++++ b/src/core/sipe-tls.c
> >     +@@ -427,7 +427,7 @@ static guchar
> >     *sipe_tls_prf(SIPE_UNUSED_PARAMETER struct tls_internal_state *sta
> >     +=A0 =A0 =A0 =A0gsize half=A0 =A0 =A0 =A0 =A0 =A0=3D (secret_length=
 + 1) / 2;
> >     +=A0 =A0 =A0 =A0gsize newseed_length =3D label_length + seed_length;
> >     +=A0 =A0 =A0 =A0/* secret: used as S1; secret2: last half of origin=
al secret
> >     (S2) */
> >     +-=A0 =A0 =A0 guchar *secret2 =3D g_memdup(secret + secret_length -=
 half, half);
> >     ++=A0 =A0 =A0 guchar *secret2 =3D g_memdup2(secret + secret_length =
- half,
> >     half);
> >     +=A0 =A0 =A0 =A0guchar *newseed =3D g_malloc(newseed_length);
> >     +=A0 =A0 =A0 =A0guchar *md5, *dest;
> >     +=A0 =A0 =A0 =A0guchar *sha1, *src;
> >     +@@ -1525,7 +1525,7 @@ static struct tls_compiled_message
> >     *tls_client_key_exchange(struct tls_internal_
> >     +
> >     +=A0 =A0 =A0 =A0/* found all the required fields */
> >     +=A0 =A0 =A0 =A0state->server_random.length =3D server_random->leng=
th;
> >     +-=A0 =A0 =A0 state->server_random.buffer =3D g_memdup(server_rando=
m->data,
> >     ++=A0 =A0 =A0 state->server_random.buffer =3D g_memdup2(server_rand=
om->data,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 server_random->length);
> >     +=A0 =A0 =A0 =A0tls_calculate_secrets(state);
> >     +
> >     +diff --git a/src/telepathy/telepathy-protocol.c
> >     b/src/telepathy/telepathy-protocol.c
> >     +index f6e5337..1dde579 100644
> >     +--- a/src/telepathy/telepathy-protocol.c
> >     ++++ b/src/telepathy/telepathy-protocol.c
> >     +@@ -237,7 +237,7 @@ static void
> >     get_connection_details(SIPE_UNUSED_PARAMETER TpBaseProtocol *self,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SIPE_TYPE_SEARCH_MA=
NAGER,
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0G_TYPE_INVALID
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> >     +-=A0 =A0 =A0 =A0 =A0 =A0 =A0 *channel_managers =3D g_memdup(types,=
 sizeof(types));
> >     ++=A0 =A0 =A0 =A0 =A0 =A0 =A0 *channel_managers =3D g_memdup2(types=
, sizeof(types));
> >     +=A0 =A0 =A0 =A0}
> >     +=A0 =A0 =A0 =A0if (icon_name)
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*icon_name=A0 =A0 =3D g_strdup("im-=
" SIPE_TELEPATHY_DOMAIN);
> >     +--
> >     +2.31.1
> >     +
> >     diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> >     <http://pidgin-sipe_1.25.0.bb>
> >     b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> >     <http://pidgin-sipe_1.25.0.bb>
> >     index f6b4c7cee1..5a96bec90a 100644
> >     --- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> >     <http://pidgin-sipe_1.25.0.bb>
> >     +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
> >     <http://pidgin-sipe_1.25.0.bb>
> >     @@ -11,6 +11,7 @@ SRC_URI =3D
> >     "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
> >     file://0001-sipe-consider-64bit-time_t-when-printing.patch \
> >     file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.pa=
tch \
> >     file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.pa=
tch \
> >     +=A0 =A0 =A0 =A0 =A0 =A0file://0001-Migrate-to-use-g_memdup2.patch \
> >      =A0"
> >=20
> >      =A0SRC_URI[md5sum] =3D "0e742f021dc8c3f17435aea05c3e0314"
> >     --     2.31.1
> >=20

--yiuhsawf6jttu7i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYGzdjwAKCRA3VSO3ZXaA
HFasAJ9xB3VdA+Rtx+NwQX9t06gjxVDskACeL46DKSFdaBRZU9qD0vp0LtgsVNI=
=qItO
-----END PGP SIGNATURE-----

--yiuhsawf6jttu7i7--
