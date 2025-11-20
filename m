Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50072CF9C7E
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 18:28:37 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1495.1763663311355022957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 10:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXxfKX9V;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63fc6115d65so989408d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763663310; x=1764268110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zXHLA9BJKuzcBJmgVYtrSU2mLlK0jgfTVeuB1bgYykY=;
        b=CXxfKX9VVCwy6O7N7oUZPpmbYhfdUxNwv/CJjJepxh2YwH3BvA/8O28UfzSTC67aK6
         eOm/FzohNBhSsHndJS6ySdh1lT7bYA/0ksK0lBapRFWcCgfl+UVC4WhslFclLO2sqf4N
         6gio9nfxCzopPTUy1O+H2L7KtTpuqZgszIWIeEaQ2wro8ghWDaQ2Z7hWQTpgK04RK3Wf
         AL5nCyHvtEup6nwAC/IiVCa848Q7kqTzC4X3Mc27GGnDEEUJIZgNTlFasFG2as3I4aoj
         g/zH3Lx7THZyB2AiC8fuUguLulzYZropkhDMCHnAOz6aeH6Ptb8qos056Aww9VTg8AQR
         mtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763663310; x=1764268110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXHLA9BJKuzcBJmgVYtrSU2mLlK0jgfTVeuB1bgYykY=;
        b=DIo/aLcqeSG5/lcu4gIUm595ntRvbEhvRTVX4pO6O/LsPkgmUPtS6KYsMRg0/+RxjY
         0Xyg+MDW1EosmjCu7LbdzawbbWJ8cKuRJQyscIu6FLtLo8z8tYNzDXcXG4h93FDseAb+
         Rl5UCHKmiAPqy/mKAFtecvXlBNiwmssaEg0rG4ItXmFyi1TXgdkmmZywvxt3Tyh7yYVO
         gWUd2qyJCXVh0wJHxPVpcbnH00xxSndWOK3XH5SbdAmsPmZqo/zzgqatlL9aXRfHq5oG
         DWPpI4uqN9GWJfWQqC88xK+mKZNoYusBzr9cxIniMP/vRBhgMvnW6PS16L8CI0GBFsW/
         +KQw==
X-Gm-Message-State: AOJu0YxhFZnigo/4YPcwYuuBfagzvaHpzRYOK3KtRRIq5kKgV1GWgVrF
	gc618Cd6Ezs/ikyIaOeBE7D/TgrXhPRZa/vmvCY5DI23Tvah92AZB1Ff91790ADnloypgNlbZVe
	nyoblOR13NqsVkEMmMoA5NCfvB495ARC4eESTgJc=
X-Gm-Gg: ASbGncs8n6KEIFbTOTxZk8gdPHZjCn+GoMofP4puRPcAqNKvC3HMNxBFSnxDHfRabam
	i/E53lL7B6IGyiIHx0++gcoCwrxW8o3PSUkcnuofzyQ8dvKWfG4D55uD8ctCJeJYegh6IIjrV/+
	N95ZjdIFMxINClpt0ZYHlrs0yj7gWkARhtP8gfylG96E9t4wHfefWdLtT8lqqIXSGlqiWT7XafK
	XVUZrWfP3gBJ2WtC4JQwzqbzFsZtxQ6Xs3rbfRxzLqnDtI0USRq9yy5iAk+VS6K706LpYcEu8he
	QP7TtIQeviLSCrzA+eXftlKqN1wEgtykpd4agjtctijdpD22F4pkaYycZOhsCQpOdxtlbqzvYw1
	ENlJl4PzDa/nOSeh75mX7B16UugWRQo/I/+shzMR/RYcoh/nfWaXGqnhP
X-Google-Smtp-Source: AGHT+IF+APB4eh46gMXHPvlRGn4p35alx5X4PwSaw4sl8wmSvilaz81AX2yM8LGMO2Cq02byeNPFZ24nvg+as9sykRc=
X-Received: by 2002:a05:690e:1208:b0:63f:bdfa:666 with SMTP id
 956f58d0204a3-642f7815d47mr3074383d50.27.1763663310387; Thu, 20 Nov 2025
 10:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20251120132334.779326-1-Moritz.Haase@bmw.de>
