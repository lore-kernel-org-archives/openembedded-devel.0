Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C93CCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 17:08:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.23431.1760548093101510850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 10:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0liHxXik;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so681284f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760548091; x=1761152891; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGNJHeluGwkc09Oi6cWARKAeXmDqB2+xQHztvDAod2A=;
        b=0liHxXik+8VkTPc7Aw1EHGLgkMm4Yg8GUWA20SQh60J9rX3UMYUdXGGx0bxMjb6JTZ
         SYNrXBU2fwzP2rwWV81q18NsQpvi/q+89LqWe/vLbBDVIfci5lyld+AxSxU2RlgR3kVK
         y9q3ujz1WGznoEDMddd/AotMBOk3MOGeJF2lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760548091; x=1761152891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGNJHeluGwkc09Oi6cWARKAeXmDqB2+xQHztvDAod2A=;
        b=N0odLS521KVF5RrVAuiI33GaHCnrKwOTeVCM5VEUArDsOw0nrCL48eFYbtW2IsZddU
         RrvEzTVC1HMv939YlP4p65tDCPCxzYMQ3XW7lcT7j3R+F4erNxuoSbm2aKde/WtIUs/E
         oRKJRgvXWqViV+YJ1FHq/+EyWa2lWEtMAt0u/w0inyCsOn79kwfHmsp/ukbSyGAwT0OG
         Q1PfbgNANxCcI+2uYf2jtDhhIMnXYAiWIhSwncYZS2w06U2Vs7/Kllk0iQQ2akvKWkFv
         Yg3TFClEBIslxo4DOeH6+/rb8xa8zZXEDHw0jdGo9MmagOcEpSqWapZdZhqWijGuFcLl
         gO/w==
X-Gm-Message-State: AOJu0Yxt70aABIxzTVAdXofWplUTvY5+oJFLAgpLARtMqEdB4AuIBw3e
	fJ69WKZe1xBzbEMipmY5uwzw1r+gHR022x/hEwXVuvXvkMi4faIhKdhyxiPaxl577pnUe4/Ph/H
	w6ipu3taG1VE14IyiOsiGsVv4Dw8ZUt/KKHe9ovEp66p0rcjf61Gtpp8nKA==
X-Gm-Gg: ASbGncu7SsxVKZ9QJ6pLPmkkNUWV8+MRmnYqZrQBRFbIPiuj4OI8g1j3nvDNyVWlHK7
	kuM5zvPf21vbBEgnN4W4QcW9ml2qIvE8uljK4V666Xg27oWSGMfZn5PF67u3J9cEgJRGtSedcIX
	a4ijuATTaN5wAdgEKdj3Vl9iqxYymWVMZax9y/kUypsmHCR3+Gj48DgDExt+qY6GbLYmLQoKlEF
	uvgbe3keSt+Qfsn+dIS8fBTPL67dqcesr4djx0IKmeZOZS++5PogUXDJNNtg2pVrf0ZN3w=
X-Google-Smtp-Source: AGHT+IFgcg/5QRLE7qkS8OsbMz3CTsqoZSYc8JcQvHDVGWtX9VxqG2fW0j26LE3Eik9uIiR9JmF6sHoUlvfb/K33H5Q=
X-Received: by 2002:a05:6000:3113:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-426fb7b41d8mr715809f8f.27.1760548091136; Wed, 15 Oct 2025
 10:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
 <20250926081914.3127272-6-hongxu.jia@windriver.com> <CAMSfU+6Y0DWjzBR9T8=5eQojoh2UaB=8_p57ziyANOMvFnTDGQ@mail.gmail.com>
In-Reply-To: <CAMSfU+6Y0DWjzBR9T8=5eQojoh2UaB=8_p57ziyANOMvFnTDGQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 15 Oct 2025 19:07:42 +0200
X-Gm-Features: AS18NWCfwKU20HzL4NqXtZTqJU--973vaHJHlC3vE_t-bJgNS1kO1NKiKcFohL8
Message-ID: <CAMSfU+7oUL+BuYryK9znLsByQs9fvM9ejSbbgSe+cthbesHqTQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v4 6/6] meta-python/conf/layer.conf:
 update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
To: hongxu.jia@eng.windriver.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000951e340641358b70"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 17:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120712

--000000000000951e340641358b70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 27 sept. 2025 =C3=A0 17:29, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Le ven. 26 sept. 2025 =C3=A0 10:21, hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :
>
>> Due to the recipes listed in OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES has
>> supported reproducibility, update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
>> to latest
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta-python/conf/layer.conf | 27 ---------------------------
>>  1 file changed, 27 deletions(-)
>>
>> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
>> index b887accbf8..202c66561f 100644
>> --- a/meta-python/conf/layer.conf
>> +++ b/meta-python/conf/layer.conf
>> @@ -21,31 +21,4 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>  # List of known non-reproducible package of the meta-python layer
>>  # Please keep this list sorted
>>  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
>> -    python3-evdev \
>> -    python3-evdev-dbg \
>> -    python3-evdev-src \
>> -    python3-frozenlist \
>> -    python3-frozenlist-dbg \
>> -    python3-kivy-src \
>> -    python3-lief \
>> -    python3-mlcommons-loadgen \
>> -    python3-mlcommons-loadgen-dbg \
>> -    python3-mlcommons-loadgen-src \
>> -    python3-pandas \
>> -    python3-pandas-dbg \
>> -    python3-pandas-src \
>> -    python3-propcache \
>> -    python3-propcache-dbg \
>> -    python3-pybind11-json-dev \
>> -    python3-pycocotools-src \
>> -    python3-pydantic-core \
>> -    python3-pynacl \
>> -    python3-pynacl-dbg \
>> -    python3-pynacl-src \
>> -    python3-pyproj \
>> -    python3-pyproj-dbg \
>> -    python3-pyproj-src \
>> -    python3-pyzmq \
>> -    python3-yarl \
>> -    python3-yarl-dbg \
>>
>
Hi Hong Xu,

