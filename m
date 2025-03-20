Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69646C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 21:16:55 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.6338.1742505412546267514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 14:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6XMzbjK;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so337888b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742505412; x=1743110212; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lwbk7Xh5O43yifIc2J7VEyqIPeJrNewg45J4WDBIoEg=;
        b=J6XMzbjK/7f1QwB5MfDr+o6XP91DliCvqyp4eSfv4yjJ3bww2DS/nlWCZmDTW48S/S
         o3HePsoboEmTZ3W/YOInTFMaCsoJABLgurRZFuU+Tb7G42BzaThPU8RqoBfa9skOPGJg
         4rV4GCPwDmVriB4UermvVnnerGew1J+yrVaGslgDgy4EY8LAAMSrWeLDx/IH3wX4wLXf
         esF2ETlL0CWRKmydz1hIA1lJxGv8HRMYIXDo7ImEU1vbC9MywAh7gj/s1Urr5AO3Bw1Z
         er4KexeonKCfiE4UczniLh6Xhz8PkYmTJJ+yMr/vsc1n6cJFPAcjgpqUlxYNFK/oDYS1
         dOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742505412; x=1743110212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwbk7Xh5O43yifIc2J7VEyqIPeJrNewg45J4WDBIoEg=;
        b=PaIfaCkAngHJjXWquJZUASexNGIw2+6jRi1twVWKGWyuJZZHN7ljfyS1U7r23nYCGh
         x63dmnatXhcBgLFoz9GYcxmRH0JhSs/cAst2Nr8UaGLmt9+gGaKKxhRnrX95OjfjusP4
         pzJrbDAkqnCC/msAnQt5z5xWzBcO0thRBwNMqjGIGuLBByaheAPJQdPEYbQxZS4YLUg4
         rcLKp4zWPiz+dOmmI/t27olsRiT9jqhjb5IVg1I3WtFD88xzWqTLH7jQzUNYicknyC7Y
         f0kZOXnccW7W5WQW6hQp0FLkD3C2XuSaIeAjpBPK3MwJ9Z/OrqrX3ai1hwwefCqwtmFy
         2OKg==
X-Gm-Message-State: AOJu0YwN59ivdNNdrmt1CX73mS1v96ArnrLtI5WqKVzjKmg63Y69F65j
	5DPe9kGVptPSqlrF5VFV0gjsYSxGwyJmepuQnJbE0+GwGKYHjYJo1E7wmCGwfS2rADMTIn5Svrk
	umjpNwv8Rzo7WhVLZrw9PxKCPthKBuj4i
X-Gm-Gg: ASbGnctr3k1Pr2N8Cdc79aszrX14zFYK/ZW0p7/PEKX6R9QcW0gyEePENIZUz2x847j
	jEG1VvTd/UYM/dyig964AASn/8Fzxz1FKR3QnFPBPiBiYF25O8zAysZGMUqjFu2gLQ4fa6vSm7v
	f+Fn30HtrlS5eC1acksF3tXffGTkI9/aY29h5IrjGCj42QHnb64G+uaA08
X-Google-Smtp-Source: AGHT+IGgpwjPXQg1uZT/DOzH2GUnKXAFdcJzqaPr18ws8BSu9n1LKR5QnkrxOc8WLnmCKiK2oGY98eVxWWzlQtmt02I=
X-Received: by 2002:a05:6808:7003:b0:3f8:1df6:400 with SMTP id
 5614622812f47-3febf724b31mr528596b6e.10.1742505411584; Thu, 20 Mar 2025
 14:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250320202606.1679616-1-peter.marko@siemens.com>
 <CAMKF1soQLwxn6cOiNcHYEBP_o=bUFoU_9wft4Ve3oY5s_JTtDw@mail.gmail.com> <PA4PR10MB5707E922FDF1F4ADD6B675F3FDD82@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PA4PR10MB5707E922FDF1F4ADD6B675F3FDD82@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 14:16:40 -0700
