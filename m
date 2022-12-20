Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BABC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:20:23 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.52767.1671549622456192150
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yv0x+KQc;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: akuster808@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id x65so5883479vkg.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzUpz07aJv1KigBEIzcgn2dN+SVPej6g50Kux8YyF24=;
        b=Yv0x+KQc3UoiW/bN9AC0Wq1OT0aqZoainSmqyjymLZJT5/83PQO4ct2OFV4s/XR1DL
         btwdNjhE4wUolU9gnMKJc2xTeSSsQ8xpd0TqMhOH1rRl2hhdNszSJvbXW3BQPKNC4BbF
         /ES6zDfB/EZachBEpuUnyiNxvufERg/ApYs2MujNzPptRSo5xwHMhNhGbu2pcUG1V9Jz
         fscMUkU0xXJv9CCvYEu/jHQ8xGx/8OKk4WAdBc8mFdQx922WQSC5aRJj2vzZYXylkmNr
         f1vM3cSJ8CGjw5ozQe3lj6ewchcXnE9QocYihT6p5Lg2G5XcNM3pETOaHzn+548n5WAs
         NZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzUpz07aJv1KigBEIzcgn2dN+SVPej6g50Kux8YyF24=;
        b=u8ipiHU39nRH/sfNa1jpOlucER54YPiGUw5GCmQe/54DXb4Vr+bTyEU2YgzTt/vera
         1bmeFR8hHCa7nErsHUVJfKV5lrBle/imbQg6IXvpB5U62I/LFF5sk3rA82tE+qkUMRIh
         P8b6d7ARcBE0knKw02CK+55QN+s//I1/IvIFvxWQkQenQCVrMCiwowxUAKyOMpjvETqR
         Gl0DgThVg9U3ioJD+jqOZa0VTDgwWLL23zUHbomnHEuBDU8GztG1ZmWs4JYoDZGCybb3
         OiQXEmQWJVW5n9FKjGMInZj5ZVbjcpN41Y55KmNlual2Ai2FYBTgY5JD1pKjtZ+N8MDT
         g+Zw==
X-Gm-Message-State: ANoB5pkQm0dqx8SbUEDfqAIeHuL+9vS2fP/BkqRMLXBVb2EqBh6tiTnC
	IU/MkBRbEmtAywQDBTPgMJo=
X-Google-Smtp-Source: AA0mqf4n+ZFjX/BQE4og2E2yRakx7hiDmQ0fbCID7UAUi8lcM5OCG6Lcqx72hSP+JWU7EcKXGXJDHw==
X-Received: by 2002:a1f:b283:0:b0:3bd:e14b:424c with SMTP id b125-20020a1fb283000000b003bde14b424cmr25029600vkf.7.1671549621433;
        Tue, 20 Dec 2022 07:20:21 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b? ([2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b])
        by smtp.gmail.com with ESMTPSA id x20-20020a05620a449400b006eef13ef4c8sm9270189qkp.94.2022.12.20.07.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:20:20 -0800 (PST)
Message-ID: <7561f784-419f-537a-3c58-c37f091780fc@gmail.com>
Date: Tue, 20 Dec 2022 10:20:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH] bubblewrap: import recipe from
 meta-security
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20221219203614.3540198-1-f_l_k@t-online.de>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221219203614.3540198-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 15:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100157



On 12/19/22 3:36 PM, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../bubblewrap/bubblewrap_0.6.2.bb            | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb

BTW, Master has a later version.

-armin
>
> diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
> new file mode 100644
> index 000000000..50f61adf8
> --- /dev/null
> +++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Unprivileged sandboxing tool"
> +HOMEPAGE = "https://github.com/containers/bubblewrap"
> +LICENSE = "LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> +
> +DEPENDS = "libcap"
> +
> +SRC_URI = "https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
> +SRC_URI[sha256sum] = "8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa547433603b8af20b"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/containers/bubblewrap/releases"
> +UPSTREAM_CHECK_REGEX = "bubblewrap-(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +inherit autotools bash-completion manpages pkgconfig
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
> +PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native docbook-xsl-stylesheets-native xmlto-native"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> +PACKAGECONFIG[setuid] = "--with-priv-mode=setuid,--with-priv-mode=none"
> +
> +PACKAGES += "${PN}-zsh-completion"
> +
> +FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100116): https://lists.openembedded.org/g/openembedded-devel/message/100116
> Mute This Topic: https://lists.openembedded.org/mt/95773343/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


