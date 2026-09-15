Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F63C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:55:04 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14104.1789437294279928474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mhgmFotF;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd76a9so2218065fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789437293; cv=none;
        d=google.com; s=arc-20260327;
        b=P+KYhXioUu141Si4ZXYcBjWTU0bBvZD1nFS8PaQGiw+nDQ1zwAwMlxcSV2w7Tv5Mvk
         K6BQjCVIKzFhv+DfrB44UojAbNHyYEcvHkmNgatWTJzrjBTE9/gKXb7t9SGFsVN2J1GH
         9hcqfs9CHRIoh6cyj1TOuWKGME5rzFhf5Eiv31VbmfvuZqetU5JdjNqL10/HoaL5sCO/
         +rtSlmMbJ+VtGfJukcq4ZLU0CDoFmm4QlBETRO4slzIclOX+kTpcj/7shILqrIxSZqe8
         sN8GDcW92M1y0VAuI9UmdUbNsu+M6QKvDocXEeiU7XqsebiT9Q4mCh3SpUNBwDFmeTfe
         fbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zSIYXYquwTozzTDUmRc0pTgx2bdLsg9RrzIywnOiz5E=;
        fh=cAJEf28kSw1dr5OZCJIkyh9mT48QJVsDxho0UgnDHyE=;
        b=jchMah43pNIH4Lv94/0vF5sjJEYXyTqF12OkgcoBEqNH+RyAGm3B+NiZpnuvYix64R
         qaFcd0Qu+KHgsRUEjlYvyLz7Us5fmOIgMJRC2+sGVNCNo+9wylpS5Tc8HpZQTGuw5oON
         kVQMuGDmxiqT3tAM1+5sMKpwHIWpNXVKbS/M5DOhq9PUwJv/YL5HZMJLAmfNAHUQe2+j
         p/c5pdc7wuAydH2yc6FkSkk4Kg8A0hi8ZxA8dIY5zZg4PKs/ElrJUveJHgQJKdPc20fm
         YNCJTc8aPX9Qc0HawT/mfDdQx34/PYgKu/y8rwo3LlNH+oYuFv2SCLk67szXJBYR1oaC
         B8/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437293; x=1790042093; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSIYXYquwTozzTDUmRc0pTgx2bdLsg9RrzIywnOiz5E=;
        b=mhgmFotFzDkUmNfZ3kbNDXex0+bJe7v2uFpZjUJvaWDdDHadOcs+wpJLLd00DDVKkM
         HeGknd75aYmN5T104xDAEZe9TMq2fO8m+tTYGdo9jwvx207kjaB7ZDjCyi3XHK8mzARE
         UxLt1B6k9XXZIjbcWdqsfmKtvB3ybHNw9w0243u6/LLD7u/dKOfaWTfr9mnMKJEZtuW6
         sFDGWD4KGsvYxoBtK8AjtQK1m/LZGH+HVC46bSyvBfV93w7tQVG1QtHwBQbNUkN3dJrs
         cAY/9o1lt9u39QkBkiiPtwNzrEh1cB3OS5MZ0wq0omTLcgKeQbn9sDMmDVNk2eL7XET8
         Aqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437293; x=1790042093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSIYXYquwTozzTDUmRc0pTgx2bdLsg9RrzIywnOiz5E=;
        b=OZ1pwwDJahgoco8lNI8hz+G+BZa3fuJbSEWBJ24iYQoKelPetma6uRMXG+p26olGw/
         rVZsNb3FF2aVwxyQEzIUwggTWiCLiZ+XqzNbetw3XZ7YgMQjCMC7uehsorOtdX1nq6TK
         gVS3pGgwNTzHVltFV7GjqP2ohjWD4ymw3xN7nelakqc+ctN7n7A3zvugVzoROd793kmQ
         UaJD+yjtBsg8i/y7C/TK48PC51IXJJXTGbggEoMI9SWBsf2e5GvNMj0eedfd/dxPfdaD
         Fw/+ekh6k7Iazi6SBgMwyNenioEiMB6V6MG3yUNh46VgUnb50ufFHOOJr6DXej9jE7cg
         f3rA==
X-Gm-Message-State: AFuF++ltYOOdJAMTjYxYlFPW1dt41bzU2Ica9GPt8erKLMSj11pzPzpj
	Ro8BZ1H12djOoe+Z/hmcqL9JEsSL7Y6TaHj6YInLo4UQKd+p3rYYNFU7pkjU7RC8Wzbe8aHAjqW
	rpxA5dDKyFsNSea7PVNud6W4J5hCp1rk=
X-Gm-Gg: AYBFou2TANx1rIypC+XQfVCNMI5cFiHqBAZEUxvzbHhKalzEApcPHKi9EOxP2/Mnuxj
	0JdKVyTPKlros38cyNiiUzG4eptlNGK3QywmVSUdhZ3XpmYmV+nVLIRL4+rzViX/92HubVUy1rt
	RXafBIUBL20A6IoIeYOfKaMjsuouhYW9h/Q8K+EAKShtP0JmQxhMugLMXbjUJJ+WJ0pLY1Lwm+v
	14XzSRbqnH00GcG2ZwdNKw2P02dzEedgxzPfkkJyK26feWe2Bz/vkWdzYd5dpU4gGsboyWhDDOF
	YBxK60EC9ygNNm22x74+46Rua0c7Qax/nTsJDSVeIVdd7Bpbbk8g7h+QdEs+yAKp5qXhD6/u
X-Received: by 2002:a05:6870:176c:b0:447:24bf:ec47 with SMTP id
 586e51a60fabf-481f814a551mr3343022fac.10.1789437293406; Mon, 14 Sep 2026
 18:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com> <CA+s=J=w5ijzWh8yNY37tuOqxOjLiBZmGtks8CPgGsgCZMRqTRg@mail.gmail.com>
In-Reply-To: <CA+s=J=w5ijzWh8yNY37tuOqxOjLiBZmGtks8CPgGsgCZMRqTRg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Sep 2026 13:54:42 +1200
X-Gm-Features: AcwNN1U07cAaebKnATJDNps3yDHKJg9WFm9qfFYosXqR23TJTh1aZwuvYO5pu1A
Message-ID: <CADySD0GPY6PhYnnEHbk8Dp45em63Tf7=bS98vxx1vOtqkF3euA@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 1/28] libmxml: upgrade 4.0.4 -> 4.0.5
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130032

On Tue, Sep 15, 2026 at 1:34=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Wed, Sep 2, 2026 at 6:08=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > (cherry picked from commit 7e505c34533b265a6da539126f4b25b9c6843f40)
> >
> > Changelog:
> > https://github.com/michaelrsweet/mxml/releases/tag/v4.0.5
>
> This isn't a bug fix only release so will drop this.

hmm, you are right.

>
> Thanks,
>
> Anuj

