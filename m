Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8DCC47422
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.198991.1703983121989233894
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+ukoBGO;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-204df0830ccso2556500fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983121; x=1704587921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXGbZGXTV/GD+Q4tjes7PmrfBS3OBWx+i1M8ay0tycQ=;
        b=T+ukoBGOK/7FkeB7zVyboUlyC3s3s5JrGMYunmJ8bRlLSTpgIMZQlTZKu/j5kQ2nl+
         ehHLN/kVXlwLryatg8wYcO8r2IZLNgsKjpR++Homk09Dwpf6f2bZQJmwWJ46M3VtNT5C
         gm8BpYTtmIMCEOsojXKax7XmzkfPl/VwAQdyzQbublXCjH3SaLsddz65OsRzDj2eo6H0
         kK1GUbJAkNiJJ59cXk8i7EbLLfP4UPjPFsoXD1nML0KZC6a+jaf4LNgW6/LjBN5KfHq1
         xXjDyw0T5E/KKWt275uJcVwpKPSQKP/kjXanjKpd1YHVq1QKhhENzFjz5FT+qxmkTLmq
         QgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983121; x=1704587921;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXGbZGXTV/GD+Q4tjes7PmrfBS3OBWx+i1M8ay0tycQ=;
        b=myJegtglChtfOs7rzpGsdgQsr8Pis3IcaSzMzx+DlKVc22KdZuEKUeN2LXpFu+BHgO
         43eTVvaKjQZQ80jNIXKRE9mOMaB3Z+G81gsOVoyqPalzawqUCxHXtozwLVmmUeQG2a5Z
         rwUT+p2rHR/exSaKM5bPePjOQS6/wfk/6C63lYGFVFng9mQaX/2XGtXnnRdN/up6iNtm
         vnxbhJdzoGQSEckoRVTvI8C31/VxWkiQlNWpasxlOAYK1alQRKqYKu6vtUFWjjE393QD
         1pwdiuqtZEvrgolzdQ8npoI8Y6C1WG4ZJ49YxXEWfdKkEzkXJSxDFriyyzuHAMdofpXq
         qBFg==
X-Gm-Message-State: AOJu0YztTsHzf+S5koCuX3a4qqYOM9tsFg4N9NaZfcj6VNwJPF6P+Ppv
	95ALo6bh0S+sxta1KNbKJKrNlJTK9JY=
X-Google-Smtp-Source: AGHT+IFzy4g+bbKcgnU3lYV40gYkciEeokm1HvqX0rRhsb66KFkfonxaSFHx6p7uykgHGB7u+j5iTQ==
X-Received: by 2002:a05:6870:c155:b0:204:32f7:6671 with SMTP id g21-20020a056870c15500b0020432f76671mr19954864oad.52.1703983120988;
        Sat, 30 Dec 2023 16:38:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703580028-13912-1-git-send-email-wangmy@fujitsu.com>
References: <1703580028-13912-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-distro: upgrade 1.8.0 ->
 1.9.0
Message-Id: <170398312024.873206.12432431298130446599.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107937


On Tue, 26 Dec 2023 16:40:28 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Refactor distro.info() method to return an InfoDict
> -Ignore the file '/etc/board-release'
> -Ignore the file '/etc/ec2_version'
> -Run Python 3.6 on Ubuntu 20.04 for CI and bump isort
> -Test on modern versions of CPython and PyPy and macOS
> -Add support for ALT Linux Server 10.1 distribution
> -Add Debian Testing to the tests
> -Update archlinux resource for tests
> 
> [...]

Applied, thanks!

[1/1] python3-distro: upgrade 1.8.0 -> 1.9.0
      commit: 8c2c816bc45543697f25dc6386ec79989f01cc52

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


