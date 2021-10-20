Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8151AC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.552.1634751043617644367
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wy2CDjYO;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id j12so3836588qkk.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9U9KYBuHA9xbcmM3kO0yEfSCENgSYYQUWgG5+Cp6/Q=;
        b=Wy2CDjYOsSY8LZ1CNfcMw5fYdv/EocVQLnNA4+GnTvBijlBJ4T6lFfQY2YnTJvz0yh
         srOkvf5Ti0VhJgKT+Cx2EAW+3Lwo//gjy2ACl3Go15a6RoKkfXmka6Yacx7VpXCCLL7L
         /+lfAElY1pyyV4Hrq7ugMgBqF0cGle5ybSzPY8LoKvx0H14uad4h0RC8xJ5k7Ob7pv+A
         eFvzifC6QsmsGsfrcrMzlEOSpO0e5L3LnMlCrrw017skchpMGJfwF5pcXYqaswDrfWIT
         3GLALiHKFfi9qOrWbxsxxNiD6WMkutgVSDY7MUBk+H2QOHGn7qBYsGDZpWHLnnvpXNk1
         9i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9U9KYBuHA9xbcmM3kO0yEfSCENgSYYQUWgG5+Cp6/Q=;
        b=eiycSymOsfRKVjfaIBGxqNaWYxbX/BTfxBHBGWz9sDnaALeGqy3hcmiUATTefEMbHQ
         UYBFZoV0r9ogGkIAmMAKmT1pKcX2bsTmxgL3PGgbf9ZsqcypzdQj2dgn6/FiwXq6ty2a
         mr5dhUNlucxIKxaUc7SEKrGjXpu2z8AMjY75LJGHUXrUGmYrnAKGuzH8Y4jNz3hr7NPV
         5Q6ywp0kqhBtLbNgtoxzf6HcXgGlD5RH/0FMOTOaikyRL9RWD8mQUpUhYGaTZq8qokPw
         JC1jL6xr/TpK7Io9rit3HzxZUuwGisJEtQiNXRPmDYXcfGAkDixYi53iNp1SswIasBje
         M07w==
X-Gm-Message-State: AOAM531WC2HCVeu11Dgvu0nssL2xW5GHt84tT3fA/bJZ3Y2p7YiZEbGf
	2aVuHd3jKjiYwhUAH/VOvyuNAcJcukl6OHVxfbI=
X-Google-Smtp-Source: 
 ABdhPJz+Co84Jo/+elMIdnPehMTqGDi4h5OiQXmVjF/bSZW6fMhrR8f/G4BcdqDnFFMdPcFkQ0RwwwaDRBcgAQcG5gA=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr374318qkf.47.1634751042701;
 Wed, 20 Oct 2021 10:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2021 10:30:16 -0700
Message-ID: 
 <CAMKF1spoVQEQB9CAs+g0_n6pYx4gJ0kPjuiLTEM6-XMhpqKwNQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:30:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93497

On Wed, Oct 20, 2021 at 9:47 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> Drop autotools/makefile patch and change the build system to luke,
>> as upstream uses that now.
>
>
> Any idea why it fails?
>
> luaposix/35.1-r0/git$ build-aux/luke
> luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt
>
> I already have a fix from Khem:
> https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b
>
> but it doesn't seem enough.

yes, its on list of failures still. I can see it happen when building
for qemuarm, luke is a native tool and its perhaps mixing libcrypt
coming from libc or libxcrrypt on some hosts.
and cant find it reliably.

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93483): https://lists.openembedded.org/g/openembedded-devel/message/93483
> Mute This Topic: https://lists.openembedded.org/mt/86244775/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

