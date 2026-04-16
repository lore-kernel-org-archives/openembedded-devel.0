Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0C5F8D775
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:33:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23854.1776368030950713768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dDPC/jyt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2464914f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776368029; x=1776972829; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TVYvqP+IFEwUW80LaxzUFdyhNuvw1hbH6896DaOXIE=;
        b=dDPC/jytiWJmDdSB1gWS5QFgBf3rQmo6DDEnuOhyvRjnePfoGjf2T5ih/TmZxqiEi/
         /f3ROyfpaOtjW5psBy7/XNskbiKbpwyR42m37v+uFZfZK81hFyap+yzIwFXVBSMsf6Em
         W1cmvFLsRya1DlX0CU9jR9IA9UGZWGwNcB2tGRF7Ez0W+QMkZK3EBw3dY4rQvTjBHLYX
         bcZW1o4P4EhwxwR5XCkX/h+SyRPmcz1bAjkNq/gUQdldRH7STiYsv1HOmfVUGZNLij9t
         mYYtRIEKcW6q7JwLF2tLdHH+nUorf+lnhb7lpnZbIoZdK/xkrYp3IZhAERYhAcBRls6c
         ykgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776368029; x=1776972829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TVYvqP+IFEwUW80LaxzUFdyhNuvw1hbH6896DaOXIE=;
        b=knPxKmfidLzyxtTeDxdDse2AxxLq7It5Mgg1yLkxKYrGwBkYQv6YCH5mOV8KS9QAjQ
         sNB8dJBx/KmwX1YtaJVyjGy1yeb9Bj0Sy2aWh47eW9GXhgtTey0SUGmU8eH8W9iE2Ewa
         v9WNvvQJVfg09PVQX3ydHZy7hMwOZ+WqQl5VJQzNIP2kb2RK9WL0Ie3LPTbcLu3F6DC8
         R7TJCE+dtUKdOgfOU1uJ4ZmqbpJGda2GXL0orck6bXB04rDtnNFoGbwG8ydQsKq41442
         mwU/4rSae+Ari+eUTPbvozHm50zSbz9wtT3X1aD9NtPPuecqeo42gjJ4iv1vp5kobbrA
         TP9A==
X-Forwarded-Encrypted: i=1; AFNElJ+02wEXoAaqdsPf07UsgvSZ+TUkCRJbOBE2P9XWqDKi2eAyDjul8Fzwb5FHpt0AKCDTOBhN36NLLykENHsOcM98fH4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMUCZmnNHW8VatdSfZjJzncUgMANEvdHnS7qIbU1ISDydRMYdV
	K3QOGxmDrMRfPL5GXUcCLXkp2NpE/vbMfwF8VfmzublvZK3BfvluPk2s
X-Gm-Gg: AeBDiesWRRZzy+Y52fu4H7Ei+dksVegKuiQzTr1sRPgWsmXZVxDmSSuIrPZu4ffXneV
	IVIfMT7KBDXcsiMcdv1UxcZ+1BOSJA8KPpAxl4NKhgZL2tbNq2bjx49X2/vpqdvCWJDZXjMeIBu
	7wtrfozNAVcGkGOSux1Nxx2eMkcYayUotYy/UljgUwsStfJJqih4Pm2MgxvaNK58+CjHNe/WQw9
	ejSfjQysyzceHG0RIiR2YRlNGYIbWM+FNEJCUXma6xoRExyu/Ozx0pUbcIzWTHUwb0ekzNpFSZZ
	9Qs+sEGT1UFkoTM2YTuxoG9q1P4uTu/T5Md1+A6rjEnRsXJ+O3USPeTEqnP/myFs9wqnQ68xHnz
	aiXdBO0p0sqGkxEDQjpHjZP9owAgE6qcd2OyH+92pYqiLG9JzwCVm9XskLK7QrN2J+Tsy2uAmDM
	/0tjthCxJJKmPw4qh4ne7YyvcVDxzYnOEIiQ15rkZUlQ==
X-Received: by 2002:a5d:5f89:0:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-43fe0fa5336mr909115f8f.11.1776368029257;
        Thu, 16 Apr 2026 12:33:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e89ddsm15421220f8f.30.2026.04.16.12.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 12:33:48 -0700 (PDT)
Message-ID: <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
Date: Thu, 16 Apr 2026 21:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
To: hfranco@baylibre.com, openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260416191754.3910026-1-hfranco@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126412

On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
> SELinux layer build fails if 'meta-clang' is not present, which
> shouldn't happen, since 'meta-clang' isn't a dependency.
> 
> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> 'clang-native' even if uutils-coreutils is not being used (this is
> enough to make the recipe fails on parsing time if meta-clang is not
> present).
> 


But meta-clang doesn't provide clang-native anymore, it's a shadow of
what it used to be - clang-native comes from oe-core. Or am I
misunderstanding the problem here? I don't really get the role of
meta-clang with this recipe.



> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> warning if the user wants selinux support o uutils-coreutils but haven't
> add clang-layer.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> index 8b9b4dc199..99beb70104 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
>  PROVIDES = "coreutils"
>  RPROVIDES:${PN} = "coreutils"
>  
> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +# This is required since uutils-coreutils uses selinux features that require clang-layer
> +python __anonymous() {
> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> +            d.appendVar('PACKAGECONFIG', ' selinux')
> +        else:
> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> +                "if selinux support on uutils-coreutils is required.")
> +}
>  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
>  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126407): https://lists.openembedded.org/g/openembedded-devel/message/126407
> Mute This Topic: https://lists.openembedded.org/mt/118863961/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


