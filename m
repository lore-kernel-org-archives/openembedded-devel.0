Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDBCCEBF9C
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:33:36 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2605.1763433206058605780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGZa8JQK;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-786d1658793so45546827b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763433205; x=1764038005; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N4R79r0fxi09sOpdmWPBb0fUCHQ3fmOFOKkPneViAyM=;
        b=nGZa8JQKK4CMB1i8Hy24GxSr0PCGvP9qq7ugVcwhjjmgfTFVoa38wT8c7vnREjjN4E
         71Y1AKusaraR3FG9JyrQdSDOwoB+bvQ37Q5K4OXN4mLkItQzaUOjTWdwAoLAIdotWeob
         zPf1yn6PPvuDHDMvb1v4Z0EhTROtxVEoroH7CR7exS6b6IXujzDUTF8Zk5FuQTBKVzwl
         0c9Ke5UNxkGgW/KA6KjQgKwN2mNpaYMwly4ZGrEcWiQFvFWZmW3Vn/ryqy8qw3KnBhrN
         NbC9queVpIROctfN6gLLcZoewH4Hc+OPTjyMDQUU1m15rBWnOPyj/NMkcxdYqAHh7yfx
         2FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763433205; x=1764038005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4R79r0fxi09sOpdmWPBb0fUCHQ3fmOFOKkPneViAyM=;
        b=Zs467GZp+S29HZ4R5zqN6ZdFuEfopVcj0v1DFwwci5bxZ/jo14qNi1yf+yeB671qYw
         WGtMsMMPnaq7G9lyRZJu6ORNtT/5ZPmYzmX9kZ8v/ptHCB2dlvYQAMPWeBmTxYoMGvp4
         f64Zd0Ozy425IYjPwtItkdVArRFHo4qgqxkaoehPOLLCPzB1aW8nHqcSrGWepJbLRxum
         hsuZwQ3kxqoFMedrlKJ5UV3yAxPghosaUVqWJ8rwrlC3BtqE1IN+ZisAlB2yi2a8vyhl
         IYIHfQzHcaoNDYycQb8FFoX6egGLwql3sUrxz/UdAQd1NU9AftGQkTpiMI7vUfq5yYJD
         kSfA==
X-Forwarded-Encrypted: i=1; AJvYcCWPuMMG2X23fg++ZDhnZLiT6o6XEFBM50bQbgbFEF6p+I3rxgKlzQixl0YIb7jCVN8Tyzxw4NWkYTaTFTF8OxuneXE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyS3w+A1UK3akUEYV5zUqpO344ZEWt1HXkHhQN9pasV7Z5ahGGu
	UZ5RSxnsS0CU8uFA/KVqYRgiIkz2akXJWRCdmL3HBwzgcfHQZckTE5PuOLCOasKyFKHeYmqwFs7
	w9r/H3YJ2ZlhJE4zobNOpRlQQUWSupAM=
X-Gm-Gg: ASbGncsjIgUxli6y6AlTeB6cyY/OLzgZbGC8EBjgBRq5nk0YunAqqvRh4md/Et/Hpat
	bcDDlpGuGLEgMof4lx87aDRcgOOiXtJaaWywrgEJ4Uf6aWtA6gmweEIZLhFrd4zeaG/rKu/nBrC
	eEEPXdkTXfG0UphwMPexCghYZnIYFkRVOqEYDJaQ7CIOhO1FyGt8WTbUOl5IUYwdkiTYqAs7nUE
	a/BpBgYZLHKnG1Iz7ToeKT59/aU25NEa+zYyGHjiRSEFGMzdMFue9fRm9q1mYa1AH6x1T9D2akF
	CJJr01C4uyWe4k+Wlp5Qy76dsNiSdtm74blUzeEIZxd6SpzZJSv4LaZptkpN+n4DVmS2h+nTPBC
	7JbNP/3bkPYxaj6c9S0domXbIY9ta9Dr4hXCzTQ==
X-Google-Smtp-Source: AGHT+IF/gRX81tDkz67tOOp70qM7reV560LYe8XTYAICGQTPlgmOcOCoc6IiJ+fnpqsCqA0syENTGbJWlL8LOVpYm8Y=
X-Received: by 2002:a05:690c:7603:b0:786:a774:e415 with SMTP id
 00721157ae682-78929efb86emr195401117b3.56.1763433205098; Mon, 17 Nov 2025
 18:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
 <20251118002723.829508-2-ankur.tyagi85@gmail.com> <CA+s=J=xiUQufA6Yzzb3hP6nD5CVwGNHWJN1BGY=X8UnCHXQNCQ@mail.gmail.com>
 <CADySD0ERyR_HgiZ3JcFf=pHAkMfcfTLRbx-WtiTdo123SZXObw@mail.gmail.com>
In-Reply-To: <CADySD0ERyR_HgiZ3JcFf=pHAkMfcfTLRbx-WtiTdo123SZXObw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Nov 2025 18:32:58 -0800
X-Gm-Features: AWmQ_bmv0GhdMb_ptGvRwzCAWzOK6OAYWTNobrJX5ndZMEbycOfPupdkEBYBfm0
Message-ID: <CAMKF1sqCx-e-PgryYUj0t+M2ZrF3TEyhYE2HQgbNgkBvmjLE9w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/6] smarty: upgrade 5.4.5 -> 5.6.0
To: ankur.tyagi85@gmail.com
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c66ae20643d549e8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121801

