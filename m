Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.2386.1614805288698480742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 13:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nnl2sCoZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id l7so12954494pfd.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 13:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6OuyijXmXkxfoKFiBvR6njH2VqqhQ4DAsNXLf0MOeGg=;
        b=Nnl2sCoZLApjSskTUrsLMWldPgmDz0pbI2iQcvKSAEXXPn2aBzLhE+ZUOEn/t9m13i
         +3ZmdjEezPqrNhBGkJIEP8s/FpHHdUmJMqvICewWrqHkPvDvCUlKpxgs1C7aF22fOzna
         rVtp72P/sJwxx0y2NIJI6L93xCbkws2USBpBfzgc/TT9Wb6sdkxZBbD1B1547G7cX3f2
         tSDvmPLg7NTT1BFaObEdfcGHgvBR7QxpmViy6GEI5mdtEKgtDpmNFxYqMFdd5qKZvQRf
         vJyMNdk3EiSBF09j2nE9krQ9VJI3x4GVQWFseqq3KJzf0J2hyOGeQlINiT9Nk0a98dvH
         e0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6OuyijXmXkxfoKFiBvR6njH2VqqhQ4DAsNXLf0MOeGg=;
        b=rhPxeJ1a3G1hW/9vuXsrg4ZsKYG1T3WAW8W1gpXKJAxYTO95V3QHiIYmuF7ONPt/Gp
         f5S7TDqoszUwTQGxmW2ufH17mxTVVYcdOdT1LlQBk++UL252tAJZp5e03yG9pRIu6ztp
         AYw7XJdt+bLZFYrKsvKcJ/weNhYQ2zu96x6l7Cs1PH4dJbpy5/+ysUtBnK+REIQzUiH6
         Jx3zwbaL2LlO1op1wLdH1gV18Z92XHcnNNJhp2l5KCkfHF28zquDurY/kI68rEm/Lmg/
         14rRn8UKBJvgc0Xx7bkYnc+Hmhc3UPCA6LoKGjYqSSO0fxYs+jYMe2tUAPQTlg2+3tHN
         zacw==
X-Gm-Message-State: AOAM531oRGc6FYjLpviND8H85wlzQEOtCQb3m96peMnOuTMcErlGkcwU
	3IlwxUzJaWHVLF9cTQMG2WlhyaZ8tEVnvl5INQ4=
X-Google-Smtp-Source: ABdhPJyGw3S7JXvxkDOnRrcwLUZVmrHfeBVVo5pI1Mxilg+JODfnxDlptyZGwWVZf+JOXjzV0LKA6ByUQKqStbtM0Xg=
X-Received: by 2002:a62:aa0a:0:b029:1ef:fe5:b172 with SMTP id
 e10-20020a62aa0a0000b02901ef0fe5b172mr694987pff.9.1614805288157; Wed, 03 Mar
 2021 13:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20210303114130.2317817-1-crg7475@mailbox.org>
In-Reply-To: <20210303114130.2317817-1-crg7475@mailbox.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 3 Mar 2021 22:01:16 +0100
Message-ID: <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	quentin.schulz@streamunlimited.com, 
	George Kiagiadakis <george.kiagiadakis@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../recipes-multimedia/pipewire/pipewire-0.2_git.bb               | 0
>  .../recipes-multimedia/pipewire/pipewire_git.bb                   | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => meta-multimedia}/recipes-multimedia/pipewire/pipewire-0.2_git.bb (100%)
>  rename {meta-oe => meta-multimedia}/recipes-multimedia/pipewire/pipewire_git.bb (100%)
>
> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> similarity index 100%
> rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
> similarity index 100%
> rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
> --
> 2.25.1
>
To be honest: I'd prefer the other way: Add it to oe-core (of course
not this old version). Haven't found the time to check more on details
but it is a drop in replacement for at least pulseaudio and jack.

Andreas