Some of those are still not reproducible on the autobuilder test :
python3-lazy-object-proxy
python3-pandas-dbg
python3-pandas-src
python3-pandas
python3-pynacl-dbg
python3-pynacl-src
python3-pynacl

* logs:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/70/steps=
/41/logs/stdio
* diffoscope output:
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-python/oe-reprod=
ucible-20251011-vmjw_qbx/packages/diff-html/

Can you look into it?

With this merged (and tested) that will mean that meta-python is fully
> reproducible. That is excellent news!
>
> Thanks!
>
>  "
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119903):
>> https://lists.openembedded.org/g/openembedded-devel/message/119903
>> Mute This Topic: https://lists.openembedded.org/mt/115445264/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Yoann Congal
Smile ECS

--000000000000951e340641358b70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 27=
 sept. 2025 =C3=A0=C2=A017:29, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 26 sep=
t. 2025 =C3=A0 10:21, hongxu via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:eng.windriver.com@lists.openembedded.org" target=3D"_blank">eng.windri=
ver.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Due to the recipes listed in OEQ=
A_REPRODUCIBLE_EXCLUDED_PACKAGES has<br>
supported reproducibility, update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES<br>
to latest<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" r=
el=3D"noreferrer" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-python/conf/layer.conf | 27 ---------------------------<br>
=C2=A01 file changed, 27 deletions(-)<br>
<br>
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf<br>
index b887accbf8..202c66561f 100644<br>
--- a/meta-python/conf/layer.conf<br>
+++ b/meta-python/conf/layer.conf<br>
@@ -21,31 +21,4 @@ LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
=C2=A0# List of known non-reproducible package of the meta-python layer<br>
=C2=A0# Please keep this list sorted<br>
=C2=A0OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D &quot; \<br>
-=C2=A0 =C2=A0 python3-evdev \<br>
-=C2=A0 =C2=A0 python3-evdev-dbg \<br>
-=C2=A0 =C2=A0 python3-evdev-src \<br>
-=C2=A0 =C2=A0 python3-frozenlist \<br>
-=C2=A0 =C2=A0 python3-frozenlist-dbg \<br>
-=C2=A0 =C2=A0 python3-kivy-src \<br>
-=C2=A0 =C2=A0 python3-lief \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen-dbg \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen-src \<br>
-=C2=A0 =C2=A0 python3-pandas \<br>
-=C2=A0 =C2=A0 python3-pandas-dbg \<br>
-=C2=A0 =C2=A0 python3-pandas-src \<br>
-=C2=A0 =C2=A0 python3-propcache \<br>
-=C2=A0 =C2=A0 python3-propcache-dbg \<br>
-=C2=A0 =C2=A0 python3-pybind11-json-dev \<br>
-=C2=A0 =C2=A0 python3-pycocotools-src \<br>
-=C2=A0 =C2=A0 python3-pydantic-core \<br>
-=C2=A0 =C2=A0 python3-pynacl \<br>
-=C2=A0 =C2=A0 python3-pynacl-dbg \<br>
-=C2=A0 =C2=A0 python3-pynacl-src \<br>
-=C2=A0 =C2=A0 python3-pyproj \<br>
-=C2=A0 =C2=A0 python3-pyproj-dbg \<br>
-=C2=A0 =C2=A0 python3-pyproj-src \<br>
-=C2=A0 =C2=A0 python3-pyzmq \<br>
-=C2=A0 =C2=A0 python3-yarl \<br>
-=C2=A0 =C2=A0 python3-yarl-dbg \<br></blockquote></div></div></div></block=
quote><div><br></div><div>Hi Hong Xu,</div><div><br></div><div>Some of thos=
e are still not reproducible on the autobuilder test :</div><div><div>pytho=
n3-lazy-object-proxy<br>python3-pandas-dbg<br>python3-pandas-src<br>python3=
-pandas<br>python3-pynacl-dbg<br>python3-pynacl-src<br>python3-pynacl<br><b=
r></div></div><div>* logs: <a href=3D"https://autobuilder.yoctoproject.org/=
valkyrie/#/builders/87/builds/70/steps/41/logs/stdio">https://autobuilder.y=
octoproject.org/valkyrie/#/builders/87/builds/70/steps/41/logs/stdio</a></d=
iv><div>* diffoscope output: <a href=3D"https://valkyrie.yocto.io/pub/repro=
-fail-openembedded/meta-python/oe-reproducible-20251011-vmjw_qbx/packages/d=
iff-html/">https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-pytho=
n/oe-reproducible-20251011-vmjw_qbx/packages/diff-html/</a></div><div><br><=
/div><div>Can you look into it?=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></di=
v></div><div dir=3D"auto">With this merged (and tested) that will mean that=
 meta-python is fully reproducible. That is excellent news!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
=C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119903): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119903" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/119903</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115445264/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115445264/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@=
smile.fr" rel=3D"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000951e340641358b70--

