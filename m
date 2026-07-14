Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB44C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:17:41 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3602.1784006257671746472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UQWfEHDH;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ea9f974ebso5373847b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 22:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784006257; cv=none;
        d=google.com; s=arc-20260327;
        b=CFO4AE4nNGj4DIKyV1qePqkh3/vImtrJSYWxlx4GAIw5G7cfYQ7imR2s2ZBVzb3307
         cnnzT/qCBXwEPQ6FvsRjMa9y31qGeE5yPNHDwGwWLnNoTo7b/7ocgEmCjy95akLK4FJ4
         MfSMGhbjsF1t/hvp0RcIbNaeNBSx4Gfo5OwsBMlFvam5QfbsorOxrZSDlLLXzQKa7CCa
         ZcrEzcSZq9OOrd6GxjqNQ+Vpf05Gj3Ss9ZDNe+fv+szlb/aIPHhOUOvFvhIE4HX/tlQx
         KK42FAhPWaDFbfoMn4yQP9H7w+8nrsvI3loteY9KYFvOdsjS0613+UiE3l59WXD9NzJP
         Ce+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f3he3fkMpDawIUeTmYDxK2xBHlyBWmp2DSWdGH08GBk=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=IWw+j1iYc77v9JfzeFn+LgE6JVmUff0wkb2lOtcr1+reoJdC+ndmIDXVGor+LVC5cv
         E/hCxoY9PgIK1VY5OzahLvB/bJ4kV6XrU3yvB9tr1fJxeF583Z2GO2XC3gIbpFr8SMgz
         Drq24xiO/UbEl/PIP2Mjm2IFTVNVCu1MsQMxALMXyAKIdIeNkvsk0idH7s0Ea+OEOv5s
         aUV+NSOu8EaY2j0nXJ7SvPwY7Oc1nCTjyyB67+A+IqXWiYGMHtXVsAplZWp0sBAVKQam
         rOfBtSrHe0/HtS4+0l3XN5ADQ+A3OksUWqr+obZjB2lp6qRNAAO+LpYpTG6zwC7x9XIz
         qjdA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784006257; x=1784611057; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3he3fkMpDawIUeTmYDxK2xBHlyBWmp2DSWdGH08GBk=;
        b=UQWfEHDHgVDuyIqXAtnuJFUR2Po/WGkXga5ThoQj9R13fgYTMDzv3pwEGHWJh+OSQv
         OiVCGWGe+5EGyN+2w8MYpEkcGXDTTwEcB0mfv9rIElp6LTaegRBVLV2CvOw+g4rOXYEs
         rZ3iWXqb0rwp2Dns7zUNeI7kqG7NwiDGjlLVycAiesxHyIzZkqQY4SKZ2PcK3ydYvTdI
         r9fiUl9Gtb1uJ4Jg9oZIJjwo8z8X7LrxDSDxOxDEwruVhoOcw2UcGmwXFWrYz2Bk7bew
         HgSge85nCfWj0MTehFYlz2gLWecfNwhKisYbHfmCTmtQrvQYPw1HH88YJrdRoBZcro9C
         j9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006257; x=1784611057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f3he3fkMpDawIUeTmYDxK2xBHlyBWmp2DSWdGH08GBk=;
        b=qaVvFR/6dAl+rekmf4d1/cluf3S1A+c0NWp+rBoKKpeQZrCwZ0bFya2qy4+WrAxo4A
         o++QhDwZK3fySX8zpMM6GMpqpow5Q3S/XtNgUhlp3SXJooAiud+uD+EhjEZTrQPOZsdO
         wxWAwROihgAQJMY/gC6yLtv0Mr5YHPW+/iTz3eubhwZCTiQEvL2jz+1UDstvB+qkodaX
         dZo0MqJprkYlaydM7KTZIessjWM4xVdZj3ho27sfpnqunv31OyR2QSnNMv9biV34OHRg
         4BQvhb2GG9M/ASHusLt2Sp3nieJhvyw+gUG/VqXDmGV9C239Sd/Igtq5ok3w+i6Cpype
         Ia0g==
