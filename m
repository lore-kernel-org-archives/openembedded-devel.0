Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5595DC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:42:18 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.21058.1646062937129298848
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OGG+RVkD;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cm8so18205550edb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xrgA7XdHRJP2Kk2YkntUahGT6e4DdPwp6BkLAhUjYeE=;
        b=OGG+RVkDDMB+/G6ixKGXUYitoVA8BsqOlC0vaB5AF9emnHs6ngEZ6yqpVJ0OpeDIGV
         gSQZSMcjuMSuK+k+fNZ91ONiJB2HSlreBQub+Ins623FjphjAgv1rFgx8dtKECSM8IEu
         2NP7fP31/BPYpSsWIQsw+l7FG7n0hUyDQO5pG7JRYnIiYYculpOkHVTNZbe2Ibt5lRD6
         9DqSXR1trl9rPZq/xIecTb2hjeDU+Ucxl3gNqN1rMmEROpiy2BpvxqXoFgqYG4Kn3Py2
         coFhyQ2CozdhQPvi6ShRpvN2YzyU/37qc8rnwwCatQrcF8YthMt5Q4sQ6NDm7ONkrkQH
         lOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xrgA7XdHRJP2Kk2YkntUahGT6e4DdPwp6BkLAhUjYeE=;
        b=YKzMLrfyNX1tx6y9WMNyUa/n4p6rxk0ltx/XXPqm9sYgDXgvgu6WlhmmfWvBGZmXjK
         wwEikBjpMzuj7jVIXNme+SHJjVwtsNov9d+yx9hWaAbF0Q9is2pauRyzi4y5P1rUCVbG
         AzmZxv38k+mE542pJ8aWAHmWSBkD8/KO4yqaNVLuPfiOLgljnaVG0LbrsGoWJEHaMJar
         GAHzViUfTM8ptTFILuOtgKuVJV3NeOXAm3I7YYDEfsm0PJU5QsBRBcH5kSCb36UR6mVn
         kdB44O1QQbbdoLM7QEllR68gjN6GtkrnGioKYV7cAAZpX79zfwdueFo3+umuuw0BmFXx
         0P4Q==
X-Gm-Message-State: AOAM530stOxv+EPCVPh/Aj62rENARgMWkAd1vPTFLBrLxHU1VOgBFX6f
	fSYOB7/ORvzmvOtglLNgwlR03kdRcOXh/N7qAVQ=
X-Google-Smtp-Source: 
 ABdhPJyMLUQOkf/3CiCWE/M1crn67nJ1QzxsOA4nbpsJvHSTtwDl20suu3tij7tVjQ8PswsFgn0USoqGM5BaghLcr/4=
X-Received: by 2002:a05:6402:142b:b0:413:2b86:7af2 with SMTP id
 c11-20020a056402142b00b004132b867af2mr20495989edx.102.1646062935199; Mon, 28
 Feb 2022 07:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20220228152958.1419-1-matthias@extraklein.de>
In-Reply-To: <20220228152958.1419-1-matthias@extraklein.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 28 Feb 2022 07:42:04 -0800
Message-ID: 
 <CANx9H-DPVHCHnuibYjzpoyxL6yo7uZKDM_jCmNujV5C2HHv1uw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-smbus: fix wheel build Recipe
 does not inherit pypi nor would PN be a good guess for the wheel name so set
 PIP_INSTALL_PACKAGE appropriately. PYPA_WHEEL doesn't respect
 SETUPTOOLS_SETUP_PATH so set PYPA_WHEEL appropriately.
To: Matthias Klein <matthias@extraklein.de>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	Konrad Weihmann <kweihmann@outlook.com>
Content-Type: multipart/alternative; boundary="00000000000087d33205d915e4ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95581

--00000000000087d33205d915e4ce
Content-Type: text/plain; charset="UTF-8"

Please shorten the "short log" (the subject line)

