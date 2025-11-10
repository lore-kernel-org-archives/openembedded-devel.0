Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175EBCD1297
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 13:34:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48021.1762781673771107518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 05:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bToN0apS;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b38de7940so651870f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 05:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762781672; x=1763386472; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+ZuIChpxvkFkYrVFWf7WJKZQJ6ZgE2ruYZI6MNLvUA=;
        b=bToN0apSDBDnBv0uvU3iTQ1Ikv3sGPMrfE2Hx2ccmK6kRU4WlWbj5gs19FjoG/gsJY
         TuBFh05lwUf4uhplIHMhOQPJtlRLGwQrTC9bl4mwK6VRWMI1kx7qFm6qqJXWDCU7ZfAY
         fUbLqBvvJ0K5YNdUURVIGC9l2WwuzfghkPiBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781672; x=1763386472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+ZuIChpxvkFkYrVFWf7WJKZQJ6ZgE2ruYZI6MNLvUA=;
        b=LBbylE3CyPm4NTiDoYjzjShl3bgwZ969dnOsV5lpKeU6gGhoEDCorSC7ocKY21hYoz
         A7hQuQLyeoDEC2nic6xr5PmVWlGNHcxVmPt9GYfXDjfwgcBXYd7YmabxapyCqWYZXJe1
         M5m4UpxA67Ixv+d6YD2MrQf1wvNacSYpzxaguTwuM/sexBDg5syKIFTPACClfSvOApn7
         6BIxMtVsqVCkfH+0YVesDhgTj3Oiq9OdOyUBREN9AArsTMuG3DEl/zReeW8+8p7/4/p5
         3w1u6/0Txz5sY5gRj9QNwPxKZwRpkXn1qyM/FF8A36J9mfMf8agW6b6yvzy4UxjMvLKM
         i9RA==
X-Gm-Message-State: AOJu0YykEOo9Pdl0u1C6YmHj43DzluT1YbB6VjiAkG7zWtRmB8U8n4TO
	0HByPGEsijEELOF4HVpRhlpBsLoK3x5zUykhmB2/gzI+wQy6Hor1IcAWYaq77cHZQV5iFcACzNB
	9xSzdncbURhQlXOHNI47AzhnhjAsYKKV/dBK/O+9EFg==
X-Gm-Gg: ASbGncuVfChretKusseuM2dncRj9N6Xf8F1PmIrabMLx60ucnOiMLAQBNn+LAc+cpyT
	rf1WniYLa6EijCzYJ1FrA77jqBFNgcTQ5fhwkcyVIPKkIO7j/D2H8/zlrtCUW//bI8BOox5VbTI
	bpUOdy4AUje/UDlmEoVxfRFzuYOi/xYDIYQLGl3B+ShsgbavTVUWR/tvuesih0uk/D+nnxIp8sp
	V7MSw5bk4bRn/mF4OBAOIoYmTAB5RQZMf5zf9VgTKBqtxJuHIomlud1Zm1cipU=
X-Google-Smtp-Source: AGHT+IEdVtVKNVr1TF7MGiN034gGfZYyhOjdvwZebXgnwnLAFr6fFGAfMIS7hACXwlSVvm5Tr5JI3ulzgI2yqgSooPQ=
X-Received: by 2002:a05:6000:4182:b0:42b:3ae2:bce3 with SMTP id
 ffacd0b85a97d-42b3ae2c000mr3404385f8f.33.1762781672010; Mon, 10 Nov 2025
 05:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20251108141838.259595-1-yi.zhao@windriver.com>
 <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com>
 <26b4e765-9fd2-47d6-8ee1-639c253c0df6@windriver.com> <CAMSfU+6bojSf344BChguojV7nhwP7=Q8yiK0YwOTkteT25RicQ@mail.gmail.com>
 <0046fab1-1d12-4e64-a975-83db90add6c1@windriver.com>
In-Reply-To: <0046fab1-1d12-4e64-a975-83db90add6c1@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 10 Nov 2025 14:34:06 +0100
X-Gm-Features: AWmQ_bkUSneESllaHjGmZx2uzRjAO2MUI5PEAf8coLr8hjq1TQWYwtmYZTHUI80
Message-ID: <CAMSfU+6xiCh1HoQ-w8C0xx2soZDVKykWCxjMEeo+O8btV2dUNA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060834806433d9788"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 13:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121462

--00000000000060834806433d9788
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 nov. 2025 =C3=A0 12:34, Yi Zhao <yi.zhao@windriver.com> a =C3=A9=
crit :