X-Gm-Message-State: AOJu0YwAM3WnmZIKQuyJ0BonlRnuYknwhMGVOh2VNG1xz4mgQ9Qy5pEy
	/KTv9sapDsPJ/1YxgwRyn2jaHWHY78+Sc0Y8z5uRcZwZR5h71XeIYfhkqS/8HoIoWs/+c0/AAZ4
	/vGkqPcxoQAjwU9wKXW6/gWGunaZOeJ8=
X-Gm-Gg: AfdE7cnl5YzMuEEXbaJB70fFiq2W35eKOFHcYst9JKp5fEwiUCkohcAryyf5j8lI6Xg
	auqXc8EcL/q57kYWYpBvbNoLEsjGuaK2VCVoUnDXeAZTVoNMs5flQ9c5GlJfrKVwM2rPnGvUblo
	TfQ27ST+hGgFgkYLcaPhdKNZ2ubpHFyo6IT32hrcZk4THaYvyC5hJImDAFPhb9kNeA6dm7QWP7b
	MOEMKG4FmTVY9fJLHsPZgfXZZP1HVfdAia8pLS29O540fP4XCsgH4x136cbU9WzxIYGlPUS8uon
	RLmqzvGMICqLKB+k0CXbyapm1fT9TSCi9gzUXBA0FVASjiUR+OIr7aK7bGy/aiRDOnOpCZ4u0pW
	PzrrnJH/gGu9mR2nxrU4tm/T+a6BI3QqxOyFRS2S5YgqQ0PkISI866cfZHs4HUlOatybSBA==
X-Received: by 2002:a05:690c:dc7:b0:81d:5806:ecc7 with SMTP id
 00721157ae682-81e900108e5mr82729987b3.1.1784006256465; Mon, 13 Jul 2026
 22:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783691257.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1783691257.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jul 2026 22:17:09 -0700
X-Gm-Features: AUfX_mxyXJhLBgx_SKYVZyZFUpNaxNF_FHl8gg5_UWQzCCwRkHpq1jeSZSk2-Yo
Message-ID: <CAMKF1spA=E4_9rk38FbWZv-OsYASOgk7qxLJhAZxJn6=_=k=VA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/10] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000319a2806568b53eb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 05:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128163

--000000000000319a2806568b53eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is installed now. Thanks Anuj

On Fri, Jul 10, 2026 at 4:34=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1616
>
> The following changes since commit
> 100027977216601000cbefc42c2ff6cf667e7b5e:
>
>   hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20
> +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to d97b5602d7f64422c94b7311466cda7f6b1962d5:
>
>   libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)
>
> ----------------------------------------------------------------
>
> Jason Schonberg (2):
>   nodejs: upgrade 22.22.3 -> 22.23.0
>   nodejs: upgrade 22.23.0 -> 22.23.1
>
> Joao Marcos Costa (1):
>   jsoncpp: fix GCC 16 (and Clang 22) build failure with u8 string
>     literals
>
> Qliangw (1):
>   libuio: fix FILE descriptor leak
>
> Shubham Pushpkar (6):
>   jq: Fix CVE-2026-40612
>   jq: Fix CVE-2026-41256
>   jq: Fix CVE-2026-41257
>   jq: Fix CVE-2026-43894
>   jq: Fix CVE-2026-43896
>   jq: Fix CVE-2026-44777
>
>  .../jq/jq/CVE-2026-40612.patch                | 127 +++++++++
>  .../jq/jq/CVE-2026-41256.patch                |  54 ++++
>  .../jq/jq/CVE-2026-41257.patch                |  57 ++++
>  .../jq/jq/CVE-2026-43894.patch                |  56 ++++
>  .../jq/jq/CVE-2026-43896.patch                |  73 ++++++
>  .../jq/jq/CVE-2026-44777.patch                | 243 ++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   6 +
>  ...build-failure-with-u8-string-literal.patch |  73 ++++++
>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
>  .../oe-npm-cache                              |   0
>  ....22.bb =3D> nodejs-oe-cache-native_22.23.bb} |   0
>  .../{nodejs_22.22.3.bb =3D> nodejs_22.23.1.bb}  |   2 +-
>  ...ix-fclose-leak-in-uio_line_from_file.patch |  31 +++
>  .../recipes-extended/libuio/libuio_0.2.1.bb   |   1 +
>  14 files changed, 723 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
>  create mode 100644
> meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-GCC-16-C-20-build-failu=
re-with-u8-string-literal.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.22 =3D>
> nodejs-oe-cache-22.23}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.22.bb
> =3D> nodejs-oe-cache-native_22.23.bb} (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.3.bb =3D>
> nodejs_22.23.1.bb} (99%)
>  create mode 100644
> meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_f=
ile.patch
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128133):
> https://lists.openembedded.org/g/openembedded-devel/message/128133
> Mute This Topic: https://lists.openembedded.org/mt/120215460/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000319a2806568b53eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is installed now. Thanks Anuj</div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Jul 10, 2026 at 4:34=E2=80=AFPM Anuj Mittal via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=
=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Please merge these changes in wrynose. Tested locally and o=
n autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1616" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1616</a><br>
<br>
The following changes since commit 100027977216601000cbefc42c2ff6cf667e7b5e=
:<br>
<br>
=C2=A0 hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20=
 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to d97b5602d7f64422c94b7311466cda7f6b1962d5:<br=
