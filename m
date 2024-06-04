Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0FEC27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 21:12:52 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.1591.1717535567676512690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 14:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MT+Rws/l;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2506fc3a6cfso1854233fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717535567; x=1718140367; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/I9Bw3DzVSUpbRMc7zoT899Hybf+v7oRxjno8hx/TE=;
        b=MT+Rws/lr31bldXl8YUVTlDgPv8eyzhNfD9kEd4liF6wKcuSI7IfcWjfxxpL2dFfAi
         I9TiwBzEOhwrEMKn36Dg5kcJEirpkHXvdq2/zNtNbhWS/+OLZwqn83Q4zjORHaONyfLU
         mwTaLRn2PV0EPykeR/eB2BkecWyW1lG1x+epK6pYAwgvt9TEYtviDh0qHAumWAzok81q
         CFXS9uU8U3RjE3nEKUUgpqKGyc0L5G/WbmKcWKXtwp+uI6EO8KtJzEhvBmw44PrHIEjY
         TJK9D+uZbS1ySXsR3AS13dtgngQ+IggU7//AV2ELHotbBWdASd7xmAnLl29qt9wmJmd9
         VpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717535567; x=1718140367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/I9Bw3DzVSUpbRMc7zoT899Hybf+v7oRxjno8hx/TE=;
        b=U6rKH9Jrw3FHvwJet939AEYl/DLs35Jjx0PTxaiRkg5nihO6/Z1vIv7F+cWpnxoIl9
         c/xEvRymgBSCqnSZ+FhKH4HlvtuLkSgCed4Qxxv6sZkguUdDOwaluJhseHtS/NKlUnk7
         a3VDz3xULDAGdJ4s2IsK6S62QHZGSXbgXkUX98oDbzSg6aEUZBSzgVLxiERfCmW86fFH
         nS4lxVV+vkktxNqkSpbE7HX2aXwzdultnDoSjzSr4OCDkH3FZlHCrbg8gPRS4MGG8UPd
         bBLR+JExO26DdBiMeEiFDE5MoJcBckE0yJQEIlY8R1TeU0vFzViVSKOam480NshCPRQJ
         Wlsw==
X-Gm-Message-State: AOJu0Yxtl0YAW1WSK1N1H8jn/Rzu1PF//pBi8KSlnb6SnBUC9hc3No55
	wfEwA7ckA0w5MyrLFNFSbAqrS+RY4tIcfqHba+BY5tFHBxPx5eMIClWV51HOj3RytgWggJethQf
	kOg8+GP3A9oHq9w9rvqLDDXsojb86urN/FgU=
X-Google-Smtp-Source: AGHT+IEvy0vVpNMtKKNIh9cpbDmkg8OqRyHsabLEOk1wg4l6ndEUZFxMYKgaAdSW8shcRWbfgzScSaM7Tb6lbZIsv9g=
X-Received: by 2002:a05:6870:17a6:b0:250:740b:809a with SMTP id
 586e51a60fabf-25122719236mr818398fac.15.1717535566382; Tue, 04 Jun 2024
 14:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 14:12:20 -0700
Message-ID: <CAMKF1so0jzeWU3+9P_Sf_3reufN37yeeOapOKD4bQKZXu37MMw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/2] rrdtool: fix compilation with GCC 14
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 21:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110689

This patch in itself is ok however ntopng fails now with this patch applied=
 see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3899/step=
s/15/logs/stdio

   | src/LuaEngineNtop.cpp: In function 'int ntop_rrd_tune(lua_State*)':
   | src/LuaEngineNtop.cpp:5430:27: error: invalid conversion from
'char**' to 'const char**' [-fpermissive]
   |  5430 |   status =3D rrd_tune(argc, (char**)argv);
   |       |                           ^~~~~~~~~~~~
   |       |                           |
   |       |                           char**

