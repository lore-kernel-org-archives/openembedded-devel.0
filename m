Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982ACC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 22:25:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.3496.1648765502422290165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 15:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=in+F7r50;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id p25so722512qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YsiQevVg6t2xlrcRT7kQ+6lxTl70Ld/pUXBkKJuootY=;
        b=in+F7r50pM/4PCRBrJmJpa6Y3db0wJLeFBE3McGbAGyJ9CVygzzlqNfKFLpAQD4Lbc
         U6g1qlCE5Kxk07sfhmrttj/zFsuGDCDkJwhk+SnCMMB3k9gNZSh0zHUAv8LeF4tF0US+
         znVGNev7Fhx8oFWyS5u2oVuYCEb9aQzJmnlhHHNapNuMXrqN9Ia+Ry/Pv5Nezkc89tT9
         fuq2fKgxju0TQHruDWwPvQTjKO+fyrI75AM8EBOTlcVqXH8irAL9Uu0BESCziIskI5WS
         CXcat05YzsqW5U5sWSweGXICjhdHjWDODcUOAUmyOgcIt7TlyBGXBc7QE/w4zi/HMlr6
         o4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YsiQevVg6t2xlrcRT7kQ+6lxTl70Ld/pUXBkKJuootY=;
        b=uFPwcDNWpRvtbTb2+zk7yVfgffLroIzg0DjIq4+gMqjx/zEg5/5ij7X1Kc3C42NjRa
         /IqttnFfl+x6ztZk80Fjx0ykz9hHchmWXxJBAgfkezDJ7F3gm8uda+LhIMDecSm41LQ0
         t0E9eO5yk7MNzft+aSLJYe4duCpHSg0nMXEYrttDWq48M46YghOeRacLKU0VSoncQDJ0
         JCDNZdd0VTXWQ+iADAiijP3lNSodxxVtRuPEmc0PLbRbkwuVP3u9Axy6j8rFdI/5U8xM
         hRQ8RcUoOLEpmZU6KaVWvMfzFFJBeZ7rOMO+OC8ZvRM+0sCD3+6kuiMtTT4Drq7i8DSX
         gxbg==
X-Gm-Message-State: AOAM5338+CE4C5G3pjfrQTDSAHI3qazE4gRjmqgPc72nRVwMQ7NDOiBk
	vvfwsqNDR0TAmEg/ZlyqmvBpNvZCFCkhwkO+fhE=
X-Google-Smtp-Source: 
 ABdhPJzSyMz0c7DOuPWRbW2wg7g5GONNbjfgdhXo/ZC3N9co2/jtRL/3x0/JI6GkedXu4MrfLJCZCcyrRl4/mF9H/BU=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr5075227qko.72.1648765501426; Thu, 31 Mar
 2022 15:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220331195826.2578886-1-schnitzeltony@gmail.com>
In-Reply-To: <20220331195826.2578886-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 15:24:35 -0700
Message-ID: 
 <CAMKF1spiTVR=EV9QoR5rRMJ350crRgi-LcY=PBbvQdT1aV+9=A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] gnome-text-editor: Fix build on clang
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 22:25:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96308

On Thu, Mar 31, 2022 at 12:58 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...ot-set-c_std-gnu17-as-default-it-bre.patch | 35 +++++++++++++++++++
>  .../gnome-text-editor_42.0.bb                 |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-text-editor/gnome-text=
-editor/0001-meson.build-Do-not-set-c_std-gnu17-as-default-it-bre.patch
>
> diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
/0001-meson.build-Do-not-set-c_std-gnu17-as-default-it-bre.patch b/meta-gno=
me/recipes-gnome/gnome-text-editor/gnome-text-editor/0001-meson.build-Do-no=
t-set-c_std-gnu17-as-default-it-bre.patch
> new file mode 100644
> index 000000000..c81b96bbd
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor/0001-m=
eson.build-Do-not-set-c_std-gnu17-as-default-it-bre.patch
> @@ -0,0 +1,35 @@
> +From f5ee0f9024e1dc8293f17864e1c774c286a3ecfa Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 31 Mar 2022 21:10:00 +0200
> +Subject: [PATCH] meson.build: Do not set c_std=3Dgnu17 as default - it b=
reaks
> + clang builds
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Clang does not seem to support gnu17:
> +| ERROR: Value "gnu17" (of type "string") for combo option "C language s=
tandard to use" is not one of the choices. Possible choices are (as string)=
: "none", "c89", "c99", "c11", "gnu89", "gnu99", "gnu11"
> +

This is not an issue in clang it supports gnu17 for -std and its also
not an issue with gnome-text-editor itself. The problem is in meson,
which I have
proposed a fix for upstream [1], I will also submit a patch to oe-core
to patch our meson recipe and then this patch won't be needed.

[1] https://github.com/mesonbuild/meson/pull/10218

