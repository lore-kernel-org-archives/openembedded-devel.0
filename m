Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F0C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:14:25 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web09.18531.1661177658740979675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6qz61HV;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3375488624aso267810867b3.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=BAmAN+vvbao/G2Jd3v38g9+n2EHx1DtGcs1jYy5fUVE=;
        b=K6qz61HVYAXUtLUbafYis+knzNA5xABpAmoSTWh93cI/N58sNkcfkDBAtlmy38164C
         8ZtvyrLdYC6H88yzoJOIEVXYvI2tYlkOqHEWiu/tHNaRECn6QLTz6DXmMaHXgKuaWxRQ
         mnaJ73e5rXrjIzipURai07VuhSMR6NretvBIT8zC/j6qkdWF7FkcAuU3ZpyhUWzm9TGN
         x9eeBnODc73bMmfVHoPJhuJYi20PAvQ/Y7FloW/NZL0XKYxOWb5bwSQ6UCM0rkebD0Wo
         KXe46h1C10tuTrOjcspt4CnMld3bA2m2/8aOYbX6EhU6NvBv2y5kYpIl/K4QDTVsi0c4
         lnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BAmAN+vvbao/G2Jd3v38g9+n2EHx1DtGcs1jYy5fUVE=;
        b=gL7O88V+fRBTk6lZRBDne13uilHlQa4SGXM5NwQ2bArm8wT7jWfaTA2IFUrXInweYs
         1TtVz0u5i8zavN6qnoWtB9/iHgWXjpBedg+JxT9vLT9M5lB4qimg75TvnAPI8AJ1YcwX
         OhoRBPcTaop+b7xl6jUI+GNcqm30LrZYi8VmyAtCMd3exeggDO//Fqdw/ak+eMVmAO0A
         r4JAHtuubMk9Sb57WzwPXi572ObntYfWU+ipjbBwRuKHNsJn24SfRwd8oy+ByMUki0I/
         gp8uQYyhOVi2ANW18pEPxYkd4R19EW94TwansLyDvcgxHMpbmy8fYAqpabUm5xXpI5Uh
         mpAA==
X-Gm-Message-State: ACgBeo2gon24XQKGkjeo6hDtbO30yP1VsWWUiJKhgUlUzVePyZQEBmYb
	MvVKsCuIJaZNOSh39nq/exziGKMX6Mw/2q5O6Ns=
X-Google-Smtp-Source: 
 AA6agR768riIBue23s62q2NkaYLboJAtzvQndOATLsMe57rLEfFlb6QSI9cZj4XZm37GSaX2pqjAoz2YCWkujYNt9qg=
X-Received: by 2002:a81:1605:0:b0:336:eddd:97ec with SMTP id
 5-20020a811605000000b00336eddd97ecmr19302244yww.162.1661177657575; Mon, 22
 Aug 2022 07:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220820191150.5699-1-f_l_k@t-online.de>
 <52f6ee030dbf4e88a86e3702a5303d57@axis.com>
 <DMXYGR.GU3KE5WIU42D1@t-online.de>
 <301d7b0dabda40eba9b037c87a8fbd4e@axis.com>
In-Reply-To: <301d7b0dabda40eba9b037c87a8fbd4e@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Aug 2022 07:14:06 -0700
Message-ID: 
 <CAMKF1sr+5CqvUjPiaX0n4h1+Dxs7fRGibeWD=GjTYC49GHRZSQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000304eee05e6d51096"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 14:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98365

--000000000000304eee05e6d51096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 1:35 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> I still don=E2=80=99t understand how you intend for a =E2=80=9Cgstreamer=
=E2=80=9D distro feature
> to work. You use it in the pipewire recipe to decide whether to use the
> =E2=80=9Cgstreamer=E2=80=9D or =E2=80=9Cffmpeg=E2=80=9D PACKAGECONFIG by =
default. However, that seems very
> specific to pipewire. We use both GStreamer and FFmpeg in our products, s=
o
> using a distro feature to distinguish between them is not something
> universal.
>

I think we should not introduce distro feature here but propose it in core
first and after that make the change if agreed upon

>
>
> //Peter
>
>
>
> *From:* Markus Volk <f_l_k@t-online.de>
> *Sent:* den 21 augusti 2022 16:01
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.5=
6
>
>
>
>
>
> i tried to follow your suggestions,
>
> Thanks
>
>
>
> Am So, 21. Aug 2022 um 12:49:24 +0000 schrieb Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>:
>
> AFAIK, there are no current examples of "gstreamer" being used a distro
> feature. What is it supposed to mean? When is it supposed to be used? Why
> is it needed?
>
>
>
>
>
> I found an example of this, but I must confess that this was in an old
> third-party layer. What I want this DISTRO_FEATURE for is the ability to
> use it to enable/disable gstreamer support in recipes. Not just here in
> pipewire. The same goes for Jack. Is this already used as a DISTRO_FEATUR=
E?
> If so, maybe we could use it to make the Jack server depend on it instead
> of always building it as it currently does?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98361):
> https://lists.openembedded.org/g/openembedded-devel/message/98361
> Mute This Topic: https://lists.openembedded.org/mt/93149934/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000304eee05e6d51096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 22, 2022 at 1:35 AM Peter Kjellerstedt &lt;<a h=
ref=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:brea=
k-word">
<div class=3D"m_-3199117474822256842WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">I still=
 don=E2=80=99t understand how you intend for a =E2=80=9Cgstreamer=E2=80=9D =
distro feature to work. You use it in the pipewire recipe to decide whether=
 to use the =E2=80=9Cgstreamer=E2=80=9D or =E2=80=9Cffmpeg=E2=80=9D
 PACKAGECONFIG by default. However, that seems very specific to pipewire. W=
e use both GStreamer and FFmpeg in our products, so using a distro feature =
to distinguish between them is not something universal.</span></p></div></d=
iv></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think we sh=
ould not introduce distro feature here but propose it in core first and aft=
er that make the change if agreed upon=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wra=
p:break-word"><div class=3D"m_-3199117474822256842WordSection1"><p class=3D=
"MsoNormal" dir=3D"auto"><span lang=3D"EN-US" style=3D"color:#943634"><u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">//Peter=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a>&gt;
<br>
<b>Sent:</b> den 21 augusti 2022 16:01<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
<b>Subject:</b> RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.=
3.56<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div id=3D"m_-3199117474822256842geary-body">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">i tried to follow your suggestions,<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">Am So, 21. Aug 2022 um 12:49:24 +0000 schrieb Peter =
Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_=
blank">peter.kjellerstedt@axis.com</a>&gt;:<br>
<br>
<u></u><u></u></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">AFAIK, there are no current examples of &quot;gstrea=
mer&quot; being used a distro feature. What is it supposed to mean? When is=
 it supposed to be used? Why is it needed?<u></u><u></u></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I found an example of this, but I must confess that =
this was in an old third-party layer. What I want this DISTRO_FEATURE for i=
s the ability to use it to enable/disable gstreamer support in recipes. Not=
 just here in pipewire. The same goes
 for Jack. Is this already used as a DISTRO_FEATURE? If so, maybe we could =
use it to make the Jack server depend on it instead of always building it a=
s it currently does?<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98361): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98361" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98361</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93149934/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93149934/1997914</a><br>
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

--000000000000304eee05e6d51096--

