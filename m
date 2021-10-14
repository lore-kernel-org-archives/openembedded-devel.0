Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2053BC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 19:14:02 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1764.1634238840716692996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkVk4j68;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id v20so4818998plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eNVGstCPGTH/+HA2YOJ6OpNlC22GjKsOP/zddNKk8GA=;
        b=kkVk4j68bkkMPM30IIpOyqXxgFSaXRvUgWPlc1M+1hNDAC3f1Cr7vQltIRbxdP91OH
         HKGVGvlwZbPJCUDaMPnA8EGw4sxo3UB+K7ltqgRZHSN6nZuo0IuxrnF4FQY3CfuBTGxO
         A8WTzNrtUwhoL1Z/8uoEiJxIbc+NnbdKnvUZYpPXLKnD5C0jZ78gzEJcIf8+DSv2lKyy
         VcHvg82HaBS8BS/ZtF2Fjv+vDEOhbnM3MxvW49cwm8t6tXA05ElEs/ydEOKZDLEFEBpA
         hife0MfevgTgyZeOD2A/2pGb9Oj/2KiXvvMSpuFZXhFqDu7xs39QKB1JHP2mSaeieMDf
         wUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eNVGstCPGTH/+HA2YOJ6OpNlC22GjKsOP/zddNKk8GA=;
        b=d5I1kvjJdbsmLGQnuvOEBL+6Fai8L3o012NYSLKPGLjggyoB/lKq/WBUYVaz41ptKF
         MvtH1uWMdncGCPDqEBHy3gOa9Gtc+Zg3vmC4U0V9HCdJgXMLze9v5KI9jQFX0Z6AlPhu
         4P9ORCe/YOSncHggeZiPAQHuXFGukLrTxg2tnmfpMbFrkMx8MvAILSo7RsYynysHg6WW
         d/ID8zEy/gY0XluyvAMlg7cs1Mzg46bnM69uyMpWL+lmVGZxDLVMaLKTHf2Vwq1FZra4
         HRnYwRUKAYBdnBRYS8pPT0X4UHonAMIoYxvLNsN2tINT13n6P9LLkt+ZrcU2YdCkIQCu
         uhhQ==
X-Gm-Message-State: AOAM530o2e+5roHBBO1+Sh7hjkgleViFEdwLXFeWK9i3TbgSCVq1NDFr
	CVbkhgu1m9XQnceZ7YrpaNe/QAgi02glU+MyfXM=
X-Google-Smtp-Source: 
 ABdhPJxB1K2DCJamE9J6Y4W+6YMYOKfM277zqQgeU42iDke3MwxErcs5mkxZcgKqWszvt2yJYUkulDPCFHMr6Rj571s=
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr8149596pjb.35.1634238840034;
 Thu, 14 Oct 2021 12:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-14-alex@linutronix.de>
In-Reply-To: <20211011184140.653609-14-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Oct 2021 21:13:49 +0200
Message-ID: 
 <CA+chaQdUbrVTb7tmGoDtj4xkJMKhzXN8Y5JpXDcLr8DPs2oZ1A@mail.gmail.com>
Subject: Re: [oe] [PATCH 14/24] nodejs: use -fpermissive
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000089d70805ce54e117"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 19:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93300

--00000000000089d70805ce54e117
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn't seem to cover nodejs-native build where it still fails with:

| ../src/node_crypto.cc:4585:37: error: invalid conversion from =E2=80=98co=
nst
dsa_st*=E2=80=99 to =E2=80=98DSA*=E2=80=99 {aka =E2=80=98dsa_st*=E2=80=99} =
[-fpermissive]
|  4585 |     DSA* dsa_key =3D EVP_PKEY_get0_DSA(pkey.get());
|       |                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
|       |                                     |
|       |                                     const dsa_st*
| ../src/node_crypto.cc:4587:34: warning: =E2=80=98const BIGNUM* DSA_get0_q=
(const
DSA*)=E2=80=99 is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4587 |     bits =3D BN_num_bits(DSA_get0_q(dsa_key));
|       |                        ~~~~~~~~~~^~~~~~~~~

On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This resolves openssl 3.x errors until upstream addresses them properly.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> index 471501979..e44398721 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> @@ -128,6 +128,9 @@ python do_create_v8_qemu_wrapper () {
>  do_create_v8_qemu_wrapper[dirs] =3D "${B}"
>  addtask create_v8_qemu_wrapper after do_configure before do_compile
>
> +# Keep until openssl 3.x compatibility is fixed
> +CXXFLAGS +=3D "-fpermissive"
> +
>  LDFLAGS:append:x86 =3D " -latomic"
>
>  # Node is way too cool to use proper autotools, so we install two
> wrappers to forcefully inject proper arch cflags to workaround gypi
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93228):
> https://lists.openembedded.org/g/openembedded-devel/message/93228
> Mute This Topic: https://lists.openembedded.org/mt/86244764/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000089d70805ce54e117
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t seem to cover nodejs-native build where i=
t still fails with:<div><br></div><div>| ../src/node_crypto.cc:4585:37: err=
or: invalid conversion from =E2=80=98const dsa_st*=E2=80=99 to =E2=80=98DSA=
*=E2=80=99 {aka =E2=80=98dsa_st*=E2=80=99} [-fpermissive]<br>| =C2=A04585 |=
 =C2=A0 =C2=A0 DSA* dsa_key =3D EVP_PKEY_get0_DSA(pkey.get());<br>| =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~~~~~~~~~~~~~~~~~^~~~~~~~~~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const dsa_st*<br>| ../=
src/node_crypto.cc:4587:34: warning: =E2=80=98const BIGNUM* DSA_get0_q(cons=
t DSA*)=E2=80=99 is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declaration=
s]<br>| =C2=A04587 | =C2=A0 =C2=A0 bits =3D BN_num_bits(DSA_get0_q(dsa_key)=
);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~^~~~~~~~~<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Oct 11, 2021 at 8:42 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">This resolves openssl 3.x errors unti=
l upstream addresses them properly.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_14.17.1.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.17=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_14.17.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.17.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_14.17.1.bb</a><br>
index 471501979..e44398721 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_14.17.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_14.17.1.bb</a><br>
@@ -128,6 +128,9 @@ python do_create_v8_qemu_wrapper () {<br>
=C2=A0do_create_v8_qemu_wrapper[dirs] =3D &quot;${B}&quot;<br>
=C2=A0addtask create_v8_qemu_wrapper after do_configure before do_compile<b=
r>
<br>
+# Keep until openssl 3.x compatibility is fixed<br>
+CXXFLAGS +=3D &quot;-fpermissive&quot;<br>
+<br>
=C2=A0LDFLAGS:append:x86 =3D &quot; -latomic&quot;<br>
<br>
=C2=A0# Node is way too cool to use proper autotools, so we install two wra=
ppers to forcefully inject proper arch cflags to workaround gypi<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93228): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93228" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93228</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86244764/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86244764/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000089d70805ce54e117--

