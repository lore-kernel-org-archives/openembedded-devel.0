Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5261C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:00:47 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37221.1782486042111545612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dDE3Sr5m;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664345f8645so1398637d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 08:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486041; cv=none;
        d=google.com; s=arc-20260327;
        b=dae1ARI5I24tVjWYpBrDe7PQoWBLWMc2nunrsg223jBdid9pkhgVQBlxh24QF0bONv
         +FyVG0tdUZCxrtQYQtdaN2gMfO9jOjy09CZtK/7CHAPfA8bZmhM1ehRR4E+IBPfzk4JJ
         MdTo/SH0Ra73yf7LRW5HeufGETEwt8T9DqgKOcJaxLhdPpKnc8QJ/V6+YXyS7L/pjnnR
         WS3+sTk89LDENpiF0tD9vbt7pCLO09AoP5nMt6dwrgVhF6v3uCLdrPP8o2/13fT+58dA
         dRqBUKn4L0w39OoEzHYvvobej2oe83FSshY3u/EnSbrK3tsS4a/GOh9r7K44RugRKOPI
         LvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2rA5pmWi0Uup1rbCnACo0xXwOG9OHgresntCT2Sda4I=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=prwarsem4G9gyTVTmJCrWjdOh3m36fTZw2OM/n0xAlHgwRU5/xrwb1vfQL+uJoRWaJ
         tcUWj533s8lGvSPz4e5Z2ltICjJ4tvziYFkAhCplA4E8hqPKgsbk7jUGPQMtLT61Kf5P
         GMg5HALNn6zaHegrN2eDt8LuRFuszGqaeckAt0gjpA9L9nx4OGypydzKcDyls/A9JI7z
         NzcQIcej6m1JicDpSrXcLcwNUDpLhGlswXF6KW4uNFq7uAywYvkYeG/deO7puUvQBm16
         IGzWnxgCbDWhXwT6SHVPecUdgAV1TkIA96b1oRnJ2wGbtxkIkYtG0KeuBGEuJ29bhGfr
         UiFw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782486041; x=1783090841; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2rA5pmWi0Uup1rbCnACo0xXwOG9OHgresntCT2Sda4I=;
        b=dDE3Sr5m6LOyON+gQUezOrQHdMCrxyJgKpFb7cxsPq6BaefchelE20G8dONHsY6QGX
         UNTE8wkN4XPoMeMroyoX0W8WxnNzLmXez3CEfGj/L2w2fzagWGFL71k0hISbT+5mPt7z
         +j0w0AKTe2kEoySr5qnOF+nfSXvmqsFJF2mpom42MBkcvTyrMVQcGaJq9u0gtDebJo1A
         f4l9GN8T5NcAXPkoP9rdbKkP/wo55+y+c6ZfGJYHNnZz/TmHY2Qq8MB9rh9xDxg0FhXy
         PXc44iRSASCmDsyEGV5QV9c1oh//G7ZNB2hUJPo1rA1DOo57wZDe6vewJrxQyNggBvX7
         Fofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486041; x=1783090841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rA5pmWi0Uup1rbCnACo0xXwOG9OHgresntCT2Sda4I=;
        b=rozRJzwwg7PG5oRFzVZPWLVYpH3v7aT4ahzq1ljBFeBq0IVWuT4xMpQpXKkSWNS3zg
         hluLsdQRrmBe/Dv+MFdiMDkxih20mQgSBpenUR33JiCjpiFO1x73SlhhKx2mVRAQP4fx
         aOi7+9WRwt8bKTu/Ph3PyPKS4ycw+fht8R5z5JueLbqFSCJZ1jop+zACMr7hgDtMM5xc
         d2uU1YZqZ65GhyNakrYbBqgpEZlbzfgbQg6w4uXDb8A80X+GmIm+5Fqf8/LvZdYPW3rh
         TYuto+JWSggNCgbMXWOHtxGkrapdg4wonOuaz7aEdpBryG9yqP+8f0+J35TU7mbL2ug5
         A8vg==
X-Gm-Message-State: AOJu0YzBLEh102ONRvnlDo1gKwXrdhC79plbOulJ5Af0uK/bC3cfrwWS
	wAtaOPpYMsW08ugNsIB9ntt6SomJCBfQ6ZWG2gHY1j1UPjDz0Mh6htJB1cxGWGGSrQ4iDloKTeU
	OQ4jT724PonNFqrQuntBKGjTIaH53sHQ=
X-Gm-Gg: AfdE7cmT+xEkSGpr46cFICPbf+ONlFqI9N+Durxk3xjX7DJaJtfvsTxtoPQ7MKvo6t2
	sqPXNtLYqSWgRDSzzVZzJ3gvTjGtxHNObQn/xtpls7+4bYkRn7UgojV/JZhBF9PuAF3RvKElZOY
	IBz/WkpQHx29jNSqvCRcEDGtkdRQ5I5NEX+K2vPFLNdjgenUt0Wwt3gMYJXgc2SKZwiWty/1SX3
	iVSm3PZG7LqDpuCmHquvYtKvlsWr5lFiXiIpPaaOa1ahLpKOm9wPSSjgCchE0aNyfpizEsCS9MQ
	9/J7cJcqz7mA62jWsHWcE7auA/d4vk1qefw2kPz04+nX7eSUY6ZhCNeW7spjuHu0qd2qMHxmpPm
	ANRv/CV/FiDEWYbiAIGNttAhK69z+jCUReVCA88utOaDBrogySZVSHVxVB01WSJ28KPIpvQ==
