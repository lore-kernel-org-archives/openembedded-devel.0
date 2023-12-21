Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F3AC3DA6E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 00:23:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.39055.1703118211582030409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 16:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNDf+WZv;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d337dc9697so2480215ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 16:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703118211; x=1703723011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT7zBQOwxP8AlOqrGZgkXs8U8pgQiwgpnyCKH6JQUOk=;
        b=JNDf+WZv1FhPbLg/xWJyaY+rmsrWPDnVkfCO4BiV3w2LzzkeOvf5TABnYmKhqMsq9v
         A1c9yVgYacBMMTKWNG8KIv/qAabtLHxGqdsMNYa5ND+i+LjaWVeB3CuNxPO+ZS1r3elN
         tPcVo8Pnj9m05+kAiMid9vfvyEp5+Juhr7ZY7aeD2QVQEnJjjaiRr58zRu0lyw6uzygY
         rzBHyJc6bWC0KnYbE4KLyaqpK3KjAs6j+/A3o9JdLGN2QRt2T1UctySYYf7fiqEFgey4
         oinXs8EA2YK2dZ0rT6YQ6CS9KSicoCMhHH9JVmUneFt74zjmvZ94Yixw6sEMXagkEuxV
         gMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118211; x=1703723011;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yT7zBQOwxP8AlOqrGZgkXs8U8pgQiwgpnyCKH6JQUOk=;
        b=RgTsQjrQbNh+r4GN91/XbdLJY8gRQlAgiBUeLe/CDKVlUSvpHVoJicXF8x6xBpDJPH
         cRo3RBHUi9tXDKQbotBSGNU1TUMUK6UIepzle2dkuyPuVHMxBrjHGCCq/lGG3SHWR7U+
         MfpGBH2enfmhW/aVv2s+iiiBha5d08wD9wD8XDO53dUs/9MX84vWiS3+qKFYvblLSsGQ
         GzC12IoY83iMK1cD+rsv3Yq4XIkytViNSVekBUDvkvWHTs5vTHV+IEHkLl/UJ1ObYXC2
         57u5+labg305sH0L+PiIyL5WxZzTTZGoohaU6BJA62CzqcbeVidWZKejmoYLTxNG+gso
         i1OA==
X-Gm-Message-State: AOJu0Yz9wlmuo2ws3WOWu/l7QHZWukHSBq82OkRmdT1uqxq4xQuipRFb
	FylU41TN2CGWHZSQ5ItsSQv0fg89Oac=
X-Google-Smtp-Source: AGHT+IF4/oylvTWU4heu4WT0K0FIgsjNeoSyLnFhMOCtLmywKPX2ADNnDLuE7BH9yGop+XFWAADBww==
X-Received: by 2002:a17:902:ab83:b0:1d0:6ffd:e2f0 with SMTP id f3-20020a170902ab8300b001d06ffde2f0mr18629538plr.138.1703118210939;
        Wed, 20 Dec 2023 16:23:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id z13-20020a170902ee0d00b001d3e51eabb3sm302948plb.225.2023.12.20.16.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 16:23:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231219134102.15916-1-alex.kiernan@gmail.com>
References: <20231219134102.15916-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH] c-ares: Upgrade 1.22.1 -> 1.24.0
Message-Id: <170311820996.3718266.3522412948433599401.b4-ty@gmail.com>
Date: Wed, 20 Dec 2023 16:23:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 00:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107695


On Tue, 19 Dec 2023 13:41:01 +0000, Alex Kiernan wrote:
> Use PACKAGE_BEFORE_PN which is designed to introduce packages before the
> final greedy ${PN}.
> 
> Changes 1.24.0:
> 
> Brad House (28):
>       Nameserver parsing: replace another hand-written parser (#643)
>       clang-format
>       SonarCloud: silence bogus reported error
>       ares_init_options() with invalid options values should unset the option
>       Enable system extensions
>       try to move AC_USE_SYSTEM_EXTENSIONS
>       ares__round_up_pow2() work around bogus warning
>       silence openwatcom warning due to qcache_max_ttl being unsigned
>       Support ipv6 link-local servers and %iface syntax (#646)
>       Windows UBSAN tests (#649)
>       increment failures on timeout (#651)
>       SonarCloud: make const
>       enhance timeout test case
>       enhance timeout test case to make sure it will re-use a previously downed server
>       Rewrite sortlist hand parser for memory safety and bugs (#653)
>       Clean up some Windows-only warnings (#654)
>       clang-format and fix one warning
>       remove redundant cast
>       use IF_NAMESIZE instead of IFNAMSIZ to avoid warning
>       Use external GoogleTest instead of bundling it (#655)
>       remove dead code: bitncmp
>       remove dead code: ares_iphlpapi.h
>       Coverity: fix allocation size as reported in new code
>       tag some functions as deprecated in docs
>       reference alternative to ares_getsock() in docs
>       1.24.0 release prep (#657)
>       rand: allow fallback from OS (#661)
>       ares_cancel() could trigger callback with wrong response code (#663)
> 
> [...]

Applied, thanks!

[1/1] c-ares: Upgrade 1.22.1 -> 1.24.0
      commit: 10f1890af03dbb804bffd4fa7eda7729e08f12cb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


