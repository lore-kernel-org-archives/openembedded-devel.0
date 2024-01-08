Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4C0C47422
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.31427.1704682011042181137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwKeSn35;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso138967039f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682010; x=1705286810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxQefGeQ8cRU12jfYwHgH7jJFmnPJzvB2hqlGCv4V38=;
        b=IwKeSn35/edbofkIaZEdu5qvN/Es9OrE2vt02E526YsLyS5n1OXX1quHOIXhqJ/hwz
         SOB9aSEWoDl5rFikDAOD5Vo0k9byMcd7NbV7LIkadmogmnk4XshZuxvoXMenEDZ17Szi
         2yj/qVgHniwiRnUHISqOeUlPYwQAr98VmYd+8MOsoVFSXo8sA5G7SKn2cTpL1U/DtGNr
         CyNPVSm/QHDBmHlIjV5HCsDa2BSiwjCwaLV3kF+dXrXIdBpL4IWHoBChKuR4L3dpA11q
         byxqaBkomlQiS8Fx33wraCY9C8KRJxTn5QIgQ4UIB9CF8ml7/NCXZ0UFo4ODfnVgWoIV
         yV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682010; x=1705286810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxQefGeQ8cRU12jfYwHgH7jJFmnPJzvB2hqlGCv4V38=;
        b=m3EPjKq8EturxDC4ux84s8HYV/iTL9YdjnwQEsHwolVdZZcfqRKbv6n4nsfdbNH6yC
         cO/fdYhVjP8Ci2yej2ng8x3h4fPzqR2B3/D86gSy489etzTFHBiWUsRV2UxUpKQwJuti
         usgB2+0+kKlDZs4YYQkwfB0TVawuwdZdXcCdgNwuMYVPfQ3NRCYmTvPhnGAhGzR6I/V4
         0jkeWqPAArPt2lFu4o1tqpKNAaQxLbhwEsUfB3R46XcDTjnKmVVPgQdjxlL+VKjVeZ+t
         4txCF5jF9J1oEC9PWXNzfKJAG0PHn6fgh35stHt4ZOcFiHI3HsvACyQDGnUWdq9DvOOP
         QPzA==
X-Gm-Message-State: AOJu0Yyj/rr1rUtiU55sHEdXboG9t4pwyayE3+3iO33E7/psFLnijD1j
	eDVsd/3IoqfGRGkWIHjJdrY=
X-Google-Smtp-Source: AGHT+IHzoCes/BoyBZyRRGDuhgWhCbHYunjxl9D/WbF78LPZsMdWqr5kTSbofnlWU+FkoN5KArhI4w==
X-Received: by 2002:a05:6e02:1989:b0:360:637:f64d with SMTP id g9-20020a056e02198900b003600637f64dmr6064249ilf.6.1704682010284;
        Sun, 07 Jan 2024 18:46:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704178953-7826-1-git-send-email-wangmy@fujitsu.com>
References: <1704178953-7826-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libssh: upgrade 0.10.5 -> 0.10.6
Message-Id: <170468200964.912276.15898242906279694310.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108092


On Tue, 02 Jan 2024 15:02:33 +0800, wangmy@fujitsu.com wrote:
> 0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
> 0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
> refreshed for 0.10.6
> 
> Changelog:
> ==========
> * Fix CVE-2023-6004: Command injection using proxycommand
> * Fix CVE-2023-48795: Potential downgrade attack using strict kex
> * Fix CVE-2023-6918: Missing checks for return values of MD functions
> * Fix ssh_send_issue_banner() for CMD(PowerShell)
> * Avoid passing other events to callbacks when poll is called recursively (#202)
> * Allow @ in usernames when parsing from URI composes
> 
> [...]

Applied, thanks!

[1/1] libssh: upgrade 0.10.5 -> 0.10.6
      commit: 1bea2e8c3053e7ecffb04adaaded54555f2afa0b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


