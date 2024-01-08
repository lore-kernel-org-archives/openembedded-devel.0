Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE0C4725D
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.31432.1704682017321354178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2axt6+r;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3aa0321b5so12357835ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682017; x=1705286817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiTSsekBxVpaIjfw6e37X+9NAPcrB10koOe2+QlQFC8=;
        b=D2axt6+rKk2K4MAM1FdYY0xf7R7a8se5KJwreTaxe6B5jh7F63hBgru8TqdGfhr20O
         MfGfzA1M/DriY7hASyap7vqxHjM+hrVk9WsoSgxTTCCMeNpao4bIU9b+p8Qai0Y/Rktz
         VK3mI66hwT3FWgPMA2qoKUqYaibksCGOxR5t1+H5dMN8Pxs6qlvAhkGRreuBHVdS31S+
         OG23JG1mV6gl0J8T/pXH3JTvIkHUoBlSdN5CgmJ4sAKzP4NXx1GSLx7UVVKgEahzqugH
         BmJWcfZrXzkblOaCPESjiM4nv6C/uCWm05j8tqqmtLkXiHaatHe7p3p41VHzIXRf79Qm
         8jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682017; x=1705286817;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiTSsekBxVpaIjfw6e37X+9NAPcrB10koOe2+QlQFC8=;
        b=rOQSMYjjaYVL358Z4RVD+W0Bccj6DtN3xDni3jibKnAhmWykhIvEW6iltSnYLI3rEr
         HG0z+VqCUynRjaXU/abIDrYTZhyMe0HJ+EuIN9Vo8bUkuqS8IUiX5lTLSo27K2mOG2Me
         gskrMIFKTEpi3A/Jk7XoB69HuKqZrdFwXlG592bQ47g+lfJxZx1nrsT13A8vnP0gk8u+
         IiSfAmYSKxS2uEaSMdHsNfJdn7YoSKQq+K6FIDPua06Z/UPLUsyQhvTdkXqkOWGMQTO6
         6Dbk6iQ3/1/mjCzCLYJuO4JVes+fllxPz6+aQdWaWcPCtU7Z6UI8Ph35OmBk/fw7/eZs
         KDCQ==
X-Gm-Message-State: AOJu0Yy2cB2AcpgPRtFH9KBJ9W4DAJX5p6S6riPR6ka2/KXZ3XcMB+gd
	DEL7/V0NZnSl+5olEYBaCo4=
X-Google-Smtp-Source: AGHT+IHjlJC69dIdD3V0OA5ZnBlO+Z4/+N+EL21HGhCRt9i9SOzHPobGUMr42gf7D1ZARtf2j/yNqQ==
X-Received: by 2002:a17:902:740b:b0:1d4:cd41:e44b with SMTP id g11-20020a170902740b00b001d4cd41e44bmr3205943pll.124.1704682016724;
        Sun, 07 Jan 2024 18:46:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179295-8140-1-git-send-email-wangmy@fujitsu.com>
References: <1704179295-8140-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flask: upgrade 2.3.3 ->
 3.0.0
Message-Id: <170468201599.912276.6161068126023577776.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108100


On Tue, 02 Jan 2024 15:08:15 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Remove previously deprecated code.
> -Deprecate the __version__ attribute. Use feature detection,
>  or importlib.metadata.version("flask"), instead.
> -Restructure the code such that the Flask (app) and Blueprint classes have
>  Sans-IO bases.
> -Allow self as an argument to url_for.
> -Require Werkzeug >= 3.0.0.
> 
> [...]

Applied, thanks!

[1/1] python3-flask: upgrade 2.3.3 -> 3.0.0
      commit: a50b58f6268dc20cccf78f2586dccbb11f907ce7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


