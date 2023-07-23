Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AECC001DC
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 06:56:23 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.21521.1690095373859086046
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jul 2023 23:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=G3UiSgSX;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so54824531fa.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690095372; x=1690700172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uERl8vhGdlQrQlyWtmDsoJt53bV4j6PjfPk97uEkUYY=;
        b=G3UiSgSXFtIIyQG8xJ6DD45EmulGTONmk/ERFQ5MhOa26QgkAnnR6Nh/JPIEJI+uPO
         G6Cx4J6IDkUGkvXqUant6iCjUHJIBuViyNY6+9NeLJh7S+vyGUDeU3zost2mzEDBE+tF
         lC7cZnwr0izzpfYSBLHa/8B767bSxup126Ung=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690095372; x=1690700172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uERl8vhGdlQrQlyWtmDsoJt53bV4j6PjfPk97uEkUYY=;
        b=SVdeOaTzhxxhhA9c90lZ4hIiMGMwgEibzxdI9qX7wKrn6n0F3R3xEAcvSFVVykL98N
         SWxX+RPygGYoJjfYAUnOyblz6JSnoVkhzDW3bqoMRhT8wwFYm04WUYsFOIq9hSaKo416
         VoQvLPdrqdK0/4f0n8W8NExZQ4d3IpnHhf6MfKFGuahhXJ+Lx8iU4Kn0gm0nCzpS4eKr
         TLc7zyxhBpSX9b3hs/67RuyNgL9SF9fdVNGcRl3GLaudytS6ifF1Fv+ctqtwk9H+BtFq
         7DoLx4P8jAzvGUKCu/jD9SlD3KQRSzqueT5mqTXbJVgwxwDd9hOgVme20ZNqgNV5tlWn
         ykEw==
X-Gm-Message-State: ABy/qLZDbqmAZapVmg36V/R1ERAe9ik/ZPn1loIzLxeueN1fjUFKwKwK
	iT59zmx2Z87SBcJewGJh6TzSD4mIv2StG8nkrX3pYw==
X-Google-Smtp-Source: APBJJlGeNE1/dlrWeiqZmec0EyJNLggM2Qpk/i8h2b6aYvPtc99XXZIpHPaFPbLSko+9i6tU8p4OstzLz35Egyi3dAk=
X-Received: by 2002:a2e:b5b8:0:b0:2b6:98c2:6378 with SMTP id
 f24-20020a2eb5b8000000b002b698c26378mr3619729ljn.2.1690095371739; Sat, 22 Jul
 2023 23:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230718025221.51690-1-vanusuri@mvista.com> <0e3b616e-5001-c0de-3976-8ef6f4367878@gmail.com>
In-Reply-To: <0e3b616e-5001-c0de-3976-8ef6f4367878@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sun, 23 Jul 2023 12:25:58 +0530
Message-ID: <CANQUz18TFrF_UGsY+esfAWEdXUiNocQ_cd3=CFwvysKrCJ_1nQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] c-ares: CVE-2023-32067 0-byte UDP
 payload Denial of Service
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000044fc35060121fe06"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 06:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103988

--00000000000044fc35060121fe06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Already patches have been sent to fix CVE-2023-32067 for kirkstone.

Below is the commit
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3Dc34b8aad5717d5e6cfa1baef5d3da1eab544def9

Thanks & Regards,
Vijay



On Sat, Jul 22, 2023 at 5:17=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:

>
>
> On 7/17/23 10:52 PM, Vijay Anusuri wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from
> https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d=
57ec1ae
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>
> Any chance of getting a kirkstone fix?  I will be updating Micklerdore
> to 1.19.1 (master) to address this issue.
>
> -Armin
> > ---
> >   .../c-ares/c-ares/CVE-2023-32067.patch        | 84 ++++++++++++++++++=
+
> >   .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
> >   2 files changed, 85 insertions(+)
> >   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> >
> > diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> > new file mode 100644
> > index 000000000..63192d3c8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> > @@ -0,0 +1,84 @@
> > +From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
> > +From: Brad House <brad@brad-house.com>
> > +Date: Mon, 22 May 2023 06:51:49 -0400
> > +Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
> > +
> > +Link: https://github.com/c-ares/c-ares/releases/tag/cares-1_19_1
> > +
> > +Upstream-Status: Backport [
> https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d=
57ec1ae
> ]
> > +CVE: CVE-2023-32067
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
> > + 1 file changed, 25 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > +index bf0cde464..6cac0a99f 100644
> > +--- a/src/lib/ares_process.c
> > ++++ b/src/lib/ares_process.c
> > +@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel,
> fd_set *read_fds,
> > + {
> > +   struct server_state *server;
> > +   int i;
> > +-  ares_ssize_t count;
> > ++  ares_ssize_t read_len;
> > +   unsigned char buf[MAXENDSSZ + 1];
> > + #ifdef HAVE_RECVFROM
> > +   ares_socklen_t fromlen;
> > +@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel
> channel, fd_set *read_fds,
> > +       /* To reduce event loop overhead, read and process as many
> > +        * packets as we can. */
> > +       do {
> > +-        if (server->udp_socket =3D=3D ARES_SOCKET_BAD)
> > +-          count =3D 0;
> > +-
> > +-        else {
> > +-          if (server->addr.family =3D=3D AF_INET)
> > ++        if (server->udp_socket =3D=3D ARES_SOCKET_BAD) {
> > ++          read_len =3D -1;
> > ++        } else {
> > ++          if (server->addr.family =3D=3D AF_INET) {
> > +             fromlen =3D sizeof(from.sa4);
> > +-          else
> > ++          } else {
> > +             fromlen =3D sizeof(from.sa6);
> > +-          count =3D socket_recvfrom(channel, server->udp_socket, (voi=
d
> *)buf,
> > +-                                  sizeof(buf), 0, &from.sa, &fromlen)=
;
> > ++          }
> > ++          read_len =3D socket_recvfrom(channel, server->udp_socket,
> (void *)buf,
> > ++                                     sizeof(buf), 0, &from.sa,
> &fromlen);
> > +         }
> > +
> > +-        if (count =3D=3D -1 && try_again(SOCKERRNO))
> > ++        if (read_len =3D=3D 0) {
> > ++          /* UDP is connectionless, so result code of 0 is a 0-length
> UDP
> > ++           * packet, and not an indication the connection is closed
> like on
> > ++           * tcp */
> > +           continue;
> > +-        else if (count <=3D 0)
> > ++        } else if (read_len < 0) {
> > ++          if (try_again(SOCKERRNO))
> > ++            continue;
> > ++
> > +           handle_error(channel, i, now);
> > ++
> > + #ifdef HAVE_RECVFROM
> > +-        else if (!same_address(&from.sa, &server->addr))
> > ++        } else if (!same_address(&from.sa, &server->addr)) {
> > +           /* The address the response comes from does not match the
> address we
> > +            * sent the request to. Someone may be attempting to perfor=
m
> a cache
> > +            * poisoning attack. */
> > +-          break;
> > ++          continue;
> > + #endif
> > +-        else
> > +-          process_answer(channel, buf, (int)count, i, 0, now);
> > +-       } while (count > 0);
> > ++
> > ++        } else {
> > ++          process_answer(channel, buf, (int)read_len, i, 0, now);
> > ++        }
> > ++      } while (read_len >=3D 0);
> > +     }
> > + }
> > +
> > diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> > index 152d91332..2aa789760 100644
> > --- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> > +++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> > @@ -9,6 +9,7 @@ SRC_URI =3D "git://
> github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
> >              file://CVE-2022-4904.patch \
> >              file://CVE-2023-31130.patch \
> >              file://CVE-2023-31147.patch \
> > +           file://CVE-2023-32067.patch \
> >             "
> >   SRCREV =3D "2aa086f822aad5017a6f2061ef656f237a62d0ed"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103892):
> https://lists.openembedded.org/g/openembedded-devel/message/103892
> > Mute This Topic: https://lists.openembedded.org/mt/100209081/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000044fc35060121fe06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div><div>Already patches ha=
ve been sent to fix CVE-2023-32067 for kirkstone.</div><div><br></div><div>=
Below is the commit</div><div><a href=3D"https://git.openembedded.org/meta-=
openembedded-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3Dc34b8aad5717=
d5e6cfa1baef5d3da1eab544def9">https://git.openembedded.org/meta-openembedde=
d-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3Dc34b8aad5717d5e6cfa1bae=
f5d3da1eab544def9</a></div><div><br></div><div>Thanks &amp; Regards,</div><=
div>Vijay<br></div><div><br></div><div>=C2=A0<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 22, 2023=
 at 5:17=E2=80=AFPM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">=
akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
<br>
On 7/17/23 10:52 PM, Vijay Anusuri wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport from <a href=3D"https://github.com/c-ares/c-=
ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e=
1573333b23052d57ec1ae</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Any chance of getting a kirkstone fix?=C2=A0 I will be updating Micklerdore=
 <br>
