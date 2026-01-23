Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1FAD72368
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 09:51:17 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64522.1769161870030832878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 01:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYIiBGgK;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b87003e998bso543774566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 01:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161868; cv=none;
        d=google.com; s=arc-20240605;
        b=Q56j3+NA68BRG5/I7bQB67v1X3LpXqMbQy1bs/Rkw3FgzEujlzmcNiMimO2yms5QsX
         jxyHvksfryWgZMXThcbAhSoGp52U9oKY53xMdqu6pdsPONDQwi3rND+2lOHAOGUk/kWI
         gFp6bQyvHtW6glzD4h9sx0NvbMm4KtuVleUculHaaF1FQdQzIb7sjmr9G1oSiPFvwF8x
         lwGs9ShBGvLGPTtdWbkpqXqE+c5EJWnGwDSD3pH/evcEa7TZfhKuYnpdfqYXXx9QGnnY
         w0/6ckYK77sOdXy5pCuZo6WQJ8h0wryYW/RILC7KPn5PJPqagkqwljRgfIuWsSlRMwYN
         d87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQZBDgn/1UAxrhnPNoe2j+y9l+HgBKt49dWX4btdjSw=;
        fh=sMsLOkHFD83pSeQqZJHQTM35q15TILLbPWuJaAztTHc=;
        b=M1mxnkUDQDFrVs9+bKkY1RenMUSTUoi9JQoAF36lZc4084FZIH+Cq1POYMS1f9/dPP
         78sq+a2IbobTKddwBLREj9zvyqNSGD0aZy1UR/1o+2TH5pFXtUbe8XoThVmZJh0tT3iA
         /FiooQk50h+2Xs34RogVvIueO/RbJomSQAT2h426kFxTIosnjitM56sT7HpEgSc8iejq
         X1yJKaUBL1/KTUVeMmK7PLPUR6EjPyZe4TnglcxMWPRSRF6GoDRUOu3nJd7QdljgvjEC
         /h+NEvFyXMkj6VCVt59jd2PwKKJwTQBVEULrr7nRs1GNE8/wxdCuyxeeX1i7/zYXOp9q
         +IsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161868; x=1769766668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQZBDgn/1UAxrhnPNoe2j+y9l+HgBKt49dWX4btdjSw=;
        b=kYIiBGgKzq7rhNXmVT2DNYtORZehONrV2uZCuQjqyy9MSHyy2lBvJbayu7CoYNuuFK
         pkDNQWg58etKxwlkHHhdZc4kPuKwUZlbPOwxED6cHYxEMxmU1zFl86OFBwUqm+CXBmnG
         z5w2W3tyiGDsp8k8V5CMC26DZv3fLPKQjCZb7itEGX9aiDTQJcy9ULc7xXz2M9RtgMBx
         NhrSJyiguS7AFJfBB0Sw9RglAZX5Hou7WgHWXLfDbuMgn8irL7w71vJKHPEslM4sF9EL
         0QMI6vLbyB1B0l6dpLjhW6pbSGzJMZvmJU8ZlGnW0nufbANFDqMTbeMH4OKD2PgzRIBP
         vFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161868; x=1769766668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQZBDgn/1UAxrhnPNoe2j+y9l+HgBKt49dWX4btdjSw=;
        b=mZDpHvaCSHa5O979otl3tZPqc9jwE/L8u9iTvp40OLaWfXcn6TPPktYqIHtTiMS3Rl
         CglJC/jTO0iFYj8e4ootznupqBk62Ah28mQp+EIMRr7MRG4Rx0upoxOip0/rYvr9zGBl
         4eLedkym5UykXUy0UczAl08CpEW5W2i/FTLyOykGMmfbYbp7JgiW8FvkOrHhdzuXSR9e
         inYkDfN9wBboWptpo9S6pojNrg5jLYtotigIb+xLeumVNeedO1D1bnL0Z6shm/yKVa83
         exW3zjYecPIBBgQ4TQQPxna7usXvaKEmM0uiaz6DO9mNsOe6y/mpoDaUQhvwdxl/T8um
         jD2A==
X-Gm-Message-State: AOJu0YxgUIVcnkPa/AmZKAdNE5tsUoqTm2r9lmJyeDkWcBLWGPMcHjax
	YQiGrk0PFEIfGe3LecO8wOW5LkC0889GgZlwOMjXyYuGUO/McfcPnJUCmDQi2Vvlw42J9B5icRQ
	qQ7wAbMzWAc2Hj4/AxhuVuOt3+pM6ei2sfk5Y
