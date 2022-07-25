Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8286AC43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 02:01:04 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.23423.1658714463567335822
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 19:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HVVekMe1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id r24so7323083qtx.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6EqMcoYe5Xo4MJ78kycf3Zx1x1RF1cZuFbd0UNYNYvY=;
        b=HVVekMe1bhq22YLW44oDCQE3/kpd7887aNwi6yV3zrdJ6V5kn9T2MZXBbmgeuzGBPT
         6YamqRTzH6KuwXa6GZEZBPa0zDiGrnMkmYgDiAUgivItv1aUCDta4sRkTMBac8QaC610
         /EOS8AdVUKeNBjjUFCSl8zN8JLcITUjWJmCCS5QYHnT5OWeBdoZBQmhf+AnLYrgzI5nC
         +E+joJNFJ7hCSGj9LpMmJirsFXTmepJefxq7JWIkEfdGqDjSEyaN+DodQ3e7kab6z3/B
         gU/uU4vKKaXZokNSOA/A2fajPPsoP4xtX8vB7osAdDpcQQuW1nyVMZL0pguviWOP0txC
         HIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6EqMcoYe5Xo4MJ78kycf3Zx1x1RF1cZuFbd0UNYNYvY=;
        b=cYgbwd2sMxmj8HR9VjtQJo6NNhGxcC8v9vYG0HPu5kF4Oy+LUx8uZJuwuac14tFPXG
         Ge/8MofNh9esDTtUumCutIO/r4Dl6drwjfa78BkLqqIK769oMU1JpnzHW8edNPcGmks+
         4ycPjZE0Wzo2lfddDt4loNCZJuC5YgMevRo7KB5IDq4bis/PYojcp+u6E7X5E58XICEV
         c8wJZI6vT1s2YTj65d7holKkVkuh0LeG6nskSInOrD4SVvg/1kJjH9ZqPZVRSZON9KZl
         Em9xfd4quX8omX2L2ceDnYB+9SjfEdbzeqGmnbKsm2VuMgUA0fWD+BxFlSGvedMaHSt5
         iS6w==
X-Gm-Message-State: AJIora8ocmdcsDCdypLblRKwLnSGuZU6p7rieYIp+GVoMz00qzQpcOOJ
	CpY09ub+qHnuGKlwcOWasL691gB+Z+SnEnu/UqM=
X-Google-Smtp-Source: 
 AGRyM1si9tpTWuvTH2n4n/6/Po9oo1l0abE53HRn0232Q4wz3zWEPuZzIYJbJLCCCVuKMurjmFga1VfwGZyHKk2ca98=
X-Received: by 2002:a05:622a:1102:b0:31f:29ed:2e2 with SMTP id
 e2-20020a05622a110200b0031f29ed02e2mr6451928qty.54.1658714461528; Sun, 24 Jul
 2022 19:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
 <CABF_=yh7frbvHSe=+EokH+AuU5p7GRSN4+Kb_-qn__1HqyFu_Q@mail.gmail.com>
In-Reply-To: 
 <CABF_=yh7frbvHSe=+EokH+AuU5p7GRSN4+Kb_-qn__1HqyFu_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jul 2022 22:00:35 -0400
Message-ID: 
 <CAMKF1soLr20bKVyC4008rtTSRAK+ehjTADwhMdMRpY7NkJxAmg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] Add runtime dependencies for
 python3-supervisor
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: =?UTF-8?Q?Martin_Gro=C3=9Fhauser?= <mgrosshauser@gmx.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 02:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97966

On Sun, Jul 24, 2022 at 3:31 PM Jan Vermaete <jan.vermaete@gmail.com> wrote=
:
>
> Hi,
>
> Could it be it should be '${PYTHON_PN}-setuptools-native' iso  '${PYTHON_=
PN}-setuptools' ?

rdep on a native package wont be a good thing.
>
> Br
>
> On Fri, Jul 22, 2022 at 9:39 PM Martin Gro=C3=9Fhauser <mgrosshauser@gmx.=
net> wrote:
>>
>> Running supervisord without these fails with import errors. smtpd might =
look strange, but provides required asynchat.py.
>> ---
>>   .../recipes-devtools/python/python3-supervisor_4.2.4.bb      | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.=
4.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
>> index fdd8a76cf..7da29e39b 100644
>> --- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
>> @@ -13,6 +13,11 @@ PYPI_PACKAGE =3D "supervisor"
>>   inherit pypi systemd setuptools3
>>   RDEPENDS:${PN} =3D "\
>>       ${PYTHON_PN}-meld3 \
>> +    ${PYTHON_PN}-io \
>> +    ${PYTHON_PN}-xmlrpc \
>> +    ${PYTHON_PN}-resource \
>> +    ${PYTHON_PN}-setuptools \
>> +    ${PYTHON_PN}-smtpd \
>>   "
>>
>>   SRC_URI +=3D "file://supervisord.conf \
>> --
>> 2.25.1
>>
>>
>>
>>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97963): https://lists.openembedded.org/g/openembedded=
-devel/message/97963
> Mute This Topic: https://lists.openembedded.org/mt/92555239/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

