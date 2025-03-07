Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD56C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 19:19:21 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.19532.1741375152252221551
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 11:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQDkDPRC;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso960252241.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741375151; x=1741979951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u2ELEMOj6e94nSpayI8FYAkGzRYc6QeAk77udNki8Ak=;
        b=mQDkDPRC3q2STkCFqFOHha4AgyES+gbkgnMtJplDGbp45wVA3iL94PjutjcNA8IE8x
         b0KCGmL1mr5wYT8LydypScIrBxEFZxM/+EXH0/J6bC+KDur13EyOEtilvEfbOmpZOxGT
         jNcZBaV9DU8fxQ9T14/gZYh8RhF6Zyan9Yr0ldP8yWn8FRUItqYFK8hgNLzBOL2kTClj
         iQ8IiKJyZ8+szxKCT7j0LJk5RjXWh4VtgtoJGCRn03BPNennRfHIfj/6ZgrrqtwZ07AB
         kkAzaeTx+2vRxCTRW4iEcDcl7M5/iFGneQNgSe2KgQxkSiIbfopKpcPEmR3LnoUCFjGy
         Wjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741375151; x=1741979951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2ELEMOj6e94nSpayI8FYAkGzRYc6QeAk77udNki8Ak=;
        b=j3fAqwOc7zk1T3S4S3sOq/QmcMS5mDOsHIeN20n/LKIBlJM0qjLYOATxgP6KOl1wgK
         imzUnPtwzQVkhNSTdwB2BqdNKSTh8pckq1Bu48IFU4VOwtbwGx8OalpV2XG6wCQi+i1a
         i94vnXKVZhbfm4JA8MgdHu12ZdGmXIe+uD6ZTbsqJ/pTusZRGol/aUYXf054a85pX3x1
         SpDbwjjcDzb1gmI3OGu0VEKfhMlOETBTOK03nIuGGVvBItfhyF0s+aj2qEtQzW0zQ10L
         ybAfU6UMnbBwv06YaqugZjIWrBSOLLnt8AUESdQ//ceoHqFcfBd2n/bwXGrK0QssBMvO
         /m0Q==
X-Gm-Message-State: AOJu0Yyaq+sajmVmBI/29wEJqaM9+FklbniiTE4mkQG6LR4kwLziTG2u
	EmNMBU/shuOLej+rFIjwjr9q5RYoOth/0itOAPvl5L05bmZSnLHEe1M6U3WPXSoCleRMedStIzQ
	2EnsbXmGBq5I0URg/2lvhRbIq8yk=
X-Gm-Gg: ASbGncutnOW8wvPvmsBzxW//Dk6MHKaIu5z+efytq9Nw1RurD6FtxFkMCnuBNW9voIl
	jD6D0mWVaFhOJ1Ic9guydQyZboe+gya2J2CDJndeDfctoUuzcGkyoTKwfedB4504AGDO3mFL5M7
	fOONgKObRj76zmQjrl6axwsQw0
X-Google-Smtp-Source: AGHT+IGEILGOq0p4YXIXewn3OIj15Pfp89jgkLkmuTmoASc/9NDaUufXVRuN3M/j5W+FWK/gLoPYxhiYLHLT04ICGx4=
X-Received: by 2002:a05:6102:f06:b0:4c1:b0ad:a0bd with SMTP id
 ada2fe7eead31-4c30a69175emr3364306137.23.1741375151102; Fri, 07 Mar 2025
 11:19:11 -0800 (PST)
MIME-Version: 1.0
References: <PA2PR06MB922472DD11FB75D7BC1C90BDAAD52@PA2PR06MB9224.eurprd06.prod.outlook.com>
In-Reply-To: <PA2PR06MB922472DD11FB75D7BC1C90BDAAD52@PA2PR06MB9224.eurprd06.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2025 11:18:42 -0800
X-Gm-Features: AQ5f1JrFk6qudRnVulu0bvGFk5TNGO9s5ZiQQA7atdly93YEqAu-yEmsiQdXMLc
Message-ID: <CAMKF1sq1Gz3=H_FoVjJxRQCt3cT1GQ5_km1CA-QOJxvXZoaK9Q@mail.gmail.com>
Subject: Re: [oe] [meta-python]recipes python3-pandas not getting built
 properly for arm 32 bit
