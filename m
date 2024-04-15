Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F0EC00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 17:17:24 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.1051.1713201439865511294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 10:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PtRYbG3q;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2da08b06e0dso37262431fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713201438; x=1713806238; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkJtuxSx5FW6XdCYBdQZwsJiUMxZBuRvqc7k2pdidM4=;
        b=PtRYbG3q43bde7A9wEHxQzL/8UDeGDPN7uUQAnZ100ozGXJ7BO2Z/SRuJ37WcW9XKR
         lkjDvcB9r2XEu3ikHwXK2Bwi9mRRdAPlGwn+kdTXKBbtv7Fj2ftkZot3FrfDHhD/HN/M
         v71+cWlTwPAoEyt+kfVkNss2W+LzahuWSmbTACh9tGXUhqK9K3giuyQ+tYx9m9025A4Q
         iPSyBOZJnIgcX6Wg0l4zH9i7Yjl3bGZmJ91m9PEmrIetcQUDC3RXiBraPHUhvHZWwGba
         hIDH5J8xYhQi0Mlg3GiRvfRCYqV5JhDNP3UTi7Ghf4YHkuHT7hXOXFAhVI44CQdzKvt1
         AqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713201438; x=1713806238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkJtuxSx5FW6XdCYBdQZwsJiUMxZBuRvqc7k2pdidM4=;
        b=vnw8cvcax0/lV6nBHuuXR57bI3kfUC/yHSk0pTKu10LYHzE9Quiuus7T2VX8XuKKwd
         Tw7Szz8OPK43VYUPUoUaoOIIsY54mUdIOSh8IZE0yXNRqJ8GPcJPJZWjX0dP5wzzE08b
         P1w9qJB89vNx4dmJGzfzKCZ8b4wImUiVJ4JRMpXslYtgP1M5Dvouo0HvBcDv9T83Utvn
         EUqsJ5W99AUYGzN/WoPYd1EeNyQ4mMqN4c0sEdQBz0GfVKb+kyhXumM4yzHvDNK9iTBh
         SCaZhxeqxREhWfMhzL1YZ3Pu/dK0wN76wKc+rUv/g3jLC/glhSMecUclqWuTP760fwNR
         dNdw==
X-Forwarded-Encrypted: i=1; AJvYcCX/MBh8LPYBXOoi8I6y5BSN6z8JKG5RrdIp/sl8y+7dx/pF3A4jOVjhd3LlPRAk2vQ7B4iavzw+pRyzjqC3/QoQtQUOB8Fh6gecRa0c99A69t7tHuexbdDBWw==
X-Gm-Message-State: AOJu0YydUu6qoGhNenYyuFGOqv1+DcIfiP72r0mASvNFd8+cIA3I7gX+
	8RJb7qsDHMbzzCh/i+JU7j3px+ygb1EQ8AnHWkFBUowYpy9zlbRZIuDdztrSqmTximX4/u5yl4v
	79WQxV3OwG9fIR1fg88MltTGPlV3PefCE
X-Google-Smtp-Source: AGHT+IFf0E1OuD4I4ljw5Chb4AJax3pnrx5g8s4NLw7NbSlzM0/QnaD72Ff7U+1YTbpYnwBZZXa5a2nhLTqhSnCC1TM=
X-Received: by 2002:a2e:a99e:0:b0:2d8:270f:9764 with SMTP id
 x30-20020a2ea99e000000b002d8270f9764mr8295553ljq.40.1713201437785; Mon, 15
 Apr 2024 10:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CANPvuR=KbhHUzs33CHSNut2Nx=fFLLu1NpMxYcJBM652DQ8bdQ@mail.gmail.com>
 <6153557a-8b52-4080-87c5-a427df64ba96@denx.de> <CANx9H-Da+bFvX6ogKNCkjONkESMfw1T47ncc+a6-mDoYg4pWYQ@mail.gmail.com>
In-Reply-To: <CANx9H-Da+bFvX6ogKNCkjONkESMfw1T47ncc+a6-mDoYg4pWYQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Apr 2024 19:17:06 +0200
Message-ID: <CANNYZj-3VJmQe0xXXBH6hr8G9_wdbBNYPnGggo9SnDOG2pKmKQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: ticotimo@gmail.com
Cc: marex@denx.de, Jose Quaresma <quaresma.jose@gmail.com>, Martin.Jansa@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 17:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109965

Yes to Tim's hard no. Qt5 itself is EOL for almost a year now (don't
tell me about their commercial offers, ok?).

I would put something similar to meta-gpl2 into that layer instead actually=
:
https://git.yoctoproject.org/meta-gplv2/commit/?id=3D43bf0e8d5985945d19d01f=
94bfbbda420c4435f3

Alex


On Mon, 15 Apr 2024 at 17:21, Tim Orling via lists.openembedded.org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>
> This is a hard no from me.
>
> On Mon, Apr 15, 2024 at 6:59=E2=80=AFAM Marek Vasut via lists.openembedde=
d.org <marex=3Ddenx.de@lists.openembedded.org> wrote:
>>
>> On 4/15/24 3:49 PM, Jose Quaresma wrote:
>> > Hi Marek,
>>
>> Hi,
>>
>> > Last commit on this layer was done 2 years ago and it was at the time =
to
>> > add Kirkstone compatibility, nothing more since then.
>> > Python 2 is dead since 1/1/2020. That means that we (python dev) will =
not
>> > improve it anymore after that day,
>> > even if someone finds a security problem in it. You should upgrade to
>> > Python 3 as soon as you can.
>> >
>> > https://www.python.org/doc/sunset-python-2
>> >
>> > In my opinion the OE community should no longer promote its use.
>>
>> I am aware of this, for me this is just a band-aid to keep meta-qt5
>> building for a while longer. I can work around this in bblayers.conf or
>> local.conf too, I would like to avoid that however.
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109964): https://lists.openembedded.org/g/openembedde=
d-devel/message/109964
> Mute This Topic: https://lists.openembedded.org/mt/105535514/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

