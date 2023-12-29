Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199F3C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:58:49 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.152718.1703869125324968510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WO9Jw2vY;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-203fbbff863so3015492fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 08:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703869124; x=1704473924; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir4bmJWfu4DgurtZI86ncGU/UVRv//oT8zLz70kFosk=;
        b=WO9Jw2vYq/Ihu5UjZqccGJIwgXRU4EUKc2yzkirSYk1xFdTrAJorD6ChDEiz4mmWCU
         j41zJt6h3eg9KOF3kNmO/GbAfgfPm7ygSOj7cr7AF4TwG0SDvIdzd0a5KM122nYcaEXy
         V4sP+sBcdYC6DMLNYBbjKfNSUA/8qgG0g/ml08pgxdhnWlP+K1vqz4hvvxSpeZbbUtjQ
         jLqi0e0YBf+NoOzsNIX2aSpUudl3kLXd5o1CcmhVORUt824B8WlDIzp9gGauK/ZLxFd1
         wQoNIwMl2lgVrYHhTVL8NCSg7vBg4PYVIQyS8ZLl/ZEaCSaWFsnouAJaLCAGZV2ib+kN
         5+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869124; x=1704473924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir4bmJWfu4DgurtZI86ncGU/UVRv//oT8zLz70kFosk=;
        b=YR77fPTR9n4qGdqfKqQfAjDojrxnTINXzA420aisGMvWbIhxbD7NWgVQ/lvkOk4ZZj
         r3kWBjSqwNgZNHqGn7YLnT8d9ADOlaBpcfTAapgfLqR1ReVmG5WmtkyMMzdCFXxG2zwn
         8RNU0SJXc+hhwXjAOTmGKVFG/a5LC68SYbYtqOvMOk/mUP0UFTYx/WnIR8zcU6fvYxqC
         7aMogeqcqj1XROaJADZvF8g77Lwhxzs700iggrW4hHQh9+EC4sW+mDJeBORUDM4dw6/W
         keBWKWV/hj2dxIosk8SZjB5Cua4Ry0He+2I/MTZSnayl+MXOf0Xe/9l7IWgszHsjS8PF
         0P1Q==
X-Gm-Message-State: AOJu0YwTMNM4AGg06EVSeLWs+cvxmjQD/Uv2oenHQ3GP8BgrWP2dNTtZ
	CFcX39OUBqhBI5GVnBh39ubuNW9m9q/AJDBgKP4ggRUADxk=
X-Google-Smtp-Source: AGHT+IFq7sfL/d1BEuv3p/9Hqk9bkgPIy7ZsdYDZjDLmp6aKK4F4TydBtPq3PtW7qLA0NgBstLiPOJVp8cYB6ZPFoHE=
X-Received: by 2002:a05:6871:8a97:b0:203:824f:a343 with SMTP id
 tm23-20020a0568718a9700b00203824fa343mr4056140oab.0.1703869124073; Fri, 29
 Dec 2023 08:58:44 -0800 (PST)
MIME-Version: 1.0
References: <c9925e3b7513843852cef0314fb2a16c962f7d3c.1703845151.git.joerg.sommer@navimatix.de>
In-Reply-To: <c9925e3b7513843852cef0314fb2a16c962f7d3c.1703845151.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Dec 2023 08:58:17 -0800
Message-ID: <CAMKF1sr2K7_SNWF9YJ+D-OT7yn_XtLdJ2V2A6M6spoAKWSiRsw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] bonnie++: New recipe for version 2.0
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 16:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107878

Here are some build issues seen while building for x86

https://errors.yoctoproject.org/Errors/Details/748405/

On Fri, Dec 29, 2023 at 2:19=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
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
>  .../bonnie/bonnie++_2.00a.bb                  |  26 +++
>  3 files changed, 248 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configu=
re-lfs.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2htm=
l-data.patch
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
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> new file mode 100644
> index 000000000..839ab7759
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> @@ -0,0 +1,26 @@
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
> +"
> +SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92=
e58f27257e468f0e"
> +
> +# force lfs to skip configure's check, because we are cross-building
> +PACKAGECONFIG ?=3D "lfs"
> +PACKAGECONFIG[lfs] =3D "--enable-lfs,--disable-lfs"
> +
> +do_install () {
> +    install -m 0755 -Dt ${D}/${bindir} bonnie++ zcav bon_csv2html bon_cs=
v2txt
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
> View/Reply Online (#107876): https://lists.openembedded.org/g/openembedde=
d-devel/message/107876
> Mute This Topic: https://lists.openembedded.org/mt/103415176/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

