Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC366AC00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:32:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so3296462wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UYqBS9I3xiB2IuZ+Xto/VkpgBPa+Emfg7P4w0+fucR0=;
	b=NOHTitqiVftAftLOQvVuIeHAHI0uz7PX9O/EvVFMZ2WPeNZt+tFap18Pc4mkBDQqs/
	qymGw4c9OBOaHlFy9p1bELnk1mRGOvvhDjtvyWdt26ehQnm+bvIxvU4cx2BYCYh1qVwR
	xOfGbfpgLSGNh92r1YeXUUz+sQoPK2NR/LWyKj+YA0ATI4Aykgor2eLQT+VkeRK1cOWr
	CeHKgG4zg2e295A1o2bZ8sG48ktsTwNzHbY45xPXwklQ1fOJu4tD+f5RxSwRlQEQzh+U
	PMPKtsVGPNjXXUyD6x4kDP+WBFqrIx11UF4Z4Z8fHHCM78vRGM/xTskqPh01IuisENHi
	m23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UYqBS9I3xiB2IuZ+Xto/VkpgBPa+Emfg7P4w0+fucR0=;
	b=Goi6wE0ffSitghpRzNlb8Oa6zLVUwMvi6tZsYb04sAzbeOYUqZeNfjMll51vjDu23h
	5kHNUmgFgacBTGvGC2rAx+DHCf/RkbO8dntG33pevZ3hIyS3a2mr8gndXeXGqxJilyxs
	upUB5GcrOXBFmJ+Bq0eeYRk1FgSPcvsEbb4Dcfz2PY4IzNMBARHljPvRxRK6uKeJgEdz
	v3flESiK+hLR4zrLPB2/+KfpVrUwcJJN5qBRADlodsTOTKNeOZUSANkS/fzNptlHxNRR
	1oPOhEoNdFShpG4z9jBXv7tUrXMkhT2pBu+WiPfb5/fwvEOFxDh7yBTIRQCjFqTylRY3
	r/1Q==
X-Gm-Message-State: AD7BkJJBJ0mCge7eOj882FYLX/YkfmJ0QrYz0XCUMDl4rnzYMsgBWXqOWTj4NaF3Oj67bw==
X-Received: by 10.194.134.202 with SMTP id pm10mr14152814wjb.111.1458901958431;
	Fri, 25 Mar 2016 03:32:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	up6sm11379289wjc.6.2016.03.25.03.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 03:32:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Mar 2016 11:37:23 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160325103723.GB2555@jama>
References: <1458862016-19466-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <1458862016-19466-1-git-send-email-stefan@agner.ch>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Chong.Lu@windriver.com, marcel@ziswiler.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-multimedia][jethro][PATCH] gstreamer: fix argument parsing when using Bison 3
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
X-List-Received-Date: Fri, 25 Mar 2016 10:32:39 -0000
X-Groupsio-MsgNum: 60667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 04:26:56PM -0700, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Remove the argument fix patch and add a patch which fixes the
> grammer.y Bison input file. YYLEX_PARAM seems to be no longer
> supported and has been replaced with %parse-param which has
> been introduced already in 2003.
>=20
> This fixes a segmentation fault when launching gst-launch-0.10.

Is this needed in master branch as well?

All changes for released branch should go to master first.

> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
> This is the stack trace of the segmentation fault:
> (gdb) bt=20
> #0  priv_gst_parse_yylex (yylval_param=3Dyylval_param@entry=3D0xbe8a4224,=
 yyscanner=3D0xc8) at lex.priv_gst_parse_yy.c:1153
