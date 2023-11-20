Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E9C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.43632.1700452301810365849
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASK9iAFf;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso624161b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452301; x=1701057101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCRhxNpeTBhy4JBl5QS8VUtr9JS5jqsIbIlqWws+n84=;
        b=ASK9iAFfF3l06Y9g6my0N5bjRnVV3sudpt0YmbeMe794nzl3OsshLmBhKKltCsemIz
         XT87H4lWorUFzkF5c0IvqbO4WlYE025v99i+CYcqfS/wBYC11evTM4Avvt0Av+hbm6Zq
         tIeH7PeQWOeL6GF53MICmypowkHnWxrtujCg7Ta96ELqnDJtHueX/U9MWp3JcC9Mqa91
         qleTKVVMbu4zjC0f2DnBLhW7qtn99GGcYZ3t4dpj573xrQ6ak+1JrBmb/qBVn3bsBTak
         XP/CIllXPhWFEc+ROI74f3t8WXAaySxEdkNnSpJcgnE4Ixj7YQxpF/PaXlQL3aZ+wF69
         r3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452301; x=1701057101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCRhxNpeTBhy4JBl5QS8VUtr9JS5jqsIbIlqWws+n84=;
        b=WESDdYo1yUrE0bM+Pxxff/6r6RV1bCmnVIT7QMPiHJ4j359NGfl+W/hSMMQ6eaw6R7
         1WAP3xBi8hy5GHcXO9psBLw/IzzOOmiiN9Vgf6iNzuW8vOgjUZH4wshqGCoFfG99Ot+P
         s2JNuZHIqowD4v9HvmR0jyVhDOrHalfbvEFv0ODHPk8UTTLEPtgoZOZXyXJzxozWVJm9
         XuqPhYXRhKBbg0yMeTrvXM2XJ8qL7CweFCoLKWFfxMn/is0oqedU2AreUF1wECgqHSpe
         XlyMTBcBEE4eCEAhWORumNEFAgqY0NGGm5XxVDfagWfF0SnAcD2rhnlxHz7J5Li6L+iA
         17sw==
X-Gm-Message-State: AOJu0YzMRBe+/3rzYWIFOQQBwWNJRO/Qlmt9T9uwKXcFJNfLEcH5f2hx
	UTQ1GNdNlgMACrR4YLM3apw=
X-Google-Smtp-Source: AGHT+IGoBkJa14UP+8LqekEeLfqaN8fGxJyB9xid08pgJDnrGUzPAhGdr18VMIXLD5mMjYUwHAkgKQ==
X-Received: by 2002:a05:6a00:301c:b0:6cb:8b47:cb6c with SMTP id ay28-20020a056a00301c00b006cb8b47cb6cmr2215143pfb.6.1700452301100;
        Sun, 19 Nov 2023 19:51:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231118164420.3110-1-f_l_k@t-online.de>
References: <20231118164420.3110-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv2] flatpak: Upgrade 1.15.4 -> 1.15.6
Message-Id: <170045230025.1416826.5429154476317927060.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106956


On Sat, 18 Nov 2023 17:44:20 +0100, Markus Volk wrote:
> - add a patch to fix build for the newly added wayland_security_context feature
> - build wayland_security_context according to wayland distro_feature
> - add GIR_MESON_OPTION
> - add packageconfigs for selinux and http_backend
> 
> Dependencies:
> 
> [...]

Applied, thanks!

[1/1] flatpak: Upgrade 1.15.4 -> 1.15.6
      commit: de1d2cbbe435be8fb8da097fbd7cbc67266cd4f6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


