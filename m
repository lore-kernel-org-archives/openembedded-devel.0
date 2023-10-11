Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E58CDB47B
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:50:33 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.24916.1697050227349977212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 11:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzafJaJD;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d865854ef96so147767276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 11:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697050226; x=1697655026; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPkFoCw/raPDuZemZ+WxTKkCJ1Seg21mk/OpoXDk0HM=;
        b=BzafJaJD0JqF0B6f/ge47E8eav/KUDuHbGXHzNpqrUeC17Ps/mcqj56fwtQhzLMGYr
         j4wSUDB5PxMa8VY+H5T2LUVZ6snKrwbCTf0Vn76qmKRTTa4+Et5kY3EGnq8QTSO8z0zO
         jE1/shDmBlHTyn4Ba/eVV9SpI0NQc7cyUP5OkelruXwlCJLHONc8NnYIsst85D3GVipt
         +NX5tD1gkRIw9fudY5oOIM+xU7YAZaVSlJLxQnlc2wbfyInJGOu2789uKhjD0023ByiU
         vmCwtRLHN59VJOrvo+jFsCNZ+B0INLgt9WqOPnlMPYNtQeAeJRKoZo9NFR1Vh7RGLhzR
         0Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050226; x=1697655026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPkFoCw/raPDuZemZ+WxTKkCJ1Seg21mk/OpoXDk0HM=;
        b=u1a0XJ+H+8xODPf53h/+EttE3xg/F6W72B23BUvjI9KEX2Wntin5/KcBGvx0yEdbqd
         JH7hmtbwWk4XyqHNC9/Gq+AN9KxNZlrEH8IiuSGjDAr7bCarP/mmq0sKnFIUl/8x9lF/
         gzHWIzFIDqwBzIQH31t/kIG64tV/3jaa9TkmBFw81XoK23mPW/siS5f6MnYqzOjkGrSZ
         RnMGhjfGqKRogGamSscm2Jq+b9WDWed9DnStbSMYfUIspQG5dAAbg0CD4FQ5xdHqY5+2
         IqZmzoYMgCQ5fp6KztaBet7vIhjCp+dhW/7/xJOkxc1sOH8RNLprkfMyK8OQp7a7MYno
         VB+g==
X-Gm-Message-State: AOJu0YzWElHxdUk6nElpVo29viYUzPeI/uosn/n+qkuhfSP0RiyHZeky
	SV0dDekAr+w5MFfX8IbpuXmeZ5SD/6Hs/Pv8LM4=
X-Google-Smtp-Source: AGHT+IE5Dhax60str1lqdLWDuuJqu+f6sZ9lhWutbOvWA5vreZX2dffieNMH4aslx8ZFrv1PTl+VhA0DFgnArLhYibk=
X-Received: by 2002:a25:d604:0:b0:d9a:5ab4:9403 with SMTP id
 n4-20020a25d604000000b00d9a5ab49403mr5857896ybg.23.1697050226493; Wed, 11 Oct
 2023 11:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231010093940.75037-1-fabien.thomas@smile.fr> <20231010093940.75037-5-fabien.thomas@smile.fr>
In-Reply-To: <20231010093940.75037-5-fabien.thomas@smile.fr>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 11 Oct 2023 12:50:15 -0600
Message-ID: <CACS+7ZTb+iUd9+6oy-KoQCr5LcFY9o1roKqDwN6s7VjCLf2ERA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/7] Add static-passwd and static-group files
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 18:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105434

On Tue, 10 Oct 2023 at 03:39, Fabien Thomas <fabien.thomas@smile.fr> wrote:
>
> In order to pass reproducible tests, recipes that use the
> useradd class must have static ids configured.
>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-oe/files/static-group-meta-oe  |  8 ++++++++
>  meta-oe/files/static-passwd-meta-oe | 11 +++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/files/static-group-meta-oe
>  create mode 100644 meta-oe/files/static-passwd-meta-oe
>
> diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
> new file mode 100644
> index 000000000..79c9bb6e1
> --- /dev/null
> +++ b/meta-oe/files/static-group-meta-oe
> @@ -0,0 +1,8 @@
> +redis:x:600:
> +xrdp:x:601:
> +sanlock:x:602:
> +mysql:x:603:
> +postgres:x:604:
> +zabbix:x:605:
> +mail:x:606:
> +nogroup:x:607:

"nogroup" is already defined by base-passwd in oe-core. Its value is
65534, so this should either match that, or be removed.

> \ No newline at end of file
> diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd-meta-oe
> new file mode 100644
> index 000000000..4c312b7b1
> --- /dev/null
> +++ b/meta-oe/files/static-passwd-meta-oe
> @@ -0,0 +1,11 @@
> +redis:x:600:600::/:/bin/nologin
> +xrdp:x:601:601::/:/bin/nologin
> +sanlock:x:602:602::/:/bin/nologin
> +mysql:x:603:603::/:/bin/nologin
> +postgres:x:604:604::/:/bin/nologin
> +zabbix:x:605:605::/:/bin/nologin
> +cyrus:x:606:nogroup::/:/bin/nologin
> +pcp:x:620:nogroup::/:/bin/nologin
> +pcpqa:x:621:nogroup::/:/bin/nologin
> +influxdb:x:622:nogroup::/:/bin/nologin
> +mongodb:x:623:nogroup::/:/bin/nologin
> \ No newline at end of file
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105401): https://lists.openembedded.org/g/openembedded-devel/message/105401
> Mute This Topic: https://lists.openembedded.org/mt/101871610/3617261
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