>
> On 11/10/25 16:17, Yoann Congal wrote:
>
>
>
> Le lun. 10 nov. 2025 =C3=A0 09:08, Yi Zhao <yi.zhao@windriver.com> a =C3=
=A9crit :
>
>>
>> On 11/10/25 15:55, Yoann Congal wrote:
>>
>>
>>
>> Le sam. 8 nov. 2025 =C3=A0 15:18, Yi Zhao via lists.openembedded.org
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15Jd=
zRmFLAvPgmRlNwcN40j7$>
>> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :
>>
>>> Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
>>> latest stable verison.
>>>
>>> Before the patch:
>>> $ devtool latest-version menulibre
>>> INFO: Current version: 2.4.0
>>> INFO: Latest version:
>>>
>>> After the patch:
>>> $ devtool latest-version menulibre
>>> INFO: Current version: 2.4.0
>>> INFO: Latest version: 2.4.0
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>>  meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN81Wey67$>
>>> | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN81Wey67$>
>>> b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN81Wey67$>
>>> index 71d3ab4d29..4c52249fed 100644
>>> --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN81Wey67$>
>>> +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!=
bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN81Wey67$>
>>> @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11
>>> gobject-introspection-data"
>>>  SRC_URI =3D "
>>> https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.g=
z
>>> <https://urldefense.com/v3/__https://github.com/bluesabre/$*7BBPN*7D/re=
leases/download/$*7BBP*7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmR=
lN4rVMobI$>
>>> "
>>>  SRC_URI[sha256sum] =3D
>>> "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
>>>
>>> +UPSTREAM_CHECK_URI =3D "https://github.com/bluesabre/menulibre/release=
s
>>> <https://urldefense.com/v3/__https://github.com/bluesabre/menulibre/rel=
eases__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM=
7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN2yK_rrE$>
>>> "
>>> +UPSTREAM_CHECK_REGEX =3D "releases/tag/menulibre-(?P<pver>\d+(\.\d+)+)=
"
>>>
>>
>> Have you thought about using the github-releases class?
>>
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/=
github-releases.bbclass
>> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-c=
ore/tree/meta/classes-recipe/github-releases.bbclass__;!!AjveYdw8EvQ!bKY-Z8=
hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPg=
mRlN7VVUaMq$>
>>
>> It doesn't work because the website address doesn't conform to the forma=
t
>> in github-releases.bbclass:
>>
>> --2025-11-10 16:04:14--  https://github.com/menulibre/menulibre/releases=
/
>> <https://urldefense.com/v3/__https://github.com/menulibre/menulibre/rele=
ases/__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76t=
YsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4UigtnL$>
>> Resolving github.com
>> <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTbQ7Kp1=
4mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ug=
k4dPIRYv$>
>> (github.com
>> <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTbQ7Kp1=
4mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ug=
k4dPIRYv$>)...
>> 20.205.243.166
>> <https://urldefense.com/v3/__http://20.205.243.166__;!!AjveYdw8EvQ!dHTbQ=
7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIp=
m7ugk1TxdIep$>
>> Connecting to github.com
>> <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTbQ7Kp1=
4mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ug=
k4dPIRYv$>
>> (github.com
>> <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!dHTbQ7Kp1=
4mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ug=
k4dPIRYv$>
>> )|20.205.243.166
>> <https://urldefense.com/v3/__http://20.205.243.166__;!!AjveYdw8EvQ!dHTbQ=
7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIp=
m7ugk1TxdIep$>|:443...
>> connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2025-11-10 16:04:14 ERROR 404: Not Found.
>>
>> INFO: Current version: 2.4.0
>> INFO: Latest version:
>>
>>
>> There is no https://github.com/menulibre/menulibre/releases/
>> <https://urldefense.com/v3/__https://github.com/menulibre/menulibre/rele=
ases/__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76t=
YsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4UigtnL$>
>> , but https://github.com/bluesabre/menulibre/releases
>> <https://urldefense.com/v3/__https://github.com/bluesabre/menulibre/rele=
ases__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tY=
sjRpFNjE8OLXHeuZEt3O-ICfIpm7ugkzVr9lqV$>
>>
>
> You can maybe override GITHUB_BASE_URI and get the UPSTREAM_CHECK_*
> variable "for free"?
>
> Besides GITHUB_BASE_URI, UPSTREAM_CHECK_REGEX also needs to be overriden
> because it also doesn't match the regex in the class.
> This means that we still need to add two more lines of modification even
> if we inherit the bbclass. I don't think this makes any sense.
>

Agreed, I missed the UPSTREAM_CHECK_REGEX change.
Sorry

Regards,


