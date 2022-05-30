Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC8FC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 14:42:10 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.37536.1653921724610072854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 07:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bBSbCM3H;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h19so5725195edj.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwhl56zq87+fkLF11v0oiB46/Ate+QHp94o64kOVoYU=;
        b=bBSbCM3HbTBYtT60W6HM46760POBTPV6q/RKT/ofECqdIUBOO+jaL5yHeRS6q1ti2E
         ZvQqBYXNsOO4kQXXjuoXvKxUamXT/qcIPsR30Apmtc9A9AnTkojPNZiGb5MRievW8/OJ
         AgI3G5pfgwCfKxoYApklnT2rohkOyArOOhV7AOVRJPsXirWJs7Vq26GXv4B7e74efidy
         XlrXzce0ozEyRY/Z9miZXwj/uVvhgebVLHqhwwG+w4oxbBKklCVeBcT2kpmpvs7N8Uvg
         zuGfO2t1T5YucjeTa7Eovx1gpEoWBaIFWlW5pvWqSK8/6HWMsjgX52ZdUW4rzbDTYF6g
         FZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwhl56zq87+fkLF11v0oiB46/Ate+QHp94o64kOVoYU=;
        b=FZWOGU+/NMzvDla+Wt6BV8OLmP2OBGB9HBgCkDUCvGu8B7AOROrrlts9R9JQjik1OX
         FhEHlgxMSc5SbGD96rnuB8CFOUviPhe0rJJsBk65DrzbuoMBOncPuFmu/s9OoytYrdMm
         TiGBQkSqo+lWxeRZ498XEwIqHMssQXvxbxeHyH61i/gObujNEu7halw5bJBagc2rAwiv
         H4vhqxd6BpKP0RcOIUWboI8QmpT6+90nIb6sEpuC+9EVzsQQpEg2DdYRwoSfFR4QyC2+
         2+a8lYa+rRXo5GuxDjKm21iQXdEwm2flmu6Ku/8NWKnawBVoDHQxOML0R2W+oMWZ+hki
         oKQQ==
X-Gm-Message-State: AOAM533oSIPQs6Yyal+j5BIilvvpIDoExr2ungUV1x97+qov1wHqw16g
	BCfPm8tkrGv791ICtdjE3vy8KlYPsG8ugjJZm2E=
X-Google-Smtp-Source: 
 ABdhPJwumzzfMRgA/47m+6sPXmekoBJ9uxyAQF8l/cwIT0W7Hwm2DON3la/mVSzLm1e4Hx6qsISts5HqdJ7SPXt+orE=
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr59363296edb.329.1653921722928; Mon, 30
 May 2022 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220530120418.21892-1-rak3033@gmail.com>
 <18e187ea-cfdd-8a30-1901-c67c481c28e8@gmail.com>
In-Reply-To: <18e187ea-cfdd-8a30-1901-c67c481c28e8@gmail.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Mon, 30 May 2022 20:11:50 +0530
Message-ID: 
 <CACpMEhOLrMAHEP8z3rEDwO-zGD18r8Gk8CVMEgsk8MzdBP5sHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH v2]] tcpdump: Add fix for
 CVE-2018-16301
To: Armin Kuster <akuster808@gmail.com>
Cc: Riyaz Ahmed Khan <rak3033@gmail.com>,
 openembedded-devel@lists.openembedded.org,
	Riyaz.Khan@kpit.com, Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000c8118405e03ba8b9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 14:42:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97337

--000000000000c8118405e03ba8b9
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

Actually we do not want company specific information in the commit message.
Can you please remove it before sending merge request?

Thank you,
Ranjitsinh Rathod

On Mon, 30 May, 2022, 7:40 pm Armin Kuster, <akuster808@gmail.com> wrote:

