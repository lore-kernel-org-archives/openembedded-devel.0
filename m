Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDFDC52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:09:43 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.16753.1722974977262297933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k7+TDGYi;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5cdf7edddc5so603601eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722974976; x=1723579776; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDBuWeVf4wZN1jJzUuyXCc1YJ3uh3FtDZEfPzop+o+g=;
        b=k7+TDGYihUt/rgG3MAVmzgzSyBcp+FgLV7xHyR8NLF/yXMA4qIHfxtBJ93RCnVWZmk
         LMcQ3zhQg6e/YMxcDzTEybJG9q7KJ4U/51ltLq37kGApqjp476vWNZj0IsYMwAzBZfLt
         HmgbymSMZWA4ZvoXOztScZrxviMikMGykkPcSuvElyICap1VymBfGCppa4+vCVnMtVmG
         CBvE6+M3b24v7htQm1gnZcG93Xamg1Jlb4tQ3sGjZ1wD/ItD1Ytz/LaKEv8RSUqUSP2Z
         /GVc4LJB4nbeV4rsIEvTnPXvMyFgoxa0p1qyTpWijrFAyIkCN4EuQOx3XyHfAOCatQM4
         AE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974976; x=1723579776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDBuWeVf4wZN1jJzUuyXCc1YJ3uh3FtDZEfPzop+o+g=;
        b=PrGicnhZ7zz2d3vRpNBhXNZ+pU+4pXUForNXiMO10/Lw+JQk94EMQI8BTMDxuPl9PZ
         0OaE9KmvbFXg7K7NWfAuWeOZOZxQvXKF2BsPD4odJYo4VgvdLyKDoJGSd5vaQwlxzZot
         84YR2YEy9jc8JoRH0HUAWw1U596bhQ0vRo1lSBpIO31zbKvVNgfbcWunnKJQVy4lqr18
         1DwE71OEXlVN6ZJ46me85gOVIiGC5RfM7b85VKbSpy2MNdKzqVCquNADp9umiF5+ub74
         fstdfw9AmVbHUIhOJrKdh2+njsn921irCPmgiBzOejwWDcLufWQWG5Rk+OFA5mTnTyd3
         fdSw==
X-Forwarded-Encrypted: i=1; AJvYcCXakwQkkaFbkMIA5/v3PuJY5Ttlfs4/ereGdGW9lZK9FgxrPm0IOucMp8+sZvvN90Fzf1CDcE0ilx8UCzTbtozL9ZI+9ldI86edTZxu4q2tPYxtyRt5Dkk4Yw==
X-Gm-Message-State: AOJu0YxkxgKkVZU2jKLofS6i73yPr1o/GVBkkW4XdlxpzUcfC2iKRptH
	iVNPaMtD3od9rOKvZ/JxZCG0FYSSzhJHcMJE4wfq6SPSJltA3qMmVmJ+42jbGSX3pkvnZaHXmTb
	yXy7lXId+lIlPX8nf2Sdv28DV3IDsCUTW
X-Google-Smtp-Source: AGHT+IFVZqaM0v98mjRAD8uPU2DW9J0ChlGEMRbapYgAA1eQgSLmYu5LpqI9xhuXnwVuzmZGoyRuMP24WgSsFcrjbEI=
X-Received: by 2002:a05:6870:eca8:b0:260:df8a:52bf with SMTP id
 586e51a60fabf-26891a7d93dmr17896141fac.2.1722974976277; Tue, 06 Aug 2024
 13:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com> <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com>
In-Reply-To: <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 13:09:10 -0700
Message-ID: <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: debrabander@gmail.com
Cc: akuster808 <akuster808@gmail.com>, dev@g0hl1n.net, 
	openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 20:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111597

On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via
lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
>
> > Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het volg=
ende geschreven:
> >
> > =EF=BB=BF
> >
> >> On 7/31/24 4:07 AM, Frank de Brabander wrote:
> >> I was unaware of this discussion when I created the fix for master.
> >> Note that I've silenced the TMPDIR QA message, this still needs a
> >> proper fix in master as well.
> >>
> >> This indeed needs to be fixed in scarthgap as well, since the
> >> incompatible versions do break some code. My two cents for the availab=
le
> >> options:
> >>
> >>  - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
> >>  - Update pydantic-core to 2.18.1
> >>  - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
> >>
> >> Would only downgrade if this is the *only* allowed option according to
> >> the LTS branch policy. Version 2.7.x includes new features compared to
> >> 2.6.4. Removing these with a downgrade would violate the LTS patch pol=
icy
> >> of not merging "ABI/API breakage".
> >
> > We have had this type of situation with a pkg (A) update in master and =
then new lts was branched. We found out other later additional pkgs needed =
to updated to work with pkg (A). pydantic update was in Master before scart=
hgap was branched.
> >>
> >> Option 2 or 3 are my preferred choices and they fall within the
> >> "fixes for bugs" category of the LTS patch policy. Option 2 is the sma=
llest
> >> change to fix the problem, but option 3 includes some additional upstr=
eam
> >> fixes with the update from 2.7.0 to 2.7.3.
> >
> > Master should be failing so if Master gets a revert of pydantic back to=
 2.6.4, then Scarthgap will follow. Is this an option? - Armin
>
> As far as I know master works now, so a revert would make no sense in tha=
t case.

Hi Armin

scarthgap is relatively new and I think I would be in favor of making
an exception for this one case.

>
> >>
> >>
> >> Regards,
> >> Frank
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111509): https://lists.openembedded.org/g/openembedde=
d-devel/message/111509
> Mute This Topic: https://lists.openembedded.org/mt/107073841/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

