Return-Path: <marcel@ziswiler.com>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	by mail.openembedded.org (Postfix) with ESMTP id EDF9E731BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 00:42:52 +0000 (UTC)
Received: from localhost.localdomain ([84.227.37.153]) by mrelay.perfora.net
	(mreueus003) with ESMTPSA (Nemesis) id 0MEULn-1aYZXP2gVV-00FjQy for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 01:42:51 +0100
Message-ID: <1458866567.30049.1.camel@ziswiler.com>
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2016 01:42:47 +0100
References: <1458865389.3884.10.camel@ziswiler.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
X-Provags-ID: V03:K0:I058Ngr/1a4zi5RXlGwWdw5TVevN+RqYNaqa9wwpKu2vxodjr56
	uVaLBtgaia8hlN07oYA1e1f471o/DMYbDj36lPyO7o52zuLBBJAodaYW/au5J3cj4HFd97P
	QhaaKHwdIPVP56GS9Jw0n5KuwyTbuqm4HpJuEst2fhyVVRPT92d3JiP/MJvvIs3Gdtnz4NP
	VakHlhQe7sCodoaPpKhKA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tqPwPi/DdTE=:TXpxt6l/Z+o8BEWQmQnmHi
	R4t502lBrML1ddGdc3NsNSbyJTmwrGvzSlAEl1QiZ7wizlrstvUuMQELWVDq4yf4t9mLahdyo
	+X4bh0UxCKWfH+cZpAGq3GBIJ4UMdW4LG1TZJSEuujho9uEL+FJV/r6/XWAorQ/oLlMQduVVG
	1u/nL9S1NuW6VZgWVO+jd0QGwpp5sxJacHntas8QU6rJMNLhPr/jWIAJRo/yhsnOP/5iXyaN+
	ONdqFUeSOORO/KBYCKqySvG+G2GyKOWgW2rzomLSeFAB2Nr0CH2jDIInT65DordpWSxJG7enN
	4JBvy051D8FE/crh+Din+haTHkt4DECNxiQ58K9CJmIgxbPcUezQk5t0iRIQ8Rk25133sc/PI
	IlU/U4ihP9cwMkLZESMKlQ32cutQrAhRthw1k7pWjDTKLOr5WEUyz3Cq2WWaKums4glru1oPZ
	yM+9iY0R268t+ZzayhZYHsiKU4wydcJsfrriUxj28Cfv6yvNRJWwcnRPdfX39uoRpYUaQ/FUU
	DGq8bxC1WlkV2/Z3Rlu56nYPeogOkZKXc7+TwJaDOJVEyR02q2M+B23Dal770GJ7BOT7sIkMF
	QLA59378z5lRw1lt1k3qv+51sIBrvYHzu9ib++xlzDEIeOnL3rNLAjqbEEStKbA+5cJ4/y0qv
	Gaqh6UJ+HdtJyDOoFWD4tMqg3jN8+m0lkdGg2xzQ5BXyEA34N2uX6Dx5iEE5LDWlPM3hH243u
	TpXkOal2lhphqK9T
Subject: Re: [meta-multimedia][jethro][PATCH] gstreamer: fix argument parsing when using Bison 3]
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
X-List-Received-Date: Fri, 25 Mar 2016 00:42:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan

Thanks, mate! I owe you a couple beers (;-p). Happy Easter and cu soon
in Seattle.

Cheers

Marcel

On Thu, 2016-03-24 at 16:26 -0700, Stefan Agner wrote:
>=20
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Remove the argument fix patch and add a patch which fixes the
> grammer.y Bison input file. YYLEX_PARAM seems to be no longer
> supported and has been replaced with %parse-param which has
> been introduced already in 2003.
>=20
> This fixes a segmentation fault when launching gst-launch-0.10.
>=20
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