To: prasad.mulay@in.abb.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004d66f4062fc57f5f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115800

--0000000000004d66f4062fc57f5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

is it same as https://github.com/pandas-dev/pandas/issues/55305

On Thu, Mar 6, 2025 at 8:23=E2=80=AFPM Prasad Mulay via lists.openembedded.=
org
<prasad.mulay=3Din.abb.com@lists.openembedded.org> wrote:

> Hello
>
> https://github.com/pandas-dev/pandas/issues/55305
>
> this is reported on pandas repo. looking at the comments looks to be bug
> from build system. I have tried the solution specified there. but still
> problem is persisting.
>
> I am using custom IMX6 board.
>
>
>
> Below is rspose from my board.
>
> root@imx6dldau:~# python
>
> Python 3.12.6 (main, Sep  6 2024, 19:03:47) [GCC 13.3.0] on linux
>
> Type "help", "copyright", "credits" or "license" for more information.
>
> >>> import pandas as pd
>
> >>> # Create a list of data
>
> >>> data =3D [["Alice", 25], ["Bob", 30], ["Carol", 35]]
>
> >>> # Create a Pandas DataFrame from the list of data
>
> >>> df =3D pd.DataFrame(data, columns=3D["Name", "Age"])
>
> >>> # Print the DataFrame
>
> >>> print(df)
>
> Traceback (most recent call last):
>
>   File "<stdin>", line 1, in <module>
>
>   File "/usr/lib/python3.12/site-packages/pandas/core/frame.py", line
> 1094, in __repr__
>
>     return self.to_string(**repr_params)
>
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/core/frame.py", line
> 1271, in to_string
>
>     return fmt.DataFrameRenderer(formatter).to_string(
>
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
> line 1134, in to_string
>
>     string =3D string_formatter.to_string()
>
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
> line 30, in to_string
>
>     text =3D self._get_string_representation()
>
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
> line 45, in _get_string_representation
>
>     strcols =3D self._get_strcols()
>
>               ^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
> line 36, in _get_strcols
>
>     strcols =3D self.fmt.get_strcols()
>
>               ^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
> line 615, in get_strcols
>
>     strcols =3D self._get_strcols_without_index()
>
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
> line 870, in _get_strcols_without_index
>
>     str_columns =3D self._get_formatted_column_labels(self.tr_frame)
>
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
> line 949, in _get_formatted_column_labels
>
>     dtypes =3D self.frame.dtypes
>
>              ^^^^^^^^^^^^^^^^^
>
>   File "/usr/lib/python3.12/site-packages/pandas/core/generic.py", line
> 6158, in dtypes
>
>     data =3D self._mgr.get_dtypes()
>
>            ^^^^^^^^^^^^^^^^^^^^^^
>
>   File
> "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py", li=
ne
> 278, in get_dtypes
>
>     return dtypes.take(self.blknos)
>
>                        ^^^^^^^^^^^
>
>   File
> "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py", li=
ne
> 179, in blknos
>
>     self._rebuild_blknos_and_blklocs()
>
>   File "pandas/_libs/internals.pyx", line 755, in
> pandas._libs.internals.BlockManager._rebuild_blknos_and_blklocs
>
> ValueError: Buffer dtype mismatch, expected 'intp_t' but got 'long long'
>
> >>>
>
>
>
> Any help would be appreciated.
>
> Thank you
>
> Regards
>
> Prasad Mulay
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115777):
> https://lists.openembedded.org/g/openembedded-devel/message/115777
> Mute This Topic: https://lists.openembedded.org/mt/111562623/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004d66f4062fc57f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">is it same as=C2=A0<a href=3D"https://github.com/pandas-de=
v/pandas/issues/55305">https://github.com/pandas-dev/pandas/issues/55305</a=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Mar 6, 2025 at 8:23=E2=80=AFPM Prasad Mulay =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;prasad.mulay=3D<a href=3D"mailto:in.abb.com@lists.openembedded.org">in.ab=
b.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div class=3D"msg1849040215300757331">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1849040215300757331WordSection1">
<p class=3D"MsoNormal">Hello <u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/pandas-dev/pandas/issu=
es/55305" target=3D"_blank">https://github.com/pandas-dev/pandas/issues/553=
05</a><u></u><u></u></p>
<p class=3D"MsoNormal">this is reported on pandas repo. looking at the comm=
ents looks to be bug from build system. I have tried the solution specified=
 there. but still problem is persisting.<u></u><u></u></p>