>
> //Yi
>
>
>
>
>>
>> //Yi
>>
>>
>>
>>> +
>>>  do_compile[noexec] =3D "1"
>>>
>>>  do_install:append() {
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#121387):
>>> https://lists.openembedded.org/g/openembedded-devel/message/121387
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-devel/message/121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MP=
uTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$>
>>> Mute This Topic: https://lists.openembedded.org/mt/116187911/4316185
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/11618791=
1/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RU=
ExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN6CRz5Io$>
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqb=
rXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN-vzl8RS$>
>>> [yoann.congal@smile.fr]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--00000000000060834806433d9788
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 nov. 2025 =C3=A0=C2=A012:34, Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriv=
er.com">yi.zhao@windriver.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 11/10/25 16:17, Yoann Congal wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10 nov. 2025
            =C3=A0=C2=A009:08, Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windri=
ver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;
            a =C3=A9crit=C2=A0:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 11/10/25 15:55, Yoann Congal wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div dir=3D"ltr"><br>
                  </div>
                  <br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 8 no=
v.
                      2025 =C3=A0=C2=A015:18, Yi Zhao via <a href=3D"https:=
//urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bKY-Z8h=
DPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgm=
RlNwcN40j7$" target=3D"_blank">lists.openembedded.org</a>
                      &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lis=
ts.openembedded.org" target=3D"_blank">eng.windriver.com@lists.openembedded=
.org</a>&gt;
                      a =C3=A9crit=C2=A0:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
                      UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to
                      check the correct<br>
                      latest stable verison.<br>
                      <br>
                      Before the patch:<br>
                      $ devtool latest-version menulibre<br>
                      INFO: Current version: 2.4.0<br>
                      INFO: Latest version:<br>
                      <br>
                      After the patch:<br>
                      $ devtool latest-version menulibre<br>
                      INFO: Current version: 2.4.0<br>
                      INFO: Latest version: 2.4.0<br>
                      <br>
                      Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@=
windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
                      ---<br>
                      =C2=A0meta-xfce/recipes-apps/menulibre/<a href=3D"htt=
ps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmR=
lN81Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a> |
                      3 +++<br>
                      =C2=A01 file changed, 3 insertions(+)<br>
                      <br>
                      diff --git a/meta-xfce/recipes-apps/menulibre/<a href=
=3D"https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb<=
/a>
                      b/meta-xfce/recipes-apps/menulibre/<a href=3D"https:/=
/urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1r=
Inc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81=
Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
                      index 71d3ab4d29..4c52249fed 100644<br>
                      --- a/meta-xfce/recipes-apps/menulibre/<a href=3D"htt=
ps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmR=
lN81Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
                      +++ b/meta-xfce/recipes-apps/menulibre/<a href=3D"htt=
ps://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmR=
lN81Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
                      @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D &quot;=
x11
                      gobject-introspection-data&quot;<br>
                      =C2=A0SRC_URI =3D &quot;<a href=3D"https://urldefense=
.com/v3/__https://github.com/bluesabre/$*7BBPN*7D/releases/download/$*7BBP*=
7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q=
7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN4rVMobI$" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/bluesabre/${BPN}/releases/down=
load/${BP}/${BP}.tar.gz</a>&quot;<br>
                      =C2=A0SRC_URI[sha256sum] =3D
                      &quot;d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c=
42f5d5f465f593c9f&quot;<br>
                      <br>
                      +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urld=
efense.com/v3/__https://github.com/bluesabre/menulibre/releases__;!!AjveYdw=
8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15=
JdzRmFLAvPgmRlN2yK_rrE$" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/bluesabre/menulibre/releases</a>&quot;<br>
                      +UPSTREAM_CHECK_REGEX =3D
                      &quot;releases/tag/menulibre-(?P&lt;pver&gt;\d+(\.\d+=
)+)&quot;<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>Have you thought about using
                      the=C2=A0github-releases class?</div>
                    <div><a href=3D"https://urldefense.com/v3/__https://git=
.openembedded.org/openembedded-core/tree/meta/classes-recipe/github-release=
s.bbclass__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RU=
ExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN7VVUaMq$" target=3D"_blank">https://git=
.openembedded.org/openembedded-core/tree/meta/classes-recipe/github-release=
s.bbclass</a></div>
                  </div>
                </div>
              </blockquote>
              <p><span lang=3D"en"><span><span>It doesn&#39;t work because =
the
                      website address doesn&#39;t conform to the format in
                      github-releases.bbclass:</span></span></span></p>
              <p>--2025-11-10 16:04:14--=C2=A0 <a href=3D"https://urldefens=
e.com/v3/__https://github.com/menulibre/menulibre/releases/__;!!AjveYdw8EvQ=
!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O=
-ICfIpm7ugk4UigtnL$" target=3D"_blank">https://github.com/menulibre/menulib=
re/releases/</a><br>
                Resolving <a href=3D"https://urldefense.com/v3/__http://git=
hub.com__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi7=
6tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank">github.com</a=
>
                (<a href=3D"https://urldefense.com/v3/__http://github.com__=
;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFN=
jE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank">github.com</a>)...
                <a href=3D"https://urldefense.com/v3/__http://20.205.243.16=
6__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjR=
pFNjE8OLXHeuZEt3O-ICfIpm7ugk1TxdIep$" target=3D"_blank">20.205.243.166</a><=
br>
                Connecting to <a href=3D"https://urldefense.com/v3/__http:/=
/github.com__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbH=
ROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank">github.co=
m</a>
                (<a href=3D"https://urldefense.com/v3/__http://github.com__=
;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFN=
jE8OLXHeuZEt3O-ICfIpm7ugk4dPIRYv$" target=3D"_blank">github.com</a>)|<a hre=
f=3D"https://urldefense.com/v3/__http://20.205.243.166__;!!AjveYdw8EvQ!dHTb=
Q7Kp14mZBv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfI=
pm7ugk1TxdIep$" target=3D"_blank">20.205.243.166</a>|:443...
                connected.<br>
                HTTP request sent, awaiting response... 404 Not Found<br>
                2025-11-10 16:04:14 ERROR 404: Not Found.<br>
                <br>
                INFO: Current version: 2.4.0<br>
                INFO: Latest version:=C2=A0</p>
              <p><br>
              </p>
              <p>There is no=C2=A0<a href=3D"https://urldefense.com/v3/__ht=
tps://github.com/menulibre/menulibre/releases/__;!!AjveYdw8EvQ!dHTbQ7Kp14mZ=
Bv7gZKyZkT0Yhc5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugk4U=
igtnL$" target=3D"_blank">https://github.com/menulibre/menulibre/releases/<=
/a>
                , but <a href=3D"https://urldefense.com/v3/__https://github=
.com/bluesabre/menulibre/releases__;!!AjveYdw8EvQ!dHTbQ7Kp14mZBv7gZKyZkT0Yh=
c5H0VJqyfn0nlF4K9GWBbHROi76tYsjRpFNjE8OLXHeuZEt3O-ICfIpm7ugkzVr9lqV$" targe=
t=3D"_blank">https://github.com/bluesabre/menulibre/releases</a></p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>You can maybe override=C2=A0GITHUB_BASE_URI and get
            the=C2=A0UPSTREAM_CHECK_* variable &quot;for free&quot;?</div>
        </div>
      </div>
    </blockquote>
    <p>Besides GITHUB_BASE_URI, UPSTREAM_CHECK_REGEX also needs to be
      overriden because it also doesn&#39;t match the regex in the class.<b=
r>
      This means that we still need to add two more lines of
      modification even if we inherit the bbclass. I don&#39;t think this
      makes any sense.</p></div></blockquote><div><br></div><div>Agreed, I =
missed the=C2=A0UPSTREAM_CHECK_REGEX change.</div><div>Sorry</div><div><br>=
</div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <p>//Yi</p>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>=C2=A0</div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      +<br>
                      =C2=A0do_compile[noexec] =3D &quot;1&quot;<br>
                      <br>
                      =C2=A0do_install:append() {<br>
                      -- <br>
                      2.34.1<br>
                      <br>
                      <br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      Links: You receive all messages sent to this
                      group.<br>
                      View/Reply Online (#121387): <a href=3D"https://urlde=
fense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/=
121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExn=
M7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/121387</a>=
<br>
                      Mute This Topic: <a href=3D"https://urldefense.com/v3=
/__https://lists.openembedded.org/mt/116187911/4316185__;!!AjveYdw8EvQ!bKY-=
Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAv=
PgmRlN6CRz5Io$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/116187911/4316185</a><br>
                      Group Owner: <a href=3D"mailto:openembedded-devel%2Bo=
wner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@lis=
ts.openembedded.org</a><br>
                      Unsubscribe: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!bK=
Y-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFL=
AvPgmRlN-vzl8RS$" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a>
                      [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_=
blank">yoann.congal@smile.fr</a>]<br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      <br>
                    </blockquote>
                  </div>
                  <div><br clear=3D"all">
                  </div>
                  <br>
                  <span class=3D"gmail_signature_prefix">-- </span><br>
                  <div dir=3D"ltr" class=3D"gmail_signature">
                    <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann
                        Congal</font>
                      <div><font face=3D"Raleway, regular">Smile ECS</font>=
</div>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <br>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</fo=
nt>
            <div><font face=3D"Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000060834806433d9788--

