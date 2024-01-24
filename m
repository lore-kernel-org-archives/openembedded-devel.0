Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030C8C48260
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 17:24:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.29008.1706117054164518159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 09:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=XMr5pjDO;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.53, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so10367299a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 09:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1706117052; x=1706721852; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Df2Q33/9CEgIgSoxE6XI4p8yriQO5DLHgyTrIpRn6+c=;
        b=XMr5pjDO8/AA5qkkmSynj+MYJnv83VW4Yf6V1J68y3N5vqZtp6YWaTogXBV6oONElv
         HFdMzkZ4nwxfvoWt19B6/Tw3GVxNBpVw90VlD/OVFR1Zrq/ZfBHYx5ojJYyPlZFcWfx5
         DF/J136T6wm8rJTlrdibeEFHwEiHICvEI3pLYlblYDLMMcjloNNrB2t2cd+MD1Of5R8x
         rbcyXrFXhFyyzEzwjTsoJJC7dFC7v0Otev8oj6Nq0ZhgMLaO8keJXDd0CwsN45jnr6+o
         2U853u4KIgQOXRDey3MQqjaNDmuu3VhNCjH6NeUr9wB4TJHX3lUZank28FGfr7lwDrLY
         p+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706117052; x=1706721852;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Df2Q33/9CEgIgSoxE6XI4p8yriQO5DLHgyTrIpRn6+c=;
        b=UgVDan2M1JHcS+E2jHzBWxZPZCu8JMMRBOXeN41TQqEf7uxEquV7+ii/YyEq0/pq6K
         9gIrFz2mwGjdQ8l7UOKTw34PQQvpEeSAg98FVNqAk0CaR2cFd5iXhg15R95L+jUWGZpn
         wXGjTVa50A8UaeIu0FNGhkdLYujDjqyIA6j9I2Ljsufn9bLhOk0y8GDly3CTFyQRs73O
         4MMkajs4qQXPbCTqCaYIHDEvioZ2EfhRaDL5r88dhozuyrHuNk5JHORQQsgaCDKyf7IM
         I3mrIUYmi3agYAY0c0YwNjkSCX7EYhyHx16eL1t4d/xGtaCDjkoBYFrGO4aooIjk8xOc
         H/lA==
X-Gm-Message-State: AOJu0YzyGHOALOpTHQwhUfTG9/RyoI/odRInIdStNSr+8ZsQ4XjoJiS+
	yJyWsSnSMUTfPHzjJQPUU50tQBoRr0aDmoe46b13PO+BLN+R5kuEPKLi3HDSDuFqCsA9OKQdpOg
	nUJr853fMb6Dm8Jvb5mHecDexuMMj5plCGvXFZmaQNqMZIOlzdFY=
X-Google-Smtp-Source: AGHT+IEIm8hxVb9SjdaRBAOLUVWBkG4CJryVX6g3kjBd9bZUN2v0JeLY9BTHLHXvWjpdB6stf7nizYavoo/mKybWfdc=
X-Received: by 2002:a05:6402:5145:b0:55c:7415:ece5 with SMTP id
 n5-20020a056402514500b0055c7415ece5mr1584997edd.6.1706117052254; Wed, 24 Jan
 2024 09:24:12 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 24 Jan 2024 18:23:46 +0100
Message-ID: <CAEt6NwqasJzzj46gJ3Jr=NZebW2Gue7gs8Ze2BH+UMLzdnsV+w@mail.gmail.com>
Subject: OE Workshop in Brussels on February 5th - Monday after FOSDEM
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, members@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d85b25060fb45452"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 17:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108450

--000000000000d85b25060fb45452
Content-Type: text/plain; charset="UTF-8"

Hi you!

Yes, exactly you!

Didn't you want to grab a seat at the OE Workshop in Brussels, the Monday
right after FOSDEM? It's time to hurry up now, there are just a couple of
seats remaining by now. So head over to
https://pretix.eu/OpenEmbedded/OEW24/ and make sure you get one now, or you
might miss out.

And that would be sad, right?

Greets,
Josef

--000000000000d85b25060fb45452
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi you!<div><br></div><div>Yes, exactly you!</div><div><br=
></div><div>Didn&#39;t you want to grab a seat at the OE Workshop in Brusse=
ls, the Monday right after FOSDEM? It&#39;s time to hurry up now, there are=
 just a couple of seats remaining by now. So head over to=C2=A0<a href=3D"h=
ttps://pretix.eu/OpenEmbedded/OEW24/">https://pretix.eu/OpenEmbedded/OEW24/=
</a> and make sure you get one now, or you might miss out.</div><div><br></=
div><div>And that would be sad, right?</div><div><br></div><div>Greets,</di=
v><div>Josef</div></div>

--000000000000d85b25060fb45452--

