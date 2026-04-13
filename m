Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E4E9381A
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 05:56:09 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265150.1776059765771767102
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 22:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eHPKDlIq;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-650775f427eso3769399d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 22:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776059765; cv=none;
        d=google.com; s=arc-20240605;
        b=lhSU/09KsJxrw6S0rzGLP6b6lsj1wX6XS8L5X3G3AVBQo0l+nZqzeNFOr8lM0U0KYC
         eW44nNFEbifwAA7euW2b29U4GRobvPzqZEBNaHrMHbqSLmJNtbsSYdhiEewVD0FDTjLE
         HgmHdASmyAW8JLVo7oF0uexLkk+2pypEliFqMtyBbu5GfRo35r1ktiIY11tH6hDnNqyZ
         MJBIRwcNRwgq8UcWx1XP/6Hu2hFK/5TKf1itmc354ZB/CnkyEQ3jH04wxSf83PARCtGQ
         SVg06zUmh/GQEP84hWZ1ELBJMj9B6enIpXbSeQ3maFkMz/oASZ3B51boV1/uEH9JLO7W
         /ZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ehjv+TkLSMHa9b+UjWgyFu1lXMueCYkoGp2zHeq7mIA=;
        fh=oB9qxa5Jj8nVDKTCmtNj0CrV2XyUJi6hia0LF0Xnhg4=;
        b=cM5Kz12qn2QxP8frBpOniGk420W7pSaMEk0VrL5syBIYhcE9Rij7/MjdFOmH1FELDb
         ceK2IUfMx9BAF5TYFEMyB2Cq0FL7xIBuix9CFn2QWAyoXowr9/K8rIXhoLn/AbhSmV1L
         YjvLgve4ed2jdnPV7Fz6vDZvmY4HH0JubGxJ3gB3RSiGR0oWerUXzIqXf++o+mFAYmnE
         8F+lCNje8EyM8MudBm/P1N0EISajvb7d9/E2dmJEiw/PHpWlq5oNAwlUqCxilmmGnOgI
         bHk+y0Dvth4+N8s6wrWi0fZo1bzeVslEiDhj/h57Dry3b+8Gr9YiTjKc0HX84kxbo4CJ
         EkZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776059765; x=1776664565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ehjv+TkLSMHa9b+UjWgyFu1lXMueCYkoGp2zHeq7mIA=;
        b=eHPKDlIqiESra6fqY+f9l5r7tHj5IJ2NqXPB1W4FkDGLqEramma1R1F8/5KBkFMz1d
         i2k0IzoanCHPCdjmARmDkrh+JuHWJTuPs+WzSWa+MIZe3IEx2yKes4oL9m8wwdVtVzjJ
         kGZwiw9CdMWGi1biBiFixbrjLn37PQWpgxvQYj15T0uEI+Heo+V7Gq3ZKlBg730uNrI5
         DyRUVnoID+1ou+MRKzoqqH4IFCQ6aTSkaI/M4dzLCAawVy29Ce38xGulXh/thP4Sh5xa
         rK54zhVQFRs8qLGt/syL3stNQhWV06vUnmIFeZWrOTmG53VMKhx77mW0NQ0dWOzMGQrT
         6fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059765; x=1776664565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehjv+TkLSMHa9b+UjWgyFu1lXMueCYkoGp2zHeq7mIA=;
        b=fH+fqdLHz1kBX5LVnBRqWV9hTrilCME2pdkYZgbFk0w0T17dGNdx0/9htvj/SDjU0q
         P41og+eovkyxIkkGiB+tZacb8qAW7BIXAl3E318etLLKhUuyghfs9WstETmzsO6+/CZd
         PWA+UmILzfA903nIiTbbaiUlpWvlDBa/aJsSM0Ddq12gU/HspzdUKduC9OBODiuNCuY5
         pjbDqJvS0PuQnbJs+RoWU1wmwPQm+MGwEdzwQkkPWy0xDfZ+8IL9ELwlP//SmFmLemQ0
         KYEzbvfJvld3veCcyWNdeQPe4xC/QjRwvyfh9ztEUBew9iik2Q87jW0fl8LMrRZcV/Pe
         gXxw==
X-Forwarded-Encrypted: i=1; AFNElJ8BbZWwGhdJYuPt6D+8PBL+gT2e0EWD92TpQvejO7mPApKBrgnj5IpRNe1Trfx0rnRgL/j3G67JyY3pubQutbxWZLI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeY/K4kOsry3UhwP+FdHUhNJFYxh8pygoFr3mZinnKXSnFA9nh
	y+H2jNFzcIZikVGlVN9EJjjpnglzykXbfbfv39fTYYC77Peq6W4PB63V9s43lxOTBVP66rhjHWg
	/mONQ62rnpbhxeX4A8hr559nupdMUJLs=
X-Gm-Gg: AeBDies0LBzPGTRcS2K0J5tS+9Xy4q1QqI7tVmN4wRQhZRDoytYG4RVzk7BDBjSxBGb
	xh+czvw81X0zpXt7sFHisbAeUi2ktfqpUIV6UwWCXUXr4sP152gS0969VbZKBADbt03syMOU3bD
	cFfIfexwtKLigZ3qzDDz5+Pkrli15h33pSVpemQF5XaHljwCH+Pyj5f2hFBwlG6aR1HNhG2I9EY
	3u+8GYXGcsBp9FWZK8dGzn50j37f1DQgnihveZw7jLawRwPigtd4lN6l8yvp7GaxrYdv/0MrqkH
	gBnerxXWoiU7oFd6HMS9DtELoIJwtzuejMKMHabbrDzJ+DQafDQrkBSK5DBwxaKO02dZEFziHn0
	hbYN4rn7P0w6QTsU6dabvfahcw6Gd2tj6rsB0dYEe79x5GROlhvMeeL41Ipwb6kADJNc3Zv3j8N
	bYnesL