X-Received: by 2002:a05:690e:124d:b0:662:e26f:cd10 with SMTP id
 956f58d0204a3-66487dce322mr5720438d50.51.1782486040738; Fri, 26 Jun 2026
 08:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260624133044.1093352-1-f_l_k@t-online.de> <20260624133044.1093352-2-f_l_k@t-online.de>
 <CAMKF1sp3_iZ-NaFJ3qrdEFiOAwqXw+WDCZPtmiF1_4vfP-iRDA@mail.gmail.com> <4MS8HT.AOOYBUNON62K2@t-online.de>
In-Reply-To: <4MS8HT.AOOYBUNON62K2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 08:00:14 -0700
X-Gm-Features: AVVi8CdydYdA44NCv_4EDFkA1y3KsNqgwjMoBLZ4ceHFNVbkZ5OLTO6k7RbRLXc
Message-ID: <CAMKF1soM6i6ktktY3MAvwOf7Z1Uz=MXGYxkdkE2xabPwJNJo8A@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia:
 add libdvdread to RDEPENDS
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000046821c0655295f03"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127799

--00000000000046821c0655295f03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These are libraries, they should be pulled by shlibs code, I am not sure if
its needed to be added to packagegroups explicitly.

On Fri, Jun 26, 2026 at 7:08=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> I have added PACKAGE_ARCH =3D "${MACHINE_ARCH}" from packagegroup-meta-oe=
.
> Hopefully this setting will fix the error
>
> Am Fr, 26. Jun 2026 um 00:08:52 -07:00:00 schrieb Khem Raj <
> raj.khem@gmail.com>:
>
> This results in
>
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
> allarch packagegroup shouldn't depend on packages which are dynamically
> renamed (libdvdread to libdvdread8)
>
> On Wed, Jun 24, 2026 at 6:31=E2=80=AFAM Markus Volk via lists.openembedde=
d.org
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
>> libdvdread has recently been moved to meta-multimedia and the 'libdvdred=
'
>> runtime
>> dependency was removed from packagegroup-meta-oe
>> Add the runtime dependency to packagegroup-meta-multimedia so that is
>> included in
>> world builds again.
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>  .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/
>> packagegroup-meta-multimedia.bb
>> b/meta-multimedia/recipes-multimedia/packagegroups/
>> packagegroup-meta-multimedia.bb
>> index 4da9de3ff9..4e4f58f14a 100644
>> --- a/meta-multimedia/recipes-multimedia/packagegroups/
>> packagegroup-meta-multimedia.bb
>> +++ b/meta-multimedia/recipes-multimedia/packagegroups/
>> packagegroup-meta-multimedia.bb
>> @@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
>>      pipewire \
>>      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial",
>> bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} =
\
>>      libcamera \
>> +    libdvdread \
>>      vorbis-tools \
>>      libopenmpt \
>>      mimic \
>> --
>> 2.54.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#127715):
>> https://lists.openembedded.org/g/openembedded-devel/message/127715
>> Mute This Topic: https://lists.openembedded.org/mt/119956631/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000046821c0655295f03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>These are libraries, they should be pulled by shlibs =
code, I am not sure if its needed to be added to packagegroups=C2=A0explici=
tly.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Jun 26, 2026 at 7:08=E2=80=AFAM Markus Vo=
lk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_1=
632116563961243038geary-body" dir=3D"auto"><div>I have added=C2=A0<span sty=
le=3D"white-space:break-spaces">PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot=
; from packagegroup-meta-oe. Hopefully this setting will fix the error</spa=
n></div></div><div id=3D"m_1632116563961243038geary-quote" dir=3D"auto"><br=
>Am Fr, 26. Jun 2026 um 00:08:52 -07:00:00 schrieb Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br=
><blockquote type=3D"cite"><div dir=3D"ltr">This results in<div><br></div><=
div>ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An all=
arch packagegroup shouldn&#39;t depend on packages which are dynamically re=
named (libdvdread to libdvdread8)<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2026 at 6:31=E2=
=80=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-onli=
ne.de@lists.openembedded.org" target=3D"_blank">t-online.de@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">libdvdread has recently been moved to meta-multimedia and the &#39;l=
ibdvdred&#39; runtime<br>
dependency was removed from packagegroup-meta-oe<br>
Add the runtime dependency to packagegroup-meta-multimedia so that is inclu=
ded in<br>
world builds again.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-multimedia.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"ht=
tp://packagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-meta-multimedia.bb</a> b/meta-multimedia/recipes-multimedia/pa=
ckagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" rel=3D"noref=
errer" target=3D"_blank">packagegroup-meta-multimedia.bb</a><br>
index 4da9de3ff9..4e4f58f14a 100644<br>
--- a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
@@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0pipewire \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;LICENSE_FLAGS_ACCEPTED&quot;=
, &quot;commercial&quot;, bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &q=
uot;x11&quot;, &quot;projucer&quot;, &quot;&quot;, d), &quot;&quot;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0libcamera \<br>
+=C2=A0 =C2=A0 libdvdread \<br>
=C2=A0 =C2=A0 =C2=A0vorbis-tools \<br>
=C2=A0 =C2=A0 =C2=A0libopenmpt \<br>
=C2=A0 =C2=A0 =C2=A0mimic \<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127715): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127715" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127715</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119956631/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119956631/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></blockquote></div></div>

--00000000000046821c0655295f03--