X-Gm-Features: AQ5f1JpN0rhz8NmIDjVv6g_suCTuZEBi5st91S9OuOVIRMTOreNH-8uKu3t4Z0c
Message-ID: <CAMKF1sp+Of=suAj=8mLHSfO+9hpcq-DQpn4SBG4PuK7Vb3Q44w@mail.gmail.com>
Subject: Re: [oe] [meta-something][PATCH 1/3] freerdp: patch CVE-2024-32661
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000013acef0630cca8d6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 21:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116148

--00000000000013acef0630cca8d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 1:36=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> It's a copy paste from my template.
> Previously I was always having meta-oe for everyting (e.g. meta-python).
> I guess I'll return my template back to meta-oe, as that looks better if =
I
> forget to change it.


Thanks for clarifying you can scriptize
It to insert the correct layer name in generated patches


>
> Peter
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Thursday, March 20, 2025 21:32
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-something][PATCH 1/3] freerdp: patch
> CVE-2024-32661
> >
> > Thanks for the patches, I noticed the subject line says meta-something
> > for the layer name which I did not understand, is that a typo?
> >
> > On Thu, Mar 20, 2025 at 1:26=E2=80=AFPM Peter Marko via lists.openembed=
ded.org
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > Pick commit [1] as mentioned in [2] or [3].
> > >
> > > [1]
> > https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc8145=
9
> > 2f56600793
> > > [2] https://nvd.nist.gov/vuln/detail/CVE-2024-32661
> > > [3] https://security-tracker.debian.org/tracker/CVE-2024-32661
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  .../freerdp/freerdp/CVE-2024-32661.patch      | 27 +++++++++++++++++=
++
> > >  .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
> > >  2 files changed, 28 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-
> > 32661.patch
> > >
> > > diff --git
> a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
> > b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
> > > new file mode 100644
> > > index 0000000000..002135b5e4
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
> > > @@ -0,0 +1,27 @@
> > > +From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:00
> > 2001
> > > +From: akallabeth <akallabeth@posteo.net>
> > > +Date: Sun, 21 Apr 2024 13:56:13 +0200
> > > +Subject: [PATCH] [core,info] fix missing check in
> rdp_write_logon_info_v1
> > > +
> > > +CVE: CVE-2024-32661
> > > +Upstream-Status: Backport
> > [
> https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc81459
> > 2f56600793]
> > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > +---
> > > + libfreerdp/core/info.c | 4 ++++
> > > + 1 file changed, 4 insertions(+)
> > > +
> > > +diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
> > > +index 7d6eec137..3395e4d2e 100644
> > > +--- a/libfreerdp/core/info.c
> > > ++++ b/libfreerdp/core/info.c
> > > +@@ -1322,6 +1322,10 @@ static BOOL rdp_write_logon_info_v1(wStream* =
s,
> > logon_info* info)
> > > +               return FALSE;
> > > +
> > > +       /* domain */
> > > ++      WINPR_ASSERT(info);
> > > ++      if (!info->domain || !info->username)
> > > ++              return FALSE;
> > > ++
> > > +       ilen =3D ConvertToUnicode(CP_UTF8, 0, info->domain, -1,
> &wString, 0);
> > > +
> > > +       if (ilen < 0)
> > > diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> b/meta-oe/recipes-
> > support/freerdp/freerdp_2.11.7.bb
> > > index ee4d4530d6..870c3ffe2f 100644
> > > --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > @@ -20,6 +20,7 @@ SRC_URI =3D
> > "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;protocol=3Dht=
tps
> > >             file://0001-Fix-const-qualifier-error.patch \
> > >             file://0002-Do-not-install-tools-a-CMake-targets.patch \
> > >
>  file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
> > > +           file://CVE-2024-32661.patch \
> > >             "
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#116142):
> https://lists.openembedded.org/g/openembedded-
> > devel/message/116142
> > > Mute This Topic: https://lists.openembedded.org/mt/111816531/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--00000000000013acef0630cca8d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 20, 2025 at 1:36=E2=80=AFPM Marko, Peter &=
lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">It&#39;s a copy paste fro=
m my template.<br>
Previously I was always having meta-oe for everyting (e.g. meta-python).<br=
>
I guess I&#39;ll return my template back to meta-oe, as that looks better i=
f I forget to change it.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for clarifying you can scriptize</div><div dir=3D"auto">It=
 to insert the correct layer name in generated patches</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Thursday, March 20, 2025 21:32<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-something][PATCH 1/3] freerdp: patch CVE-2024-=