>=20
> ---
> This is the stack trace of the segmentation fault:
> (gdb) bt=C2=A0
> #0=C2=A0=C2=A0priv_gst_parse_yylex (yylval_param=3Dyylval_param@entry=3D0=
xbe8a4224,
> yyscanner=3D0xc8) at lex.priv_gst_parse_yy.c:1153
> #1=C2=A0=C2=A00x4022d712 in priv_gst_parse_yyparse (scanner=3D<optimized =
out>, gr
> aph=3Dgraph@entry=3D0xbe8a47ec) at grammar.tab.c:1821
> #2=C2=A0=C2=A00x4022f18c in priv_gst_parse_launch (
> =C2=A0=C2=A0=C2=A0=C2=A0str=3D0x94f28 "filesrc
> location=3D/home/root_2p_key60_q90_aac128_44.mp4 ! qtdemuxemux
> demux.video_00 ! nv_omx_h264dec ! nv_gl_eglimagesink demux.audio_00 !
> nv_omx_aacdec ! alsasink device=3Dhw:0,0 ",=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0error=3Derror@entry=3D0xbe8a4910, ctx=3Dctx@entry=
=3D0x0, flags=3Dflags@entr
> y=3DGST_PARSE_FLAG_NONE) at /usr/src/debug/gstreamer/0.10.36-
> r2/gstreamer-0.10.36/gst/parse/grammar.y:927
> #3=C2=A0=C2=A00x402277b8 in gst_parse_launch_full (
> =C2=A0=C2=A0=C2=A0=C2=A0pipeline_description=3D0x94f28 "filesrc
> location=3D/home/root_2p_key60_q90_aac128_44.mp4 ! qtdemuxemux
> demux.video_00 ! nv_omx_h264dec ! nv_gl_eglimagesink demux.audio_00 !
> nv_omx_aacdec ! alsasink device=3Dhw:0,0 ", context=3Dcontext@entry=3D0x0=
,=C2=A0
> flags=3Dflags@entry=3DGST_PARSE_FLAG_NONE, error=3Derror@entry=3D0xbe8a49=
10)
> at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-
> 0.10.36/gst/gstparse.c:336
> #4=C2=A0=C2=A00x40227968 in gst_parse_launchv_full (argv=3Dargv@entry=3D0=
x7ad50, co
> ntext=3Dcontext@entry=3D0x0, flags=3Dflags@entry=3DGST_PARSE_FLAG_NONE, e=
rror
> =3Derror@entry=3D0xbe8a4910)
> =C2=A0=C2=A0=C2=A0=C2=A0at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-
> 0.10.36/gst/gstparse.c:272
> #5=C2=A0=C2=A00x402279f2 in gst_parse_launchv (argv=3Dargv@entry=3D0x7ad5=
0, error=3De
> rror@entry=3D0xbe8a4910) at /usr/src/debug/gstreamer/0.10.36-
> r2/gstreamer-0.10.36/gst/gstparse.c:224
> #6=C2=A0=C2=A00x0000a6d8 in main (argc=3D16, argv=3D0xbe8a4ca4) at
> /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/tools/gst-
> launch.c:1031
>=20
> =C2=A0...01-parse-make-grammar.y-work-with-Bison-3.patch | 35
> ++++++++++++++++++++++
> =C2=A0...mer-change-priv_gst_parse_yylex-arguments.patch | 33 -----------=
-
> --------
> =C2=A0.../gstreamer-0.10/gstreamer_0.10.36.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> =C2=A03 files changed, 36 insertions(+), 34 deletions(-)
> =C2=A0create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-
> 3.patch
> =C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-
> arguments.patch
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-
> 3.patch b/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-
> 3.patch
> new file mode 100644
> index 0000000..dc2d606
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-
> 0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
> @@ -0,0 +1,35 @@
> +From 60516f4798894f958fc53b470e1283318d0f8706 Mon Sep 17 00:00:00
> 2001
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
> +=C2=A0=C2=A0*/
> +=C2=A0
> + #define YYERROR_VERBOSE 1
> +-#define YYLEX_PARAM scanner
> +=C2=A0
> + #define YYENABLE_NLS 0
> +=C2=A0
> +@@ -648,6 +647,7 @@ static int yyerror (void *scanner, graph_t
> *graph, const char *s);
> + %right '.'
> + %left '!' '=3D'
> +=C2=A0
> ++%lex-param { void *scanner }
> + %parse-param { void *scanner }
> + %parse-param { graph_t *graph }
> + %pure-parser
> +--=C2=A0
> +2.7.2
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-
> arguments.patch b/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-
> arguments.patch
> deleted file mode 100644
> index bf93cb2..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-
> 0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -gstreamer: change priv_gst_parse_yylex arguments
> -
> -Change priv_gst_parse_yylex to fit new bison version, else we will
> -get following error:
> -
> -| grammar.tab.c: In function 'priv_gst_parse_yyparse':
> -| grammar.tab.c:67:25: error: too few arguments to function
> 'priv_gst_parse_yylex'
> -|=C2=A0=C2=A0#define yylex=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0priv_gst_parse_yylex
> -|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0^
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
> -=C2=A0
> - typedef void* yyscan_t;
> -=C2=A0
> --int priv_gst_parse_yylex (void * yylval_param , yyscan_t
> yyscanner);
> -+int priv_gst_parse_yylex (yyscan_t yyscanner);
> - int priv_gst_parse_yylex_init (yyscan_t scanner);
> - int priv_gst_parse_yylex_destroy (yyscan_t scanner);
> - struct yy_buffer_state * priv_gst_parse_yy_scan_string (char* ,
> yyscan_t);
> ---=C2=A0
> -1.9.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
> index 5b30603..ad7cf99 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer_0.10.36.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-
> 0.10/gstreamer_0.10.36.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst
> reamer/gstreamer-${PV}.tar.bz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
ile://check_fix.patch \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
ile://gst-inspect-check-error.patch \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
ile://0001-baseparse-Fix-self-comparison-always-
> evaluates-to-tr.patch \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file:/=
/gstreamer-change-priv_gst_parse_yylex-
> arguments.patch \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file:/=
/0001-parse-make-grammar.y-work-with-Bison-3.patch
> \
> =C2=A0"
> =C2=A0
> =C2=A0SRC_URI[md5sum] =3D "a0cf7d6877f694a1a2ad2b4d1ecb890b"