--000000000000c66ae20643d549e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:24=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Tue, Nov 18, 2025 at 3:15=E2=80=AFPM Anuj Mittal
> <anuj.mittal@oss.qualcomm.com> wrote:
> >
> >
> >
> > On Tue, Nov 18, 2025 at 8:27=E2=80=AFAM Ankur Tyagi via lists.openembed=
ded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> Also update CVE_PRODUCT.
> >>
> >> Changelog:
> >> https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
> >> ---
> >>  .../smarty/{smarty_5.4.5.bb =3D> smarty_5.6.0.bb}               | 4 +=
+--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb =3D>
> smarty_5.6.0.bb} (82%)
> >>
> >> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> >> similarity index 82%
> >> rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> >> rename to meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> >> index 047f10589d..88afc55c15 100644
> >> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> >> +++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> >> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2c0f216b2120ffc367e20f2b56df51b3"
> >>
> >>  SRC_URI =3D "git://
> github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv=
${PV}
> <http://github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster=
;tag=3Dv$%7BPV%7D>
> "
> >>
> >> -SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
> >> +SRCREV =3D "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
> >>
> >>
> >>  INHIBIT_DEFAULT_DEPS =3D "1"
> >> @@ -34,4 +34,4 @@ FILES:${PN} +=3D "${datadir}/php/smarty3/"
> >>
> >>  RDEPENDS:${PN} =3D "php"
> >>
> >> -CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the
> meta-openembedded is a different smarty package compared to the one which
> has the CVE issue."
> >> +CVE_PRODUCT =3D "smarty:smarty"
> >>
> >
> > I think this change should be split into a separate patch so it can be
> backported.
>
> thanks Anuj, good suggestion.
>

I agree. Just resend this patch reworked, no need to send full series again=
.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121800):
> https://lists.openembedded.org/g/openembedded-devel/message/121800
> Mute This Topic: https://lists.openembedded.org/mt/116349300/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c66ae20643d549e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 17,=
 2025 at 6:24=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Nov=
 18, 2025 at 3:15=E2=80=AFPM Anuj Mittal<br>
&lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.com" target=3D"_blank">anuj.=
mittal@oss.qualcomm.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Nov 18, 2025 at 8:27=E2=80=AFAM Ankur Tyagi via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Also update CVE_PRODUCT.<br>
&gt;&gt;<br>
&gt;&gt; Changelog:<br>
&gt;&gt; <a href=3D"https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGE=
LOG.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/smarty-php/=
smarty/blob/v5.6.0/CHANGELOG.md</a><br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../smarty/{<a href=3D"http://smarty_5.4.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">smarty_5.4.5.bb</a> =3D&gt; <a href=3D"http://smart=
y_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-support/smarty/{<a href=3D"http://sma=
rty_5.4.5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> =3D&=
gt; <a href=3D"http://smarty_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>smarty_5.6.0.bb</a>} (82%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/smarty/<a href=3D"http://smar=
ty_5.4.5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> b/met=
a-oe/recipes-support/smarty/<a href=3D"http://smarty_5.6.0.bb" rel=3D"noref=
errer" target=3D"_blank">smarty_5.6.0.bb</a><br>
&gt;&gt; similarity index 82%<br>
&gt;&gt; rename from meta-oe/recipes-support/smarty/<a href=3D"http://smart=
y_5.4.5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-support/smarty/<a href=3D"http://smarty_=
5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a><br>
&gt;&gt; index 047f10589d..88afc55c15 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.=
5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.6.=
0.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a><br>
&gt;&gt; @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D=
2c0f216b2120ffc367e20f2b56df51b3&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/smarty-=
php/smarty.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"no=
referrer" target=3D"_blank">github.com/smarty-php/smarty.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3Dv${PV}</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV =3D &quot;e26f82d02c4d18fc82094c28fbc65f711e39ed5d&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;1fc41e385da8a27a87bec5914392ab662a7bb8ec&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;&gt; @@ -34,4 +34,4 @@ FILES:${PN} +=3D &quot;${datadir}/php/smarty3/&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;php&quot;<br>
&gt;&gt;<br>
&gt;&gt; -CVE_STATUS[CVE-2020-10375] =3D &quot;cpe-incorrect: The recipe us=
ed in the meta-openembedded is a different smarty package compared to the o=
ne which has the CVE issue.&quot;<br>
&gt;&gt; +CVE_PRODUCT =3D &quot;smarty:smarty&quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think this change should be split into a separate patch so it can be=
 backported.<br>
<br>
thanks Anuj, good suggestion.<br></blockquote><div><br></div><div>I agree. =
Just resend this patch reworked, no need to send full series again.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121800): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121800" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121800</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116349300/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116349300/1997914</a><br>
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

--000000000000c66ae20643d549e8--

