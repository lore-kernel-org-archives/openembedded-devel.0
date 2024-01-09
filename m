Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DA1C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:36:11 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.19489.1704814564092731173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhgwwmQ2;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-20503dc09adso2253260fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 07:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704814563; x=1705419363; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQK0q42CtVafTUHSzSNoMMECmclO9xrGRkY7xxy/yMU=;
        b=LhgwwmQ2oh4tyid3fGFMNPmYpumOV4g5fWhdyGpZT7ER9NOjoexRVDzSCcZnm1tEi9
         Bfv2tiSCOAkdbn6oU+zD1ajdNxFrucMc0k2XdfKflqCAWmAPxm/PTk3w/Xk033dynp/7
         joIMqOvL5faCKnQ43Pmu2mB0sNn2ecPl32x8WNkir63hbJTSsaRBZpd6lbWNR8HZwsam
         gN61R4zoYaQK7ArstKBlL50pu09kzXJJ8rF+v2Q/xKXglvmjgcWWb/vsXGVaLBZOzb72
         bJr0A1eiLk7ME16C65Q4iXVXMrJhHBnpWdYQTD6y24Y9jptL8uA1HxIF2NOFOyR/f1As
         uq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814563; x=1705419363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQK0q42CtVafTUHSzSNoMMECmclO9xrGRkY7xxy/yMU=;
        b=sNMqBP47W7C55TDRWoOJ62Gypyf+lRvQT1s/9mKDRKD32jdyOkpMcNXkKo4MuPwCI4
         IPVZCSnDK9QO1h5uZ+QBsa/2Lmwt+sbdzaj6vGn6UGFJkaKV/VEt2rwkP0/jBvWf3QJH
         61/kr1bryOBf/PTnQqKpMiPP0ej4PlIzAT8RcqeCumh2YllgLp89mHPWtsyL7Cs/evn1
         Y1bY5hYyOdtrlBPRR1TOVwpQW5bLCpqjX5yJge03So4mRwIft15yqMe8MuHD7bFEBLSw
         VFx3hlz252tFUGoRLRRuMoGB4QNS4ewZub0M1Pk2MEaIb2mvIR4NUv06/FPcPzePsnFl
         YAkg==
X-Gm-Message-State: AOJu0YxaZFdKun7GdvEkbtH3P0iyJSe6aWe+ekrRM5ry51upgz4oAANC
	8Jtnv+/5rVHAGIXG1/1c7S+WF8JMyF3jp4f1jPTRHHe8z0fnTQ==
X-Google-Smtp-Source: AGHT+IGT2K5fo1dPT6YW7F7X4lHfrKODFPws4Z3X7Jf07V5hFJtKtHmjG+XgiW7hAbY2uCYX3BmNIw+T6ukYLvldCKY=
X-Received: by 2002:a05:6870:e8c5:b0:204:4d6c:e282 with SMTP id
 r5-20020a056870e8c500b002044d6ce282mr6976643oan.20.1704814563152; Tue, 09 Jan
 2024 07:36:03 -0800 (PST)
MIME-Version: 1.0
References: <863a4972681a395e0e73ac1081b3f065b92592d0.1704813698.git.joerg.sommer@navimatix.de>
In-Reply-To: <863a4972681a395e0e73ac1081b3f065b92592d0.1704813698.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 07:35:37 -0800
Message-ID: <CAMKF1spPWTvai-tJKo1CvM_JYWTgrGb3qAwdbMPKBsUxYkLTiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] bonnie++: New recipe for version 2.0
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108200

ERROR: bonnie++-2.00a-r0 do_patch: QA Issue: Fuzz detected:

Applying patch makefile-use-link-for-helper.patch
patching file Makefile.in
Hunk #1 succeeded at 11 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify bonnie++
    devtool finish --force-patch-refresh bonnie++ <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: bonnie++-2.00a-r0 do_patch: Fatal QA errors were found, failing task=
.