32661<br>
&gt; <br>
&gt; Thanks for the patches, I noticed the subject line says meta-something=
<br>
&gt; for the layer name which I did not understand, is that a typo?<br>
&gt; <br>
&gt; On Thu, Mar 20, 2025 at 1:26=E2=80=AFPM Peter Marko via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org=
" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Pick commit [1] as mentioned in [2] or [3].<br>
&gt; &gt;<br>
&gt; &gt; [1]<br>
&gt; <a href=3D"https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f40=
22d36bfc81459" rel=3D"noreferrer" target=3D"_blank">https://github.com/Free=
RDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc81459</a><br>
&gt; 2f56600793<br>
&gt; &gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-32661" r=
el=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-20=
24-32661</a><br>
&gt; &gt; [3] <a href=3D"https://security-tracker.debian.org/tracker/CVE-20=
24-32661" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.deb=
ian.org/tracker/CVE-2024-32661</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siem=
ens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../freerdp/freerdp/CVE-2024-32661.patch=C2=A0 =C2=A0 =C2=
=A0 | 27 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../recipes-support/freerdp/<a href=3D"http://freerdp_2.11.=
7.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a> |=C2=A0 1 =
+<br>
&gt; &gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/=
CVE-2024-<br>
&gt; 32661.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-326=
61.patch<br>
&gt; b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..002135b5e4<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patc=
h<br>
&gt; &gt; @@ -0,0 +1,27 @@<br>
&gt; &gt; +From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: akallabeth &lt;<a href=3D"mailto:akallabeth@posteo.net" ta=
rget=3D"_blank">akallabeth@posteo.net</a>&gt;<br>
&gt; &gt; +Date: Sun, 21 Apr 2024 13:56:13 +0200<br>
&gt; &gt; +Subject: [PATCH] [core,info] fix missing check in rdp_write_logo=
n_info_v1<br>
&gt; &gt; +<br>
&gt; &gt; +CVE: CVE-2024-32661<br>
&gt; &gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4=
022d36bfc81459" rel=3D"noreferrer" target=3D"_blank">https://github.com/Fre=
eRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc81459</a><br>
&gt; 2f56600793]<br>
&gt; &gt; +Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@sie=
mens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + libfreerdp/core/info.c | 4 ++++<br>
&gt; &gt; + 1 file changed, 4 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c<br>
&gt; &gt; +index 7d6eec137..3395e4d2e 100644<br>
&gt; &gt; +--- a/libfreerdp/core/info.c<br>
&gt; &gt; ++++ b/libfreerdp/core/info.c<br>
&gt; &gt; +@@ -1322,6 +1322,10 @@ static BOOL rdp_write_logon_info_v1(wStre=
am* s,<br>
&gt; logon_info* info)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FA=
LSE;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* domain */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 WINPR_ASSERT(info);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (!info-&gt;domain || !info-&gt;username=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<=
br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ilen =3D ConvertToUnicode(CP_UTF8, 0,=
 info-&gt;domain, -1, &amp;wString, 0);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ilen &lt; 0)<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/freerdp/<a href=3D"http://fr=
eerdp_2.11.7.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a>=
 b/meta-oe/recipes-<br>
&gt; support/freerdp/<a href=3D"http://freerdp_2.11.7.bb" rel=3D"noreferrer=
" target=3D"_blank">freerdp_2.11.7.bb</a><br>
&gt; &gt; index ee4d4530d6..870c3ffe2f 100644<br>
&gt; &gt; --- a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2=
.11.7.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2=
.11.7.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a><br>
&gt; &gt; @@ -20,6 +20,7 @@ SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/FreeRDP/FreeRDP.git;branch=3D=
stable-2.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;protocol=3Dhttps</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-co=
nst-qualifier-error.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Do-not=
-install-tools-a-CMake-targets.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fixed-=
compilation-warnings-in-ainput-channel.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-32661.p=
atch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#116142): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-</a><br>
&gt; devel/message/116142<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111=
816531/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/111816531/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a><br>
&gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000013acef0630cca8d6--

