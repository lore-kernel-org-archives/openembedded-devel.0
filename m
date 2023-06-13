Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6C6EB64D8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 13:59:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.13752.1686664762217932948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 06:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=al630WTN;
 spf=pass (domain: mvista.com, ip: 209.85.208.178, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b1a46ad09fso68609861fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686664760; x=1689256760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S8KESCzgLLWFxVJRv4cmyS4j0jfR5f3xcytT/LDi5Cs=;
        b=al630WTN8kujLKH97VrQH5gEtU1QUiXiMeTILap5eHhZu00uP18p9MuNzSp0Qo7R6l
         p/GSCKAzXBEx8phSVM7LXvQk3XWAbXMqPD41cKVU76TZdfNbn87JtBJPLOQmG8h8P+Il
         AhZh2FDSc7L16SE+O+UjPymd2/KxUKsShSQl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664760; x=1689256760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8KESCzgLLWFxVJRv4cmyS4j0jfR5f3xcytT/LDi5Cs=;
        b=dCK+lLEOJbMwi0+9UKFeQ6sHyGW/ijbL1bwsxwfUUbt96qJvGH5GBJCbFqVTns9jb1
         E0L/j/h9oYRegjorepxCctCuFuIkh+yYATcN6NKopUZKTUkr3LWC4QNGrLGUniMLoiDt
         rtphwW0MrpOMiWrvpSzx2kY+V8bqYGU2Iat17sq74kewnihCf77An9F2qz0KZqzgGgRL
         8dUiaw5KnG+mfNHkjpbgY6eY+0fGXx7oWxabThdaB7/WCJ28EKQ4LzEJM/9X237gNCtA
         pd+iGAcAYjIFXprr2oNUzzb1YyTOqgrXnmqSpyhAQgoByFozlP5EP/u+Q7+fbPTguZWo
         DGAQ==
X-Gm-Message-State: AC+VfDwV/jmKNJKUtuHs9cE8nWWLWIAc6J+wI7dom07jIUqjfJOzudwo
	iT9JTV7iwGLWYqJeyXRevo5IoNiALZiCHLXaMZj0zg==
X-Google-Smtp-Source: ACHHUZ4X0L1ZmtTQZ5l0+OKlKIBU4uI+GlXkq791xu/OLhAcz4dBUKg0LYb78YQTCkI6dc4Ld60l9W6vLPPBTvE8rDY=
X-Received: by 2002:a2e:a171:0:b0:2b2:90e:165f with SMTP id
 u17-20020a2ea171000000b002b2090e165fmr4612023ljl.17.1686664760175; Tue, 13
 Jun 2023 06:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <1765B238F36B7A92.7352@lists.openembedded.org> <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
 <CAOSpxdax2+ObAQOytUaQ4gEvFvwb3xVCpLJ53xFBFwN-k0VvKA@mail.gmail.com>
In-Reply-To: <CAOSpxdax2+ObAQOytUaQ4gEvFvwb3xVCpLJ53xFBFwN-k0VvKA@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 13 Jun 2023 19:29:08 +0530
Message-ID: <CANQUz1_ZoOofkAfd=2C6OopyVaeP+FQthnYp76arYimr5dOCuw@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] openldap: Fix CVE-2023-2953
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e2c01a05fe033d57"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 13:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103270

--000000000000e2c01a05fe033d57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the update ...!!!