X-Gm-Gg: AZuq6aK7Yoz+es2GThdSgMKN04JuHVCyg/Mu0MsUpBwp2hVBA5ChSrmuh2EODSW1eyP
	6LHyH504XBG7HsifxBrn8SGFULKt1Ws5og8G5PsOCcK+bRNx+m+/pmTqPXEbGPAfS3ql+ouCY+U
	tHNXKUu8hiRYSbz8M2VDslOlEAjWaG4tDF5+JyypN1nQBaefcirrw3feHV4qKM8sXT8wJBIb+ae
	DNtM3mNo8KFt8fcFgIR+G2Ymyj3s0Ex46afyXLHsIviPlMhAirC4kRaco+ldVzD6tROTnBUEg==
X-Received: by 2002:a17:907:60d3:b0:b79:cd80:6fff with SMTP id
 a640c23a62f3a-b8831d966b2mr463027466b.17.1769161867770; Fri, 23 Jan 2026
 01:51:07 -0800 (PST)
MIME-Version: 1.0
References: <LV2PR02MB11156D8117417F9CFAD864EB99294A@LV2PR02MB11156.namprd02.prod.outlook.com>
In-Reply-To: <LV2PR02MB11156D8117417F9CFAD864EB99294A@LV2PR02MB11156.namprd02.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 23 Jan 2026 09:50:56 +0000
X-Gm-Features: AZwV_QhniA_yzcMZepTIoK4nHFzNO45Sk3baQ9wCDmLJKS7j6HgwSO6OWhPKS0c
Message-ID: <CANPvuR=97J4=pawQDF8=Kx-11B3H0NSm5YpxcLEru-_7wOiR4Q@mail.gmail.com>
Subject: Re: [oe] Please help review https://github.com/openembedded/meta-openembedded/pull/1022
To: shoudil@qti.qualcomm.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000adbe8306490b185e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123779

--000000000000adbe8306490b185e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shoudil,

I have forward it to the mailing list please see
https://lists.openembedded.org/g/openembedded-devel/message/123778

You can do the same with:
git send-email -M -1 --to openembedded-devel@lists.openembedded.org
--subject-prefix=3D"meta-oe][PATCH"

Please take a look on the readme:
grep send-email meta-oe/README.md

Jose

Shoudi Li via lists.openembedded.org <shoudil=3D
qti.qualcomm.com@lists.openembedded.org> escreveu (sexta, 23/01/2026 =C3=A0=
(s)
08:55):

> Hi Maintainers,
>
> Could you help review this PR to fix adb issue on boards with multiple UD=
C
> ports ?
> android-tools-conf-configfs: handle multiple UDC controllers by shoudil =
=C2=B7
> Pull Request #1022 =C2=B7 openembedded/meta-openembedded
> <https://github.com/openembedded/meta-openembedded/pull/1022>
>
> Best regards,
> Shoudil
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123774):
> https://lists.openembedded.org/g/openembedded-devel/message/123774
> Mute This Topic: https://lists.openembedded.org/mt/117415072/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000adbe8306490b185e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Shoudil,</div><div><br></div><div>I have forward i=
t to the mailing list please see <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/123778">https://lists.openembedded.org/g/opene=
mbedded-devel/message/123778</a></div><div><br></div><div>You can do the sa=
me with:</div><div>git send-email -M -1 --to <a href=3D"mailto:openembedded=
-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&quot;meta-oe][PATCH&quot;<br></div><div><br></div><di=
v>Please take a look on the readme:</div><div>grep send-email meta-oe/READM=
E.md<br></div><div><br></div>Jose<div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">Shoudi Li via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;shoudil=
=3D<a href=3D"mailto:qti.qualcomm.com@lists.openembedded.org">qti.qualcomm.=
com@lists.openembedded.org</a>&gt; escreveu (sexta, 23/01/2026 =C3=A0(s) 08=
:55):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg-2870551809585387594">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2870551809585387594WordSection1">
<p class=3D"MsoNormal">Hi Maintainers, <br>
<br>
Could you help review this PR to fix adb issue on boards with multiple UDC =
ports ?<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/pull/1022" tar=
get=3D"_blank">android-tools-conf-configfs: handle multiple UDC controllers=
 by shoudil =C2=B7 Pull Request #1022 =C2=B7 openembedded/meta-openembedded=
</a><br>
<br>
Best regards,<br>
Shoudil<u></u><u></u></p>
<div name=3D"divtagdefaultwrapper">
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif">=C2=
=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif">=C2=
=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123774): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123774" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123774</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117415072/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117415072/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div></div></div>

--000000000000adbe8306490b185e--

