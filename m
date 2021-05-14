Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.120.1621030517207686994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 15:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q82qHbd8;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z4so316557pgb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ohOnzE8bDTTTQTLn9Nr4/iYoJM7jSW0NLFeBjCmDd+g=;
        b=Q82qHbd8Um5o9LZHAC0pdNGd5cYAzuTAcqpVkZWC2NDFcCW3CsTd14oO4g6ZApxgUk
         25cKxRxS1VygyDb8xnD2LoDWebPDB7zmjUEKv5DqEME0gwLHvyOsLyTRWZ8OTCp0F9bi
         dskRi7FJYL3/CT+YAVNbNFAAtwmtKKasLlwgvHo559YzbLtgbT5j/OmzPO0ybGaopPT9
         HvTeOOLSPHzgKIk6io8EhpBL9y//0l/0caGmWCS2OstOY+WeZxl0uTRgWj/F8VA2STHm
         EEvRl6lsSHKXcztxVzAn9A5ptEzMyThYsR8CrxGGaKFzO5ynASXvAaWoSX5zyY+gnGy5
         Xs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ohOnzE8bDTTTQTLn9Nr4/iYoJM7jSW0NLFeBjCmDd+g=;
        b=V8hi8gDDTJ8ZcfU+vtW5IKY5H1vODdqyGSlz2uTyTLZ5yDW9gLnGqbGydRzMuAbcJP
         CFGZ0m4uC1bBUA1Nq060M7BDlquwOm+JqR1gQnlK7UF53Imq78rn+ZSyHzsIvXxj7Ec0
         TUfv4/rxdd5OTP3bXSrEl5O0rmGLbSJQ8FEpMStD9UAnIJhoEqOAhkBBElR/wOnAJ1xX
         9ztD53wM5XzR5IK1McP6J/wvPRup8VA3gXSZ7ykKHQTqjmu0jCqvuVNOx7cdE9/RrqT1
         SQ2k75PwJ8B3kTgz1WYMUrq8Vd7nQXCD+zZM9hOEdB30OaaXMw8dm+C8oatjuz+H9sMw
         Cezg==
X-Gm-Message-State: AOAM531VEJnPdc3EXSMXxXJqghGqM1CKbEVCqKgUZNpFXk8Lfb84veMv
	qO0cgfRbNjmnYRPj387JZY+iNpwJowk=
X-Google-Smtp-Source: ABdhPJwHyqq4cI5A7QWDqOQzsPRKF5FhjoZsvm9unEtKL52gEOi7wpLGXgYTcBBK726zwGB0U/n3sQ==
X-Received: by 2002:a63:d312:: with SMTP id b18mr13326123pgg.89.1621030516583;
        Fri, 14 May 2021 15:15:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b? ([2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b])
        by smtp.gmail.com with ESMTPSA id z126sm4646764pfz.130.2021.05.14.15.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 15:15:16 -0700 (PDT)
Subject: Re: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: athomasset@gmail.com, openembedded-devel@lists.openembedded.org
References: <CALvjPy0by0vAvNLTzJ4WyasGHpzhw4T8SKmWj-_k7v1gRzR=jg@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <13743e57-bcc5-46fe-7ccd-9add6f2332db@gmail.com>
Date: Fri, 14 May 2021 15:15:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALvjPy0by0vAvNLTzJ4WyasGHpzhw4T8SKmWj-_k7v1gRzR=jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/14/21 8:28 AM, Adrian Thomasset wrote:
> From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 00:00:00 2001
> From: Mario Schuknecht <schuknecht@dresearch-fe.de
> <mailto:schuknecht@dresearch-fe.de>>
> Date: Thu, 15 Oct 2020 16:53:12 +0200
> Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd
>  service installation
>
> Install systemd configuration file wg-quick@.service into the proper
> folder.
> Use 'systemd_system_unitdir' instead of 'systemd_unitdir' as the
> installation
> path.

I take it this will affect Hardknott and Gatesgarth. I will wait for
Master to merge before propagating to those branches.

-armin
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de
> <mailto:mario.schuknecht@dresearch-fe.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> ---
>  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> <http://wireguard-tools_1.0.20200513.bb>  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> <http://wireguard-tools_1.0.20200513.bb>
> b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> <http://wireguard-tools_1.0.20200513.bb>
> index 31b33a045..3403fd943 100644
> ---
> a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> <http://wireguard-tools_1.0.20200513.bb>
> +++
> b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> <http://wireguard-tools_1.0.20200513.bb>
> @@ -9,7 +9,7 @@ DEPENDS += "libmnl"
>
>  do_install () {
>      oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
> SYSCONFDIR="${sysconfdir}" \
> -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
>          WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'yes', '', d)} \
>          WITH_BASHCOMPLETION=yes \
>          WITH_WGQUICK=yes \
> @@ -18,7 +18,7 @@ do_install () {
>
>  FILES_${PN} = " \
>      ${sysconfdir} \
> -    ${systemd_unitdir} \
> +    ${systemd_system_unitdir} \
>      ${bindir} \
>  "
>
> --
> 2.25.1
>  

