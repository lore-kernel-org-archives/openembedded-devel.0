Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F636D38FEB
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:42:36 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14675.1768408955802523928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZzYN/zKo;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6467ac59e16so6486244d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768408955; x=1769013755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dEF6oz4D/IvuBSrVoNVWZ2DBroizlcNrEZTZpJtads4=;
        b=ZzYN/zKo7aCeaJzFh5zaiQYwlq5dqJ7ujKmFyizBEw6EuqZRqCFcSGushla0JrkHCJ
         uHBKcxiA0JTN+4wcDoX8D8ZFhAR9AWTTT5POMVUiR5mnKKoNKclB3dpoyG9wyWdjs79Y
         wG8L3Pj42+mYiDB9ksexYHPD01b7b18X3S1aIRUsbWG+Dgapad2B55Zzk999ZtVpK8DA
         XqAynztA3lacGflNA53H2PSBK7TkG6T5CYtKPd8jBGXGMMoYDqowVs/tgrwkfdip4GHZ
         qxZM1nDb+kEvqDP8U7470cVBGAPt6QNO2SE3jwzG4wXBvoFAOVm78K/PJPYtZDzw23HO
         jwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408955; x=1769013755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEF6oz4D/IvuBSrVoNVWZ2DBroizlcNrEZTZpJtads4=;
        b=O/NtkolCsbOTgViznesTCT0q46wMxo2+GbXxoWtQqgyXzUUxxEWWbmtGeDfR5JnU/W
         uwCCRSXxu/38HCepDEwtweA5oqbFCZDSe6dvGAIwMuL+egGl1wusoJ2JcFhZblS3/gZV
         BuPgtTnqOpMKlOF08WjQUf4kpwXThXokgzED3vfIRMqCd3AUb3HRuYGXGdkBH7VrfzNQ
         FzF3Dpk7+lIrkygZI+/HisVZfb2/1lRc/uyhsUFiLSOEVplzGJlL1AUjWIawUdX1yde0
         VlVK3cA+Wh1t5Dl0L01aSdOn0/8koFB5RgqZM/wh+KVNZ5Y1cJeZeZm/kNUVKOolYgtd
         e99g==
X-Forwarded-Encrypted: i=1; AJvYcCVCXVURkv08j336BVwk7i6AcbNfwmQeb2hIDJr+6nwnZ9gVrhuZvqSqoN1mWGmTjcR/16fg5QFYc9D/0MHh561YG7g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlvIOCBiNkwu6LMLD8kf228O43qibZopPGesgPG9g53WvvFUGD
	uWrly3J6V99mGRUseopF7o90xvwhPAqtSqIEXRHR5y+Y11O5W9IyYDYDiUb2Cn9BNpo/bt8kzYU
	j+YH95iLiI2EZOUiyuj+CZ8XsJ0xu9oU=
X-Gm-Gg: AY/fxX7DdvpCen2yhn8SXIGZViP2Crs6VFwSDgtU6qO3Yff9eqRKRonW96ImfGEDoJV
	/ilWZmRmG0fxbV2okVkhAxwrmJquVU9GqiKYX0pLbK0jrvkJiNR70yxuOv54jqVVP6YgBuAe/tU
	2Uq1LQ/VO6AxV+4R7WMd3U1fqEcLMmKLWgXmLYHiwvCM0NSoGWrYK4mDxt5nWKvc4oPTnzMEhi5
	5KxZ5fstXjASxtu7d58TB1qfs3gKavkItqRFQ+Ir4ADtfAZYLd/MQjmU2RYMEUEY0cbHQ6aPjWm
	0lZ+spYJHVj3fyQYUPzYaSLSfqAF7xraRiK6TX19OJ6Lk9i3K5YI0fmKzIBfSFEyrtICW5qN3K5
	C2/eJzxxP4V1rPK7FDaTYWoKleod4jAjbNP909RvU2ic=
X-Received: by 2002:a05:690e:1699:b0:648:f591:f94e with SMTP id
 956f58d0204a3-64901aae92amr2663580d50.29.1768408954838; Wed, 14 Jan 2026
 08:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
 <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
 <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
 <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>
 <297305bc-193f-4fe5-a306-bd05f33933b4@gmail.com> <CAM=5AmaYsT5ULEKPjPTvXusu+c6jo3xmC13nCTHp5_KJg4Sppg@mail.gmail.com>
In-Reply-To: <CAM=5AmaYsT5ULEKPjPTvXusu+c6jo3xmC13nCTHp5_KJg4Sppg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Jan 2026 08:42:08 -0800
X-Gm-Features: AZwV_QiJGF8H88P16Gt78oi2MtThb5bSroKsdOifoXFIeonQs5CeEP4O8vUe6F0
Message-ID: <CAMKF1sreMxZM6pQQnab1Uyw5rDaX8CzXp0OzGSSfj2rrHkXj+Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Awais Belal <awais.belal@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009222af06485bcb3c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 16:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123481

--0000000000009222af06485bcb3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 6:48=E2=80=AFAM Awais Belal <awais.belal@gmail.com>=
 wrote:

> Hi Khem,
>
> I did not ignore you, :) I just did not have time to help out. There are
>> some patterns of TMPDIR embedding into target packages, but it needs to
>> be root caused. If you look through repo, you might find some help on
>> what different use cases have been found and how they were handled.
>>
>
> Sorry for being so so late with this but I now have a patch for mongodb
> src which coupled with the earlier changes I submitted will allow us to
> build mongodb 4.4.29 on OE cleanly. The additional patch is to fix the la=
st
> outstanding TMPDIR issue that we saw around last time. What would be the
> best way for submission here? i.e. should I just send over the patch or
> redo the whole series for master?
>

I think do the changes on top of latest meta-oe master and submit again


>
> --
> Regards,
> Awais Belal
>

--0000000000009222af06485bcb3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14,=
 2026 at 6:48=E2=80=AFAM Awais Belal &lt;<a href=3D"mailto:awais.belal@gmai=
l.com">awais.belal@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Khem,</div=
><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">I did not ignore you, :) I just did not have time to help out. There=
 are<br>
some patterns of TMPDIR embedding into target packages, but it needs to <br=
>
be root caused. If you look through repo, you might find some help on <br>
what different use cases have been found and how they were handled.<br></bl=
ockquote></div><div><br></div><div>Sorry for being so so late with this but=
 I now have a patch for mongodb src which coupled with the earlier changes =
I submitted will allow us to build mongodb 4.4.29 on OE cleanly. The additi=
onal patch is to fix the last outstanding TMPDIR issue that we saw around l=
ast time. What would be the best way for submission here? i.e. should I jus=
t send over=C2=A0the patch or redo the whole series for master?</div></div>=
</blockquote><div><br></div><div>I think do the changes on top of latest me=
ta-oe master and submit=C2=A0again=C2=A0</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><span=
 class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"g=
mail_signature">Regards,<br>Awais Belal</div></div>
</blockquote></div></div>

--0000000000009222af06485bcb3c--

