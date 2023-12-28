Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E37C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 18:16:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.128587.1703787366731740155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Dec 2023 10:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bzQanzUf;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so3454324fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Dec 2023 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703787366; x=1704392166; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz/Hu2aCHI3Hh2U1neok50Lv7vbiMzBD71YN2IIT5tA=;
        b=bzQanzUf8oS4lekB3Mn9fID3eY0/i3foI/aGi2Rtb+w3LKY6FdEYAC5muvPoddwZOL
         OCg+6j7MTXb0Xst8O56P4lucq0WAMyHH/uurVS/du8YknCaPPLVvKn3Hv8Fen6X0GzrB
         sM98BBZ1K/mikffonpLxSn5K8B4XgX4exiGWTcZ4igwLFcA20OTzehBJ6+ysugiCe5rT
         Bf4PqwjiBJuoqVvVrdArQ44C8p4yNOcxH4Te8I2ceaDX6Syp0/OfzgFRfhi6YccgIqRK
         uVN+6C9FcDUcLwUUutu+unbDfqr9iD5UstJqXFIxM3bp20FIZtsZNvCrXV21QGP0kMNk
         lHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703787366; x=1704392166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz/Hu2aCHI3Hh2U1neok50Lv7vbiMzBD71YN2IIT5tA=;
        b=ETWlVJE5xX8SJiPY3Iy3GtHTsgRb/EG4A7Heq0QktfV9l5xG2s11PIDoDLLz3kzxQA
         lc3cO4xoqjzqbn8Rs4Fm9T0Y1uAG76jsNp7ZYd3mA4h4nuTwW75RKnL55PP7v57F7jGw
         M9m7jOJ20yY4Kq93oqWGFgzLlIBK7WxS/6IT7uk37fsZyBZxwHiUWxuRQpFJmZiarUL7
         XB90aEF6wOXaM/CR2NRJWbTQyxT02aEpvGSEbvhPz/XT9yaiYglNSLQ4v3+hjB+OzgM9
         jFojmFiaU66Pum7sP12Fozd0K/xhCHjMu5L63y80+tVGbO9ank31etlAKm4nITgtM46n
         hwwQ==
X-Gm-Message-State: AOJu0YyEKP5Lf8WPJ5ikijfj2jghNUjJoqt3CYcBOz5a+xXbdPORJXN0
	fPMl37jEm9tgLvNgQWHYbVjQBEUjM0X8tLzMVKPsACVj
X-Google-Smtp-Source: AGHT+IFIZGMLI0ML7qWBXCjLA0IH4aX93j/haClrLfwa+HL2WLDIcnxEyupJbZnJ1y278uhjILopZaAxrxrufHgLjsI=
X-Received: by 2002:a05:6870:a686:b0:1fb:75c:3fee with SMTP id
 i6-20020a056870a68600b001fb075c3feemr14617673oam.78.1703787365765; Thu, 28
 Dec 2023 10:16:05 -0800 (PST)
MIME-Version: 1.0
References: <8701b8118a57fad2921655c82cea20dcbf92c12d.1703772150.git.joerg.sommer@navimatix.de>
In-Reply-To: <8701b8118a57fad2921655c82cea20dcbf92c12d.1703772150.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Dec 2023 10:15:39 -0800
Message-ID: <CAMKF1sqtS3_2ontNfi6nXLOvUq=_N9j52Fvm7o4AUj0xFJyOKQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bonnie++: New recipe for version 2.0
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Dec 2023 18:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107875

On Thu, Dec 28, 2023 at 6:03=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
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
>  .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
>  3 files changed, 255 insertions(+)
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
> index 000000000..f31fd09fc
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
> +SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> +    file://fix-configure-lfs.patch \
> +    file://fix-csv2html-data.patch \
> +"
> +SRC_URI[md5sum] =3D "3a16b3a91b1d38b6f5561e197f81d870"

Drop setting md5sum, its not used any more.

> +SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92=
e58f27257e468f0e"
> +
> +SCRIPTS =3D "bon_csv2html bon_csv2txt"
> +EXES =3D "bonnie++ zcav"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +# force lfs to skip configure's check, because we are cross-building
> +EXTRA_OECONF:append=3D"--enable-lfs"

Either there should be a space before --enable-lfs or better make it a
PACKAGECONFIG

> +
> +do_install () {
> +    install -d ${D}/${bindir}
> +    install -d ${D}/${sbindir}
> +    install -m 0755 ${EXES} ${D}/${sbindir}
> +    install -m 0755 ${SCRIPTS} ${D}/${bindir}
> +}
> +
> +PACKAGES =3D+ "bonnie-scripts"
> +
> +FILES:${PN} =3D "${sbindir}"
> +FILES:bonnie-scripts =3D "${bindir}"
> +
> +RDEPENDS:bonnie-scripts +=3D "perl"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107874): https://lists.openembedded.org/g/openembedde=
d-devel/message/107874
> Mute This Topic: https://lists.openembedded.org/mt/103400703/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

