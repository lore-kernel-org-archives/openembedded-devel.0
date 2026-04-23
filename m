Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AD0F9EDFD
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:02:28 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14275.1776927742957651434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l19EfiKw;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-652fcd5a6d7so6951395d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 00:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776927742; cv=none;
        d=google.com; s=arc-20240605;
        b=IiQjJERClQ0ZL5c/s+oMy/Y57iHlWjgOsCaUfqVodtR/Uz1i806UeBnH7SB+uYW5i/
         ohltn9EYokPRjpmI4mQk8/5xbm5iJ4vOXLZTjU1XQ80K1g0SrQOkvrphF+mfF94wEW2+
         ZqKHmg096gNBHga0R6fwj4yS71s8r/GPiJ8Bj37Asb/mRDjKv2dUWZFsD9umRVhJ+BP5
         9MZEdn5yXYYKH2OJKUlD97A+FFrCJ+4mbIKqs34SG0dKR2g1CmLYC91jaDnTcYOvkikp
         jhKSUonSDpa63I6ZtbqsEN5YK41npuxVYfxOvc22IPjEtFYrtHKpthNNyjd674dvZ7lC
         ihRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6t3Lm7NeTci1aWNnkoeTt3Db296Mnbbp8Ew/hYLWO6I=;
        fh=YkTfMVMSoA3jC1Sn45nehZmHIXeAnwDt+QDopY86TKg=;
        b=GBgKsctEAFxegDUIaL67qTVfb581y8QSdb06SIQnpLO4BbT18j2w/tAs6rmhrigwXp
         MOtkPmblIRfSRAaOfvcwuVgcdWOh1gG2KAYCFUVI9JXY+LO+sMXsjpw26NpoX24bP195
         ep8JAzcDW14nH4BG4DMgdhWEYEai/PzwE/dBiam9XC5CyaZQsD7Wk7qmypVsJjjm0FR3
         sMfuOGpxmENcudj1KUBT66hHzwQJ+5Bt54OsJSS46f1fIWcokFr5vSYni6H2XzwTAnWx
         QBrwtOGOefeRoVNJvRG2/Nfb5X7Xy5G8pUCGhaksoWKED/RbI3gXWiYIuWHR+8J0jmOx
         N/Mg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927742; x=1777532542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6t3Lm7NeTci1aWNnkoeTt3Db296Mnbbp8Ew/hYLWO6I=;
        b=l19EfiKw0Lk/E7p59vjwwqA/H+yGozo7F57Xk2VtZxsPhfq5O04JF4sPfoYkZWflpf
         4hbiESsGJDmPPfvyF247avAyuzog8r5pv520YATKyF6SpFo7qG4AW5EvooETfo6/Fq5v
         wGXvEbInsmgBGJERlVEDaGU1CkCc8+xL/6fnW24TaDBaQTTYmm4QSRhmBqomybAZyzRN
         cNHm5Z+SukMJbgFsNieeL7sKKSUAwrccu8GakVxE25ql2bBj5O3X29TO73OIQ2LU4fQN
         mHTD5rnpHyadMzaXVJjX6iq7jvr0jjfkzC27TPIet19N3d6d3p7+oPdUhc1VbTbJsJdR
         xYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927742; x=1777532542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t3Lm7NeTci1aWNnkoeTt3Db296Mnbbp8Ew/hYLWO6I=;
        b=aySb2olsuZrGDFa8LkN/7C943WL8U0EpQBF9PrVRbj0OpKvX3Opz9kNNdMYA9j1bPE
         hjmIHtcUi7Nqp40hAL8Df/4pA9tr6BqC8c89DYxjXxXDF8i4JArxlfQFajs8t8BCQ7eA
         u0Aeh1l+CqOXbn5bttkkwSlPFPXzeHogv7GtBVigH9ezLK7YfzUZ5G8LNZM6vmhWnaHv
         seU2gKWcraYtv91147zwmyLRPXMBvY6b382xG09+cyFcxCEXVgY2V76dJrc6nGTWsuMb
         quy/JLTliswoV/YVJCmbSeY3iZgEwBHwxLHR7CiF7pQx/KrEtigiXfJJrJ8Pr/GaNMJS
         nakA==