<p class=3D"MsoNormal">I am using custom IMX6 board.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Below is rspose from my board.<u></u><u></u></p>
<p class=3D"MsoNormal">root@imx6dldau:~# python<u></u><u></u></p>
<p class=3D"MsoNormal">Python 3.12.6 (main, Sep=C2=A0 6 2024, 19:03:47) [GC=
C 13.3.0] on linux<u></u><u></u></p>
<p class=3D"MsoNormal">Type &quot;help&quot;, &quot;copyright&quot;, &quot;=
credits&quot; or &quot;license&quot; for more information.<u></u><u></u></p=
>
<p class=3D"MsoNormal">&gt;&gt;&gt; import pandas as pd<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Create a list of data<u></u><u></u></=
p>
<p class=3D"MsoNormal">&gt;&gt;&gt; data =3D [[&quot;Alice&quot;, 25], [&qu=
ot;Bob&quot;, 30], [&quot;Carol&quot;, 35]]<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Create a Pandas DataFrame from the li=
st of data<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; df =3D pd.DataFrame(data, columns=3D[&q=
uot;Name&quot;, &quot;Age&quot;])<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Print the DataFrame<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; print(df)<u></u><u></u></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &l=
t;module&gt;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/frame.py&quot;, line 1094, in __repr__<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 return self.to_string(**repr_para=
ms)<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/frame.py&quot;, line 1271, in to_string<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 return fmt.DataFrameRenderer(form=
atter).to_string(<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 1134, in to_string<u></u><u></u></p=
>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 string =3D string_formatter.to_st=
ring()<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 30, in to_string<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 text =3D self._get_string_represe=
ntation()<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 45, in _get_string_representation<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 strcols =3D self._get_strcols()<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 36, in _get_strcols<u></u><u></u></=
p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 strcols =3D self.fmt.get_strcols(=
)<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 615, in get_strcols<u></u><u></u></=
p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 strcols =3D self._get_strcols_wit=
hout_index()<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u>=
</p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 870, in _get_strcols_without_index<=
u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 str_columns =3D self._get_formatt=
ed_column_labels(self.tr_frame)<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 949, in _get_formatted_column_label=
s<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 dtypes =3D self.frame.dtypes<u></=
u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/generic.py&quot;, line 6158, in dtypes<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 data =3D self._mgr.get_dtypes()<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/internals/managers.py&quot;, line 278, in get_dtypes<u></u><u><=
/u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 return dtypes.take(self.blknos)<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^^^^^^^^^^^<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/internals/managers.py&quot;, line 179, in blknos<u></u><u></u><=
/p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 self._rebuild_blknos_and_blklocs(=
)<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 File &quot;pandas/_libs/internals.pyx&quot;, =
line 755, in pandas._libs.internals.BlockManager._rebuild_blknos_and_blkloc=
s<u></u><u></u></p>
<p class=3D"MsoNormal">ValueError: Buffer dtype mismatch, expected &#39;int=
p_t&#39; but got &#39;long long&#39;<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Any help would be appreciated. <u></u><u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" summary=3D"Email si=
gnature" width=3D"100%" style=3D"width:100%;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"100%" style=3D"width:100%;padding:0in">
<div id=3D"m_1849040215300757331signature">
<div style=3D"margin-bottom:15pt">
<div>
<p class=3D"MsoNormal" style=3D"margin-top:15pt;line-height:12pt">Thank you=
<u></u><u></u></p>
<p class=3D"MsoNormal">Regards <u></u><u></u></p>
<p class=3D"MsoNormal">Prasad Mulay<u></u><u></u></p>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115777): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115777" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115777</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111562623/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111562623/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--0000000000004d66f4062fc57f5f--

