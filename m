Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F672C36002
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 02:06:37 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.56989.1742868387223172049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 19:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbQQ8RvE;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso2349820eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 19:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742868386; x=1743473186; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGFMKRdG/GMR+qCpkHDHYgmKahryAT9a9olZe8zDj6Y=;
        b=LbQQ8RvEtKYXLxBt/NmNwXYBuk1Z+ZV0jwJX6cJfrf+fFYLIINjVbZ8RfdzOGUIeNy
         CHUNssC6hCBvCwARC/YI5h5cF162sI0/WMCL3ERqxjj4l4lamYU1P8lIg9Wpwnz7uQuY
         29o6TfdZtOcVw93+n0ScK4STjFZaHK85NlXroFhsLNcfCDKEIaDZWrYL1y0L9ZhG7+FM
         CVn4ZAFi0Ze4G6S8NRewjAktpeY5Op8vdpHn/yx6hiG8cafpshA/rhVNc6jrjf6uNFEe
         DOE890FE+342eyZLMTUlHw2atP6uqsWJd6Gk8iAhKWmTzcfJFWuVW3FzsHyjLexMN3JM
         0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742868386; x=1743473186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGFMKRdG/GMR+qCpkHDHYgmKahryAT9a9olZe8zDj6Y=;
        b=TgpSzbqDsDUxRjAUrninGMXIpY6J+FefgwB/OjWomfSTqJb+y6L3JjXwStP+g5wqTD
         /N3SeshFgX3mmSy6q5pCFWJPg1zxkQjnFkuHCYhFtdeabtrHQYqSWP+Dwq6iVGJLfL/n
         1gb1FghdsDh48BID5O0rRrVtSb8hGlwr+JRBP3zsGFIS+E1+eTfuQAYe4XcDIx/7oA28
         lVGfzS9DDOqbITJAkGGzhA7s/CGbjzefEPVS7RVcvsl5cwkttAioQAp+ygWxdyV4U+Mo
         +9YePxXWHBzbXY4R75fiYC+YWWemr/ygqdKoxeUbpItW07TKvBIopD65tTXIhzQXnU6l
         751A==
X-Gm-Message-State: AOJu0Yw5H03rqp3/TF47RAeykCTOo05Han9yq2axsDXuR6oCiAXCbx+M
	4xxSMLNBFd8l3gUHJWZv8hOAS5+uT7I2Xvei8fNr7+pySD7Psx9tp1zXheJuPDZGTjq8Ltu+IRE
	9oi3HS4pDCpAUmTCLH1mt8xnLyDU=
X-Gm-Gg: ASbGncuGKjbGnjM54UAoIHvihpkn2GDjtQ5Hk3FpyJ8Xl8FV+wB/c0i60Wrg+4Nrxg0
	Cmb1MZ/Y/oKm9si1ZhFSUNQ2V9PamL0q8jU/jl45h+VDM74CMqUjkU/7paVQ3l+2eZ0JgJMbwya
	lA/H6uG9RaQ79HovykkrVWPD4+
X-Google-Smtp-Source: AGHT+IHkfTSaz/IOFoaquxcs6UNPM2/50XH69u1W81K65rSjSoPMaXeqibdbIJzgQ+JtMNUs3LipZnVp6MG7pm7AGZA=
X-Received: by 2002:a05:6808:2e4f:b0:3fa:7328:b9a8 with SMTP id
 5614622812f47-3febf732b5dmr9333415b6e.18.1742868386223; Mon, 24 Mar 2025
 19:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250324140353.2905738-1-f_l_k@t-online.de>
In-Reply-To: <20250324140353.2905738-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 19:06:00 -0700
X-Gm-Features: AQ5f1JqjlzbhNVq3Ac-nossc-myJnqXWeEwhUF5pdfuPebYVMi0B6ZBDG5bU23A
Message-ID: <CAMKF1soDa_09QUOabb266UOLud+q9xocpTAasDKdzjEWLFKNfg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: update 1.4.0 -> 1.4.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 02:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116213

On Mon, Mar 24, 2025 at 7:03=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This is a quick bugfix release that is API and ABI compatible with
> previous 1.x releases.
>
>   - Handle SplitPCM wrong channels specifications. This fixes some
>     problems with disappearing devices.
>   - Add backwards compatibility support for when the kernel does not
>     support UMP. Also fix UMP output. This restores MIDI support for
>     older kernels/ALSA.
>   - Fix a crash in audioconvert because the resampler was not using the
>     right number of channels.
>   - Some compilation fixes and small improvements.
>
>   - Don't emit events when disconnecting a stream. (#3314)
>   - Fix some compilation problems. (#4603)
>
>   - Bump the ROC requirement to version 0.4.0
>
>   - Handle SplitPCM too few or too many channels. Add an error string
>     to the device names when the UCM config has an error.
>   - Add backwards compatibility support for when the kernel does not
>     support UMP.
>   - Configure the channels in the resampler correctly in all
>     cases. (#4595)
>   - Fix UMP output.
>   - Use the right samplerate of the filter-graph in audioconvert in
>     all cases.
>
>   - Fix a crash with an incomming call.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/{pipewire_1.4.0.bb =3D> pipewire_1.4.1.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.0.bb =
=3D> pipewire_1.4.1.bb} (99%)
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
> similarity index 99%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
> index a57fbca229..2bd7739433 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D "dbus ncurses"
>
> -SRCREV =3D "df1c36aec2aaf9e2eb1596b6b55e72c15fb2088a"
> +SRCREV =3D "2eb8cf5dc780ca22b94545f1254497a428c412f5"
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3Dmaster;protocol=3Dhttps"

This commit is not on master branch but on 1.4 branch, so please
update the branch=3D value to 1.4 as well.

>
>  S =3D "${WORKDIR}/git"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116208): https://lists.openembedded.org/g/openembedde=
d-devel/message/116208
> Mute This Topic: https://lists.openembedded.org/mt/111877112/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