X-Received: by 2002:a53:d8c6:0:b0:650:5316:175b with SMTP id
 956f58d0204a3-65198bd1c13mr8857627d50.52.1776059764791; Sun, 12 Apr 2026
 22:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024804.1678-1-wangmy@fujitsu.com> <CA+chaQcEYDO5-jNRVZajTm2mvbnkbParUAXndNGFn-PE72-+OQ@mail.gmail.com>
In-Reply-To: <CA+chaQcEYDO5-jNRVZajTm2mvbnkbParUAXndNGFn-PE72-+OQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Apr 2026 22:55:37 -0700
X-Gm-Features: AQROBzASwRJaEUexsCsTPl0U51vukIXzol-oxQRttB2TKdMb_Qu4XIm3cAmomMU
Message-ID: <CAMKF1soGuWJji_72+O=7gF7Bg2n+2O4+cXnRB+r6-i6wDxguhw@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: rename downloaded file name
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000615f43064f512302"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 05:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126270

--000000000000615f43064f512302
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 10:44=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Mon, Apr 13, 2026 at 4:48=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Add downloadfilename to SRC_URI to ensure the downloaded file has
> > a consistent local name, avoiding potential future filename conflicts.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> > index a6b78ea781..9b3666863c 100644
> > --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> > +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> > @@ -9,7 +9,7 @@ SECTION =3D "mail"
> >  LICENSE =3D "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb805cc6bdb95ba8fc2398a55fd=
50877"
> >
> > -SRC_URI =3D "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
> > +SRC_URI =3D "
> https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;downloadfilename=3D=
${BP}.tar.gz
> \
>
> dovecot-${PV}.tar.gz is ${BP}.tar.gz, isn't it?
>
> To avoid the issue with modified tarball I was assuming something like:
>
> # 2.4.3 tarball was recreated, see
> #
> https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/threa=
d/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/
> SRC_URI =3D "
> https://dovecot.org/releases/2.4/${BP}.tar.gz;downloadfilename=3D${BP}-re=
created.tar.gz
> \
>

I think the problem is that we might have to  purge the old tarball since
upstream has regenerated it with same name+version

>
>
> >
>  file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
> >             file://dovecot.service \
> >             file://dovecot.socket \
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126269):
> https://lists.openembedded.org/g/openembedded-devel/message/126269
> Mute This Topic: https://lists.openembedded.org/mt/118798933/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000615f43064f512302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 12,=
 2026 at 10:44=E2=80=AFPM Martin Jansa via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Ap=
r 13, 2026 at 4:48=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" target=
=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;<br>
&gt; Add downloadfilename to SRC_URI to ensure the downloaded file has<br>
&gt; a consistent local name, avoiding potential future filename conflicts.=
<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-support/dovecot/<a href=3D"http://doveco=
t_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a> | 2 +=
-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/dovecot/<a href=3D"http:/=
/dovecot_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a=
> b/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.4.3=
.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a><br>
&gt; index a6b78ea781..9b3666863c 100644<br>
&gt; --- a/meta-networking/recipes-support/dovecot/<a href=3D"http://doveco=
t_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/dovecot/<a href=3D"http://doveco=
t_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a><br>
&gt; @@ -9,7 +9,7 @@ SECTION =3D &quot;mail&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPL-2.1-only &amp; MIT &amp; Unicode-3.0 &amp=
; BSD-3-Clause &amp; PD&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dcb805cc6bdb95ba8=
fc2398a55fd50877&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://dovecot.org/releases/2.4/dovecot=
-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://dovecot.org=
/releases/2.4/dovecot-${PV}.tar.gz</a> \<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://dovecot.org/releases/2.4/dovecot=
-$%7BPV%7D.tar.gz;downloadfilename=3D$%7BBP%7D.tar.gz" rel=3D"noreferrer" t=
arget=3D"_blank">https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;down=
loadfilename=3D${BP}.tar.gz</a> \<br>
<br>
dovecot-${PV}.tar.gz is ${BP}.tar.gz, isn&#39;t it?<br>
<br>
To avoid the issue with modified tarball I was assuming something like:<br>
<br>
# 2.4.3 tarball was recreated, see<br>
# <a href=3D"https://dovecot.org/mailman3/archives/list/dovecot-news@doveco=
t.org/thread/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/" rel=3D"noreferrer" target=
=3D"_blank">https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot=
.org/thread/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/</a><br>
SRC_URI =3D &quot;<a href=3D"https://dovecot.org/releases/2.4/$%7BBP%7D.tar=
.gz;downloadfilename=3D$%7BBP%7D-recreated.tar.gz" rel=3D"noreferrer" targe=
t=3D"_blank">https://dovecot.org/releases/2.4/${BP}.tar.gz;downloadfilename=
=3D${BP}-recreated.tar.gz</a><br>
\<br></blockquote><div><br></div><div>I think the problem is that we might =
have to=C2=A0 purge the old tarball since upstream has regenerated it with =
same name+version</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.a=
c-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dovecot.service =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dovecot.socket \=
<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126269): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126269" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126269</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118798933/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118798933/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000615f43064f512302--