>
<br>
=C2=A0 libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 nodejs: upgrade 22.22.3 -&gt; 22.23.0<br>
=C2=A0 nodejs: upgrade 22.23.0 -&gt; 22.23.1<br>
<br>
Joao Marcos Costa (1):<br>
=C2=A0 jsoncpp: fix GCC 16 (and Clang 22) build failure with u8 string<br>
=C2=A0 =C2=A0 literals<br>
<br>
Qliangw (1):<br>
=C2=A0 libuio: fix FILE descriptor leak<br>
<br>
Shubham Pushpkar (6):<br>
=C2=A0 jq: Fix CVE-2026-40612<br>
=C2=A0 jq: Fix CVE-2026-41256<br>
=C2=A0 jq: Fix CVE-2026-41257<br>
=C2=A0 jq: Fix CVE-2026-43894<br>
=C2=A0 jq: Fix CVE-2026-43896<br>
=C2=A0 jq: Fix CVE-2026-44777<br>
<br>
=C2=A0.../jq/jq/CVE-2026-40612.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 127 +++++++++<br>
=C2=A0.../jq/jq/CVE-2026-41256.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++++<br>
=C2=A0.../jq/jq/CVE-2026-41257.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 57 ++++<br>
=C2=A0.../jq/jq/CVE-2026-43894.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 56 ++++<br>
=C2=A0.../jq/jq/CVE-2026-43896.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 73 ++++++<br>
=C2=A0.../jq/jq/CVE-2026-44777.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 243 ++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +<br>
=C2=A0...build-failure-with-u8-string-literal.patch |=C2=A0 73 ++++++<br>
=C2=A0.../recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" rel=
=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A0.../oe-npm-cache=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0....<a href=3D"http://22.bb" rel=3D"noreferrer" target=3D"_blank">22.=
bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-native_22.23.bb" rel=3D"no=
referrer" target=3D"_blank">nodejs-oe-cache-native_22.23.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0.../{<a href=3D"http://nodejs_22.22.3.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_22.22.3.bb</a> =3D&gt; <a href=3D"http://nodejs_22.23.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.1.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...ix-fclose-leak-in-uio_line_from_file.patch |=C2=A0 31 +++<br>
=C2=A0.../recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A014 files changed, 723 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-=
GCC-16-C-20-build-failure-with-u8-string-literal.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.22 =3D&gt;=
 nodejs-oe-cache-22.23}/oe-npm-cache (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs-oe-c=
ache-native_22.22.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-=
native_22.22.bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-native_22.23.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-native_22.23.bb</a=
>} (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_22.2=
2.3.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.3.bb</a> =3D&gt; =
<a href=3D"http://nodejs_22.23.1.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_22.23.1.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-=
leak-in-uio_line_from_file.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128133): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128133" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128133</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120215460/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120215460/1997914</a><br>
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

--000000000000319a2806568b53eb--

