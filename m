Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D1C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:23 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.16723.1722974894509421311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emuuOPqs;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db18842a4dso106991b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722974894; x=1723579694; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVYJliG2Ybw4w9tbqSz/MCf2WjDRIEfTLXwrJs8TH2Q=;
        b=emuuOPqsXlQtIpgfGVQ3BsOLxms043edj4Q9PwdhdsG4SwRTXQOHmySee1TP+Lzw03
         Io/KL9MFb16E/Jx5j8vK6ezckP9wCu9Pdpkxbw4sJ+cOJlFaE7QYOz/beRvazaQaMX+I
         pS1R/HkgP8gEZo5ttLQdGux4sms2mNM8J7yBhYjKB4fYBS5sEyoUWkZzgf84kqKvj2wt
         HYrUKEsN0BpWHcB0cQL9362v5mtNMrT9dWlTl8ykrMovY4BXbJg0ulQx8LkWe+vwgQFG
         eWTf4/b7qJ0U4BtXlJlojkMRoncoMNuz2pgyMpYemwmJL7nPYsjJc+PHfNai9F7TrwVz
         MvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974894; x=1723579694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVYJliG2Ybw4w9tbqSz/MCf2WjDRIEfTLXwrJs8TH2Q=;
        b=IocEt6CvKY7h0hTbbOU4qgii0lk5x6sty8Dlr6kkBsHR30vtXFEVk1ez1eydavMxU+
         xlJj6G8RXrnW37ADZXQi6hwZvTTEHx9R4vaoxh+Z++RgVJ8d/nCpCyt3VCHnWgCFvqKq
         amW4zgetXHG+ldKEL9TMLcNG2GrPvZoKALzMGKBZl8fbV+H3m+qq+ElqpXbLoVEg1q3U
         /bQJCEMcMu7y0SfJVLH3bO0Bx0LpdKyJb+fnPQSGGggBGNBjBXcazduTBEIljx3dr2Y9
         fJjof0FuilReHGEG72SDg4Pvfil0fzdPz/BlLqvA21W2A7+thacirUVMU8CeGYBwEg6k
         osMg==
X-Forwarded-Encrypted: i=1; AJvYcCW8xKLe72aZTv+afcfrvl85GdsZJnHkp0zCKWNOQcXLTnRW9rz4UhhsqXrNW8pJYP1HR5/bFW8xF6lwDKtKb55Wn2huzEWFKiX3UORyCrnZ/2V1/QqaJ321Zg==
X-Gm-Message-State: AOJu0Yz3nnJephC4e8RS+LaOdcnAMTqtp9ZEy+MrQ+xH6wCtUoa5v+98
	6J9jsiKrqXFjhS7WCB83Eu65PKX0u0O9H7oq/IYuXG+UWbDNCHhto+4rddYKyOs2pT3+bghRhwD
	a2AHL7tJHwfNWdH7xFdTk5UVsd2WiUEwx
X-Google-Smtp-Source: AGHT+IEm6D+APeUfEZgNSfpCLCCU5mSpdCyxpQiwB4mlMORkUS5qfG/w4aOByQmMvD/HHuI3X8LqjdyJHTVSsP/o2Js=
X-Received: by 2002:a05:6870:468b:b0:260:e225:4bb6 with SMTP id
 586e51a60fabf-2688771889emr7808253fac.2.1722974893802; Tue, 06 Aug 2024
 13:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
 <22372.1722341730427474245@lists.openembedded.org> <17E70719B24635F2.20637@lists.openembedded.org>
 <CANPvuRkyvDvecxKraFVx4LRcxQ3rWSmptbuhq_DVgDOfOHMiwA@mail.gmail.com>
In-Reply-To: <CANPvuRkyvDvecxKraFVx4LRcxQ3rWSmptbuhq_DVgDOfOHMiwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 13:07:48 -0700
Message-ID: <CAMKF1sriRLhfnwnSk8Z-otjxGW61DEwEzdfrc0pm9HxJeZMx_A@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: quaresma.jose@gmail.com
Cc: przemyslaw.zegan@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 20:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111596

On Mon, Aug 5, 2024 at 6:40=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi,
>
> I just noticed that this patch was integrated so it should be reverted.
> There is no problem installing the ftdi-eeprom package.

Yeah a last time oversight, I have staged a revert in master-next
>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s) 16:26):
>>
>>
>>
>> Przemyslaw Zegan via lists.openembedded.org <przemyslaw.zegan=3Dgmail.co=
m@lists.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s) 13:15)=
:
>>>
>>> In the following configuration as you suggested, ftdi-eeprom option is =
still explicitly enabled in libftdi package, which is a bit confusing.
>>
>>
>> Sometimes bitbake is a little confusing but this is the way it works you=
 can inspect the packages produced using the following:
>>
>> # this will build the ftdi-eeprom tool provided by the libftdi project
>> echo 'PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"' >> conf/local.conf
>>
>> # this will build the package
>> bitbake libftdi -f -c do_package
>>
>> # with this you can inspect the packages produced by bitbake as well as =
its content:
>> tree tmp/work/*/libftdi/*/packages-split
>>
>> # and with this you install the package from the above options on the im=
age
>> echo 'IMAGE_INSTALL:append =3D " ftdi-eeprom"' >> conf/local.conf
>>
>>
>> Everything you need is already there, just choose the right one.
>>
>> Jose
>>
>>> IMAGE_INSTALL:append =3D " ftdi-eeprom"
>>> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>>>
>>> Once you apply my patch, you can either select libftdi as a separate pa=
ckage or explicitly add the ftdi-eeprom option:
>>> IMAGE_INSTALL:append =3D " libftdi"
>>> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>>>
>>> Przemyslaw Zegan
>>>
>>>
>>>
>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111512): https://lists.openembedded.org/g/openembedde=
d-devel/message/111512
> Mute This Topic: https://lists.openembedded.org/mt/107614478/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

