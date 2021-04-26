Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.465.1619395550809535934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyEqeBCu;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id n22so893169qtk.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jgb0DHA7fw0kghASlEcJp2q+3UT/wHAPxgliIPS75ic=;
        b=tyEqeBCuqFthUUFQOaKT2bGaP2hKatIod9fKScHFSWw6w3CGdIpw2agCvfFZSLrWl7
         n/F38fiX/0VnELR6yEzRV5jNaYfG1p2z4e5ikds0jdMCIIrrdfc4aSE2XHX+pVOEOuZW
         R6OhFp2fT44P0Jz4QAt0VmarqpVoXVE9eMxoP0AsfArX8C0Y6jEeedznrhHWzwkVE2yh
         rWJclHFJIBMPPChGCaYMQ1gzYa4kpRnMuUpY3aq6GawWaEyIFWzAd2jr5Yl01b0I7m4A
         nHZgpswfrJQ6opMx6khCCmwqlmgbO5FiOFQehNzsI2kvK4NqRsNVzyBXKEAbFffUH5/W
         MgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jgb0DHA7fw0kghASlEcJp2q+3UT/wHAPxgliIPS75ic=;
        b=dTyq7nVzxHKXdzy7Nc00gLuuY/ombui+J9iPkmdG9giQEo/NOhcqDbT/lsPuIsbGBy
         Fc8c2R2yRVSggnPd0HMhybTPUm6HYrr3C21Bpq28sSlQdi8Q9OfsG7ZkB4rjafr1kIDR
         THBP+WyH3DWcc5JqVCuL8Q17U9ny9JF5QHsSTwv/+xMFPDmAYasrPHSKZHTL9vNlaRQB
         xEl5H1qFqxcDIaGD5JvcKQ4BSm9JexQYTwL6tlm3QrfW5+yo3Cz3f0QQHersgC/1Z0He
         Wey/K0Kt2t8NSQ90EYRMMHhD/rTkSb/nX+IT+Qk/W5/5mtMdlC59ZOWOrCn6SgbdRGmU
         y3dA==
X-Gm-Message-State: AOAM531061LSfezejkmUG1Iz77Vk90POMdK21IKpv89ERIvRO3wRUUZo
	SlFLe4oD3J7tDnV0jUsOx0UYoN8ddrINPvde5AA=
X-Google-Smtp-Source: ABdhPJyBo1oMLITpZuDlMIE5+qAT+KSRIa2nzcZECmuszBDOYHOt1mfgUkJM9VBlstoqRY6DqXdmlzG8bMKg1ldPG6s=
X-Received: by 2002:ac8:534a:: with SMTP id d10mr13948359qto.299.1619395549875;
 Sun, 25 Apr 2021 17:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <248b148e-b0f9-b13f-3ee8-c84ce1c4155a@gmail.com>
In-Reply-To: <248b148e-b0f9-b13f-3ee8-c84ce1c4155a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 25 Apr 2021 17:05:23 -0700
Message-ID: <CAMKF1srYdnxvHAP17Q7XuKumPqOpaj0cZEN+J-e4ePsOKb6fJA@mail.gmail.com>
Subject: Re: Dunfell merge request - April 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Sun, Apr 25, 2021 at 2:29 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 430ef96fe65f62d8da995f446d5b9b093544f031:
>
>   wireguard: fix build issue with updated 5.4 kernel (2021-04-07
> 08:55:15 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to c1a50683225b0bf10f8d7a18280acefa7469ecc2:
>
>   libupnp: Fix CVE-2020-13848 (2021-04-23 19:13:09 -0700)
>
> ----------------------------------------------------------------
> Andrej Kozemcak (1):
>       libupnp: Fix CVE-2020-13848
>
> Martin Jansa (3):
>       uml-utilities: fix installed-vs-shipped with usrmerge
>       telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
>       libyui: switch to libyui-old repo which still has this SRCREV
>
> Mingli Yu (2):
>       hostapd: fix CVE-2019-5061
>       hostapd: fix CVE-2021-0326 and CVE-2021-27803
>
> Stefan Ghinea (1):
>       hostapd: fix CVE-2021-30004
>
>  .../libupnp/files/CVE-2020-13848.patch             |  75 ++
>  .../recipes-connectivity/libupnp/libupnp_git.bb    |   3 +-
>  .../hostapd/hostapd/CVE-2019-5061.patch            | 854
> +++++++++++++++++++++
>  .../hostapd/hostapd/CVE-2021-0326.patch            |  43 ++
>  .../hostapd/hostapd/CVE-2021-27803.patch           |  54 ++
>  .../hostapd/hostapd/CVE-2021-30004.patch           | 123 +++
>  .../recipes-connectivity/hostapd/hostapd_2.9.bb    |   4 +
>  .../telepathy/telepathy-glib_0.24.1.bb             |   4 +-
>  .../uml-utilities/uml-utilities_20040406.bb        |   5 +-
>  meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb    |   2 +-
>  10 files changed, 1161 insertions(+), 6 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
>