> What is wrong with the one that has been sitting in dunfell-next for a
> few days?
>
> -armin
>
> On 5/30/22 05:04, Riyaz Ahmed Khan wrote:
> > From: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> >
> > Add patch for CVE issue: CVE-2018-16301
> > Link:
> https://github.com/the-tcpdump-group/tcpdump/commit/8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86
> >
> > Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> > ---
> >   .../tcpdump/tcpdump/CVE-2018-16301.patch      | 111 ++++++++++++++++++
> >   .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |   1 +
> >   2 files changed, 112 insertions(+)
> >   create mode 100644
> meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch
> >
> > diff --git
> a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch
> b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch
> > new file mode 100644
> > index 000000000..5f5c68ccd
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch
> > @@ -0,0 +1,111 @@
> > +From 8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86 Mon Sep 17 00:00:00 2001
> > +From: Guy Harris <gharris@sonic.net>
> > +Date: Wed, 30 Sep 2020 11:37:30 -0700
> > +Subject: [PATCH] Handle very large -f files by rejecting them.
> > +
> > +_read(), on Windows, has a 32-bit size argument and a 32-bit return
> > +value, so reject -f files that have more than 2^31-1 characters.
> > +
> > +Add some #defines so that, on Windows, we use _fstati64 to get the size
> > +of that file, to handle large files.
> > +
> > +Don't assume that our definition for ssize_t is the same size as size_t;
> > +by the time we want to print the return value of the read, we know it'll
> > +fit into an int, so just cast it to int and print it with %d.
> > +
> > +(cherry picked from commit faf8fb70af3a013e5d662b8283dec742fd6b1a77)
> > +
> > +CVE: CVE-2022-25308
> > +Upstream-Status: Backport [
> https://github.com/the-tcpdump-group/tcpdump/commit/8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86
> ]
> > +
> > +Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> > +
> > +---
> > + netdissect-stdinc.h | 16 +++++++++++++++-
> > + tcpdump.c           | 15 ++++++++++++---
> > + 2 files changed, 27 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/netdissect-stdinc.h b/netdissect-stdinc.h
> > +index 8282c5846..9941c2a16 100644
> > +--- a/netdissect-stdinc.h
> > ++++ b/netdissect-stdinc.h
> > +@@ -149,10 +149,17 @@
> > + #ifdef _MSC_VER
> > + #define stat _stat
> > + #define open _open
> > +-#define fstat _fstat
> > + #define read _read
> > + #define close _close
> > + #define O_RDONLY _O_RDONLY
> > ++
> > ++/*
> > ++ * We define our_fstat64 as _fstati64, and define our_statb as
> > ++ * struct _stati64, so we get 64-bit file sizes.
> > ++ */
> > ++#define our_fstat _fstati64
> > ++#define our_statb struct _stati64
> > ++
> > + #endif  /* _MSC_VER */
> > +
> > + /*
> > +@@ -211,6 +218,13 @@ typedef char* caddr_t;
> > +
> > + #include <arpa/inet.h>
> > +
> > ++/*
> > ++ * We should have large file support enabled, if it's available,
> > ++ * so just use fstat as our_fstat and struct stat as our_statb.
> > ++ */
> > ++#define our_fstat fstat
> > ++#define our_statb struct stat
> > ++
> > + #endif /* _WIN32 */
> > +
> > + #ifndef HAVE___ATTRIBUTE__
> > +diff --git a/tcpdump.c b/tcpdump.c
> > +index 043bda1d7..8f27ba2a4 100644
> > +--- a/tcpdump.c
> > ++++ b/tcpdump.c
> > +@@ -108,6 +108,7 @@ The Regents of the University of California.  All
> rights reserved.\n";
> > + #endif /* HAVE_CAP_NG_H */
> > + #endif /* HAVE_LIBCAP_NG */
> > +
> > ++#include "netdissect-stdinc.h"
> > + #include "netdissect.h"
> > + #include "interface.h"
> > + #include "addrtoname.h"
> > +@@ -861,15 +862,22 @@ read_infile(char *fname)
> > + {
> > +     register int i, fd, cc;
> > +     register char *cp;
> > +-    struct stat buf;
> > ++    our_statb buf;
> > +
> > +     fd = open(fname, O_RDONLY|O_BINARY);
> > +     if (fd < 0)
> > +             error("can't open %s: %s", fname, pcap_strerror(errno));
> > +
> > +-    if (fstat(fd, &buf) < 0)
> > ++    if (our_fstat(fd, &buf) < 0)
> > +             error("can't stat %s: %s", fname, pcap_strerror(errno));
> > +
> > ++    /*
> > ++     * Reject files whose size doesn't fit into an int; a filter
> > ++     * *that* large will probably be too big.
> > ++     */
> > ++    if (buf.st_size > INT_MAX)
> > ++            error("%s is too large", fname);
> > ++
> > +     cp = malloc((u_int)buf.st_size + 1);
> > +     if (cp == NULL)
> > +             error("malloc(%d) for %s: %s", (u_int)buf.st_size + 1,
> > +@@ -878,7 +886,8 @@ read_infile(char *fname)
> > +     if (cc < 0)
> > +             error("read %s: %s", fname, pcap_strerror(errno));
> > +     if (cc != buf.st_size)
> > +-            error("short read %s (%d != %d)", fname, cc,
> (int)buf.st_size);
> > ++            error("short read %s (%d != %d)", fname, (int) cc,
> > ++                (int)buf.st_size);
> > +
> > +     close(fd);
> > +     /* replace "# comment" with spaces */
> > diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> > index 2ea493863..66bf21775 100644
> > --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> > +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> > @@ -18,6 +18,7 @@ SRC_URI = " \
> >       file://add-ptest.patch \
> >       file://run-ptest \
> >
>  file://0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch \
> > +    file://CVE-2018-16301.patch \
> >   "
> >
> >   SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97335):
> https://lists.openembedded.org/g/openembedded-devel/message/97335
> Mute This Topic: https://lists.openembedded.org/mt/91429070/6360406
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c8118405e03ba8b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Armin,<div dir=3D"auto"><br></div><div dir=3D"auto">Ac=
tually we do not want company specific information in the commit message. C=
an you please remove it before sending merge request?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thank you,</div><div dir=3D"auto">Ranjitsinh =
Rathod</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, 30 May, 2022, 7:40 pm Armin Kuster, &lt;<a href=3D"mail=
to:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">What is wrong with the one that has been sitting =
in dunfell-next for a <br>
few days?<br>
<br>
-armin<br>
<br>
On 5/30/22 05:04, Riyaz Ahmed Khan wrote:<br>
&gt; From: Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt;<br>
&gt; Add patch for CVE issue: CVE-2018-16301<br>
&gt; Link: <a href=3D"https://github.com/the-tcpdump-group/tcpdump/commit/8=
ab211a7ec728bb0ad8c766c8eeb12deb0a13b86" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/the-tcpdump-group/tcpdump/commit/8ab211a7e=
c728bb0ad8c766c8eeb12deb0a13b86</a><br>
&gt;<br>
&gt; Signed-off-by: Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.=
com" target=3D"_blank" rel=3D"noreferrer">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../tcpdump/tcpdump/CVE-2018-16301.patch=C2=A0 =C2=A0 =C2=
=A0 | 111 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-support/tcpdump/<a href=3D"http://tcpdump_4.9.=
3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tcpdump_4.9.3.bb</a>=
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A02 files changed, 112 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-networking/recipes-support/tcpdump=
/tcpdump/CVE-2018-16301.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-=
16301.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-1630=
1.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..5f5c68ccd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.p=
atch<br>
&gt; @@ -0,0 +1,111 @@<br>
&gt; +From 8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Guy Harris &lt;<a href=3D"mailto:gharris@sonic.net" target=3D"_=
blank" rel=3D"noreferrer">gharris@sonic.net</a>&gt;<br>
&gt; +Date: Wed, 30 Sep 2020 11:37:30 -0700<br>
&gt; +Subject: [PATCH] Handle very large -f files by rejecting them.<br>
&gt; +<br>
&gt; +_read(), on Windows, has a 32-bit size argument and a 32-bit return<b=
r>
&gt; +value, so reject -f files that have more than 2^31-1 characters.<br>
&gt; +<br>
&gt; +Add some #defines so that, on Windows, we use _fstati64 to get the si=
ze<br>
&gt; +of that file, to handle large files.<br>
&gt; +<br>
&gt; +Don&#39;t assume that our definition for ssize_t is the same size as =
size_t;<br>
&gt; +by the time we want to print the return value of the read, we know it=
&#39;ll<br>
&gt; +fit into an int, so just cast it to int and print it with %d.<br>
&gt; +<br>
&gt; +(cherry picked from commit faf8fb70af3a013e5d662b8283dec742fd6b1a77)<=
br>
&gt; +<br>
&gt; +CVE: CVE-2022-25308<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/the-tcpdump-=
group/tcpdump/commit/8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/the-tcpdump-group/tc=
pdump/commit/8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit=
.com" target=3D"_blank" rel=3D"noreferrer">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + netdissect-stdinc.h | 16 +++++++++++++++-<br>
&gt; + tcpdump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++++++-=
--<br>
&gt; + 2 files changed, 27 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/netdissect-stdinc.h b/netdissect-stdinc.h<br>
&gt; +index 8282c5846..9941c2a16 100644<br>
&gt; +--- a/netdissect-stdinc.h<br>
&gt; ++++ b/netdissect-stdinc.h<br>
&gt; +@@ -149,10 +149,17 @@<br>
&gt; + #ifdef _MSC_VER<br>
&gt; + #define stat _stat<br>
&gt; + #define open _open<br>
&gt; +-#define fstat _fstat<br>
&gt; + #define read _read<br>
&gt; + #define close _close<br>
&gt; + #define O_RDONLY _O_RDONLY<br>
&gt; ++<br>
&gt; ++/*<br>
&gt; ++ * We define our_fstat64 as _fstati64, and define our_statb as<br>
&gt; ++ * struct _stati64, so we get 64-bit file sizes.<br>
&gt; ++ */<br>
&gt; ++#define our_fstat _fstati64<br>
&gt; ++#define our_statb struct _stati64<br>
&gt; ++<br>
&gt; + #endif=C2=A0 /* _MSC_VER */<br>
&gt; +<br>
&gt; + /*<br>
&gt; +@@ -211,6 +218,13 @@ typedef char* caddr_t;<br>
&gt; +<br>
&gt; + #include &lt;arpa/inet.h&gt;<br>
&gt; +<br>
&gt; ++/*<br>
&gt; ++ * We should have large file support enabled, if it&#39;s available,=
<br>
&gt; ++ * so just use fstat as our_fstat and struct stat as our_statb.<br>
&gt; ++ */<br>
&gt; ++#define our_fstat fstat<br>
&gt; ++#define our_statb struct stat<br>
&gt; ++<br>
&gt; + #endif /* _WIN32 */<br>
&gt; +<br>
&gt; + #ifndef HAVE___ATTRIBUTE__<br>
&gt; +diff --git a/tcpdump.c b/tcpdump.c<br>
&gt; +index 043bda1d7..8f27ba2a4 100644<br>
&gt; +--- a/tcpdump.c<br>
&gt; ++++ b/tcpdump.c<br>
&gt; +@@ -108,6 +108,7 @@ The Regents of the University of California.=C2=
=A0 All rights reserved.\n&quot;;<br>
&gt; + #endif /* HAVE_CAP_NG_H */<br>
&gt; + #endif /* HAVE_LIBCAP_NG */<br>
&gt; +<br>
&gt; ++#include &quot;netdissect-stdinc.h&quot;<br>
&gt; + #include &quot;netdissect.h&quot;<br>
&gt; + #include &quot;interface.h&quot;<br>
&gt; + #include &quot;addrtoname.h&quot;<br>
&gt; +@@ -861,15 +862,22 @@ read_infile(char *fname)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0register int i, fd, cc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0register char *cp;<br>
&gt; +-=C2=A0 =C2=A0 struct stat buf;<br>
&gt; ++=C2=A0 =C2=A0 our_statb buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd =3D open(fname, O_RDONLY|O_BINARY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(&quot;can&#39;t=
 open %s: %s&quot;, fname, pcap_strerror(errno));<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 if (fstat(fd, &amp;buf) &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 if (our_fstat(fd, &amp;buf) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(&quot;can&#39;t=
 stat %s: %s&quot;, fname, pcap_strerror(errno));<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Reject files whose size doesn&#39;t fit into a=
n int; a filter<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* *that* large will probably be too big.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (buf.st_size &gt; INT_MAX)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&quot;%s is too larg=
e&quot;, fname);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp =3D malloc((u_int)buf.st_size + 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cp =3D=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(&quot;malloc(%d=
) for %s: %s&quot;, (u_int)buf.st_size + 1,<br>
&gt; +@@ -878,7 +886,8 @@ read_infile(char *fname)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cc &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(&quot;read %s: =
%s&quot;, fname, pcap_strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cc !=3D buf.st_size)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&quot;short read %s =
(%d !=3D %d)&quot;, fname, cc, (int)buf.st_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&quot;short read %s =
(%d !=3D %d)&quot;, fname, (int) cc,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)buf.st_=
size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* replace &quot;# comment&quot; with spaces */<b=
r>
&gt; diff --git a/meta-networking/recipes-support/tcpdump/<a href=3D"http:/=
/tcpdump_4.9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tcpdump_=
4.9.3.bb</a> b/meta-networking/recipes-support/tcpdump/<a href=3D"http://tc=
pdump_4.9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tcpdump_4.9=
.3.bb</a><br>
&gt; index 2ea493863..66bf21775 100644<br>
&gt; --- a/meta-networking/recipes-support/tcpdump/<a href=3D"http://tcpdum=
p_4.9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tcpdump_4.9.3.b=
b</a><br>
&gt; +++ b/meta-networking/recipes-support/tcpdump/<a href=3D"http://tcpdum=
p_4.9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tcpdump_4.9.3.b=
b</a><br>
&gt; @@ -18,6 +18,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-ptest.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PPP-When-un-escaping-don-t-alloc=
ate-a-too-large-buff.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2018-16301.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;a4ead41d371f91aa0a2287f589958bae=
&quot;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97335): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97335" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/97335</a><b=
r>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91429070/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/91429070/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ranjitsinhrat=
hod1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod199=
1@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c8118405e03ba8b9--

