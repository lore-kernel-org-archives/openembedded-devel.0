Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.4808.1617867201168808697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 00:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TRGpK8lz;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id h20so573057plr.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J2RZeUuCxk/xptTmf08T9ogTgn/8+6948caTiOSSPi0=;
        b=TRGpK8lzlUOOJ7YEEeiHhS6odOVZj9vIVhV4z05jYvSznZb9UdEc91ECqm023wImmA
         5Q7kKewV8MqZJh4JrFI+YYjVkDsrXbjfC9pXrKZGshSM6WLJL8ysGAwIW9Q0DlYRxFA+
         2ul8Z1ND1A9nMjbyBtCzzJDBKJySRJFoNGEgydk2cLn37DN3A8sLhGQZp8ni5sOxkkXd
         eKlthlKMo103aYHxD17CiELmDV2R+KIjPsKlu4H92gAhRGtFHQjBGTbUlT85JnQp133S
         I+j3IJ0vwAxkRxNFHCYNHQ4Pm06zAc9CxDs/gPMLWyVylaVhLCE/4erC3h+slGE+/7OW
         IbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J2RZeUuCxk/xptTmf08T9ogTgn/8+6948caTiOSSPi0=;
        b=kAtH9LkU1B8b0acVciXeciIMY3pqaI+OvIeOwhkqBhbMTOsvSf46hBNbYLKmTjVYkx
         c7Z2c2XedQiDWaJpXha8Qgxjyv8u4qB6lFy97ji5Ya/XnW+wWox+4aQPRFlxXTotHGBF
         8Iu+vvkWmzm7Z0DP1csTajJOQbZLXtkGmKo5DmC8Bi7Pp79MNt+imoLBDI5vpna35WGt
         CLmQGRk2QaBhCy4OlJEZTlGRFSdc/8108C0jvs4Xx1YCxNqLueYxeo+yo8F+aEycXkQM
         BvZL7ZPO+Xj4lG+U16zLv1HbbmlWyTE6Hx7b44JTYsYq4wxBghXT1HemBy1fvX3BPjJX
         wAdQ==
X-Gm-Message-State: AOAM533VkDq/cUq9u9+F+C8DJjTckgX0QFbRL0Me3rx/SV9hTLPZkrR4
	mXXrvvJXNITCb8exPVdprdMtlsBURa0f85y54/8=
X-Google-Smtp-Source: ABdhPJwNk5bFnR/NXnUqZ4S1fpci73o7aBxi6L5PE4GB0ucky5SyA+bzanJd2jlk0Dd0z35oczZjpnHGGB91G3hpJ6U=
X-Received: by 2002:a17:90a:5217:: with SMTP id v23mr6620449pjh.161.1617867200767;
 Thu, 08 Apr 2021 00:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210407194439.3748988-1-voa.aquino@gmail.com>
In-Reply-To: <20210407194439.3748988-1-voa.aquino@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 8 Apr 2021 09:33:09 +0200
Message-ID: <CALbNGRRxF5FW5bhDYYm-OXMWDogc-CtC1gNw9gv+a6y6GobSXg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: upgrade 1.28.0 -> 1.30.2
To: =?UTF-8?Q?Vin=C3=ADcius_Ossanes_Aquino?= <voa.aquino@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 7, 2021 at 9:47 PM Vin=C3=ADcius Ossanes Aquino
<voa.aquino@gmail.com> wrote:
>
> Upgrade to release 1.30.2:
>
> - 0004-fix_reallocarray_check.patch removed because the current
>   version of nm already includes boths malloc.h and stdlib.h
> - musl/0002-Fix-build-with-musl.patch removed because the commit
>   c50da167bc of nm solves the build issue with musl
> - musl/0001-Fix-build-with-musl-systemd-specific.patch modified
>   to avoid conflicts when applied to current version of nm
> - musl/0003-Fix-build-with-musl-systemd-specific.patch renamed
>   to musl/0002-Fix-build-with-musl-systemd-specific.patch and
>   modified to avoid conflicts when applied to current version of nm
>
> Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Hi Vinicius,

1. Thanks - it was on my list
2. For unknown reasons it seems this patch was ignored by patchwork - resen=
d?

Cheers

Andreas
