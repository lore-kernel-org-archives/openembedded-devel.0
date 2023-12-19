Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DFAC46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6762.1702967249021135114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTVnQsIp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3aa0321b5so19909395ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967248; x=1703572048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOrNj04lLpukg6nJiRpxG0COI5DW2oVUbe0OznWlvXg=;
        b=lTVnQsIpZQamCENaBErOtPcoLxkShXm3OEZ7GnS/MmeM8FcllnrmJKn73JKhg/4FF9
         2SoivOsKA+FTlvU5vGBSD0rbrJRVGrc4YscOz6npaeE9RTaKmOlvFSUa38ItaJThV7NX
         gPm8/vAXe1+heueC9RZ+BKHDtFZlHm/4x9XVUcUPy+uJuCgE59DbzWzTm0jAvSAsyuv8
         NyTIitLlflw3TkXO/2I/dsfc40m6MWsA2KrzbtI/KxmkBzD83Zsn5wNrWuSWj9FrnCK+
         SBOzcMcHE7a7G+KrJHa98NBsps7o4PKO8NufTD92mStTPqPueRzTmvelpfpYV3WRXN8G
         pU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967248; x=1703572048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOrNj04lLpukg6nJiRpxG0COI5DW2oVUbe0OznWlvXg=;
        b=db3Sz9I1tkmPOA4yZMoIjYtlFEIBA2oK0UvFfQKFwGgFYmGiAlL6L+aKPXAt9igJxC
         w6iYOj7n2BL3dUtqyKoiIN+1Wte9Q55W676p9f6IpZr3aD3D/z1xhC0NM7FFUFeWB5+n
         s0uo1NICsNu9dUy6bD9Hz2PmsBtnCWYyRsTLb+ryaIOX7DDwtD+q/oMQLTxqLXNM7gdG
         q2ZITvI7CywfbCuf7CZmELPGNU6kJjHQt+WZ+117wDyZ5rGTGLdk5Bzu/eLFswHGWLe/
         LiaBPag+boPR5JTBjyCkEsKzI61BVjLSLfFLmEhUkDfiC/0U4CdUtIW8aFY4j1Hm6Zoe
         jIhA==
X-Gm-Message-State: AOJu0YxJGGggbpRPWApxciHVmH4ev4RX80TltTkvDMxfQ71zbkYeZ26y
	7BkDkvRohGW/ZAYN7VC7h5Y=
X-Google-Smtp-Source: AGHT+IHC0tMrxyV5vixFtdPTBjghbEFLZbDA+CvkL+3nHry51wPX0GUvC9mOJlWNFztYaeCkHGnldQ==
X-Received: by 2002:a17:902:bd88:b0:1d0:4706:60fc with SMTP id q8-20020a170902bd8800b001d0470660fcmr17116519pls.17.1702967248379;
        Mon, 18 Dec 2023 22:27:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544301-28120-1-git-send-email-wangmy@fujitsu.com>
References: <1702544301-28120-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.12.0 ->
 5.13.1
Message-Id: <170296724771.1627685.11712163554955525789.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107587


On Thu, 14 Dec 2023 16:58:21 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Fixed integration tests
> -Fixed normalizing imports from more than one level of parent modules
> -Remove optional dependencies without extras
> -Cleanup deprecated extras
> -Fixed #1989: settings lookup when working in stream based mode
> -Fixed 80 line length for wemake linter
> -Add support for Python 3.12 75
> -Fixed: add newest version to pre-commit docs
> -Fixed assertions in test_git_hook
> -Removed check for include_trailing_comma for the Hanging Indent wrap mode
> -Use the standard library tomllib on sufficiently new python
> -Update pre-commit.md version number
> -doc: Update black_compatibility.md
> -Fixed safety sept 2023
> -docs: fix black profile documentation
> -Fixed typo: indended -> indented
> -Docs(configuration/options.md): fix missing trailing spaces for hard linebreak
> -Update pre-commit.md
> -chore: move configurations to pyproject.toml
> -Fixed typo in README
> -Update version in pre-commit setup to avoid installation issue with poetry
> -Skip .pytype directory by default.
> -Fixed a tip block styling in the Config Files section
> -Do not cache configuration files
> -Derive settings_path from --filename
> -Fixed year of version 5.12.0 in CHANGELOG.md
> 
> [...]

Applied, thanks!

[1/1] python3-isort: upgrade 5.12.0 -> 5.13.1
      commit: 36df077879a3116ca1fbf9a16fab2b0b4f2c5346

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