On Tue, Jan 9, 2024 at 7:22=E2=80=AFAM J=C3=B6rg Sommer via lists.openembed=
ded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Newer versions of bonnie get published on
> <https://doc.coker.com.au/projects/bonnie/>. Unfortunately, the new versi=
on
> doesn't compile with g++ 11 which requires *fix-csv2html-data.patch* and
> configure fails due to cross compilation which gets fixed
> with *fix-configure-lfs.patch*
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../bonnie/bonnie++/fix-configure-lfs.patch   |  39 ++++
>  .../bonnie/bonnie++/fix-csv2html-data.patch   | 183 ++++++++++++++++++
>  .../makefile-use-link-for-helper.patch        |  24 +++
>  .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
>  4 files changed, 279 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configu=
re-lfs.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2htm=
l-data.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-us=
e-link-for-helper.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
>
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.=
patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> new file mode 100644
> index 000000000..af20acdcd
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge=
_requests/3/diffs?commit_id=3D4ffece51791ba75ddca2e664cdce726cc40c92d3]
> +
> +diff --git i/configure.in w/configure.in
> +index 080e40c..f2a2bbe 100644
> +--- i/configure.in
> ++++ w/configure.in
> +@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }
> +   , thread_ldflags=3D"-lpthread"
> +   , thread_ldflags=3D"-pthread")
> +
> +-AC_SUBST(large_file)
> +-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> ++AC_ARG_ENABLE(lfs,
> ++      [  --disable-lfs  disable large file support],
> ++      LFS_CHOICE=3D$enableval, LFS_CHOICE=3Dcheck)
> ++
> ++if test "$LFS_CHOICE" =3D yes; then
> ++   bonniepp_cv_large_file=3Dyes
> ++elif test "$LFS_CHOICE" =3D check; then
> ++   AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], bonniepp_c=
v_large_file,
> ++      AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> + #define _LARGEFILE64_SOURCE
> + #endif
> + #include <stdio.h>
> +@@ -118,8 +125,12 @@ int main () {
> +   }
> +   close(fd);
> +   return 0;
> +-}], large_file=3D"yes")
> +-if [[ -n "$large_file" ]]; then
> ++}], bonniepp_cv_large_file=3D"yes"))
> ++fi
> ++
> ++AC_SUBST(large_file)
> ++
> ++if [[ -n "$bonniepp_cv_large_file" ]]; then
> +    large_file=3D"#define _LARGEFILE64_SOURCE"
> + fi
> +
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.=
patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> new file mode 100644
> index 000000000..4b37b8d65
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> @@ -0,0 +1,183 @@
> +commit 7e9433a56f22426b11cbc9bd80e0debca67c893b
> +Author: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Date:   Mon Jun 26 12:38:30 2023 +0200
> +
> +    csv2html: Explicitly reference data in top level
> +
> +    With g++ 11 *data* became ambiguous with [std::data][1]. Therefore i=
t's
> +    needed to explicitly address the variable from the top level scope.
> +
> +    [1] https://en.cppreference.com/w/cpp/iterator/data
> +
> +Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge=
_requests/3/diffs?commit_id=3Dfb13a71d56dab8aaa39233fcaaedfb0ba4ad647d]
> +
> +diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp
> +index e9d9c50..652e330 100644
> +--- a/bon_csv2html.cpp
> ++++ b/bon_csv2html.cpp
> +@@ -87,8 +87,8 @@ int main(int argc, char **argv)
> +     read_in(buf);
> +   }
> +
> +-  props =3D new PPCCHAR[data.size()];
> +-  for(i =3D 0; i < data.size(); i++)
> ++  props =3D new PPCCHAR[::data.size()];
> ++  for(i =3D 0; i < ::data.size(); i++)
> +   {
> +     props[i] =3D new PCCHAR[MAX_ITEMS];
> +     props[i][0] =3D NULL;
> +@@ -109,7 +109,7 @@ int main(int argc, char **argv)
> +   }
> +   calc_vals();
> +   int mid_width =3D header();
> +-  for(i =3D 0; i < data.size(); i++)
> ++  for(i =3D 0; i < ::data.size(); i++)
> +   {
> + // First print the average speed line
> +     printf("<tr>");
> +@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)
> +
> + void calc_vals()
> + {
> +-  ITEM *arr =3D new ITEM[data.size()];
> ++  ITEM *arr =3D new ITEM[::data.size()];
> +   for(unsigned int column_ind =3D 0; column_ind < MAX_ITEMS; column_ind=
++)
> +   {
> +     switch(vals[column_ind])
> +     {
> +     case eNoCols:
> +     {
> +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind+=
+)
> +       {
> +         if(column_ind =3D=3D COL_CONCURRENCY)
> +         {
> +-          if(data[row_ind][column_ind] && strcmp("1", data[row_ind][col=
umn_ind]))
> ++          if(::data[row_ind][column_ind] && strcmp("1", ::data[row_ind]=
[column_ind]))
> +             col_used[column_ind] =3D true;
> +         }
> +         else
> +         {
> +-          if(data[row_ind][column_ind] && strlen(data[row_ind][column_i=
nd]))
> ++          if(::data[row_ind][column_ind] && strlen(::data[row_ind][colu=
mn_ind]))
> +             col_used[column_ind] =3D true;
> +         }
> +       }
> +@@ -195,22 +195,22 @@ void calc_vals()
> +     break;
> +     case eCPU:
> +     {
> +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind+=
+)
> +       {
> +         double work, cpu;
> +         arr[row_ind].val =3D 0.0;
> +-        if(data[row_ind].size() > column_ind
> +-         && sscanf(data[row_ind][column_ind - 1], "%lf", &work) =3D=3D =
1
> +-         && sscanf(data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
> ++        if(::data[row_ind].size() > column_ind
> ++         && sscanf(::data[row_ind][column_ind - 1], "%lf", &work) =3D=
=3D 1
> ++         && sscanf(::data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
> +         {
> +           arr[row_ind].val =3D cpu / work;
> +         }
> +         arr[row_ind].pos =3D row_ind;
> +       }
> +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> +       int col_count =3D -1;
> +       double min_col =3D -1.0, max_col =3D -1.0;
> +-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
> ++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
> +       {
> +         // if item is different from previous or if the first row
> +         // (sort_ind =3D=3D 0) then increment col count
> +@@ -239,7 +239,7 @@ void calc_vals()
> +           min_col /=3D mult;
> +         }
> +         double range_col =3D max_col - min_col;
> +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_i=
nd++)
> ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort=
_ind++)
> +         {
> +           if(arr[sort_ind].col_ind > -1)
> +           {
> +@@ -250,7 +250,7 @@ void calc_vals()
> +       }
> +       else
> +       {
> +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_i=
nd++)
> ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort=
_ind++)
> +         {
> +           if(vals[column_ind] =3D=3D eLatency)
> +           {
> +@@ -263,25 +263,25 @@ void calc_vals()
> +     case eSpeed:
> +     case eLatency:
> +     {
> +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind+=
+)
> +       {
> +         arr[row_ind].val =3D 0.0;
> +-        if(data[row_ind].size() <=3D column_ind
> +-         || sscanf(data[row_ind][column_ind], "%lf", &arr[row_ind].val)=
 =3D=3D 0)
> ++        if(::data[row_ind].size() <=3D column_ind
> ++         || sscanf(::data[row_ind][column_ind], "%lf", &arr[row_ind].va=
l) =3D=3D 0)
> +           arr[row_ind].val =3D 0.0;
> +         if(vals[column_ind] =3D=3D eLatency && arr[row_ind].val !=3D 0.=
0)
> +         {
> +-          if(strstr(data[row_ind][column_ind], "ms"))
> ++          if(strstr(::data[row_ind][column_ind], "ms"))
> +             arr[row_ind].val *=3D 1000.0;
> +-          else if(!strstr(data[row_ind][column_ind], "us"))
> ++          else if(!strstr(::data[row_ind][column_ind], "us"))
> +             arr[row_ind].val *=3D 1000000.0; // is !us && !ms then secs=
!
> +         }
> +         arr[row_ind].pos =3D row_ind;
> +       }
> +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> +       int col_count =3D -1;
> +       double min_col =3D -1.0, max_col =3D -1.0;
> +-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
> ++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
> +       {
> +         // if item is different from previous or if the first row
> +         // (sort_ind =3D=3D 0) then increment col count
> +@@ -310,7 +310,7 @@ void calc_vals()
> +           min_col /=3D mult;
> +         }
> +         double range_col =3D max_col - min_col;
> +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_i=
nd++)
> ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort=
_ind++)
> +         {
> +           if(arr[sort_ind].col_ind > -1)
> +           {
> +@@ -332,7 +332,7 @@ void calc_vals()
> +       }
> +       else
> +       {
> +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_i=
nd++)
> ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort=
_ind++)
> +         {
> +           if(vals[column_ind] =3D=3D eLatency)
> +           {
> +@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)
> +     free((void *)arr[0]);
> +     return;
> +   }
> +-  data.push_back(arr);
> ++  ::data.push_back(arr);
> + }
> +
> + void print_item(int num, int item, CPCCHAR extra)
> + {
> +   PCCHAR line_data;
> +   char buf[1024];
> +-  if(int(data[num].size()) > item)
> ++  if(int(::data[num].size()) > item)
> +   {
> +-    line_data =3D data[num][item];
> ++    line_data =3D ::data[num][item];
> +     switch(item)
> +     {
> +     case COL_PUT_BLOCK:
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-link-=
for-helper.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-l=
ink-for-helper.patch
> new file mode 100644
> index 000000000..f352fd7c0
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-link-for-hel=
per.patch
> @@ -0,0 +1,24 @@
> +Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge=
_requests/3/diffs?commit_id=3Df6ce71d9f97316697c55d0fb3c756becdee04c5c]
> +
> +diff --git i/Makefile.in w/Makefile.in
> +index 6dfdb75..87a5fb1 100644
> +--- i/Makefile.in
> ++++ w/Makefile.in
> +@@ -11,7 +11,7 @@ eprefix=3D@exec_prefix@
> + WFLAGS=3D-Wall -W -Wshadow -Wpointer-arith -Wwrite-strings -pedantic -W=
cast-align -Wsign-compare -Wpointer-arith -Wwrite-strings -Wformat-security=
 -Wswitch-enum -Winit-self $(MORE_WARNINGS)
> + CFLAGS=3D-O2 @debug@ -DNDEBUG $(WFLAGS) $(MORECFLAGS)
> + CXX=3D@CXX@ $(CFLAGS)
> +-LINK=3D@CXX@
> ++LINK=3D$(LINK.cc)
> + THREAD_LFLAGS=3D@thread_ldflags@
> +
> + INSTALL=3D@INSTALL@
> +@@ -43,7 +43,7 @@ getc_putc: $(GETCOBJS) getc_putc_helper
> +       $(LINK) -o getc_putc $(GETCOBJS) $(THREAD_LFLAGS)
> +
> + getc_putc_helper: $(GETCHOBJS)
> +-      $(CXX) -o getc_putc_helper $(GETCHOBJS)
> ++      $(LINK) -o getc_putc_helper $(GETCHOBJS)
> +
> + bon_csv2html: bon_csv2html.o
> +       $(LINK) bon_csv2html.o -o bon_csv2html
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> new file mode 100644
> index 000000000..29590bfe8
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> +HOMEPAGE =3D "https://doc.coker.com.au/projects/bonnie/"
> +SECTION =3D "benchmark/tests"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150=
ae9cc3ee0"
> +
> +SRC_URI =3D "\
> +    http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> +    file://fix-configure-lfs.patch \
> +    file://fix-csv2html-data.patch \
> +    file://makefile-use-link-for-helper.patch \
> +"
> +SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92=
e58f27257e468f0e"
> +
> +# force lfs to skip configure's check, because we are cross-building
> +PACKAGECONFIG ?=3D "lfs"
> +PACKAGECONFIG[lfs] =3D "--enable-lfs,--disable-lfs"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--disable-stripping"
> +EXTRA_OEMAKE +=3D "-I ${S} VPATH=3D${S}"
> +CXXFLAGS +=3D "-I ${S}"
> +
> +do_install() {
> +    oe_runmake eprefix=3D'${D}${exec_prefix}' install-bin
> +}
> +
> +PACKAGE_BEFORE_PN +=3D "${PN}-scripts"
> +
> +FILES:${PN}-scripts =3D "${bindir}/bon_csv2*"
> +
> +RDEPENDS:${PN}-scripts +=3D "perl"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108199): https://lists.openembedded.org/g/openembedde=
d-devel/message/108199
> Mute This Topic: https://lists.openembedded.org/mt/103621192/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