X-Gm-Message-State: AOJu0YwH3GM39eKtB8vrQGkqvTcRqCPMQKpG+dSo3K+7hEF2OXx6/JCU
	PO3MRCDJwpInz+7F0UFoZR0qyqWFkrUi3OK7/qJfrjOiPDJmLLtEnx8aESaNq94qv+OHrDjh4Z5
	whVdaVqEkNsWxQTy+UHiXF9Rit5BJOqo=
X-Gm-Gg: AeBDieu0U1UlhnDwGC8xqSra+5vKR3GDdGi4J/WxRR1wmjo2ZYJqHtSJC4+2xWajT6p
	I7TPycDaNsj6fskEGMkpeW5FOIFSJszN7maiNIV7FcDmUlQvSzyyl3nGISSo1dXLWP4j6gr9G2F
	Ij3usTT417zaiFzye2uzy0sSg6zP9PFn6yKzlnlGiUn9A9mkrQfPsivXhjWYxvVTO8+SED92pg8
	+VYYtHNzKsSnUJHdQKTXMD1q/eROZLVxKjwImNxK+3MCMQ+j0r+cqbzWdFn0DLlPkxMWOzJ6EtY
	LrnmfBH2MgPe1PX9Y3RcWX/HB8TDPceXrMffGJvVsHlBCvT0ODfEx8N+uq/LDcBSD9JAlHySIzp
	kUiiGKQSUT7UYPMJqK45lbCIHgUk0ljh63rMKuG0GJGioR1O6LYIJB6I13yR3/Snb1SQMpyVZUI
	krQeiN9ugESssfzUrtqA==
X-Received: by 2002:a05:690e:1917:b0:654:52b8:4a8e with SMTP id
 956f58d0204a3-65452b84dfdmr5481766d50.45.1776927742026; Thu, 23 Apr 2026
 00:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260422013925.1791148-1-khem.raj@oss.qualcomm.com> <ab02ec5f-3569-41d4-b846-93a51c8002db@gmail.com>
In-Reply-To: <ab02ec5f-3569-41d4-b846-93a51c8002db@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Apr 2026 00:01:52 -0700
X-Gm-Features: AQROBzCjwsjeNZW1PRn9kF9w7exD95IyNBmPByhQ6mcAttornFccikMzbzx8nhg
Message-ID: <CAMKF1srSFo_+pWhhQXsoHykcZK7FTp-5LJ5QbGVewUvZhF0jbQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gphoto2: Fix build with clang-22
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000dae98906501b3af9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 07:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126571

