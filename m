Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC9FC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:00:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8955.1643126424210471242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=QvP4LTaY;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso1985003wme.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iELClxPNSmEYcsDdCMI3NQhCFK0JLhbNQZ9AvxlY20M=;
        b=QvP4LTaYub2so323aI6ZaCDS79SBQg4vqQCZdSaZZkFQUh0Dh5rRRQsblDnMYkD4VK
         Y/guBlYxk8D9DxF3PIvpeteNlpcUi9lt1OXDLIgxv6UscU5EUer4cSLu3+qAvIqQo8BL
         GQxDAM78BioNcI2/2IX68a8OeGJIMB7ApARbA55qBKE/3ovgsIk+Xf9naM5zUpPeRYVo
         g+T1H6JBxnhEvbW1bL1AAvyNw/kBIgasuzD5bqjv5vdhhrHzTWZGFTCm7YOArXhIzIZY
         KSqwQNut9HH0gygBKXTwPLeO0PqE89U759DZyIOHBLo/QigW5Y8j7tX69wfwVz7Vmmih
         Q69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iELClxPNSmEYcsDdCMI3NQhCFK0JLhbNQZ9AvxlY20M=;
        b=okpJPe6kogLOcp7asAZu/eEbWv/oQuyBQz0shex918PSayTIxHJejP1XqVlR9YDhdL
         TnAJV3zgr+kKpHH67tjGkO/qNIrnZJV/AQXnKncc+Qc9viVCU3uh5G2MeTlQPTRJNHmJ
         FehHn0JnbNQ4jHS0c9WPzW/cWQ5sObCbdOsoO8ur+nGsWzIA4IdLnaehAu0lz+Tfjnfc
         oCvXJl0HH+FKM24Lf9DiAJRX+cdVITg4Iif2Z3SX8GzFBxRUaeZBq76v9nT0xYRhoEDD
         8LCiEQ1CAMSWVgi70pHr3oW6w3TGji7cGaUG20FG9O7vG79gr0quO9UnlS44ki1Gu1bT
         db2w==
X-Gm-Message-State: AOAM530qVq7iABUhhl1dI696GAXHdtgsqUaDnXysUZXYWIHSwCz1aiI9
	oeD4+wOjZs6mzYHWx7Ac/65nNwChpn7TbFPpFSdzjg==
X-Google-Smtp-Source: 
 ABdhPJyPgMxJsOT4glkNaRm0z5wn7L4JsrxiY6UXCCtSuZwO7MCBcZrBlHxZMDDhg06QaOKGN+E2kxjrCNF5Zoq1F/I=
X-Received: by 2002:a7b:ce04:: with SMTP id m4mr3582941wmc.157.1643126422456;
 Tue, 25 Jan 2022 08:00:22 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
 <CAB=6tBSszdZEjyKPvMd88HFKZiszcVuGEt4BH6w8YsS0Ew=gNA@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBSszdZEjyKPvMd88HFKZiszcVuGEt4BH6w8YsS0Ew=gNA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 25 Jan 2022 16:00:11 +0000
Message-ID: 
 <CAAnfSTthW4_OK-wSPnqP2eXV1hg8eqB86MWwRs8dDitCu09qmw@mail.gmail.com>
Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, yocto <yocto@lists.yoctoproject.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 16:00:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95070

On Tue, 25 Jan 2022 at 15:50, Chuck Wolber <chuckwolber@gmail.com> wrote:
>> Branch Names
>> The =E2=80=9Cmaster=E2=80=9D branches on the relevant OpenEmbedded and Y=
octo Project
>> git trees will be changed to an alternative name at some point in the
>> future.  The current preferred name is =E2=80=9Cdevel=E2=80=9D.
>
>
> Why devel instead of main [1]?
>
> [1] https://lore.kernel.org/git/pull.656.v4.git.1593009996.gitgitgadget@g=
mail.com/

Personally, the only advantage of 'main' is muscle memory of m[tab].

Semantically it's not the 'main' branch, it's the active development
branch.  Thus, devel.

Ross

