Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 740986093D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 19:36:32 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id j128so11355094ywg.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 11:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t5C5eIWUb9YGxpE70HQlE1XyRhI1MpXuioIsk3qfwsE=;
	b=nspvyVdcGXE0Kjv7ss+2JJFNcHysBLlwi1Lhmqta3bEybaJ5CI7fAXhvQAQXAbatka
	GQDQDlQfL1+pcvqPwVuIXhUBKRlwSI4BVkh+EYf+kKYAgZXnL5K+IFnTU9W/3W/1Q//X
	jzEadAWYEYaJD5//l1+f5toLaKkPoPHjrbv/cafaEId8PUjr14nvfBk6B+6eAOBloGKd
	ivLR7dl16da37D8PhjkeFViPF7sjOgyFIpq7DWAiLBp9OHTnd3FmKiTeu4eq4StKVbBc
	ZoW24KEheYJ6CooMSqWBNtS8L1YVZBJVHTL0X4ummY+sw9ePZgto6ygTxhkslGUVZb41
	ycUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=t5C5eIWUb9YGxpE70HQlE1XyRhI1MpXuioIsk3qfwsE=;
	b=twspzB1AEsYLtwUkehm0v0FtyfOom315IQmUxoTtpucWDHMnTKGcp+AwTJTqK2ydxI
	BWQzwWihU47W2nkSSqDk4BivYffSXo7XETQDQaovu7pq/9Ua5edyU4UOQ0F3UFbKvjrw
	Tfxbca+xv2fBvfbMvtAl+tkKGy6TTk3Q5MjFsv57ltVvKDXiRIMrZLGYn4Un/Fx1CmcD
	jfBqcXbiksbShpOBcinbJUmtqu2SxlTKfrRX9Zk8LwJPMkZI1AdwmiOnFSMQhj5G7C6J
	uDr62E3D8dol0QNzYL7Qcmjbd7XuTJZZ+YyxswKm4eL9O8zX2OXU0m7B7YJ87WzdNutF
	4JmQ==
X-Gm-Message-State: AKwxytflxwTLz79j2J4V7L6eYKzfwcliFtGn0PBVjm1h1kx1oyI3FLz3
	sg8UoKaVTkW2z4U0JgqLmO3IjHQYwFASbGa9uhQ=
X-Google-Smtp-Source: AH8x22509fjari/72rgWKLabOdpaD5woWSWpldHjiq8InQEj7ErXcgvIMd1cu7wbsokIZOOtSt9QrdfZNzP5aB3YEqY=
X-Received: by 10.129.166.135 with SMTP id d129mr24925191ywh.339.1517513794239;
	Thu, 01 Feb 2018 11:36:34 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.128.6 with HTTP; Thu, 1 Feb 2018 11:36:33 -0800 (PST)
In-Reply-To: <CAK18fxFuSkpsd4hb-9hvDSYTZGisJ73otqpxk-xW0ZYoGkU+-A@mail.gmail.com>
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
	<ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
	<CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
	<CAHUNapSQJoSJbexQd6_NWU=YO4ekubf5fwNeBdtrGxP_okkByQ@mail.gmail.com>
	<CAK18fxFuSkpsd4hb-9hvDSYTZGisJ73otqpxk-xW0ZYoGkU+-A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 1 Feb 2018 14:36:33 -0500
X-Google-Sender-Auth: 8fzwbzSC3c7CUyptsaTYC9EKqzE
Message-ID: <CAPuovEJfXdpKs2XFp6Y6hmh5Mg8u=3Vo_dL98GSGbAp2DVwbww@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 19:36:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 1, 2018 at 1:47 PM, Andrei Gherzan <andrei@gherzan.com> wrote:
> On Thu, Feb 1, 2018 at 2:22 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>
>> On Thu, Feb 1, 2018 at 8:51 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>> > I've merged it now to unblock people doing the builds as discussed on
>> > meta-oe github and also meta-raspberrypi github.
>> >
>>
>> Thank you, it'll be nice to have a working master again
>>
>>
> Should be fixed now.
>

Martin,

Any chance you can merge this to master-next? No reason to leave that
branch busted.

Thanks,
Mark

> --
> Andrei Gherzan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

