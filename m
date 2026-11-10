Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15732.1794299056845849124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 00:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gHkKfr4Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-704597ef1d8so608494eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 00:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794299056; cv=none;
        d=google.com; s=arc-20260327;
        b=GBdlb1qIXpFrO28xfol3IjmYfItCWeH5iMjQHPqQqaPtHzOIPjPbtIj4+r00uqh7Pt
         pKRE4SahFFX35/9mhqaaZ/a8nnygOvunVthEhjzytrvY4tv2H0Gh8c2zW/be9rBFWk0q
         OLdnd9DthV69zuJKY06bZedXA4JhDGqDr2jR1R6vWMqo762ArtZasN8T4tx2g/d/5PHb
         8fP7XIdCazrJLHrC+hzm0d+mdz9BIrIyk5lRg+6moTqxijliBRPFOX8pnu/V/FrSTJ7M
         YWslYEU8QuTc1tiWemVnFCj9pHwqcuva85EMrqFYbg9jmYtWtRFn3Du35wTHSGS5prKP
         gCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7L2rzehHwXRLZ5b6AwyEpMXp7KjQZRGsebEJda85Bc=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=fy0ghiy3tqONCw7gyU52GZoDkHd4R1Yb+zte5rFT/52OBAjZNInmzouSOWe0UkcnRb
         WPHwuSZ33OZTboSX5RclYlm+hO36p5gGDuTozlnZYpQfJdZ6TF/fK5zKQLM+Cxpeqk+E
         8iK9Uqz0PTlRlONEloTqmZusEt9oMRyP+54CPx7oJfxrzIgEvEnsXmrglj7PLVWGuteb
         gryGFogE05NxRPYsG8QppWFrCSyxTF+mphod8gFsAhYudk2tIOJ4zHo29csJKqiVZhcG
         UxGyFu+5iRgEyowhtfwGrYevOr3nmCOGcsRdfgCbh3Ts0vyDzrKtiLvaAMKXg+gslc3t
         e3Kg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299056; x=1794903856; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7L2rzehHwXRLZ5b6AwyEpMXp7KjQZRGsebEJda85Bc=;
        b=gHkKfr4Zqtr6VwDHvPZ4QahRKrheEBO1szv8VV/6moIpUj5MZ6LLmNwhUe0EZKp6Tq
         +YkWXRg7tSO+8rogrhrem39jMQ+HmjHRdeMwBWfN4d4pyzSo/l1G7WkB7O0SIIzub21J
         5kWm5CwQ3027/XchzZdri+gDj3bzIMZdvsHN3QthppeXiU8htQfI4bpQFmPIfVr2DlOo
         GmTX5Go1PTDu0aETkQeuLUsOMCDABvElfSddpJgYOQZIrItzPmki4xWFhuut+O8NfWQ8
         em6TMURfrBqWYA6PTav58VNOFAXqoUhnxmq833mcaIIJwvfOIikXVYEJUivGxwSQJ0BS
         NzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299056; x=1794903856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7L2rzehHwXRLZ5b6AwyEpMXp7KjQZRGsebEJda85Bc=;
        b=QRI3eaQK1A6pS3pgTla0NwpNJKcId+ZA7hT2gIkqT+qqBllE1LdPmBy9uepLfuftUT
         0dNGjbmoyTEZADZGPlZh/HNqZNRhARihYXiZzP48gjAAKgs6nmA1cFJnIQQHumY4lobQ
         U6L4Bv2rpd9mEC0jj6lBjfJmuEN2eD0M2cuamQwjVwZFxg5p+4MvxKQ3WuSQZsXzQM05
         NmrEeODmlHY+PgCt8dytLi2SVftg97IZAHCnWto5GBeHfF2uVEnMIH56jP/X54eR6QIF
         kEmM7oLlwC/VIQ2L7dcSd55OxQ1TNqMFnuj1Q7l43UrLuOWjUdafiAuvHjaR0DtxCrfW
         iY+g==
