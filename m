Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DCBC46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.14521.1701215730431161162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuGnpUuC;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cfc2d03b3aso23905235ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215730; x=1701820530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbCgB01ZM8HCTbiIlCo8Vso7ldQVcJMk+HB7NHaMCAM=;
        b=LuGnpUuCjeLKssAtaPiPHxF6dYHfGEL7pbYzZwOomzehD2HicYzjNPa6FM8d+dgcgu
         khBPd68NrS5L1MJySxnRAxyp+x0DUhZYRiZju0TDffBjO2oiaS4tqFuo+oDS7Fr5Dd/a
         GEE63w5sHddel8hs9f9bM1L66DR1IzlZ6aDzIgP8Z8TZUck67w80jl8/QjEfdOIJUUii
         MIuKF9EqP8dyFEAg8x8KUiGUPAhJzSfqb0/Eld71hQgPFZfox0nf5W22M/4kwU65p6gk
         F7UKgJMIqdaup/NWTFGh1QfrkEX4w2iFF9omME/ZGH1VJyyH/WleTortf+BJF+y7K4wD
         ewhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215730; x=1701820530;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbCgB01ZM8HCTbiIlCo8Vso7ldQVcJMk+HB7NHaMCAM=;
        b=Th09Fxl7Z7RPznQh/B8XaBTO2+DBA22SU8jiMOh80i/i7JdQBilsXSidf0pWK+2YEY
         f9iTPhqUfIHTktgiBtaNfR0W48yqe+9XgrEK8DiPenjBySVSBuJluz9vEublQFUZVlmO
         Eon09QGy9QD6KWeMqzj1wwfmGiJZGwfqeHBGzrvazjNOikkvI1u+mthv+AYiKhrOJaNX
         f4vko7SI+z+b69nsc3pyiKRpMglt/mpe2IGGK78bExlCkf4/n4pRcJ+X76dMzLkGdKgb
         Q5q1G85gLEcoSB6I/96T9BAxHlsFnrLifRYkZhpEQeMLQgxMZ7yzQF5hZMBeOOVOl7YP
         8J2w==
X-Gm-Message-State: AOJu0Yy8W8t/Tes5GwikkTTSxI6y4M4wKm/UrbMd1HQ600oV+3aaXAWm
	ukKvi0/ciZe7EqiE5b+E6iy8XVXzkE6e7w==
X-Google-Smtp-Source: AGHT+IFD++HJxX2H/5gFu6FkBNfwTq78lZ1D15/PzpvC4zRTZoEepvXDv3l5VtXsPqpzZSUaG5A3/w==
X-Received: by 2002:a17:903:234a:b0:1cf:fc5c:75c9 with SMTP id c10-20020a170903234a00b001cffc5c75c9mr3145095plh.3.1701215729661;
        Tue, 28 Nov 2023 15:55:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160603-28318-1-git-send-email-wangmy@fujitsu.com>
References: <1701160603-28318-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pexpect: upgrade 4.8.0 ->
 4.9.0
Message-Id: <170121572881.1187527.7570794927242106696.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107115


On Tue, 28 Nov 2023 16:36:43 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Add support for Python 3.12
> -Clean up temporary files after UnicodeTests
> -Add Python 3.5, 3.6 and 3.12.0-rc.1 to test matrix
> -Set prompt correctly for zsh
> -Add zsh convenience function to replwrap module
> -Rework async unittests to rely on unittest.IsolatedAsyncioTestCase
> -Make test_expect.py work on POSIX systems that are not Linux based
> -Add support for socket, which allows sockets to be used crossplatform
> -Update async to work on newer versions of python
> -Remove deprecated RSAAuthentication option (SSHv1)
> -Multiple CI fixes
> -Use Github Actions for CI
> -Remove pytest-capturelog from testing requirements
> -Fix usage for Solaris
> -Fix threading for new versions of python
> -Fix documentation builds for use with Sphinx 3
> -Use sys.executable for tests and wrapper, allowing the calling python executable to be used instead
> -Update documentation about Wexpect
> -Added project urls to setup.py
> -Provide examples for how to use Pexpect and Pyte
> -Coerce compiled regex patterns type according to spawn encoding
> -Several doc updates
> 
> [...]

Applied, thanks!

[1/1] python3-pexpect: upgrade 4.8.0 -> 4.9.0
      commit: 42907a1786ed53e96c0fcc50ffc69253f51e5c94

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