to 1.19.1 (master) to address this issue.<br>
<br>
-Armin<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../c-ares/c-ares/CVE-2023-32067.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 84 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-support/c-ares/<a href=3D"http://c-ares_1.18.1=
.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.18.1.bb</a>=C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 85 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/C=
VE-2023-32067.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patc=
h b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..63192d3c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" target=3D=
"_blank">brad@brad-house.com</a>&gt;<br>
&gt; +Date: Mon, 22 May 2023 06:51:49 -0400<br>
&gt; +Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc<br>
&gt; +<br>
&gt; +Link: <a href=3D"https://github.com/c-ares/c-ares/releases/tag/cares-=
1_19_1" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-ar=
es/releases/tag/cares-1_19_1</a><br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/c-are=
s/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e157=
3333b23052d57ec1ae</a>]<br>
&gt; +CVE: CVE-2023-32067<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/lib/ares_process.c | 41 +++++++++++++++++++++++++---------------=
-<br>
&gt; + 1 file changed, 25 insertions(+), 16 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; +index bf0cde464..6cac0a99f 100644<br>
&gt; +--- a/src/lib/ares_process.c<br>
&gt; ++++ b/src/lib/ares_process.c<br>
&gt; +@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel=
, fd_set *read_fds,<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0struct server_state *server;<br>
&gt; +=C2=A0 =C2=A0int i;<br>
&gt; +-=C2=A0 ares_ssize_t count;<br>
&gt; ++=C2=A0 ares_ssize_t read_len;<br>
&gt; +=C2=A0 =C2=A0unsigned char buf[MAXENDSSZ + 1];<br>
&gt; + #ifdef HAVE_RECVFROM<br>
&gt; +=C2=A0 =C2=A0ares_socklen_t fromlen;<br>
&gt; +@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel chann=
el, fd_set *read_fds,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* To reduce event loop overhead, read and=
 process as many<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * packets as we can. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (server-&gt;udp_socket =3D=3D ARES_SO=
CKET_BAD)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (server-&gt;addr.family =3D=3D=
 AF_INET)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (server-&gt;udp_socket =3D=3D ARES_SO=
CKET_BAD) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_len =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (server-&gt;addr.family =3D=3D=
 AF_INET) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fromlen =3D sizeof(fr=
om.sa4);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fromlen =3D sizeof(fr=
om.sa6);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D socket_recvfrom(channel=
, server-&gt;udp_socket, (void *)buf,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(buf), 0, &amp;<=
a href=3D"http://from.sa" rel=3D"noreferrer" target=3D"_blank">from.sa</a>,=
 &amp;fromlen);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_len =3D socket_recvfrom(chan=
nel, server-&gt;udp_socket, (void *)buf,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(bu=
f), 0, &amp;<a href=3D"http://from.sa" rel=3D"noreferrer" target=3D"_blank"=
>from.sa</a>, &amp;fromlen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count =3D=3D -1 &amp;&amp; try_again=
(SOCKERRNO))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read_len =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* UDP is connectionless, so resu=
lt code of 0 is a 0-length UDP<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* packet, and not an indica=
tion the connection is closed like on<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tcp */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (count &lt;=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (read_len &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (try_again(SOCKERRNO))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle_error(channel, i, now=
);<br>
&gt; ++<br>
&gt; + #ifdef HAVE_RECVFROM<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (!same_address(&amp;<a href=3D"h=
ttp://from.sa" rel=3D"noreferrer" target=3D"_blank">from.sa</a>, &amp;serve=
r-&gt;addr))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!same_address(&amp;<a href=3D=
"http://from.sa" rel=3D"noreferrer" target=3D"_blank">from.sa</a>, &amp;ser=
ver-&gt;addr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The address the response =
comes from does not match the address we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sent the request to. Some=
one may be attempting to perform a cache<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * poisoning attack. */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_answer(channel, buf, (int=
)count, i, 0, now);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (count &gt; 0);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_answer(channel, buf, (int=
)read_len, i, 0, now);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } while (read_len &gt;=3D 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1=
.18.1.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.18.1.bb</a> b/meta-=
oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.18.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">c-ares_1.18.1.bb</a><br>
&gt; index 152d91332..2aa789760 100644<br>
&gt; --- a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.18.1.b=
b" rel=3D"noreferrer" target=3D"_blank">c-ares_1.18.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.18.1.b=
b" rel=3D"noreferrer" target=3D"_blank">c-ares_1.18.1.bb</a><br>
&gt; @@ -9,6 +9,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/c=
-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps</a>=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-4904.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-31130.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-31147.=
patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-32067.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;2aa086f822aad5017a6f2061ef656f237a62d0ed&=
quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#103892): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/103892" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/103892</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10020908=
1/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100209081/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000044fc35060121fe06--

