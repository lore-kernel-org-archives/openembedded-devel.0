Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBF0D35171
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:37:39 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10096.1775039849586027248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Meou+Nxe;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso6754503e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 03:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775039848; cv=none;
        d=google.com; s=arc-20240605;
        b=cTq9VJ7zgvg6pEPo+WVbi5kF61zUreNWxE7FMjgFXZCbxcCeIgtj9FMGXP6jQ7AvNK
         3nma9hT2pxY8DkAyA2mVwLREspW6PvRjlo4nu9SYLAuVNIw8+IsbICGGlFxDaINfjgrF
         d35B9K6MoeKtzNJznJvtNpR5Z+8mDzV0KwmOzj6RGzI6ZZkdB6amm8WsIPGtxlTpqkFl
         SfPNEod5pL9T7Qa2shXHDYP8ISXOKl/6DA/4GHCQOKc5Sk9bXl1XLTMFixrSMAeTr0Qn
         eaPTdwFqGuKCd3v7GJrsG87rM9Zlrqw9N6bWp/QGm8UZaNifMahJ6sBJQr35OoMJwCva
         KzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zS9Bt71a/KlnBhIBqwKCwO1+QNKQAXCQU9USm8/iNuU=;
        fh=u21m4wHpfaMB5h+db/Z8D5+4JEoO6P2UfUXW6WUYL60=;
        b=StmlxcZZIzDoYm68kmRhw9dpHVtmywV3eCtMVOlQjIsgestKN2bQszKa/9po3O5GTR
         IntR76qPVjv/8OAoxO8lp/6a1jwSrpeTP5KgnG0XBtyqJN0rxmG7iTudN27R7UNXtykW
         HZt4E+HB4hECwc6vd5auzHaa64RiJoIwgix00/H3KZoOgX5x8D9apyRedDYCwDvGUP33
         gEBHgPrP928N0YWkVOZ3HhOwsB2SC7+s52iEGD4VtO6/6ybB2oDRMKaJwkKuPYmCw3RY
         VDYk91I/8VRxKZ54g5VUvuxxVNhT/BnozLLbnW8HVGWo/mR7qHsFCGGrMV0Kc+QAuHWh
         +ecQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775039848; x=1775644648; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS9Bt71a/KlnBhIBqwKCwO1+QNKQAXCQU9USm8/iNuU=;
        b=Meou+Nxe12lNlyXdBPFasO8QnJKRyX2Vkq54kVcwi0OGh2q+Sjv5ayY3Y/qIMm3obx
         a5QQU/l1n+VxHO8DLxeo28+tSk5COEZgABXyt7SPmwpvis9rtbNpBfht0E7aW46K6SDf
         G/67hmZ2b2ViSWYYd69T7S5w5Sq+ZpT54jeutxwOkdjye3Uwnt0ND3V5tj0sGGpFEjRg
         LGrIwniiIiB0uojN38MAKJ9ipY222w/LvSuoeIbjR5AriG6ri/TR0kT3uqQ3AdqA6n6O
         eHsJivx/h5bcB7vJaJevdf7Ihd8BAEV4/RtQniKx2QFugHR7K1wdCrXgPVgf2S/3pJkZ
         2wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039848; x=1775644648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zS9Bt71a/KlnBhIBqwKCwO1+QNKQAXCQU9USm8/iNuU=;
        b=WgrPhM6lDDNy92Cmawq0HFIrr1LnAwzAeMplQN+INCRH+dNtyV7y3s3ZtXq/Mz70f3
         Aijo4fjD0jnyceRqeh7PHqVwXK3dtGu3XtD9cE7lIV59KZKpU0kjvpmXZz/9888UZLKS
         WRq9vaf+lFKNbAcZjEdNFDXwwgeJ+mNh/WEO9+TdwNzeQ+5F0E/70q9fISL7SjDsqlHD
         XEc2dFpSY2XOQIWAiTL59QGWBxiswIMTeh+qmrnIFSt5alSUcBamNjo2IyAz0D4hIR2x
         mBF1KTwGNP3GfRVUOPbh6muDBBPcDhx6/L3joyyT2fK/LFlJegjhL+/HQsp/M5EagRPm
         d2OQ==
X-Gm-Message-State: AOJu0YwFQHrmuy1Jz9IcIqQvxw7ccqP4wPuhcq2hu6spIKGRgo3F5oKU
	mZRoKjgRkswZrMQ+b/3bxUqZ/+SP8IcMtaV+X6BGVCsg31FTahzwaAidOF6xGOI7chocXjJ3A/A
	BFXfaL+VkFfOLtCkokxmXfidi/qprhUM=
X-Gm-Gg: ATEYQzx8WyneCMR8Jh7VhXaQWjjsE8gLLy7ahuiCH9MOxVgxwNOSVIOtNndgP958m7w
	e58NCej9TxKw7gKIDXUZqpqdkzdsn8KXOXnwFeJ/M6DnkFkw9+cEfHqky5CiZ3qy1z3alFwk+vy
	6DXy9hQwfJgZAjuS29tAylAPup1dL+CctNPWg7VZZlxODWudGfbu85UNCbKVwCbOVH5Mj/G0fjh
	toBsi82nMCqh0AorROIK0OQmAG6XakBt+XQYalB3dknlXoOwqIb+Qkl9LpoNFeM6sCaaCGdprwp
	s7X0JzUJog==
X-Received: by 2002:a05:6512:ba1:b0:5a1:44d3:7601 with SMTP id
 2adb3069b0e04-5a2c1f1a661mr1060826e87.20.1775039847404; Wed, 01 Apr 2026
 03:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260401071852.406134-1-asusmith@qti.qualcomm.com>
In-Reply-To: <20260401071852.406134-1-asusmith@qti.qualcomm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Apr 2026 12:37:13 +0200
X-Gm-Features: AQROBzBzd0vs5cEomTSN7r2xmEhQcC_mcv_NtbvhGgVTIIhFFF-L0wPx9txwJAE
Message-ID: <CA+chaQfjhHg2etYQ0NansvCh9xSPj3mB+=d3zhbh+vWNoDXrjw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: enable modemmanager
 for 'phone' devices
To: asusmith@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 10:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125907

On Wed, Apr 1, 2026 at 11:53=E2=80=AFAM Akula Susmitha via
lists.openembedded.org
<asusmith=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> Enable ModemManager in NetworkManager when the 'phone'
> MACHINE_FEATURE is enabled.
>
> Signed-off-by: Akula Susmitha <asusmith@qti.qualcomm.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.56.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.56.0.bb
> index de163fe00e..31d9f1d2b0 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.56.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.56.0.bb
> @@ -91,6 +91,7 @@ PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcl=
i \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', =
'', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES_BACKFILL_CONSIDERED', 'gobject=
-introspection-data', '', 'vala', d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'phone', ' modemmanager ', =
'', d)} \
>  "

I think it's not that simple.

What if there are 2 MACHINEs having the same TUNE_PKGARCH and only one
of them has phone in MACHINE_FEATURES? It will cause this recipe (and
everything which might (r)depend on it) effectively MACHINE_ARCH
without PACKAGE_ARCH being set like that.

I guess this would be the first case of using 'phone' as
MACHINE_FEATURES, would be nice to document it somewhere and figure
out how to support different features effectively (without making
everything MACHINE_ARCH).

Regards,