X-Gm-Message-State: APuU4Z+aIWAeFtdSDKjL/W+rEgmqBAQ6xnHTxKr83kdDctYFExM/ZL5O
	w3MU9bSkL7cORGRb66+4v4vwfuCN2Y04cTX+/txSy0XX4S2Q2+2T8PYdu8x1vXSvsU0aRgF7Xl1
	+KxyAy4vELpEDhgDrjUW105FwfsPhQPE=
X-Gm-Gg: AYBFou1+JgnjQLBxHFbpjaLNTltph70fmPwOTpJCZycPE7Z7MvtwC470mLqOJ2hlP9Y
	DgHMtMmphSu1PDMONjgFghZoE8uDBIVByV2fVFG0U9XxWmzHDm/80Kyq8cYtW24+OVJCe+6zteM
	kR+tXeOvNUP6JFYYLoBaRi7B4KjXlRAnPOOEPa2RmoJliSw0DCfznSSBVp9MNETNgAmCQIi53xk
	jCuS68HzfahdD3SNGRxB2CwYIaC6598sBMNgcpCVYPN1qVkNI4TnkMKzEfF0xqGApmx0yO3wu2y
	4j0Xs0k5cMqyEX0x5gF1Emu6/Hny4eXRGr+cwb2/CsqQn6o+LoApkHOB7BSaWO5bWK6WCffsJZf
	k2yFroFx3WR1/SCBFd0iuQ57hmQARYSb+3WFAmeXpspF28d58RBRSvEbF6qs=
X-Received: by 2002:a05:6820:8905:b0:708:ccf9:886b with SMTP id
 006d021491bc7-718a644c2femr521143eaf.84.1794299055722; Tue, 10 Nov 2026
 00:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
 <20261107101154.2992152-5-ankur.tyagi85@gmail.com> <CAMKF1sp4FTEJuM24HU5urX_j3F=KLLiLHFHN_XmH8977Hix8EQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp4FTEJuM24HU5urX_j3F=KLLiLHFHN_XmH8977Hix8EQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Nov 2026 21:24:03 +1300
X-Gm-Features: AclHuK8mhccFAA7KfVhmwifjxVQHde2NCJfsx3QncBD3ExAZWckVdrQkjybHL4E
Message-ID: <CADySD0Fx3+vwcuX6wRVUA-XUMZNTRQ=s20GKHKO0ykYvT86EOw@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH 5/11] wireplumber: upgrade 0.5.18 -> 0.5.19
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 08:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132071

On Tue, Nov 10, 2026 at 8:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This failed ptests btw. I have sent a patch to fix this but in future I w=
ill reject patches which fail ptests, so we can keep it
> from regressing.

That's a valid point, I try to run ptest wherever applicable but
clearly missed this time.
Apologies for that and thanks for fixing it.

>
> On Sat, Nov 7, 2026 at 2:12=E2=80=AFAM Ankur Tyagi via openembedded-devel=
 <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Changelog:
>> https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.19/NEWS.r=
st?ref_type=3Dtags
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../{wireplumber_0.5.18.bb =3D> wireplumber_0.5.19.bb}            | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.=
18.bb =3D> wireplumber_0.5.19.bb} (99%)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_=
0.5.18.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
19.bb
>> similarity index 99%
>> rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.18.bb
>> rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.19.bb
>> index 3b8494d124..f925aad8c3 100644
>> --- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.=
bb
>> +++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.=
bb
>> @@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
>>      ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data=
", "python3-native python3-lxml-native doxygen-native", "", d)} \
>>  "
>>
>> -SRCREV =3D "81606cbb32d29df20147d1b68b662c1082654d81"
>> +SRCREV =3D "4ab992fa2931ae2b17ef73508b1370030b7878c3"
>>  SRC_URI =3D " \
>>      git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3D${PV} \
>>      file://run-ptest \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131979): https://lists.openembedded.org/g/openembedd=
ed-devel/message/131979
>> Mute This Topic: https://lists.openembedded.org/mt/122141743/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
