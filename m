Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45386C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:29:08 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.75460.1698337740669218092
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSlD4cMY;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-58686e94ad7so632602eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698337740; x=1698942540; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B5XcPeGjZocEwdMZ13+AX4fBltJZGpvf2yG0XuCl6o=;
        b=NSlD4cMY2zrTBDyyIOYET9eyUZarnV4jHuax205jgfoQ6mucH8AJWhOMWmGaNPupg8
         e64RPNuLfNv8jeoFbVd5CAKj0q5hllFCu0zqatgSAEtDIB9yGyGGBAIK+araFNHXr103
         BzJu6t2JzieqncF8IMUif/FwAHCvfVtgDJP6bo8Bza3MVjoAj9MeOrrNuMEG2vstVUyu
         RB4AjOVO60m0Ti7GZL+TpP4c5WzZxHnL0rvU76qDKUEzjgcuZYedNYYdkbz/Qz9T44bq
         lVmnOa6OxH+fHYSwYuEbKqqWihaP/niGQ6hMrW2NhRsYuUGyPpIkMbqagL7JjXTGl6Y/
         MYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698337740; x=1698942540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B5XcPeGjZocEwdMZ13+AX4fBltJZGpvf2yG0XuCl6o=;
        b=lpXhtBqcust3MZOO1CZ8fNboqNW64PRMdicuQgsH7IjDC3ZHa8WbtT1FMYVdOWn26Y
         YQcRMk58m0W5pnl8iMvtn4AzQk/TykgzUDdIau4u9xaSYnYrJ6kMS9OjoVU6Npqlq6so
         xBSuQBJO/Xz8CfEQg3j1s6NvUPXXLm27VC5rZRg7Yf0t81O8gyQqjLdOGtREYOgpZKg1
         hcy7BtENSc2+s/+jSpqmh7Nt6LEJVikrL0AkKuqNH897RKsulCf61ZSW5ZYOv9i4oq0b
         ScyWCrmARwYfinTBLiWFCU2AXN05g8aQ5LH7C3v0nXVv79LugL1vCT/l6HUC0SNrlg1u
         koZQ==
X-Gm-Message-State: AOJu0YxtVIuwjB5XPwq6lNbj0ZM6CC4ITWdAs5TmA4tYqDRoKRUiY8P4
	ZiU1X7VHWEfs4lxMg2+E7QlyyApxlb7qYSwWeBt5t56F
X-Google-Smtp-Source: AGHT+IHxFeLiXdWR8Ls/Myixvu0NgXrfinT2aTxmIl8wRDx7nJyS6J9CHF6+5XBmQcXChGADWP5XJidW29RvnsiuVAM=
X-Received: by 2002:a05:6870:4615:b0:1d0:e372:6c2d with SMTP id
 z21-20020a056870461500b001d0e3726c2dmr114951oao.0.1698337739866; Thu, 26 Oct
 2023 09:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231026130904.1500640-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231026130904.1500640-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Oct 2023 09:28:33 -0700
Message-ID: <CAMKF1sqFtrwm_k3ytkT=mGue+PFgqHZJZXmntqY23Q9mQQdNJw@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [PATCH] python-blivet: Adapt to upstream
 branch name changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 16:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105758

+Armin Kuster
This is for dunfell I guess.

On Thu, Oct 26, 2023 at 6:13=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Upstream now use main as their development branch.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui=
_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.=
3.0.bb
> index aba127897..42bcf4651 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
> @@ -9,7 +9,7 @@ S =3D "${WORKDIR}/git"
>  B =3D "${S}"
>
>  SRCREV =3D "42512ee48494cee71febf04078d9774f0146a085"
> -SRC_URI =3D "git://github.com/storaged-project/blivet-gui.git;branch=3Dm=
aster;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/storaged-project/blivet-gui.git;branch=3Dm=
ain;protocol=3Dhttps \
>             file://0001-Use-setuptools-instead-of-distutils-in-setup.py.p=
atch \
>             file://0002-Use-symbolic-list-add-and-edit-icons.patch \
>             "
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105742): https://lists.openembedded.org/g/openembedde=
d-devel/message/105742
> Mute This Topic: https://lists.openembedded.org/mt/102199171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

