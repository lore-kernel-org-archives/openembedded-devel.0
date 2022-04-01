Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC1EC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 04:02:53 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.6499.1648785772595509565
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hy6Xs2O/;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id o13so1409666pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYHejRXQOcdqD3Of3dqKIDVFNDfKP7oCCFPvAoo2biQ=;
        b=Hy6Xs2O/u9ck2kNCGfdVCJRGwPOlpztSFPC0rtulN/E4k7jq9Re4KDxytuMri1gfcZ
         A9Lt9h7E+kZNKf631wrluW3gte2+AN+f8NZvtnxNM0qcXn4Aj+ulkWbJbCxjZVTxdCtx
         HrE4Hvu1/68CIkajnPSU/d5+r6fefI6fwb1CGctf5VN/9beQBiVOf+3fdOt0rXbSUUBZ
         pNJTbaIF5+0xtOTGA7zyESahMF3s5VUuXqyB0KMjOVH+C5wxMqVIwr7b89IVjFGgUISn
         4Cd7hjdB8C4sSGIPIEMco/Sp74T5Tq1JiqtuKRW1dLIZhwL2iiXADkamqzuPJb9hpk7f
         Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYHejRXQOcdqD3Of3dqKIDVFNDfKP7oCCFPvAoo2biQ=;
        b=eOmy1vltLERP85Ja6UA4inuPC3RQY3BnzeNxzqj5xFJTMLdAUPpcU7SlNkVjJFAD6E
         iay4GtZyJpnCv7/iyVVFhWShzKDf/M1WdEcZw0TmQNwRvBFmVZ8RjH1WrHZwXTWzAsBT
         4MJufqhPcoWbBsLxLlJwtN34KmEcu5aF8z9btubaqpBuLzymT59D6mA+BUga1nyxa/KD
         BMP5MqYjL1qGD7/knSB9/Ap2Wh9gM+fmfC7C8KWdkZx7GBeQ+stSJx3hxnNj2iH1kMZ7
         8lT87CrUiEPbw+Bi/AHRY4RfI0zSlxml2DeVXns69teLKY37iwRw6/3GokD5O2Y70J01
         7FgA==
X-Gm-Message-State: AOAM532E7VoOGHRYXL7M0IsmTb7Rbd3u1d/K/GXWkWHlVyozPbjuq5Ka
	D6cxOIf18Ak6sqO2HTR2CbJt3C23Gf0kXulCCWU=
X-Google-Smtp-Source: 
 ABdhPJytjOAjTLOaN2+73SqTzM+N7njMvx5bq/fDwQK0IkwCsLGev7IfCuS148ebQvEQIz8w0E46Q6/b8rHaLteBrP4=
X-Received: by 2002:a63:931d:0:b0:398:a2b7:76b9 with SMTP id
 b29-20020a63931d000000b00398a2b776b9mr11082285pge.239.1648785772028; Thu, 31
 Mar 2022 21:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648784612-10348-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1648784612-10348-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 31 Mar 2022 21:02:39 -0700
Message-ID: 
 <CANx9H-A1UCGRtLNhLjyvRaWMES6w8my1ZCOTLmbD6_wqB3xvMw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-nocasedict: upgrade 1.0.2 ->
 1.0.3
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000040ac2e05db8fdaea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 04:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96319

--00000000000040ac2e05db8fdaea
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 8:44 PM zhengruoqin <zhengrq.fnst@fujitsu.com>
wrote:

> License-Update: version updated to 1.0.3
>

Again. This is not the correct use of the License-Update tag. Please look
into what has actually changed. We need to know why the LIC_FILES_CHKSUM
has changed in case we need to get our lawyers involved, etc.


>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...ython3-nocasedict_1.0.2.bb => python3-nocasedict_1.0.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.2.bb
> => python3-nocasedict_1.0.3.bb} (50%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/
> python3-nocasedict_1.0.3.bb
> similarity index 50%
> rename from meta-python/recipes-devtools/python/
> python3-nocasedict_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
> index 591b9c6b8d..a47c4a455f 100644
> --- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
> @@ -1,8 +1,8 @@
>  SUMMARY = "A case-insensitive ordered dictionary for Python"
>  HOMEPAGE = "https://github.com/pywbem/nocasedict"
>  LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
>
> -SRC_URI[sha256sum] =
> "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
> +SRC_URI[sha256sum] =
> "8220b97ba06b08eb2deded774c406c77e0ca0d5352ae71249f6f9d1f2a17bd7b"
>
>  inherit pypi setuptools3
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96317):
> https://lists.openembedded.org/g/openembedded-devel/message/96317
> Mute This Topic: https://lists.openembedded.org/mt/90170592/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000040ac2e05db8fdaea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 8:44 PM zheng=
ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">License-Update: version updated to 1.0.3<br></blockquote><div><br></div=
><div>Again. This is not the correct use of the License-Update tag. Please =
look into what has actually changed. We need to know why the LIC_FILES_CHKS=
UM has changed in case we need to get our lawyers involved, etc.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ython3-nocasedict_1.0.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ython3-nocasedict_1.0.2.bb</a> =3D&gt; <a href=3D"http://p=
ython3-nocasedict_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-no=
casedict_1.0.3.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-nocasedict_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedi=
ct_1.0.2.bb</a> =3D&gt; <a href=3D"http://python3-nocasedict_1.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-nocasedict_1.0.3.bb</a>} (50%)<br=
>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
nocasedict_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedic=
t_1.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-nocasedict_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocas=
edict_1.0.3.bb</a><br>
similarity index 50%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-n=
ocasedict_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedict=
_1.0.2.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-noc=
asedict_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedict_1=
.0.3.bb</a><br>
index 591b9c6b8d..a47c4a455f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-nocased=
ict_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedict_1.0.2=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-nocased=
ict_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocasedict_1.0.3=
.bb</a><br>
@@ -1,8 +1,8 @@<br>
=C2=A0SUMMARY =3D &quot;A case-insensitive ordered dictionary for Python&qu=
ot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/pywbem/nocasedict" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/pywbem/nocasedict</a=
>&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da87a7059d580c45495c1218f53=
e3610d&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75=
310742&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b=
34c390c6c58885c85a0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8220b97ba06b08eb2deded774c406c77e0ca0d5352ae7=
1249f6f9d1f2a17bd7b&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96317): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96317" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96317</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90170592/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
90170592/924729</a><br>
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

--00000000000040ac2e05db8fdaea--