On Tue, Jun 13, 2023 at 7:20=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Jun 12, 2023 at 10:24=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.c=
om>
> wrote:
>
> > Any update on this ?
>
> I'm the maintainer for oe-core and this is a meta-oe patch, so I
> believe Armin is the right person for an update :-)
>
> Steve
>
> > On Mon, Jun 5, 2023 at 12:49=E2=80=AFPM Vijay Anusuri via lists.openemb=
edded.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
> >>
> >> From: Vijay Anusuri <vanusuri@mvista.com>
> >>
> >> Upstream-Status: Backport
> >> [
> https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c090=
0f1a8f6af0a3fc3c4ce
> >> &
> >>
> https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d=
0398e78571d09fb808b
> ]
> >>
> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> ---
> >>  .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
> >>  .../openldap/openldap/CVE-2023-2953-2.patch   | 76 ++++++++++++++++++=
+
> >>  .../openldap/openldap_2.4.57.bb               |  2 +
> >>  3 files changed, 108 insertions(+)
> >>  create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> >>  create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> >>
> >> diff --git
> a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> >> new file mode 100644
> >> index 000000000..f4b4eb95d
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> >> @@ -0,0 +1,30 @@
> >> +From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00 200=
1
> >> +From: Howard Chu <hyc@openldap.org>
> >> +Date: Wed, 24 Aug 2022 14:40:51 +0100
> >> +Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
> >> +
> >> +Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
> >> +
> >> +Upstream-Status: Backport [
> https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c090=
0f1a8f6af0a3fc3c4ce
> ]
> >> +CVE: CVE-2023-2953
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + libraries/libldap/fetch.c | 2 ++
> >> + 1 file changed, 2 insertions(+)
> >> +
> >> +diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
> >> +index 9e426dc647..536871bcfe 100644
> >> +--- a/libraries/libldap/fetch.c
> >> ++++ b/libraries/libldap/fetch.c
> >> +@@ -69,6 +69,8 @@ ldif_open_url(
> >> +               }
> >> +
> >> +               p =3D ber_strdup( urlstr );
> >> ++              if ( p =3D=3D NULL )
> >> ++                      return NULL;
> >> +
> >> +               /* But we should convert to LDAP_DIRSEP before use */
> >> +               if ( LDAP_DIRSEP[0] !=3D '/' ) {
> >> +--
> >> +GitLab
> >> +
> >> diff --git
> a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> >> new file mode 100644
> >> index 000000000..02c43bc44
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> >> @@ -0,0 +1,76 @@
> >> +From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00 200=
1
> >> +From: Howard Chu <hyc@openldap.org>
> >> +Date: Thu, 25 Aug 2022 16:13:21 +0100
> >> +Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failu=
re
> >> +
> >> +Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
> >> +failure when dup'ing scheme.
> >> +
> >> +Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
> >> +
> >> +Upstream-Status: Backport [
> https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d=
0398e78571d09fb808b
> ]
> >> +CVE: CVE-2023-2953
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + libraries/libldap/url.c | 21 ++++++++++++---------
> >> + 1 file changed, 12 insertions(+), 9 deletions(-)
> >> +
> >> +diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
> >> +index dcf2aac9e8..493fd7ce47 100644
> >> +--- a/libraries/libldap/url.c
> >> ++++ b/libraries/libldap/url.c
> >> +@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(
> >> +               }
> >> +               ludp->lud_port =3D port;
> >> +               ludp->lud_host =3D specs[i];
> >> +-              specs[i] =3D NULL;
> >> +               p =3D strchr(ludp->lud_host, ':');
> >> +               if (p !=3D NULL) {
> >> +                       /* more than one :, IPv6 address */
> >> +                       if ( strchr(p+1, ':') !=3D NULL ) {
> >> +                               /* allow [address] and [address]:port =
*/
> >> +                               if ( *ludp->lud_host =3D=3D '[' ) {
> >> +-                                      p =3D
> LDAP_STRDUP(ludp->lud_host+1);
> >> +-                                      /* copied, make sure we free
> source later */
> >> +-                                      specs[i] =3D ludp->lud_host;
> >> +-                                      ludp->lud_host =3D p;
> >> +-                                      p =3D strchr( ludp->lud_host, =
']'
> );
> >> ++                                      p =3D strchr( ludp->lud_host+1=
,
> ']' );
> >> +                                       if ( p =3D=3D NULL ) {
> >> +                                               LDAP_FREE(ludp);
> >> +
>  ldap_charray_free(specs);
> >> +                                               return LDAP_PARAM_ERRO=
R;
> >> +                                       }
> >> +-                                      *p++ =3D '\0';
> >> ++                                      /* Truncate trailing ']' and
> shift hostname down 1 char */
> >> ++                                      *p =3D '\0';
> >> ++                                      AC_MEMCPY( ludp->lud_host,
> ludp->lud_host+1, p - ludp->lud_host );
> >> ++                                      p++;
> >> +                                       if ( *p !=3D ':' ) {
> >> +                                               if ( *p !=3D '\0' ) {
> >> +                                                       LDAP_FREE(ludp=
);
> >> +@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(
> >> +                               }
> >> +                       }
> >> +               }
> >> +-              ldap_pvt_hex_unescape(ludp->lud_host);
> >> +               ludp->lud_scheme =3D LDAP_STRDUP("ldap");
> >> ++              if ( ludp->lud_scheme =3D=3D NULL ) {
> >> ++                      LDAP_FREE(ludp);
> >> ++                      ldap_charray_free(specs);
> >> ++                      return LDAP_NO_MEMORY;
> >> ++              }
> >> ++              specs[i] =3D NULL;
> >> ++              ldap_pvt_hex_unescape(ludp->lud_host);
> >> +               ludp->lud_next =3D *ludlist;
> >> +               *ludlist =3D ludp;
> >> +       }
> >> +
> >> +       /* this should be an array of NULLs now */
> >> +-      /* except entries starting with [ */
> >> +       ldap_charray_free(specs);
> >> +       return LDAP_SUCCESS;
> >> + }
> >> +--
> >> +GitLab
> >> +
> >> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> >> index e3e9caa1b..1e7e6b3d7 100644
> >> --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> >> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> >> @@ -24,6 +24,8 @@ SRC_URI =3D "
> http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
> >>      file://openldap-CVE-2015-3276.patch \
> >>      file://remove-user-host-pwd-from-version.patch \
> >>      file://CVE-2022-29155.patch \
> >> +    file://CVE-2023-2953-1.patch \
> >> +    file://CVE-2023-2953-2.patch \
> >>  "
> >>  SRC_URI[md5sum] =3D "e3349456c3a66e5e6155be7ddc3f042c"
> >>  SRC_URI[sha256sum] =3D
> "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#103107):
> https://lists.openembedded.org/g/openembedded-devel/message/103107
> >> Mute This Topic: https://lists.openembedded.org/mt/99335615/7301997
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [vanusuri@mvista.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000e2c01a05fe033d57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the update ...!!!<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 13, 2023 at 7:=
20=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@=
sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Jun 12, 2023 at 10:24=E2=80=AFPM Vijay Anusuri &lt;<a hr=
ef=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>=
&gt; wrote:<br>
<br>
&gt; Any update on this ?<br>
<br>
I&#39;m the maintainer for oe-core and this is a meta-oe patch, so I<br>
believe Armin is the right person for an update :-)<br>
<br>
Steve<br>
<br>
&gt; On Mon, Jun 5, 2023 at 12:49=E2=80=AFPM Vijay Anusuri via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openem=
bedded.org" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Upstream-Status: Backport<br>
&gt;&gt; [<a href=3D"https://git.openldap.org/openldap/openldap/-/commit/75=
2d320cf96e46f24c0900f1a8f6af0a3fc3c4ce" rel=3D"noreferrer" target=3D"_blank=
">https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c090=
0f1a8f6af0a3fc3c4ce</a><br>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://git.openldap.org/openldap/openldap/-/commit/656=
3fab9e2feccb0a684d0398e78571d09fb808b" rel=3D"noreferrer" target=3D"_blank"=
>https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0=
398e78571d09fb808b</a>]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../openldap/openldap/CVE-2023-2953-1.patch=C2=A0 =C2=A0| 30=
 ++++++++<br>
&gt;&gt;=C2=A0 .../openldap/openldap/CVE-2023-2953-2.patch=C2=A0 =C2=A0| 76=
 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 .../openldap/<a href=3D"http://openldap_2.4.57.bb" rel=3D"no=
referrer" target=3D"_blank">openldap_2.4.57.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;&gt;=C2=A0 3 files changed, 108 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/openldap/openldap=
/CVE-2023-2953-1.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/openldap/openldap=
/CVE-2023-2953-2.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-29=
53-1.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patc=
h<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..f4b4eb95d<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.pa=
tch<br>
&gt;&gt; @@ -0,0 +1,30 @@<br>
&gt;&gt; +From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Howard Chu &lt;<a href=3D"mailto:hyc@openldap.org" target=
=3D"_blank">hyc@openldap.org</a>&gt;<br>
&gt;&gt; +Date: Wed, 24 Aug 2022 14:40:51 +0100<br>
&gt;&gt; +Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup fai=
lure<br>
&gt;&gt; +<br>
&gt;&gt; +Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a=
<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://git.openldap.org/op=
enldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce" rel=3D"n=
oreferrer" target=3D"_blank">https://git.openldap.org/openldap/openldap/-/c=
ommit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce</a>]<br>
&gt;&gt; +CVE: CVE-2023-2953<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + libraries/libldap/fetch.c | 2 ++<br>
&gt;&gt; + 1 file changed, 2 insertions(+)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.=
c<br>
&gt;&gt; +index 9e426dc647..536871bcfe 100644<br>
&gt;&gt; +--- a/libraries/libldap/fetch.c<br>
&gt;&gt; ++++ b/libraries/libldap/fetch.c<br>
&gt;&gt; +@@ -69,6 +69,8 @@ ldif_open_url(<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D ber_=
strdup( urlstr );<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( p =3D=3D N=
ULL )<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* But we =
should convert to LDAP_DIRSEP before use */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( LDAP_=
DIRSEP[0] !=3D &#39;/&#39; ) {<br>
&gt;&gt; +--<br>
&gt;&gt; +GitLab<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-29=
53-2.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patc=
h<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..02c43bc44<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.pa=
tch<br>
&gt;&gt; @@ -0,0 +1,76 @@<br>
&gt;&gt; +From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Howard Chu &lt;<a href=3D"mailto:hyc@openldap.org" target=
=3D"_blank">hyc@openldap.org</a>&gt;<br>
&gt;&gt; +Date: Thu, 25 Aug 2022 16:13:21 +0100<br>
&gt;&gt; +Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup f=
ailure<br>
&gt;&gt; +<br>
&gt;&gt; +Avoid unnecessary strdup in IPv6 addr parsing, check for strdup<b=
r>
&gt;&gt; +failure when dup&#39;ing scheme.<br>
&gt;&gt; +<br>
&gt;&gt; +Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59=
<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://git.openldap.org/op=
enldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b" rel=3D"n=
oreferrer" target=3D"_blank">https://git.openldap.org/openldap/openldap/-/c=
ommit/6563fab9e2feccb0a684d0398e78571d09fb808b</a>]<br>
&gt;&gt; +CVE: CVE-2023-2953<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + libraries/libldap/url.c | 21 ++++++++++++---------<br>
&gt;&gt; + 1 file changed, 12 insertions(+), 9 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c<br=
>
&gt;&gt; +index dcf2aac9e8..493fd7ce47 100644<br>
&gt;&gt; +--- a/libraries/libldap/url.c<br>
&gt;&gt; ++++ b/libraries/libldap/url.c<br>
&gt;&gt; +@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;l=
ud_port =3D port;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;l=
ud_host =3D specs[i];<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs[i] =3D NU=
LL;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D strc=
hr(ludp-&gt;lud_host, &#39;:&#39;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D=
 NULL) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* more than one :, IPv6 address */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ( strchr(p+1, &#39;:&#39;) !=3D NULL ) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* allow [address] and [add=
ress]:port */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( *ludp-&gt;lud_host =3D=
=3D &#39;[&#39; ) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D=
 LDAP_STRDUP(ludp-&gt;lud_host+1);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* co=
pied, make sure we free source later */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs=
[i] =3D ludp-&gt;lud_host;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ludp-=
&gt;lud_host =3D p;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D=
 strchr( ludp-&gt;lud_host, &#39;]&#39; );<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D=
 strchr( ludp-&gt;lud_host+1, &#39;]&#39; );<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ( p =3D=3D NULL ) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDAP_FREE(ludp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldap_charray_free(specs);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return LDAP_PARAM_ERROR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =
=3D &#39;\0&#39;;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Tr=
uncate trailing &#39;]&#39; and shift hostname down 1 char */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =
=3D &#39;\0&#39;;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_ME=
MCPY( ludp-&gt;lud_host, ludp-&gt;lud_host+1, p - ludp-&gt;lud_host );<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p++;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ( *p !=3D &#39;:&#39; ) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( *p !=3D &#39;\0&#39; ) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDAP_FREE(ludp);=
<br>
&gt;&gt; +@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldap_pvt_hex_un=
escape(ludp-&gt;lud_host);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;l=
ud_scheme =3D LDAP_STRDUP(&quot;ldap&quot;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ludp-&gt;l=
ud_scheme =3D=3D NULL ) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 LDAP_FREE(ludp);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ldap_charray_free(specs);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return LDAP_NO_MEMORY;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs[i] =3D NU=
LL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldap_pvt_hex_un=
escape(ludp-&gt;lud_host);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;l=
ud_next =3D *ludlist;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ludlist =
=3D ludp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* this should be an array of NULLs no=
w */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 /* except entries starting with [ */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ldap_charray_free(specs);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return LDAP_SUCCESS;<br>
&gt;&gt; + }<br>
&gt;&gt; +--<br>
&gt;&gt; +GitLab<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/openldap/<a href=3D"http://op=
enldap_2.4.57.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</=
a> b/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_2.4.57.bb"=
 rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
&gt;&gt; index e3e9caa1b..1e7e6b3d7 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_=
2.4.57.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_=
2.4.57.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
&gt;&gt; @@ -24,6 +24,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.openldap=
.org/software/download/OpenLDAP/openldap-release/$" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.openldap.org/software/download/OpenLDAP/openldap-r=
elease/$</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://openldap-CVE-2015-3276.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://remove-user-host-pwd-from-version.patch=
 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-29155.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-2953-1.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-2953-2.patch \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;e3349456c3a66e5e6155be7ddc3f042c&q=
uot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;c7ba47e1e6ecb5b436f3d43281df57a=
beffa99262141aec822628bc220f6b45a&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#103107): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/103107" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/103107</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9933=
5615/7301997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/99335615/7301997</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000e2c01a05fe033d57--