On Mon, Jun 3, 2024 at 4:09=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Import patch from the rrdtool's git to fix building with GCC 14. Note,
> it also requires fixing other tools (like lmsensors) in a similar way.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  ...3c578f1e9f582e9c28f50d82b1f569602075.patch | 1583 +++++++++++++++++
>  .../recipes-extended/rrdtool/rrdtool_1.8.0.bb |    1 +
>  2 files changed, 1584 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/b76e3c578f1e=
9f582e9c28f50d82b1f569602075.patch
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/b76e3c578f1e9f582e9=
c28f50d82b1f569602075.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/b76e=
3c578f1e9f582e9c28f50d82b1f569602075.patch
> new file mode 100644
> index 000000000000..7f54a3723d55
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool/b76e3c578f1e9f582e9c28f50d=
82b1f569602075.patch
> @@ -0,0 +1,1583 @@
> +From b76e3c578f1e9f582e9c28f50d82b1f569602075 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Michal=3D20Such=3DC3=3DA1nek?=3D <hramrach@gmail.com>
> +Date: Fri, 5 Jan 2024 15:31:48 +0100
> +Subject: [PATCH] Constify argv, fix warnings. (#1242)
> +
> +* Fix perl warnings
> +
> + - cast POPs to void to avoid unused value warning
> + - declare functions that don't set RETVAL as returning void
> +
> +Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> +
> +* Constify argv
> +
> +rrd has no business modifying the string pointed to by passed agrv, and
> +as far as gcc can see it does indeed not modify them because it compiles
> +with const argv.
> +
> +This fixes warnings when passing const strings into rrd, and avoids the
> +need to duplicate all strings in the tcl bindings.
> +
> +This fixes warnings like these:
> +[    3s] prog/sensord/rrd.c: In function 'rrdInit':
> +[    3s] prog/sensord/rrd.c:302:40: warning: cast discards 'const' quali=
fier from pointer target type [-Wcast-qual]
> +[    3s]   302 |                 ret =3D rrd_create(argc, (char**) argv)=
;
> +[    3s]       |                                        ^
> +[    3s] prog/sensord/rrd.c: In function 'rrdUpdate':
> +[    3s] prog/sensord/rrd.c:458:42: warning: cast discards 'const' quali=
fier from pointer target type [-Wcast-qual]
> +[    3s]   458 |                 if ((ret =3D rrd_update(3, (char **) /*=
 WEAK */ argv))) {
> +[    3s]       |                                          ^
> +
> +Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> +
> +* tcl: Do not duplicate const strings
> +
> +---------
> +
> +Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> +Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit=
/b76e3c578f1e9f582e9c28f50d82b1f569602075]
> +---
> + CHANGES                         |  3 ++
> + bindings/lua/rrdlua.c           | 25 +++++-----
> + bindings/perl-shared/RRDs.xs    | 36 +++++++-------
> + bindings/python/rrdtoolmodule.c | 38 +++++++--------
> + bindings/ruby/main.c            | 10 ++--
> + bindings/tcl/tclrrd.c           | 84 ++++++++-------------------------
> + src/optparse.c                  | 14 +++---
> + src/optparse.h                  |  6 +--
> + src/rrd.h                       | 38 +++++++--------
> + src/rrd_cgi.c                   | 24 +++++-----
> + src/rrd_create.c                |  2 +-
> + src/rrd_daemon.c                | 12 ++---
> + src/rrd_dump.c                  |  4 +-
> + src/rrd_fetch.c                 |  2 +-
> + src/rrd_first.c                 |  2 +-
> + src/rrd_flushcached.c           |  2 +-
> + src/rrd_graph.c                 |  6 +--
> + src/rrd_graph.h                 |  4 +-
> + src/rrd_graph_helper.c          |  2 +-
> + src/rrd_info.c                  |  2 +-
> + src/rrd_last.c                  |  2 +-
> + src/rrd_lastupdate.c            |  2 +-
> + src/rrd_list.c                  |  6 +--
> + src/rrd_modify.c                |  2 +-
> + src/rrd_modify.h                |  2 +-
> + src/rrd_resize.c                |  4 +-
> + src/rrd_restore.c               |  2 +-
> + src/rrd_tool.c                  | 26 +++++-----
> + src/rrd_tune.c                  |  2 +-
> + src/rrd_update.c                |  4 +-
> + src/rrd_xport.c                 |  2 +-
> + src/rrdupdate.c                 |  7 +--
> + 32 files changed, 168 insertions(+), 209 deletions(-)
> +
> +diff --git a/bindings/lua/rrdlua.c b/bindings/lua/rrdlua.c
> +index d1a700641..2095c3b5b 100644
> +--- a/bindings/lua/rrdlua.c
> ++++ b/bindings/lua/rrdlua.c
> +@@ -37,8 +37,8 @@
> + extern void rrd_freemem(void *mem);
> +
> + extern int luaopen_rrd (lua_State * L);
> +-typedef int (*RRD_FUNCTION)(int, char **);
> +-typedef rrd_info_t *(RRD_FUNCTION_V)(int, char **);
> ++typedef int (*RRD_FUNCTION)(int, const char **);
> ++typedef rrd_info_t *(RRD_FUNCTION_V)(int, const char **);
> +
> + /**********************************************************/
> +
> +@@ -49,9 +49,9 @@ static void reset_rrd_state(void)
> +     rrd_clear_error();
> + }
> +
> +-static char **make_argv(const char *cmd, lua_State * L)
> ++static const char **make_argv(const char *cmd, lua_State * L)
> + {
> +-  char **argv;
> ++  const char **argv;
> +   int i;
> +   int argc =3D lua_gettop(L) + 1;
> +
> +@@ -60,13 +60,12 @@ static char **make_argv(const char *cmd, lua_State *=
 L)
> +     luaL_error(L, "Can't allocate memory for arguments array", cmd);
> +
> +   /* fprintf(stderr, "Args:\n"); */
> +-  argv[0] =3D (char *) cmd; /* Dummy arg. Cast to (char *) because rrd =
*/
> +-                          /* functions don't expect (const * char)   */
> ++  argv[0] =3D cmd;
> +   /* fprintf(stderr, "%s\n", argv[0]); */
> +   for (i=3D1; i<argc; i++) {
> +     /* accepts string or number */
> +     if (lua_isstring(L, i) || lua_isnumber(L, i)) {
> +-      if (!(argv[i] =3D (char *) lua_tostring (L, i))) {
> ++      if (!(argv[i] =3D lua_tostring (L, i))) {
> +         /* raise an error and never return */
> +         luaL_error(L, "%s - error duplicating string area for arg #%d",
> +                    cmd, i);
> +@@ -84,7 +83,7 @@ static char **make_argv(const char *cmd, lua_State * L=
)
> + static int
> + rrd_common_call (lua_State *L, const char *cmd, RRD_FUNCTION rrd_functi=
on)
> + {
> +-  char **argv;
> ++  const char **argv;
> +   int argc =3D lua_gettop(L) + 1;
> +
> +   argv =3D make_argv(cmd, L);
> +@@ -99,7 +98,7 @@ rrd_common_call (lua_State *L, const char *cmd, RRD_FU=
NCTION rrd_function)
> + static int
> + lua_rrd_infocall(lua_State *L, const char *cmd, RRD_FUNCTION_V rrd_func=
tion)
> + {
> +-  char **argv;
> ++  const char **argv;
> +   rrd_info_t *p, *data;
> +   int argc =3D lua_gettop(L) + 1;
> +
> +@@ -197,7 +196,7 @@ static int
> + lua_rrd_fetch (lua_State * L)
> + {
> +   int argc =3D lua_gettop(L) + 1;
> +-  char **argv =3D make_argv("fetch", L);
> ++  const char **argv =3D make_argv("fetch", L);
> +   unsigned long i, j, step, ds_cnt;
> +   rrd_value_t *data, *p;
> +   char    **names;
> +@@ -246,7 +245,7 @@ lua_rrd_first (lua_State * L)
> + {
> +   time_t first;
> +   int argc =3D lua_gettop(L) + 1;
> +-  char **argv =3D make_argv("first", L);
> ++  const char **argv =3D make_argv("first", L);
> +   reset_rrd_state();
> +   first =3D rrd_first(argc, argv);
> +   free(argv);
> +@@ -260,7 +259,7 @@ lua_rrd_last (lua_State * L)
> + {
> +   time_t last;
> +   int argc =3D lua_gettop(L) + 1;
> +-  char **argv =3D make_argv("last", L);
> ++  const char **argv =3D make_argv("last", L);
> +   reset_rrd_state();
> +   last =3D rrd_last(argc, argv);
> +   free(argv);
> +@@ -275,7 +274,7 @@ static int
> + lua_rrd_graph (lua_State * L)
> + {
> +   int argc =3D lua_gettop(L) + 1;
> +-  char **argv =3D make_argv("last", L);
> ++  const char **argv =3D make_argv("last", L);
> +   char **calcpr;
> +   int i, xsize, ysize;
> +   double ymin, ymax;
> +diff --git a/bindings/perl-shared/RRDs.xs b/bindings/perl-shared/RRDs.xs
> +index e233b5835..edce76ec4 100644
> +--- a/bindings/perl-shared/RRDs.xs
> ++++ b/bindings/perl-shared/RRDs.xs
> +@@ -44,11 +44,11 @@ extern "C" {
> +                   strcpy(argv[i+1],handle); \
> +               } \
> +               rrd_clear_error();\
> +-              RETVAL=3Dname(items+1,argv); \
> ++              RETVAL =3D name(items + 1, (const char **)argv); \
> +               for (i=3D0; i < items; i++) {\
> +-                  free(argv[i+1]);\
> ++                  free((void *)argv[i+1]);\
> +               } \
> +-              free(argv);\
> ++              free((void *)argv);\
> +               \
> +               if (rrd_test_error()) XSRETURN_UNDEF;
> +
> +@@ -67,11 +67,11 @@ extern "C" {
> +                   strcpy(argv[i+1],handle); \
> +               } \
> +                 rrd_clear_error(); \
> +-                data=3Dname(items+1, argv); \
> ++                data =3D name(items + 1, (const char **)argv); \
> +                 for (i=3D0; i < items; i++) { \
> +-                  free(argv[i+1]); \
> ++                  free((void *)argv[i+1]); \
> +               } \
> +-              free(argv); \
> ++              free((void *)argv); \
> +                 if (rrd_test_error()) XSRETURN_UNDEF; \
> +                 hash =3D newHV(); \
> +               save=3Ddata; \
> +@@ -175,7 +175,7 @@ static int rrd_fetch_cb_wrapper(
> +     /* Check the eval first */
> +     if (SvTRUE(ERRSV)) {
> +         rrd_set_error("perl callback failed: %s",SvPV_nolen(ERRSV));
> +-        POPs; /* there is undef on top of the stack when there is an er=
ror
> ++        (void)POPs; /* there is undef on top of the stack when there is=
 an error
> +                  and call_sv was initiated with G_EVAL|G_SCALER */
> +         goto error_out;
> +     }
> +@@ -383,7 +383,7 @@ rrd_tune(...)
> +
> + #ifdef HAVE_RRD_GRAPH
> +
> +-SV *
> ++void
> + rrd_graph(...)
> +       PROTOTYPE: @
> +       PREINIT:
> +@@ -404,7 +404,7 @@ rrd_graph(...)
> +                   strcpy(argv[i+1],handle);
> +               }
> +               rrd_clear_error();
> +-              rrd_graph(items+1,argv,&calcpr,&xsize,&ysize,NULL,&ymin,&=
ymax);
> ++              rrd_graph(items+1,(const char **)argv,&calcpr,&xsize,&ysi=
ze,NULL,&ymin,&ymax);
> +               for (i=3D0; i < items; i++) {
> +                   free(argv[i+1]);
> +               }
> +@@ -433,7 +433,7 @@ rrd_graph(...)
> +
> + #endif /* HAVE_RRD_GRAPH */
> +
> +-SV *
> ++void
> + rrd_fetch(...)
> +       PROTOTYPE: @
> +       PREINIT:
> +@@ -455,7 +455,7 @@ rrd_fetch(...)
> +                   strcpy(argv[i+1],handle);
> +               }
> +               rrd_clear_error();
> +-              rrd_fetch(items+1,argv,&start,&end,&step,&ds_cnt,&ds_namv=
,&data);
> ++              rrd_fetch(items+1,(const char **)argv,&start,&end,&step,&=
ds_cnt,&ds_namv,&data);
> +               for (i=3D0; i < items; i++) {
> +                   free(argv[i+1]);
> +               }
> +@@ -486,7 +486,7 @@ rrd_fetch(...)
> +               PUSHs(sv_2mortal(newRV_noinc((SV*)names)));
> +               PUSHs(sv_2mortal(newRV_noinc((SV*)retar)));
> +
> +-SV *
> ++void
> + rrd_fetch_cb_register(cb)
> +     SV * cb
> +     CODE:
> +@@ -496,7 +496,7 @@ rrd_fetch_cb_register(cb)
> +             SvSetSV(rrd_fetch_cb_svptr,cb);
> +         rrd_fetch_cb_register(rrd_fetch_cb_wrapper);
> +
> +-SV *
> ++void
> + rrd_times(start, end)
> +         char *start
> +         char *end
> +@@ -521,7 +521,7 @@ rrd_times(start, end)
> +               PUSHs(sv_2mortal(newSVuv(start_tmp)));
> +               PUSHs(sv_2mortal(newSVuv(end_tmp)));
> +
> +-int
> ++void
> + rrd_xport(...)
> +       PROTOTYPE: @
> +       PREINIT:
> +@@ -543,7 +543,7 @@ rrd_xport(...)
> +                   strcpy(argv[i+1],handle);
> +               }
> +               rrd_clear_error();
> +-              rrd_xport(items+1,argv,&xsize,&start,&end,&step,&col_cnt,=
&legend_v,&data);
> ++              rrd_xport(items+1,(const char **)argv,&xsize,&start,&end,=
&step,&col_cnt,&legend_v,&data);
> +               for (i=3D0; i < items; i++) {
> +                   free(argv[i+1]);
> +               }
> +@@ -657,7 +657,7 @@ rrd_flushcached(...)
> +       OUTPUT:
> +               RETVAL
> +
> +-SV*
> ++void
> + rrd_list(...)
> +       PROTOTYPE: @
> +       PREINIT:
> +@@ -667,7 +667,7 @@ rrd_list(...)
> +                 char **argv;
> +               AV *list;
> +       PPCODE:
> +-              argv =3D (char **) malloc((items+1)*sizeof(char *));
> ++              argv =3D malloc((items+1)*sizeof(char *));
> +               argv[0] =3D "dummy";
> +
> +               for (i =3D 0; i < items; i++) {
> +@@ -681,7 +681,7 @@ rrd_list(...)
> +
> +                 rrd_clear_error();
> +
> +-              data =3D rrd_list(items+1, argv);
> ++              data =3D rrd_list(items+1, (const char **)argv);
> +
> +                 for (i=3D0; i < items; i++) {
> +                   free(argv[i+1]);
> +diff --git a/bindings/python/rrdtoolmodule.c b/bindings/python/rrdtoolmo=
dule.c
> +index 1ab463584..f255e65bc 100644
> +--- a/bindings/python/rrdtoolmodule.c
> ++++ b/bindings/python/rrdtoolmodule.c
> +@@ -123,7 +123,7 @@ PyRRD_String_FromCF(enum cf_en cf)
> +  * @return Zero if the function succeeds, otherwise -1
> +  */
> + static int
> +-convert_args(char *command, PyObject *args, char ***rrdtool_argv, int *=
rrdtool_argc)
> ++convert_args(char *command, PyObject *args, const char ***rrdtool_argv,=
 int *rrdtool_argc)
> + {
> +     PyObject *o, *lo;
> +     int i, j, args_count, argv_count, element_count;
> +@@ -145,7 +145,7 @@ convert_args(char *command, PyObject *args, char ***=
rrdtool_argv, int *rrdtool_a
> +         }
> +     }
> +
> +-    *rrdtool_argv =3D PyMem_New(char *, element_count + 1);
> ++    *rrdtool_argv =3D PyMem_New(const char *, element_count + 1);
> +
> +     if (*rrdtool_argv =3D=3D NULL)
> +         return -1;
> +@@ -186,7 +186,7 @@ convert_args(char *command, PyObject *args, char ***=
rrdtool_argv, int *rrdtool_a
> +  * Destroy argument vector.
> +  */
> + static void
> +-destroy_args(char ***rrdtool_argv)
> ++destroy_args(const char ***rrdtool_argv)
> + {
> +     PyMem_Del(*rrdtool_argv);
> +     *rrdtool_argv =3D NULL;
> +@@ -267,7 +267,7 @@ static char _rrdtool_create__doc__[] =3D "Create a n=
ew Round Robin Database.\n\n\
> + static PyObject *
> + _rrdtool_create(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -306,7 +306,7 @@ static char _rrdtool_dump__doc__[] =3D "Dump an RRD =
to XML.\n\n\
> + static PyObject *
> + _rrdtool_dump(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -345,7 +345,7 @@ static char _rrdtool_update__doc__[] =3D "Store a ne=
w set of values into\
> + static PyObject *
> + _rrdtool_update(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -378,7 +378,7 @@ static char _rrdtool_updatev__doc__[] =3D "Store a n=
ew set of values into "\
> + static PyObject *
> + _rrdtool_updatev(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     rrd_info_t *data;
> +@@ -419,7 +419,7 @@ static char _rrdtool_fetch__doc__[] =3D "Fetch data =
from an RRD.\n\n\
> + static PyObject *
> + _rrdtool_fetch(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret, *range_tup, *dsnam_tup, *data_list, *t;
> +     rrd_value_t *data, *datai, dv;
> +@@ -497,7 +497,7 @@ static char _rrdtool_flushcached__doc__[] =3D "Flush=
 RRD files from memory.\n\n\
> + static PyObject *
> + _rrdtool_flushcached(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -592,7 +592,7 @@ static char _rrdtool_graph__doc__[] =3D "Create a gr=
aph based on one or more " \
> + static PyObject *
> + _rrdtool_graph(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int xsize, ysize, i, status;
> +@@ -650,7 +650,7 @@ static char _rrdtool_graphv__doc__[] =3D "Create a g=
raph based on one or more " \
> + static PyObject *
> + _rrdtool_graphv(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     rrd_info_t *data;
> +@@ -695,7 +695,7 @@ static char _rrdtool_xport__doc__[] =3D "Dictionary =
representation of data " \
> + static PyObject *
> + _rrdtool_xport(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int xsize, status;
> +@@ -793,7 +793,7 @@ static char _rrdtool_list__doc__[] =3D "List RRDs in=
 storage.\n\n" \
> + static PyObject *
> + _rrdtool_list(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret, *str;
> +     char *data, *ptr, *end;
> +@@ -855,7 +855,7 @@ static char _rrdtool_tune__doc__[] =3D "Modify some =
basic properties of a " \
> + static PyObject *
> + _rrdtool_tune(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -893,7 +893,7 @@ static char _rrdtool_first__doc__[] =3D "Get the fir=
st UNIX timestamp of the "\
> + static PyObject *
> + _rrdtool_first(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int ts;
> +@@ -928,7 +928,7 @@ static char _rrdtool_last__doc__[] =3D "Get the UNIX=
 timestamp of the most "\
> + static PyObject *
> + _rrdtool_last(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int ts;
> +@@ -965,7 +965,7 @@ static char _rrdtool_resize__doc__[] =3D "Modify the=
 number of rows in a "\
> + static PyObject *
> + _rrdtool_resize(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     int status;
> +@@ -1003,7 +1003,7 @@ static char _rrdtool_info__doc__[] =3D "Extract he=
ader information from an "\
> + static PyObject *
> + _rrdtool_info(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret;
> +     rrd_info_t *data;
> +@@ -1040,7 +1040,7 @@ static char _rrdtool_lastupdate__doc__[] =3D "Retu=
rns datetime and value stored "\
> + static PyObject *
> + _rrdtool_lastupdate(PyObject *Py_UNUSED(self), PyObject *args)
> + {
> +-    char **rrdtool_argv =3D NULL;
> ++    const char **rrdtool_argv =3D NULL;
> +     int    rrdtool_argc =3D 0;
> +     PyObject *ret, *ds_dict, *lastupd;
> +     int status;
> +diff --git a/bindings/ruby/main.c b/bindings/ruby/main.c
> +index e4cc6443d..a036b7fb8 100644
> +--- a/bindings/ruby/main.c
> ++++ b/bindings/ruby/main.c
> +@@ -9,7 +9,7 @@
> +
> + typedef struct string_arr_t {
> +     int       len;
> +-    char    **strings;
> ++    const char    **strings;
> + } string_arr;
> +
> + VALUE     mRRD;
> +@@ -18,12 +18,12 @@ VALUE     rb_eRRDError;
> + typedef int (
> +     *RRDFUNC) (
> +     int argc,
> +-    char **argv);
> ++    const char **argv);
> +
> + typedef rrd_info_t *(
> +     *RRDINFOFUNC) (
> +     int argc,
> +-    char **argv);
> ++    const char **argv);
> +
> + #define RRD_CHECK_ERROR  \
> +     if (rrd_test_error()) \
> +@@ -72,10 +72,10 @@ void string_arr_delete(
> +
> +     /* skip dummy first entry */
> +     for (i =3D 1; i < a.len; i++) {
> +-        free(a.strings[i]);
> ++        free((void *)a.strings[i]);
> +     }
> +
> +-    free(a.strings);
> ++    free((void *)a.strings);
> + }
> +
> + void reset_rrd_state(
> +diff --git a/bindings/tcl/tclrrd.c b/bindings/tcl/tclrrd.c
> +index 2927d9251..58a4cef68 100644
> +--- a/bindings/tcl/tclrrd.c
> ++++ b/bindings/tcl/tclrrd.c
> +@@ -22,6 +22,7 @@
> + #include <stdlib.h>
> + #include "../../src/rrd_tool.h"
> + #include "../../src/rrd_format.h"
> ++#include "../../src/unused.h"
> +
> + /* support pre-8.4 tcl */
> +
> +@@ -41,47 +42,39 @@ extern int Tclrrd_SafeInit(
> +  * Hence, we need to do some preparation before
> +  * calling the rrd library functions.
> +  */
> +-static char **getopt_init(
> ++static const char **getopt_init(
> +     int argc,
> +     CONST84 char *argv[])
> + {
> +-    char    **argv2;
> ++    const char    **argv2;
> +     int       i;
> +
> +     argv2 =3D calloc(argc, sizeof(char *));
> +     for (i =3D 0; i < argc; i++) {
> +-        argv2[i] =3D strdup(argv[i]);
> ++        argv2[i] =3D argv[i];
> +     }
> +     return argv2;
> + }
> +
> + static void getopt_cleanup(
> +-    int argc,
> +-    char **argv2)
> ++    int UNUSED(argc),
> ++    const char **argv2)
> + {
> +-    int       i;
> +-
> +-    for (i =3D 0; i < argc; i++) {
> +-        if (argv2[i] !=3D NULL) {
> +-            free(argv2[i]);
> +-        }
> +-    }
> +-    free(argv2);
> ++    free((void *)argv2);
> + }
> +
> + static void getopt_free_element(
> +-    char *argv2[],
> ++    const char *argv2[],
> +     int argn)
> + {
> +     if (argv2[argn] !=3D NULL) {
> +-        free(argv2[argn]);
> +         argv2[argn] =3D NULL;
> +     }
> + }
> +
> + static void getopt_squieeze(
> +     int *argc,
> +-    char *argv2[])
> ++    const char *argv2[])
> + {
> +     int       i, null_i =3D 0, argc_tmp =3D *argc;
> +
> +@@ -104,7 +97,7 @@ static int Rrd_Create(
> +     CONST84 char *argv[])
> + {
> +     int       argv_i;
> +-    char    **argv2;
> ++    const char    **argv2;
> +     char     *parsetime_error =3D NULL;
> +     time_t    last_up =3D time(NULL) - 10;
> +     long int  long_tmp;
> +@@ -295,7 +288,7 @@ static int Rrd_Flushcached(
> +         return TCL_ERROR;
> +     }
> +
> +-    rrd_flushcached(argc, (char**)argv);
> ++    rrd_flushcached(argc, argv);
> +
> +     if (rrd_test_error()) {
> +         Tcl_AppendResult(interp, "RRD Error: ",
> +@@ -380,7 +373,7 @@ static int Rrd_Update(
> +     CONST84 char *argv[])
> + {
> +     int       argv_i;
> +-    char    **argv2, *template =3D NULL;
> ++    const char    **argv2, *template =3D NULL;
> +
> +     argv2 =3D getopt_init(argc, argv);
> +
> +@@ -391,16 +384,10 @@ static int Rrd_Update(
> +                 Tcl_AppendResult(interp, "RRD Error: option '",
> +                                  argv2[argv_i - 1], "' needs an argumen=
t",
> +                                  (char *) NULL);
> +-                if (template !=3D NULL) {
> +-                    free(template);
> +-                }
> +                 getopt_cleanup(argc, argv2);
> +                 return TCL_ERROR;
> +             }
> +-            if (template !=3D NULL) {
> +-                free(template);
> +-            }
> +-            template =3D strdup(argv2[argv_i]);
> ++            template =3D argv2[argv_i];
> +             getopt_free_element(argv2, argv_i - 1);
> +             getopt_free_element(argv2, argv_i);
> +         } else if (!strcmp(argv2[argv_i], "--")) {
> +@@ -409,9 +396,6 @@ static int Rrd_Update(
> +         } else if (argv2[argv_i][0] =3D=3D '-') {
> +             Tcl_AppendResult(interp, "RRD Error: unknown option '",
> +                              argv2[argv_i], "'", (char *) NULL);
> +-            if (template !=3D NULL) {
> +-                free(template);
> +-            }
> +             getopt_cleanup(argc, argv2);
> +             return TCL_ERROR;
> +         }
> +@@ -422,18 +406,12 @@ static int Rrd_Update(
> +     if (argc < 2) {
> +         Tcl_AppendResult(interp, "RRD Error: needs rrd filename",
> +                          (char *) NULL);
> +-        if (template !=3D NULL) {
> +-            free(template);
> +-        }
> +         getopt_cleanup(argc, argv2);
> +         return TCL_ERROR;
> +     }
> +
> +     rrd_update_r(argv2[1], template, argc - 2, (const char **)argv2 + 2=
);
> +
> +-    if (template !=3D NULL) {
> +-        free(template);
> +-    }
> +     getopt_cleanup(argc, argv2);
> +
> +     if (rrd_test_error()) {
> +@@ -454,7 +432,6 @@ static int Rrd_Info(
> + {
> +     int status =3D TCL_OK;
> +     rrd_info_t *data;
> +-    char **argv2;
> +
> +     /* TODO: support for rrdcached */
> +     if (argc !=3D 2) {
> +@@ -463,9 +440,7 @@ static int Rrd_Info(
> +         return TCL_ERROR;
> +     }
> +
> +-    argv2 =3D getopt_init(argc, argv);
> +-
> +-    data =3D rrd_info_r(argv2[1]);
> ++    data =3D rrd_info_r(argv[1]);
> +
> +     if (data) {
> +       Tcl_SetObjResult(interp, convert_info(data));
> +@@ -477,7 +452,6 @@ static int Rrd_Info(
> +       status =3D TCL_ERROR;
> +     }
> +
> +-    getopt_cleanup(argc, argv2);
> +     return status;
> + }
> +
> +@@ -488,7 +462,6 @@ static int Rrd_Lastupdate(
> +     CONST84 char *argv[])
> + {
> +     time_t    last_update;
> +-    char    **argv2;
> +     char    **ds_namv;
> +     char    **last_ds;
> +     char      s[30];
> +@@ -502,8 +475,7 @@ static int Rrd_Lastupdate(
> +         return TCL_ERROR;
> +     }
> +
> +-    argv2 =3D getopt_init(argc, argv);
> +-    if (rrd_lastupdate_r(argv2[1], &last_update,
> ++    if (rrd_lastupdate_r(argv[1], &last_update,
> +                        &ds_cnt, &ds_namv, &last_ds) =3D=3D 0) {
> +         listPtr =3D Tcl_GetObjResult(interp);
> +         for (i =3D 0; i < ds_cnt; i++) {
> +@@ -527,7 +499,6 @@ static int Rrd_Lastupdate(
> +             free(ds_namv);
> +         }
> +     }
> +-    getopt_cleanup(argc, argv2);
> +     return TCL_OK;
> + }
> +
> +@@ -543,10 +514,8 @@ static int Rrd_Fetch(
> +     char    **ds_namv;
> +     Tcl_Obj  *listPtr;
> +     char      s[30];
> +-    char    **argv2;
> +
> +-    argv2 =3D getopt_init(argc, argv);
> +-    if (rrd_fetch(argc, argv2, &start, &end, &step,
> ++    if (rrd_fetch(argc, argv, &start, &end, &step,
> +                   &ds_cnt, &ds_namv, &data) !=3D -1) {
> +         datai =3D data;
> +         listPtr =3D Tcl_GetObjResult(interp);
> +@@ -562,7 +531,6 @@ static int Rrd_Fetch(
> +         free(ds_namv);
> +         free(data);
> +     }
> +-    getopt_cleanup(argc, argv2);
> +
> +     if (rrd_test_error()) {
> +         Tcl_AppendResult(interp, "RRD Error: ",
> +@@ -590,7 +558,7 @@ static int Rrd_Graph(
> +     int       rc, xsize, ysize;
> +     double    ymin, ymax;
> +     char      dimensions[50];
> +-    char    **argv2;
> ++    const char    **argv2;
> +     CONST84 char *save;
> +
> +     /*
> +@@ -692,11 +660,7 @@ static int Rrd_Tune(
> +     int argc,
> +     CONST84 char *argv[])
> + {
> +-    char    **argv2;
> +-
> +-    argv2 =3D getopt_init(argc, argv);
> +-    rrd_tune(argc, argv2);
> +-    getopt_cleanup(argc, argv2);
> ++    rrd_tune(argc, argv);
> +
> +     if (rrd_test_error()) {
> +         Tcl_AppendResult(interp, "RRD Error: ",
> +@@ -716,11 +680,7 @@ static int Rrd_Resize(
> +     int argc,
> +     CONST84 char *argv[])
> + {
> +-    char    **argv2;
> +-
> +-    argv2 =3D getopt_init(argc, argv);
> +-    rrd_resize(argc, argv2);
> +-    getopt_cleanup(argc, argv2);
> ++    rrd_resize(argc, argv);
> +
> +     if (rrd_test_error()) {
> +         Tcl_AppendResult(interp, "RRD Error: ",
> +@@ -740,11 +700,7 @@ static int Rrd_Restore(
> +     int argc,
> +     CONST84 char *argv[])
> + {
> +-    char    **argv2;
> +-
> +-    argv2 =3D getopt_init(argc, argv);
> +-    rrd_restore(argc, argv2);
> +-    getopt_cleanup(argc, argv2);
> ++    rrd_restore(argc, argv);
> +
> +     if (rrd_test_error()) {
> +         Tcl_AppendResult(interp, "RRD Error: ",
> +diff --git a/src/optparse.c b/src/optparse.c
> +index 9040ba8b2..79a3efe11 100644
> +--- a/src/optparse.c
> ++++ b/src/optparse.c
> +@@ -10,7 +10,7 @@
> + #define options_argv(i) \
> +     ((i) < options->argc ? options->argv[i] : NULL)
> +
> +-void optparse_init(struct optparse *options, int argc, char **argv)
> ++void optparse_init(struct optparse *options, int argc, const char **arg=
v)
> + {
> +     options->argv =3D argv;
> +     options->argc =3D argc;
> +@@ -42,7 +42,7 @@ is_longopt(const char *arg)
> + static void
> + permute(struct optparse *options, int index)
> + {
> +-    char *nonoption =3D options->argv[index];
> ++    const char *nonoption =3D options->argv[index];
> +     for (int i =3D index; i < options->optind - 1; i++)
> +         options->argv[i] =3D options->argv[i + 1];
> +     options->argv[options->optind - 1] =3D nonoption;
> +@@ -67,7 +67,7 @@ int optparse(struct optparse *options, const char *opt=
string)
> +     options->errmsg[0] =3D '\0';
> +     options->optopt =3D 0;
> +     options->optarg =3D NULL;
> +-    char *option =3D options_argv(options->optind);
> ++    const char *option =3D options_argv(options->optind);
> +     if (option =3D=3D NULL) {
> +         return -1;
> +     } else if (is_dashdash(option)) {
> +@@ -88,7 +88,7 @@ int optparse(struct optparse *options, const char *opt=
string)
> +     option +=3D options->subopt + 1;
> +     options->optopt =3D option[0];
> +     int type =3D argtype(optstring, option[0]);
> +-    char *next =3D options_argv(options->optind + 1);
> ++    const char *next =3D options_argv(options->optind + 1);
> +     switch (type) {
> +     case -1:
> +         opterror(options, "invalid option -- '%c'", option[0]);
> +@@ -128,10 +128,10 @@ int optparse(struct optparse *options, const char =
*optstring)
> +     return 0;
> + }
> +
> +-char *optparse_arg(struct optparse *options)
> ++const char *optparse_arg(struct optparse *options)
> + {
> +     options->subopt =3D 0;
> +-    char *option =3D options->argv[options->optind];
> ++    const char *option =3D options->argv[options->optind];
> +     if (option !=3D NULL)
> +         options->optind++;
> +     return option;
> +@@ -222,7 +222,7 @@ optparse_long(struct optparse *options,
> +               int *longindex)
> + {
> + //    printf("%i < %i\n",options->optind,options->argc);
> +-    char *option =3D options_argv(options->optind);
> ++    const char *option =3D options_argv(options->optind);
> +     if (option =3D=3D NULL) {
> +         return -1;
> +     } else if (is_dashdash(option)) {
> +diff --git a/src/optparse.h b/src/optparse.h
> +index c4b0ec19c..7a0bb3885 100644
> +--- a/src/optparse.h
> ++++ b/src/optparse.h
> +@@ -44,7 +44,7 @@
> +  */
> +
> + struct optparse {
> +-    char **argv;
> ++    const char **argv;
> +     int argc;
> +     int permute;
> +     int optind;
> +@@ -65,7 +65,7 @@ struct optparse_long {
> + /**
> +  * Initializes the parser state.
> +  */
> +-void optparse_init(struct optparse *options, int argc, char **argv);
> ++void optparse_init(struct optparse *options, int argc, const char **arg=
v);
> +
> + /**
> +  * Read the next option in the argv array.
> +@@ -98,6 +98,6 @@ optparse_long(struct optparse *options,
> +  * subcommand returned by optparse_arg(). This function allows you to
> +  * ignore the value of optind.
> +  */
> +-char *optparse_arg(struct optparse *options);
> ++const char *optparse_arg(struct optparse *options);
> +
> + #endif
> +diff --git a/src/rrd.h b/src/rrd.h
> +index 184887ccc..b40f9a449 100644
> +--- a/src/rrd.h
> ++++ b/src/rrd.h
> +@@ -155,10 +155,10 @@ extern    "C" {
> + /* main function blocks */
> +     int       rrd_create(
> +     int,
> +-    char **);
> ++    const char **);
> +     rrd_info_t *rrd_info(
> +     int,
> +-    char **);
> ++    const char **);
> +     rrd_info_t *rrd_info_push(
> +     rrd_info_t *,
> +     char *,
> +@@ -170,19 +170,19 @@ extern    "C" {
> +     rrd_info_t *);
> +     char     *rrd_list(
> +     int,
> +-    char **);
> ++    const char **);
> +     char     *rrd_list_r(
> +     int,
> +-    char *dirname);
> ++    const char *dirname);
> +     int       rrd_update(
> +     int,
> +-    char **);
> ++    const char **);
> +     rrd_info_t *rrd_update_v(
> +     int,
> +-    char **);
> ++    const char **);
> +     int       rrd_graph(
> +     int,
> +-    char **,
> ++    const char **,
> +     char ***,
> +     int *,
> +     int *,
> +@@ -191,11 +191,11 @@ extern    "C" {
> +     double *);
> +     rrd_info_t *rrd_graph_v(
> +     int,
> +-    char **);
> ++    const char **);
> +
> +     int       rrd_fetch(
> +     int,
> +-    char **,
> ++    const char **,
> +     time_t *,
> +     time_t *,
> +     unsigned long *,
> +@@ -204,32 +204,32 @@ extern    "C" {
> +     rrd_value_t **);
> +     int       rrd_restore(
> +     int,
> +-    char **);
> ++    const char **);
> +     int       rrd_dump(
> +     int,
> +-    char **);
> ++    const char **);
> +     int       rrd_tune(
> +     int,
> +-    char **);
> ++    const char **);
> +     time_t    rrd_last(
> +     int,
> +-    char **);
> ++    const char **);
> +     int       rrd_lastupdate(
> +     int argc,
> +-    char **argv);
> ++    const char **argv);
> +     time_t    rrd_first(
> +     int,
> +-    char **);
> ++    const char **);
> +     int       rrd_resize(
> +     int,
> +-    char **);
> ++    const char **);
> +     char     *rrd_strversion(
> +     void);
> +     double    rrd_version(
> +     void);
> +     int       rrd_xport(
> +     int,
> +-    char **,
> ++    const char **,
> +     int *,
> +     time_t *,
> +     time_t *,
> +@@ -239,7 +239,7 @@ extern    "C" {
> +     rrd_value_t **);
> +     int       rrd_flushcached(
> +     int argc,
> +-    char **argv);
> ++    const char **argv);
> +
> +     void      rrd_freemem(
> +     void *mem);
> +@@ -323,7 +323,7 @@ extern    "C" {
> +     const char **argv);
> +     int       rrd_dump_opt_r(
> +     const char *filename,
> +-    char *outname,
> ++    const char *outname,
> +     int opt_noheader);
> +     int       rrd_dump_r(
> +     const char *filename,
> +diff --git a/src/rrd_cgi.c b/src/rrd_cgi.c
> +index b82c310db..14a4f511a 100644
> +--- a/src/rrd_cgi.c
> ++++ b/src/rrd_cgi.c
> +@@ -102,7 +102,7 @@ static char *rrdstrip(
> + static char *scanargs(
> +     char *line,
> +     int *argc,
> +-    char ***args);
> ++    const char ***args);
> +
> + /* format at-time specified times using strftime */
> + static char *printstrftime(
> +@@ -317,7 +317,7 @@ static const char *putvar(
> + }
> +
> + /* expand those RRD:* directives that can be used recursively */
> +-static char *rrd_expand_vars(
> ++static const char *rrd_expand_vars(
> +     char *buffer)
> + {
> +     int       i;
> +@@ -434,7 +434,7 @@ static int readfile(
> +
> + int main(
> +     int argc,
> +-    char *argv[])
> ++    const char *argv[])
> + {
> +     char     *buffer;
> +     long      i;
> +@@ -926,7 +926,7 @@ static char *drawgraph(
> +     }
> +     calfree();
> +     if (rrd_graph
> +-        (argc + 1, (char **) args - 1, &calcpr, &xsize, &ysize, NULL, &=
ymin,
> ++        (argc + 1, args - 1, &calcpr, &xsize, &ysize, NULL, &ymin,
> +          &ymax) !=3D -1) {
> +         return stralloc(calcpr[0]);
> +     } else {
> +@@ -973,7 +973,7 @@ static char *printtimelast(
> +         /* not raising argc in step with args - 1 since the last argume=
nt
> +            will be used below for strftime  */
> +
> +-        last =3D rrd_last(argc, (char **) args - 1);
> ++        last =3D rrd_last(argc, args - 1);
> +         if (rrd_test_error()) {
> +             char      err[4096];
> +
> +@@ -1027,7 +1027,7 @@ static char *printtimenow(
> + static char *scanargs(
> +     char *line,
> +     int *argument_count,
> +-    char ***arguments)
> ++    const char ***arguments)
> + {
> +     char     *getP;     /* read cursor */
> +     char     *putP;     /* write cursor */
> +@@ -1039,8 +1039,8 @@ static char *scanargs(
> +
> +     /* local array of arguments while parsing */
> +     int       argc =3D 1;
> +-    char    **argv;
> +-    char    **argv_tmp; /* temp variable for realloc() */
> ++    const char    **argv;
> ++    const char    **argv_tmp; /* temp variable for realloc() */
> +
> + #ifdef DEBUG_PARSER
> +     printf("<-- scanargs(%s) -->\n", line);
> +@@ -1051,7 +1051,7 @@ static char *scanargs(
> +
> +     /* create initial argument array of char pointers */
> +     argsz =3D 32;
> +-    argv =3D (char **) malloc(argsz * sizeof(char *));
> ++    argv =3D malloc(argsz * sizeof(char *));
> +     if (!argv) {
> +         return NULL;
> +     }
> +@@ -1146,7 +1146,7 @@ static char *scanargs(
> +         if (argc =3D=3D argsz - 2) {
> +             /* resize argument array */
> +             argsz *=3D 2;
> +-            argv_tmp =3D (char **) rrd_realloc(argv, argsz * sizeof(cha=
r *));
> ++            argv_tmp =3D rrd_realloc(argv, argsz * sizeof(char *));
> +             if (*argv_tmp =3D=3D NULL) {
> +                 return NULL;
> +             }
> +@@ -1213,7 +1213,7 @@ static int parse(
> +     /* the name of the vairable ... */
> +     char     *val;
> +     long      valln;
> +-    char    **args;
> ++    const char    **args;
> +     char     *end;
> +     long      end_offset;
> +     int       argc;
> +@@ -1264,7 +1264,7 @@ static int parse(
> +         /* make sure we do not shrink the mallocd block */
> +         size_t    newbufsize =3D i + strlen(end) + valln + 1;
> +
> +-        *buf =3D (char *) rrd_realloc(*buf, newbufsize);
> ++        *buf =3D rrd_realloc(*buf, newbufsize);
> +
> +         if (*buf =3D=3D NULL) {
> +             perror("Realoc buf:");
> +diff --git a/src/rrd_create.c b/src/rrd_create.c
> +index f9bad0866..919b4195a 100644
> +--- a/src/rrd_create.c
> ++++ b/src/rrd_create.c
> +@@ -76,7 +76,7 @@ static void parseGENERIC_DS(
> +
> + int rrd_create(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"start", 'b', OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_daemon.c b/src/rrd_daemon.c
> +index 751798aa1..21c38a11d 100644
> +--- a/src/rrd_daemon.c
> ++++ b/src/rrd_daemon.c
> +@@ -1877,7 +1877,7 @@ static int handle_request_tune(
> +     HANDLER_PROTO)
> + {                       /* {{{ */
> +     int       status;
> +-    char**    argv =3D NULL;
> ++    const char**    argv =3D NULL;
> +     int       argc, argc_tmp;
> +     char*     i;
> +     int       rc;
> +@@ -1916,7 +1916,7 @@ static int handle_request_tune(
> +         goto done;
> +     }
> +
> +-    if ((argv =3D (char **) malloc(argc * sizeof(char*))) =3D=3D NULL) =
{
> ++    if ((argv =3D malloc(argc * sizeof(char*))) =3D=3D NULL) {
> +         rc =3D send_response(sock, RESP_ERR, "%s\n", rrd_strerror(ENOME=
M));
> +         goto done;
> +     }
> +@@ -1927,7 +1927,7 @@ static int handle_request_tune(
> +         argc_tmp +=3D 1;
> +     }
> +
> +-    status =3D rrd_tune_r(file, argc, (const char **)argv);
> ++    status =3D rrd_tune_r(file, argc, argv);
> +     if (status !=3D 0) {
> +         rc =3D send_response(sock, RESP_ERR, "Got error %s\n", rrd_get_=
error());
> +         goto done;
> +@@ -1935,7 +1935,7 @@ static int handle_request_tune(
> +     rc =3D send_response(sock, RESP_OK, "Success\n");
> +     done:
> +     free(file);
> +-    free(argv);
> ++    free((void *)argv);
> +     return rc;
> + }
> +
> +@@ -4505,7 +4505,7 @@ static int cleanup(
> +
> + static int read_options(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {                       /* {{{ */
> +     struct optparse_long longopts[] =3D {
> +         {NULL, 'a', OPTPARSE_REQUIRED},
> +@@ -5050,7 +5050,7 @@ static int read_options(
> +
> + int main(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     int       status;
> +
> +diff --git a/src/rrd_dump.c b/src/rrd_dump.c
> +index a4490d594..c58e0ee4a 100644
> +--- a/src/rrd_dump.c
> ++++ b/src/rrd_dump.c
> +@@ -497,7 +497,7 @@ static size_t rrd_dump_opt_cb_fileout(
> +
> + int rrd_dump_opt_r(
> +     const char *filename,
> +-    char *outname,
> ++    const char *outname,
> +     int opt_noheader)
> + {
> +     FILE     *out_file;
> +@@ -543,7 +543,7 @@ int rrd_dump_r(
> +
> + int rrd_dump(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     int       opt;
> +     struct optparse_long longopts[] =3D {
> +diff --git a/src/rrd_fetch.c b/src/rrd_fetch.c
> +index c739bfc45..54780f19b 100644
> +--- a/src/rrd_fetch.c
> ++++ b/src/rrd_fetch.c
> +@@ -61,7 +61,7 @@
> +
> + int rrd_fetch(
> +     int argc,
> +-    char **argv,
> ++    const char **argv,
> +     time_t *start,
> +     time_t *end,        /* which time frame do you want ?
> +                          * will be changed to represent reality */
> +diff --git a/src/rrd_first.c b/src/rrd_first.c
> +index a696c5c38..f3dde5404 100644
> +--- a/src/rrd_first.c
> ++++ b/src/rrd_first.c
> +@@ -13,7 +13,7 @@
> +
> + time_t rrd_first(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"rraindex", 129, OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_flushcached.c b/src/rrd_flushcached.c
> +index 090bca749..3bf6cd29d 100644
> +--- a/src/rrd_flushcached.c
> ++++ b/src/rrd_flushcached.c
> +@@ -22,7 +22,7 @@
> + #include "rrd_tool.h"
> + #include "rrd_client.h"
> +
> +-int rrd_flushcached (int argc, char **argv)
> ++int rrd_flushcached (int argc, const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"daemon", 'd', OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_graph.c b/src/rrd_graph.c
> +index b32d45085..46511e9a3 100644
> +--- a/src/rrd_graph.c
> ++++ b/src/rrd_graph.c
> +@@ -4607,7 +4607,7 @@ int scan_for_col(
> + /* Now just a wrapper around rrd_graph_v */
> + int rrd_graph(
> +     int argc,
> +-    char **argv,
> ++    const char **argv,
> +     char ***prdata,
> +     int *xsize,
> +     int *ysize,
> +@@ -4690,7 +4690,7 @@ int rrd_graph(
> +
> + rrd_info_t *rrd_graph_v(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     image_desc_t im;
> +     rrd_info_t *grinfo;
> +@@ -4953,7 +4953,7 @@ void rrd_graph_init(
> +
> + void rrd_graph_options(
> +     int argc,
> +-    char *argv[],
> ++    const char **argv,
> +     struct optparse *poptions,
> +     image_desc_t *im)
> + {
> +diff --git a/src/rrd_graph.h b/src/rrd_graph.h
> +index 4df32ec66..083cf3800 100644
> +--- a/src/rrd_graph.h
> ++++ b/src/rrd_graph.h
> +@@ -473,12 +473,12 @@ void      time_clean(
> +
> + void      rrd_graph_options(
> +     int,
> +-    char **,
> ++    const char **,
> +     struct optparse *,
> +     image_desc_t *);
> + void      rrd_graph_script(
> +     int,
> +-    char **,
> ++    const char **,
> +     image_desc_t *const,
> +     int);
> + int       rrd_graph_color(
> +diff --git a/src/rrd_graph_helper.c b/src/rrd_graph_helper.c
> +index 99cdefa65..ba90e1a6c 100644
> +--- a/src/rrd_graph_helper.c
> ++++ b/src/rrd_graph_helper.c
> +@@ -1952,7 +1952,7 @@ static int parse_xport(
> +
> + void rrd_graph_script(
> +     int argc,
> +-    char *argv[],
> ++    const char **argv,
> +     image_desc_t *const im,
> +     int optno)
> + {
> +diff --git a/src/rrd_info.c b/src/rrd_info.c
> +index c0c6f68c7..eb0d4e4de 100644
> +--- a/src/rrd_info.c
> ++++ b/src/rrd_info.c
> +@@ -82,7 +82,7 @@ rrd_info_t
> +
> + rrd_info_t *rrd_info(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"daemon", 'd', OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_last.c b/src/rrd_last.c
> +index 026a1e828..1aae72512 100644
> +--- a/src/rrd_last.c
> ++++ b/src/rrd_last.c
> +@@ -11,7 +11,7 @@
> +
> + time_t rrd_last(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     char *opt_daemon =3D NULL;
> +     time_t lastupdate;
> +diff --git a/src/rrd_lastupdate.c b/src/rrd_lastupdate.c
> +index ab30dcf67..4f7f4770e 100644
> +--- a/src/rrd_lastupdate.c
> ++++ b/src/rrd_lastupdate.c
> +@@ -14,7 +14,7 @@
> + #include "rrd_client.h"
> + #include <stdarg.h>
> +
> +-int rrd_lastupdate (int argc, char **argv)
> ++int rrd_lastupdate (int argc, const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"daemon", 'd', OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_list.c b/src/rrd_list.c
> +index e743b9b7d..6e96220ea 100644
> +--- a/src/rrd_list.c
> ++++ b/src/rrd_list.c
> +@@ -37,7 +37,7 @@ static char *move_past_prefix(const char *prefix, cons=
t char *string)
> +       return (char *)&(string[index]);
> + }
> +
> +-static char *rrd_list_rec(int recursive, char *root, char *dirname)
> ++static char *rrd_list_rec(int recursive, const char *root, const char *=
dirname)
> + {
> + #define SANE_ASPRINTF2(_dest_str, _format, ...)                        =
       \
> +       if (asprintf(&_dest_str, _format, __VA_ARGS__) =3D=3D -1) {      =
   \
> +@@ -138,7 +138,7 @@ static char *rrd_list_rec(int recursive, char *root,=
 char *dirname)
> +       return out;
> + }
> +
> +-char *rrd_list_r(int recursive, char *dirname)
> ++char *rrd_list_r(int recursive, const char *dirname)
> + {
> + #define SANE_ASPRINTF(_dest_str, _format, ...)                         =
       \
> +       if (asprintf(&_dest_str, _format, __VA_ARGS__) =3D=3D -1) {      =
   \
> +@@ -240,7 +240,7 @@ char *rrd_list_r(int recursive, char *dirname)
> +       return rrd_list_rec(recursive, dirname, dirname);
> + }
> +
> +-char *rrd_list(int argc, char **argv)
> ++char *rrd_list(int argc, const char **argv)
> + {
> +       char *opt_daemon =3D NULL;
> +       int status;
> +diff --git a/src/rrd_modify.c b/src/rrd_modify.c
> +index a2b07f640..70ac9e77f 100644
> +--- a/src/rrd_modify.c
> ++++ b/src/rrd_modify.c
> +@@ -1297,7 +1297,7 @@ static int add_rras(const rrd_t *in, rrd_t *out, c=
onst int *ds_map,
> + }
> +
> + int handle_modify(const rrd_t *in, const char *outfilename,
> +-                int argc, char **argv, int optidx,
> ++                int argc, const char **argv, int optidx,
> +                 int newstep) {
> +     // parse add/remove options
> +     int rc =3D -1;
> +diff --git a/src/rrd_modify.h b/src/rrd_modify.h
> +index 52d8789be..64a39926e 100644
> +--- a/src/rrd_modify.h
> ++++ b/src/rrd_modify.h
> +@@ -28,7 +28,7 @@ typedef struct {
> + } rra_mod_op_t;
> +
> + int handle_modify(const rrd_t *in, const char *outfilename,
> +-                int argc, char **argv, int optind,
> ++                int argc, const char **argv, int optind,
> +                 int newstep);
> +
> + typedef union {
> +diff --git a/src/rrd_resize.c b/src/rrd_resize.c
> +index fb75d81ff..742e6d141 100644
> +--- a/src/rrd_resize.c
> ++++ b/src/rrd_resize.c
> +@@ -12,9 +12,9 @@
> +
> + int rrd_resize(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +-    char     *infilename, outfilename[11] =3D "resize.rrd";
> ++    const char     *infilename, outfilename[11] =3D "resize.rrd";
> +     rrd_t     rrdold, rrdnew;
> +     rrd_value_t buffer;
> +     int       version;
> +diff --git a/src/rrd_restore.c b/src/rrd_restore.c
> +index 85d481e0c..ebef5efe8 100644
> +--- a/src/rrd_restore.c
> ++++ b/src/rrd_restore.c
> +@@ -1378,7 +1378,7 @@ int write_file(
> +
> + int rrd_restore(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"range-check", 'r', OPTPARSE_NONE},
> +diff --git a/src/rrd_tool.c b/src/rrd_tool.c
> +index cc6119d9a..56321ee1a 100644
> +--- a/src/rrd_tool.c
> ++++ b/src/rrd_tool.c
> +@@ -22,16 +22,16 @@
> +
> +
> + static void PrintUsage(
> +-    char *cmd);
> ++    const char *cmd);
> + static int CountArgs(
> +     char *aLine);
> + static int CreateArgs(
> ++    const char *,
> +     char *,
> +-    char *,
> +-    char **);
> ++    const char **);
> + static int HandleInputLine(
> +     int,
> +-    char **,
> ++    const char **,
> +     FILE *);
> + int       RemoteMode =3D 0;
> + int       ChangeRoot =3D 0;
> +@@ -42,7 +42,7 @@ int       ChangeRoot =3D 0;
> +
> +
> + static void PrintUsage(
> +-    char *cmd)
> ++    const char *cmd)
> + {
> +
> +     const char *help_main =3D
> +@@ -443,11 +443,11 @@ static char *fgetslong(
> +
> + int main(
> +     int argc,
> +-    char *argv[])
> ++    const char *argv[])
> + {
> +-    char    **myargv;
> ++    const char    **myargv;
> +     char     *aLine;
> +-    char     *firstdir =3D "";
> ++    const char     *firstdir =3D "";
> +
> + #ifdef MUST_DISABLE_SIGFPE
> +     signal(SIGFPE, SIG_IGN);
> +@@ -526,7 +526,7 @@ int main(
> +                 printf("ERROR: not enough arguments\n");
> +                 continue;
> +             }
> +-            if ((myargv =3D (char **) malloc((argc + 1) *
> ++            if ((myargv =3D malloc((argc + 1) *
> +                                            sizeof(char *))) =3D=3D NULL=
) {
> +                 perror("malloc");
> +                 exit(1);
> +@@ -572,7 +572,7 @@ int main(
> +    resolving them portably is not really simple. */
> + static int HandleInputLine(
> +     int argc,
> +-    char **argv,
> ++    const char **argv,
> +     FILE * out)
> + {
> + #if defined(HAVE_OPENDIR) && defined (HAVE_READDIR)
> +@@ -887,12 +887,12 @@ static int CountArgs(
> +  * CreateArgs - take a string (aLine) and tokenize
> +  */
> + static int CreateArgs(
> +-    char *pName,
> ++    const char *pName,
> +     char *aLine,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     char     *getP, *putP;
> +-    char    **pargv =3D argv;
> ++    const char    **pargv =3D argv;
> +     char      Quote =3D 0;
> +     int       inArg =3D 0;
> +     int       len;
> +diff --git a/src/rrd_tune.c b/src/rrd_tune.c
> +index 198817f37..dd3f3f7cb 100644
> +--- a/src/rrd_tune.c
> ++++ b/src/rrd_tune.c
> +@@ -71,7 +71,7 @@ static int set_hwsmootharg(
> +
> + int rrd_tune(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     char      *opt_daemon =3D NULL;
> +     const char *in_filename =3D NULL;
> +diff --git a/src/rrd_update.c b/src/rrd_update.c
> +index fbbe2820a..bb9a0602c 100644
> +--- a/src/rrd_update.c
> ++++ b/src/rrd_update.c
> +@@ -299,7 +299,7 @@ static void initialize_time(
> +
> + rrd_info_t *rrd_update_v(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"template",          't', OPTPARSE_REQUIRED},
> +@@ -674,7 +674,7 @@ static int rrd_template_update(const char *filename,=
  /* {{{ */
> +
> + int rrd_update(
> +     int argc,
> +-    char **argv)
> ++    const char **argv)
> + {
> +     struct optparse_long longopts[] =3D {
> +         {"template",          't', OPTPARSE_REQUIRED},
> +diff --git a/src/rrd_xport.c b/src/rrd_xport.c
> +index d15d33dd9..93c02f926 100644
> +--- a/src/rrd_xport.c
> ++++ b/src/rrd_xport.c
> +@@ -73,7 +73,7 @@ static int rrd_xport_format_addprints(
> +
> + int rrd_xport(
> +     int argc,
> +-    char **argv,
> ++    const char **argv,
> +     int UNUSED(*xsize),
> +     time_t *start,
> +     time_t *end,        /* which time frame do you want ?
> +diff --git a/src/rrdupdate.c b/src/rrdupdate.c
> +index cbbf48cc1..e368516c8 100644
> +--- a/src/rrdupdate.c
> ++++ b/src/rrdupdate.c
> +@@ -20,19 +20,20 @@ int main(
> +     int argc,
> +     char **argv)
> + {
> ++    const char **cargv =3D (const char **)argv;
> +     char *name=3Dbasename(argv[0]);
> +     rrd_info_t *info;
> +
> +     if (!strcmp(name, "rrdcreate")) {
> +-        rrd_create(argc, argv);
> ++        rrd_create(argc, cargv);
> +     }
> +     else if (!strcmp(name, "rrdinfo")) {
> +-         info=3Drrd_info(argc, argv);
> ++         info=3Drrd_info(argc, cargv);
> +          rrd_info_print(info);
> +          rrd_info_free(info);
> +     }
> +     else {
> +-        rrd_update(argc, argv);
> ++        rrd_update(argc, cargv);
> +     }
> +
> +     if (rrd_test_error()) {
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.8.0.bb
> index cbe1af2854f2..425a98f0c09b 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
> @@ -11,6 +11,7 @@ PV =3D "1.8.0"
>
>  SRC_URI =3D "\
>      git://github.com/oetiker/rrdtool-1.x.git;protocol=3Dhttps;branch=3Dm=
aster \
> +    file://b76e3c578f1e9f582e9c28f50d82b1f569602075.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110682): https://lists.openembedded.org/g/openembedde=
d-devel/message/110682
> Mute This Topic: https://lists.openembedded.org/mt/106473144/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