--000000000000dae98906501b3af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:57=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> On 4/22/26 03:39, Khem Raj via lists.openembedded.org wrote:
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  ...hoto2-fix-const-qualifier-violations.patch | 73 +++++++++++++++++++
> >  .../gphoto2/gphoto2_2.5.32.bb                 |  1 +
> >  2 files changed, 74 insertions(+)
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier=
-violations.patch
> >
> > diff --git
> a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifi=
er-violations.patch
> b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifi=
er-violations.patch
> > new file mode 100644
> > index 0000000000..a8f85d034c
> > --- /dev/null
> > +++
> b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifi=
er-violations.patch
> > @@ -0,0 +1,73 @@
> > +From 55edc241e9b61b14153c61fd0baaefac927ad89f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <khem.raj@oss.qualcomm.com>
> > +Date: Tue, 21 Apr 2026 17:39:43 -0700
> > +Subject: [PATCH] gphoto2: fix const qualifier violations
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +No logic is changed. The patch is a pure
> > +type-correctness fix that makes the variable
> > +declarations match the actual semantics =E2=80=94
> > +const char * for pointers into string literals
> > +or function parameters that must not be mutated,
> > +and char * only for owned heap memory. This
> > +satisfies Clang's strict qualifier checking without
> > +needing any casts or warning suppressions.
> > +
> > +Fixes errors seen on clang with
> > +  -Werror,-Wincompatible-pointer-types-discards-qualifiers
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > +---
> > + gphoto2/main.c | 14 ++++++++------
> > + 1 file changed, 8 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gphoto2/main.c b/gphoto2/main.c
> > +index 5a3c5c1..086f9df 100644
> > +--- a/gphoto2/main.c
> > ++++ b/gphoto2/main.c
> > +@@ -146,7 +146,8 @@ static int
> > + get_path_for_file (const char *folder, const char *name,
> CameraFileType type, CameraFile *file, char **path)
> > + {
> > +     unsigned int i, l;
> > +-    char *s =3D NULL, b[1024];
> > ++    const char *s =3D NULL;
> > ++    char *p =3D NULL; char b[1024];
> > +     time_t t =3D 0;
> > +     struct tm *tm;
> > +     int hour12;
> > +@@ -339,18 +340,18 @@ get_path_for_file (const char *folder, const cha=
r
> *name, CameraFileType type, Ca
> > +                     b[1] =3D '\0';
> > +             }
> > +
> > +-            s =3D *path ? realloc (*path, strlen (*path) + strlen (b)=
 +
> 1) :
> > ++            p =3D *path ? realloc (*path, strlen (*path) + strlen (b)=
 +
> 1) :
> > +                         malloc (strlen (b) + 1);
> > +-            if (!s) {
> > ++            if (!p) {
> > +                     free (*path);
> > +                     *path =3D NULL;
> > +                     return (GP_ERROR_NO_MEMORY);
> > +             }
> > +             if (*path) {
> > +-                    *path =3D s;
> > ++                    *path =3D p;
> > +                     strcat (*path, b);
> > +             } else {
> > +-                    *path =3D s;
> > ++                    *path =3D p;
> > +                     strcpy (*path, b);
> > +             }
> > +     }
>
>
> Is this enough? Variable s is still used a few lines later as an input
> parameter, but now it has a different value than before this patch.
> (Admittedly haven't looked deep enough to check if the difference is
> significant)
>
>
I think p should be used instead of s in that function call

return gp_file_get_name_by_type (file, s, type, path);



>
> > +@@ -696,7 +697,8 @@ dissolve_filename (
> > +     const char *folder, const char *filename,
> > +     char **newfolder, char **newfilename
> > + ) {
> > +-    char *nfolder, *s;
> > ++    char *nfolder;
> > ++    const char *s;
> > +
> > +     s =3D strrchr (filename, '/');
> > +     if (!s) {
> > diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> > index e5e7c6926f..dbd2b0e748 100644
> > --- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> > +++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> > @@ -9,6 +9,7 @@ RDEPENDS:gphoto2 =3D "libgphoto2"
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=3Dgphoto2=
 \
> >             file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
> >             file://0001-configure-Filter-out-buildpaths-from-CC.patch \
> > +           file://0001-gphoto2-fix-const-qualifier-violations.patch \
> >  "
> >  SRC_URI[gphoto2.sha256sum] =3D
> "4e379a0f12f72b49ee5ee2283ffd806b5d12d099939d75197a3f4bbc7f27a1a1"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126539):
> https://lists.openembedded.org/g/openembedded-devel/message/126539
> > Mute This Topic: https://lists.openembedded.org/mt/118948760/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000dae98906501b3af9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 22,=
 2026 at 12:57=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@=
gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 4/22/26 03:39, Khem Raj via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...hoto2-fix-const-qualifier-violations.patch | 73 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../gphoto2/<a href=3D"http://gphoto2_2.5.32.bb" rel=3D"noreferr=
er" target=3D"_blank">gphoto2_2.5.32.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 74 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001=
-gphoto2-fix-const-qualifier-violations.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix=
-const-qualifier-violations.patch b/meta-oe/recipes-graphics/gphoto2/gphoto=
2/0001-gphoto2-fix-const-qualifier-violations.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a8f85d034c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-=
qualifier-violations.patch<br>
&gt; @@ -0,0 +1,73 @@<br>
&gt; +From 55edc241e9b61b14153c61fd0baaefac927ad89f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" targe=
t=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; +Date: Tue, 21 Apr 2026 17:39:43 -0700<br>
&gt; +Subject: [PATCH] gphoto2: fix const qualifier violations<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +No logic is changed. The patch is a pure<br>
&gt; +type-correctness fix that makes the variable<br>
&gt; +declarations match the actual semantics =E2=80=94<br>
&gt; +const char * for pointers into string literals<br>
&gt; +or function parameters that must not be mutated,<br>
&gt; +and char * only for owned heap memory. This<br>
&gt; +satisfies Clang&#39;s strict qualifier checking without<br>
&gt; +needing any casts or warning suppressions.<br>
&gt; +<br>
&gt; +Fixes errors seen on clang with<br>
&gt; +=C2=A0 -Werror,-Wincompatible-pointer-types-discards-qualifiers<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.c=
om" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; +---<br>
&gt; + gphoto2/main.c | 14 ++++++++------<br>
&gt; + 1 file changed, 8 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gphoto2/main.c b/gphoto2/main.c<br>
&gt; +index 5a3c5c1..086f9df 100644<br>
&gt; +--- a/gphoto2/main.c<br>
&gt; ++++ b/gphoto2/main.c<br>
&gt; +@@ -146,7 +146,8 @@ static int<br>
&gt; + get_path_for_file (const char *folder, const char *name, CameraFileT=
ype type, CameraFile *file, char **path)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int i, l;<br>
&gt; +-=C2=A0 =C2=A0 char *s =3D NULL, b[1024];<br>
&gt; ++=C2=A0 =C2=A0 const char *s =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 char *p =3D NULL; char b[1024];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0time_t t =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tm *tm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int hour12;<br>
&gt; +@@ -339,18 +340,18 @@ get_path_for_file (const char *folder, const ch=
ar *name, CameraFileType type, Ca<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0b[1] =3D &#39;\0&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D *path ? realloc (*pa=
th, strlen (*path) + strlen (b) + 1) :<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D *path ? realloc (*pa=
th, strlen (*path) + strlen (b) + 1) :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0malloc (strlen (b) + 1);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0free (*path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*path =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (GP_ERROR_NO_MEMORY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*path) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *path =3D s;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *path =3D p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0strcat (*path, b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *path =3D s;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *path =3D p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0strcpy (*path, b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
<br>
Is this enough? Variable s is still used a few lines later as an input<br>
parameter, but now it has a different value than before this patch.<br>
(Admittedly haven&#39;t looked deep enough to check if the difference is<br=
>
significant)<br>
<br></blockquote><div><br></div><div>I think p should be used instead of s =
in that function call</div><div><br></div><div>return gp_file_get_name_by_t=
ype (file, s, type, path);</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +@@ -696,7 +697,8 @@ dissolve_filename (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *folder, const char *filename,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char **newfolder, char **newfilename<br>
&gt; + ) {<br>
&gt; +-=C2=A0 =C2=A0 char *nfolder, *s;<br>
&gt; ++=C2=A0 =C2=A0 char *nfolder;<br>
&gt; ++=C2=A0 =C2=A0 const char *s;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s =3D strrchr (filename, &#39;/&#39;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!s) {<br>
&gt; diff --git a/meta-oe/recipes-graphics/gphoto2/<a href=3D"http://gphoto=
2_2.5.32.bb" rel=3D"noreferrer" target=3D"_blank">gphoto2_2.5.32.bb</a> b/m=
eta-oe/recipes-graphics/gphoto2/<a href=3D"http://gphoto2_2.5.32.bb" rel=3D=
"noreferrer" target=3D"_blank">gphoto2_2.5.32.bb</a><br>
&gt; index e5e7c6926f..dbd2b0e748 100644<br>
&gt; --- a/meta-oe/recipes-graphics/gphoto2/<a href=3D"http://gphoto2_2.5.3=
2.bb" rel=3D"noreferrer" target=3D"_blank">gphoto2_2.5.32.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/gphoto2/<a href=3D"http://gphoto2_2.5.3=
2.bb" rel=3D"noreferrer" target=3D"_blank">gphoto2_2.5.32.bb</a><br>
&gt; @@ -9,6 +9,7 @@ RDEPENDS:gphoto2 =3D &quot;libgphoto2&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;nam=
e=3Dgphoto2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.a=
c-remove-AM_PO_SUBDIRS.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-F=
ilter-out-buildpaths-from-CC.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gphoto2-fix-cons=
t-qualifier-violations.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[gphoto2.sha256sum] =3D &quot;4e379a0f12f72b49ee5ee2283ff=
d806b5d12d099939d75197a3f4bbc7f27a1a1&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#126539): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/126539" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/126539</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11894876=
0/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118948760/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000dae98906501b3af9--