In-Reply-To: <20251120132334.779326-1-Moritz.Haase@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Nov 2025 10:28:04 -0800
X-Gm-Features: AWmQ_bmh5oBpT4GB-OU0a2gvWF4S7-vAqO1OYWIUqsDcCtLXdZOHlHwXbvJSZ6A
Message-ID: <CAMKF1spPh+ehJxj+7dA+HAatbBKmpsfs6mrn0Z=E3yj=kh7RtQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is
 indeed respected
To: Moritz.Haase@bmw.de
Cc: openembedded-devel@lists.openembedded.org, changqing.li@windriver.com
Content-Type: multipart/alternative; boundary="0000000000001e7d3206440add31"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 18:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121954

--0000000000001e7d3206440add31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it should go to openembedded-core mailing list, since curl is in core layer=
.

On Thu, Nov 20, 2025 at 5:24=E2=80=AFAM Moritz Haase via lists.openembedded=
.org
<Moritz.Haase=3Dbmw.de@lists.openembedded.org> wrote:

> Due to what looks like a copy'n'paste mistake, the environment setup scri=
pt
> might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
> untouched. Fix that.
>
> CC: changqing.li@windriver.com
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh
> b/meta/recipes-support/curl/curl/environment.d-curl.sh
> index 581108ef35..b948db2cf6 100644
> --- a/meta/recipes-support/curl/curl/environment.d-curl.sh
> +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
> @@ -1,6 +1,6 @@
>  # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected
> host cert, then cert in buildtools
> -# CAFILE/CAPATH is auto-deteced when source buildtools
> -if [ -z "${CURL_CA_PATH:-}" ]; then
> +# CAFILE/CAPATH is auto-detected when source buildtools
> +if [ -z "${CURL_CA_BUNDLE:-}" ]; then
>         if [ -n "${CAFILE:-}" ];then
>                 export CURL_CA_BUNDLE=3D"$CAFILE"
>         elif [ -e
> "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121936):
> https://lists.openembedded.org/g/openembedded-devel/message/121936
> Mute This Topic: https://lists.openembedded.org/mt/116390303/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001e7d3206440add31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">it should go to openembedded-core mailing list, since curl=
 is in core layer.</div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 20, 2025 at 5:24=E2=80=
=AFAM Moritz Haase via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;Moritz.Haase=3D<a href=3D"mailto:bmw.de@lists.openembe=
dded.org">bmw.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Due to what looks like a copy&#39;n&=
#39;paste mistake, the environment setup script<br>
might override &#39;CURL_CA_BUNDLE&#39; from the host env instead of leavin=
g it<br>
untouched. Fix that.<br>
<br>
CC: <a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank">changqi=
ng.li@windriver.com</a><br>
Signed-off-by: Moritz Haase &lt;<a href=3D"mailto:Moritz.Haase@bmw.de" targ=
et=3D"_blank">Moritz.Haase@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a> | 4 ++--<=
br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/curl/curl/<a href=3D"http://environment.d=
-curl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a> b/=
meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.sh" rel=
=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
index 581108ef35..b948db2cf6 100644<br>
--- a/meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
+++ b/meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detec=
ted host cert, then cert in buildtools<br>
-# CAFILE/CAPATH is auto-deteced when source buildtools<br>
-if [ -z &quot;${CURL_CA_PATH:-}&quot; ]; then<br>
+# CAFILE/CAPATH is auto-detected when source buildtools<br>
+if [ -z &quot;${CURL_CA_BUNDLE:-}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${CAFILE:-}&quot; ];then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CURL_CA_BUND=
LE=3D&quot;$CAFILE&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ss=
l/certs/ca-certificates.crt&quot; ];then<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121936): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121936" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121936</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116390303/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116390303/1997914</a><br>
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

--0000000000001e7d3206440add31--