> #1  0x4022d712 in priv_gst_parse_yyparse (scanner=3D<optimized out>, grap=
h=3Dgraph@entry=3D0xbe8a47ec) at grammar.tab.c:1821
> #2  0x4022f18c in priv_gst_parse_launch (
>     str=3D0x94f28 "filesrc location=3D/home/root_2p_key60_q90_aac128_44.m=
p4 ! qtdemuxemux demux.video_00 ! nv_omx_h264dec ! nv_gl_eglimagesink demux=
=2Eaudio_00 ! nv_omx_aacdec ! alsasink device=3Dhw:0,0 ",=20
>     error=3Derror@entry=3D0xbe8a4910, ctx=3Dctx@entry=3D0x0, flags=3Dflag=
s@entry=3DGST_PARSE_FLAG_NONE) at /usr/src/debug/gstreamer/0.10.36-r2/gstre=
amer-0.10.36/gst/parse/grammar.y:927
> #3  0x402277b8 in gst_parse_launch_full (
>     pipeline_description=3D0x94f28 "filesrc location=3D/home/root_2p_key6=
0_q90_aac128_44.mp4 ! qtdemuxemux demux.video_00 ! nv_omx_h264dec ! nv_gl_e=
glimagesink demux.audio_00 ! nv_omx_aacdec ! alsasink device=3Dhw:0,0 ", co=
ntext=3Dcontext@entry=3D0x0, flags=3Dflags@entry=3DGST_PARSE_FLAG_NONE, err=
or=3Derror@entry=3D0xbe8a4910) at /usr/src/debug/gstreamer/0.10.36-r2/gstre=
amer-0.10.36/gst/gstparse.c:336
> #4  0x40227968 in gst_parse_launchv_full (argv=3Dargv@entry=3D0x7ad50, co=
ntext=3Dcontext@entry=3D0x0, flags=3Dflags@entry=3DGST_PARSE_FLAG_NONE, err=
or=3Derror@entry=3D0xbe8a4910)
>     at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/gst/gstparse=
=2Ec:272
> #5  0x402279f2 in gst_parse_launchv (argv=3Dargv@entry=3D0x7ad50, error=
=3Derror@entry=3D0xbe8a4910) at /usr/src/debug/gstreamer/0.10.36-r2/gstream=
er-0.10.36/gst/gstparse.c:224
> #6  0x0000a6d8 in main (argc=3D16, argv=3D0xbe8a4ca4) at /usr/src/debug/g=
streamer/0.10.36-r2/gstreamer-0.10.36/tools/gst-launch.c:1031
>=20
>  ...01-parse-make-grammar.y-work-with-Bison-3.patch | 35 ++++++++++++++++=
++++++
>  ...mer-change-priv_gst_parse_yylex-arguments.patch | 33 ----------------=
----
>  .../gstreamer-0.10/gstreamer_0.10.36.bb            |  2 +-
>  3 files changed, 36 insertions(+), 34 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch b/meta-multimedia=
/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-gramma=
r.y-work-with-Bison-3.patch
> new file mode 100644
> index 0000000..dc2d606
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/0001-parse-make-grammar.y-work-with-Bison-3.patch
> @@ -0,0 +1,35 @@
> +From 60516f4798894f958fc53b470e1283318d0f8706 Mon Sep 17 00:00:00 2001
> +From: Kerrick Staley <kerrick@kerrickstaley.com>
> +Date: Tue, 20 Aug 2013 23:59:29 -0700
> +Subject: [PATCH 1/2] parse: make grammar.y work with Bison 3
> +
> +YYLEX_PARAM is no longer supported in Bison 3.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D706462
> +---
> + gst/parse/grammar.y | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
> +index 24fc87b..7f9dd16 100644
> +--- a/gst/parse/grammar.y
> ++++ b/gst/parse/grammar.y
> +@@ -26,7 +26,6 @@
> +  */
> +=20
> + #define YYERROR_VERBOSE 1
> +-#define YYLEX_PARAM scanner
> +=20
> + #define YYENABLE_NLS 0
> +=20
> +@@ -648,6 +647,7 @@ static int yyerror (void *scanner, graph_t *graph, c=
onst char *s);
> + %right '.'
> + %left '!' '=3D'
> +=20
> ++%lex-param { void *scanner }
> + %parse-param { void *scanner }
> + %parse-param { graph_t *graph }
> + %pure-parser
> +--=20
> +2.7.2
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch b/meta-multim=
edia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-p=
riv_gst_parse_yylex-arguments.patch
> deleted file mode 100644
> index bf93cb2..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/gstreamer-change-priv_gst_parse_yylex-arguments.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -gstreamer: change priv_gst_parse_yylex arguments
> -
> -Change priv_gst_parse_yylex to fit new bison version, else we will
> -get following error:
> -
> -| grammar.tab.c: In function 'priv_gst_parse_yyparse':
> -| grammar.tab.c:67:25: error: too few arguments to function 'priv_gst_pa=
rse_yylex'
> -|  #define yylex           priv_gst_parse_yylex
> -|                          ^
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ----
> - gst/parse/grammar.y | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
> -index 24fc87b..24fe906 100644
> ---- a/gst/parse/grammar.y
> -+++ b/gst/parse/grammar.y
> -@@ -36,7 +36,7 @@
> -=20
> - typedef void* yyscan_t;
> -=20
> --int priv_gst_parse_yylex (void * yylval_param , yyscan_t yyscanner);
> -+int priv_gst_parse_yylex (yyscan_t yyscanner);
> - int priv_gst_parse_yylex_init (yyscan_t scanner);
> - int priv_gst_parse_yylex_destroy (yyscan_t scanner);
> - struct yy_buffer_state * priv_gst_parse_yy_scan_string (char* , yyscan_=
t);
> ---=20
> -1.9.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_=
0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.=
10.36.bb
> index 5b30603..ad7cf99 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36=
=2Ebb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36=
=2Ebb
> @@ -15,7 +15,7 @@ SRC_URI =3D "http://gstreamer.freedesktop.org/src/gstre=
amer/gstreamer-${PV}.tar.bz
>             file://check_fix.patch \
>             file://gst-inspect-check-error.patch \
>             file://0001-baseparse-Fix-self-comparison-always-evaluates-to=
-tr.patch \
> -           file://gstreamer-change-priv_gst_parse_yylex-arguments.patch \
> +           file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "a0cf7d6877f694a1a2ad2b4d1ecb890b"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb1FOMACgkQN1Ujt2V2gBwShwCfab30g27Kz/iizjaZdn3ke1g4
XRUAn2SWTP4mgCMEB8V7Xo9ygE1Tgw8A
=dpOl
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