On Mon, Feb 28, 2022 at 7:30 AM Matthias Klein <matthias@extraklein.de>
wrote:

> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  meta-python/recipes-devtools/python/python3-smbus_4.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> index ecdff3ada..1a6c99cfc 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> @@ -13,4 +13,6 @@ S = "${WORKDIR}/i2c-tools-${PV}"
>
>  inherit setuptools3
>
> +PIP_INSTALL_PACKAGE = "smbus"
> +PYPA_WHEEL = "${S}/py-smbus/dist/smbus-*-*.whl"
>
You could use:
PYPA_WHEEL = "${SETUPTOOOLS_SETUP_PATH}/dist/smbus-*-*.whl"

We could have used
PIP_INSTALL_DIST_PATH = "${SETUPTOOLS_SETUP_PATH}/dist" but there is a
problem with the version here.
The PV of the recipe is for the version of the i2c-tools tarball, but the
actual version of py-smbus as picked up by the uptream wheel tooling is 1.1.

So no matter what, this recipe is a special corner case. As rburton has
said "bitbake is not psychic".

Also, you might consider using python3-smbus2 (
https://layers.openembedded.org/layerindex/recipe/120644/ ) which is not 10
years old without any updates.

 SETUPTOOLS_SETUP_PATH = "${S}/py-smbus"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95580):
> https://lists.openembedded.org/g/openembedded-devel/message/95580
> Mute This Topic: https://lists.openembedded.org/mt/89452706/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000087d33205d915e4ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Please shorten the &quot;short log&quot; =
(the subject line)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Feb 28, 2022 at 7:30 AM Matthias Klein &lt;<a hre=
f=3D"mailto:matthias@extraklein.de">matthias@extraklein.de</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Ma=
tthias Klein &lt;<a href=3D"mailto:matthias@extraklein.de" target=3D"_blank=
">matthias@extraklein.de</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-smbus_4=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-smbus_4.3.bb</a> | 2 ++=
<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
smbus_4.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-smbus_4.3.bb</a>=
 b/meta-python/recipes-devtools/python/<a href=3D"http://python3-smbus_4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-smbus_4.3.bb</a><br>
index ecdff3ada..1a6c99cfc 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-smbus_4=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-smbus_4.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-smbus_4=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-smbus_4.3.bb</a><br>
@@ -13,4 +13,6 @@ S =3D &quot;${WORKDIR}/i2c-tools-${PV}&quot;<br>
<br>
=C2=A0inherit setuptools3<br>
<br>
+PIP_INSTALL_PACKAGE =3D &quot;smbus&quot;<br>
+PYPA_WHEEL =3D &quot;${S}/py-smbus/dist/smbus-*-*.whl&quot;<br></blockquot=
e><div>You could use:</div><div>PYPA_WHEEL =3D &quot;${SETUPTOOOLS_SETUP_PA=
TH}/dist/smbus-*-*.whl&quot;</div><div><br></div><div>We could have used</d=
iv><div>PIP_INSTALL_DIST_PATH =3D &quot;${SETUPTOOLS_SETUP_PATH}/dist&quot;=
 but there is a problem with the version here.</div><div>The PV of the reci=
pe is for the version of the i2c-tools tarball, but the actual version of p=
y-smbus as picked up by the uptream wheel tooling is 1.1.</div><div><br></d=
iv><div>So no matter what, this recipe is a special corner case. As rburton=
 has said &quot;bitbake is not psychic&quot;.</div><div>=C2=A0</div><div>Al=
so, you might consider using python3-smbus2 (<a href=3D"https://layers.open=
embedded.org/layerindex/recipe/120644/">https://layers.openembedded.org/lay=
erindex/recipe/120644/</a> ) which is not 10 years old without any updates.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0SETUPTOOLS_SETUP_PATH =3D &quot;${S}/py-smbus&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95580): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95580" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95580</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89452706/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89452706/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000087d33205d915e4ce--

