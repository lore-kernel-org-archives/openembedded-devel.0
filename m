Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0B5D66B83
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 18:14:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21269.1765995284953148231
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 10:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1BgupXM;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so36755895e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 10:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995283; x=1766600083; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMUa/f17IT4ngTuDahxY2MRkvxT4ajsOL8oX/ZSPyQ8=;
        b=X1BgupXMWnvavqPL7ImIcdjhOvlMTXZX41siN1CYADG1Es1ilQwmUXSgPl/g57njsB
         dZEcRJ8WFzwEsF5NRPrp/2xaEsvmPCkLKijo+yV5p29RZ3Ts1W4JWnKZ8a80fcxe03cL
         Cbldt+grCPBYVpz3njjnqKp6Hi76WDZa4FU+XZVynl0y51zet9td6vsYdeXkpUzZSdRU
         Hlm62/pYXlSyFjWLT9EUcihJmDXXSQyy9ng+YHKkRyKCek68Br1cnTIU78rNE1LlXVT4
         ut5kzTQVAVRDzAvPalchXZzynW9v8fiMTxNZck17pIzb8EXhStD2PdfK2X5gh7xnN206
         d8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995283; x=1766600083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMUa/f17IT4ngTuDahxY2MRkvxT4ajsOL8oX/ZSPyQ8=;
        b=DAbCf0Vl0uzpY1XLa25NIxSszFO/TkmpIc96oEqBPNhQ9dwmaV6afMeVy6cMG0EjzK
         4S0bbPH5KtftX1hltIs8mEtc3jzP7LFo0YjsFCz3Xu9+B1N+IfOIwjcz/VUSHYYMBgSn
         QJUk//LKTbJ0i5uGrgOAjcFCYL/zsmYj9eTLHZDkRt5KK3g/z1lhT6Iv52yGSJ2J4Vsx
         dAMG+bGigOX1deDf2uah1nHY6wzQErMkMBOA/ORuhd94h/Gn4gUo1mkWA0bCKjX0Tzci
         v/1H49ixoSXfF+U+F9p47/dHqkhEz/ocUcNanrCyb5b0Jne2JlBqjLQ8Zq5DxjZ+NGWS
         A8xA==
X-Forwarded-Encrypted: i=1; AJvYcCVQmpSmhJX6utR5up5eUVG5b9vZ3JIcr7huuJMmefZCaDS3WSUr0XwDoIJF4hof6QWXF7ZyMfYGUNCRqqjqRJpC0AQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9EdzKXV3KcWrtO/VS5W7RFd43xDqfOyUV6yNPDFWUVvkn/1WW
	2oNsqo6yjbWjH/5alODBP1nfskY3NCvLyulEAp/uWniynC2RB/ul/B/psMWOMg==
X-Gm-Gg: AY/fxX5tH1F7gneLelTa2nlj2KvJwVRUE3jRQMh95W7NsNsLaU2zjzk1RGm8xC9sK6f
	nmhjECjLWjNPVx+7/d6JhzHd4cGKDJsDJcuCk67vor5KSPIzmWDqca+M4aKDIi9pNgZF16DYHq0
	Ddblb0T6UzcRLxzxckkWWyuAJeFOS3QxGqahtvMltSc299lIlV7SZTlcge8qaden/8HmSyO0WwC
	gWbEf0AYJoXwGDIzu6nWh+PODPX0+ukBPbS1ahI1Bk6v/MMMc8XDGctfTcj4WCqTykspr3qamf9
	cCNfpcQZTo56J8By/5PHaH9UuoTw7H44vc9ks+/PQ3nI7WF8eh2xMQW/KWJHSJM42c4ne4DINCS
	prVoZuHHRfMsXQYUnoTGCb9dpaLlBGND07WCy2/wxwAbHinA+9ZWY+jTMlO3GT7TO6hb8wBh3LO
	oBucU3+MnYazbbvF4VjvU=
X-Google-Smtp-Source: AGHT+IEB4BgIXqQz443zutXrygN9G6/8kXfVHzSi1bHYNGIkfmMQ1tcVxunYL0SHO7OLvA78tPwY/Q==
X-Received: by 2002:a05:600c:1c88:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47a8f917533mr211662645e9.34.1765995282963;
        Wed, 17 Dec 2025 10:14:42 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279d6d8sm4454125e9.10.2025.12.17.10.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:14:42 -0800 (PST)
Message-ID: <ac14ae52-176f-4705-8759-e68a1649d9d7@gmail.com>
Date: Wed, 17 Dec 2025 19:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] drm-lease-manager: add new recipe
To: rbarrau33@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251217161114.403899-1-renaud.barrau@madic.com>
 <20251217161114.403899-2-renaud.barrau@madic.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251217161114.403899-2-renaud.barrau@madic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122728

On 12/17/25 17:11, Renaud Barrau via lists.openembedded.org wrote:
> From: Renaud Barrau <rbarrau33@gmail.com>
>
> Create a recipe for the drm-lease-manager project  https://github.com/AGLExport/drm-lease-manager
>
> Signed-off-by: Renaud Barrau <rbarrau33@gmail.com>
> ---
>  .../drm-lease-manager_git.bb                  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
>
> diff --git a/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
> new file mode 100644
> index 0000000000..621a08f324
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Recipe for drm-lease-manager"
> +HOMEPAGE = "https://github.com/AGLExport/drm-lease-manager"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI = "git://github.com/AGLExport/drm-lease-manager;protocol=https;branch=master"

This seems to be a development fork, not the upstream repo:
https://git.automotivelinux.org/src/drm-lease-manager/ - I think this
(or a mirror of it) would be a better source.

> +
> +SRCREV = "e6c3bf4ff76ae5eeefdb149e4b4167195dfcfb61"
> +
> +S = "${WORKDIR}/git"

[Same comment about S as in the libtoml recipe]

> +
> +inherit meson pkgconfig
> +
> +DEPENDS += "libdrm pkgconfig-native libtoml"
> +
> +# Change default path /var/run/drm-lease-manager.
> +# For exemple if you wish to move the runtime dir of drm-lease-manager to /etc :
> +# EXTRA_OEMESON += "-Druntime_subdir=/etc/drm-lease-manager"
> +
> +FILES:${PN} += "${bindir}/drm-lease-manager"

Is this needed to specify? I would expect that ${PN} package grabs the
content of ${bindir} by default.

