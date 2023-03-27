Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B007C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 19:05:11 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.45140.1679943910548447947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 12:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z5PgDRQE;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17aeb49429eso10358590fac.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679943910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2ZpiTTbOyXN9os9bqUetx7r6q3d+TFajcf/BXFO+HU=;
        b=Z5PgDRQE5ndJ4MT86t7OvY1EuotMalLqL0IQVzgcYt7YL5CsUue/ztu/AWRPgeAxv7
         A477mg1gK2u2Q3wL3BWUACqM3ZtwtNds9g9ocMRblx3Aa1Nuf30WlrWSn5ubYjHgK5rY
         WQUzbK6UOLP0rt8WiiU9iOHLJTQbmnCrbWltJdFAEzJbXPRS3P/OVKfJUBeb8evQvyre
         wvcw8MPEI4uJp9QK+fsakcbek3Ho02EF2PWic2TJLFxJMuXVv+ljghPWLFrJb9wLEQWC
         wATnuGdHA3dRYsjY9rCr/ayDZog2Uu9VEiHZczwOH5NP1/JUuM66rtYp1mcGRkmsrg9B
         LBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679943910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2ZpiTTbOyXN9os9bqUetx7r6q3d+TFajcf/BXFO+HU=;
        b=VbzS9w1nSfqsetwQIZcfxdDiGZ3s0yrD/Q3lR/16w5Ozrh30XiGLA48Bu36bn7WFNe
         6+AgoSAf1jPm7NZmsJHVqekdAGiLRtwK3WQn9rEbKB6INv13+OV+aQx7cffjfQtQ7Mpf
         gOshMP9IYlVAA1efnR9XKvEbyPT/aLr1xpDh5kfoIcRsWVQuaQiJTPl7mfQcs8m79nM2
         5KbHNrkWguDVrJAgQPChcYsnUd/WhhGn/gaiWewgnjKqQtD8NT9KGDUSPxd11Un9MQV2
         cay8zQCqaXiJ7fpnIOs3LM8eKugqZlBala3BGFxAjK6zANNInZlTfUnTNIY15nukkKDa
         nhUA==
X-Gm-Message-State: AAQBX9f5Ih2IERHnpFguOVciBW9yFeRgibadxhKmMfTxyjFTrOIFBI4r
	9GsQ98RU3mQ1N2o2CEihFPBtGYy6HWDc8Jo05wE=
X-Google-Smtp-Source: AKy350bOxqpOgaQG/8IlTsFOXgfxnUYMMhL1Asqv+lK/lbu4dRn8zIYZAepM1jIPuCWS42EIJAzuSdZqTt/9WBTmPaw=
X-Received: by 2002:a05:6870:1017:b0:17e:3fe:6711 with SMTP id
 23-20020a056870101700b0017e03fe6711mr3637676oai.2.1679943909602; Mon, 27 Mar
 2023 12:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125002.90472-1-zboszor@gmail.com> <20230327125002.90472-4-zboszor@gmail.com>
 <CANx9H-AJ59GB+NY4KBigGHBGKAzMry2YUCcifdEe44KjA3iJJA@mail.gmail.com>
In-Reply-To: <CANx9H-AJ59GB+NY4KBigGHBGKAzMry2YUCcifdEe44KjA3iJJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 12:04:43 -0700
Message-ID: <CAMKF1someMdY8ayGDSBQ0LPgrXw1NPCSxrUC-6DwgRBAQB37DA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-ipython: Add missing dependency
To: Tim Orling <ticotimo@gmail.com>
Cc: Zoltan Boszormenyi <zboszor@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 19:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101792

On Mon, Mar 27, 2023 at 9:39=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Mon, Mar 27, 2023 at 5:50=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail=
.com> wrote:
>>
>> This fixes the error:
>>
>> Python 3.11.2 (main, Feb  7 2023, 13:52:42) [GCC 12.2.0] on linux
>> Type "help", "copyright", "credits" or "license" for more information.
>> >>> import IPython
>> Traceback (most recent call last):
>>   File "<stdin>", line 1, in <module>
>>   File "/usr/lib/python3.11/site-packages/IPython/__init__.py", line 52,=
 in <module>
>>     from .core.application import Application
>>   File "/usr/lib/python3.11/site-packages/IPython/core/application.py", =
line 26, in <module>
>>     from IPython.core import release, crashhandler
>>   File "/usr/lib/python3.11/site-packages/IPython/core/crashhandler.py",=
 line 27, in <module>
>>     from IPython.core import ultratb
>>   File "/usr/lib/python3.11/site-packages/IPython/core/ultratb.py", line=
 101, in <module>
>>     import stack_data
>> ModuleNotFoundError: No module named 'stack_data'
>>
> It appears `stack_data` was added in 8.0.0
> https://github.com/ipython/ipython/commit/77651b7a7331b1b030f1c2c03310bf7=
ebb242488
>
> So we've been missing it for quite some time. This highlights the need fo=
r runtime testing vs. just "it builds".
>

Tim you are listed as one of meta-python maintainers, do you have
plans to implement runtime testing? or for that matter
anyone else in the community wants to volunteer to do this?
I am happy to insert that into upstreaming process and wait for
relevant ACK on meta-python submissions

> Thank you for the contribution.
>
>>
>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
>> ---
>>  meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.=
bb b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
>> index 4d21afd6f..875e89abe 100644
>> --- a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
>> @@ -23,6 +23,7 @@ RDEPENDS:${PN} =3D "\
>>      ${PYTHON_PN}-unixadmin \
>>      ${PYTHON_PN}-misc \
>>      ${PYTHON_PN}-sqlite3 \
>> +    ${PYTHON_PN}-stack-data \
>>  "
>>
>>  inherit setuptools3 pypi
>> --
>> 2.39.2
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101789): https://lists.openembedded.org/g/openembedde=
d-devel/message/101789
> Mute This Topic: https://lists.openembedded.org/mt/97881025/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

