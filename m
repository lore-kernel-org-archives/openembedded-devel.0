Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EBFC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 00:23:35 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.38639.1703118209467998601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 16:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKXvvV1O;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3e2972f65so1395815ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 16:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703118209; x=1703723009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeZ5rgOsk6LSIRKVW6u7WwQNHcsL6RbcA/4PBGwI0/c=;
        b=EKXvvV1O3zP0kvgOOlYaRDrhGcuN0rBGXc9+nYjIf3g69/d4nFJKk/eBHpe8Q4TuCM
         M4ZsBU/Jl9fKj24RmudAzCEY0a375/0SrGus2nT1c93A73L0zreaiWLk2MTKdenokxY8
         u7bvHQ87CDJaVZP5cBJXHcDeco/L7QUx6Kkm3ClWWmnyyzA0bmckO5YHpi2TqKm9gqWg
         DHssPiiYHh7bU+1k5mAoA/UrrN7MyGOKQMSit57fKXZ/lr0Hb9+FRxGntbjEQN+ZXb4j
         VKJO3UNMWjaswJngaAHGbPdXeBJgz7Kg05QkqGmnH34NM7mAavNDcXMsk5jI0lSsy0ah
         J5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118209; x=1703723009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeZ5rgOsk6LSIRKVW6u7WwQNHcsL6RbcA/4PBGwI0/c=;
        b=ie28fMsd/DjkV6pF7/tfHZvvSvRn+qbttZMAKPY9vx3VagFueDj2flbdNAUI/ivvw2
         lp4TlIkAou1ZPpXL1RLTXLcFQLZ+49UzyOPMc8Ib30Lphbg9ukPWk2ePgxN4fT8ePIDU
         lMXwjORQVfVy+OEssWntn9J3BYzKmXp5LVTdov7nABVe+Avfc/kEp3AjY8kTGBF524Dz
         2JfSg1SPcJZvA/XWpwEcQw9GOKn4R3IpBNn80m2up1vebUdX/CfGy6BMLnIy1t7tdY/r
         ItS8gd8h8wxif6rWGouSpxIeQSzM+ludQZC2OKz6zGzO1Bn6pmaua8CqqIjEFtMZ/KbP
         4EJg==
X-Gm-Message-State: AOJu0Yw4j//ktYCbywPYxa+gk99sny2aV9gENTuTT7FEkHmoO076NtDv
	bsrBd2VRPcuo1J4nR9MCKPw=
X-Google-Smtp-Source: AGHT+IFMcztV1LsqM0P5ZWadTY0FFoyVeD7wCuOGP43EDJ4Q5XHFQ+Qa2l4/eTEGWMGMQq0/RUGA6Q==
X-Received: by 2002:a17:902:d512:b0:1d0:b6ca:e485 with SMTP id b18-20020a170902d51200b001d0b6cae485mr12932479plg.128.1703118208764;
        Wed, 20 Dec 2023 16:23:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id z13-20020a170902ee0d00b001d3e51eabb3sm302948plb.225.2023.12.20.16.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 16:23:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>
Cc: Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231218231939.124196-1-marex@denx.de>
References: <20231218231939.124196-1-marex@denx.de>
Subject: Re: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.11.1
Message-Id: <170311820804.3718266.7902127318983599148.b4-ty@gmail.com>
Date: Wed, 20 Dec 2023 16:23:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 00:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107693


On Tue, 19 Dec 2023 00:19:01 +0100, Marek Vasut wrote:
> Update faad2 to latest 2.11.1 release. Use SRCREV matching tag 2.11.1 .
> 
> Switch to cmake .
> 
> 

Applied, thanks!

[1/1] faad2: Upgrade 2.10.0 -> 2.11.1
      commit: 1867ce60e2e8823ea9d4d20723b3fac6b8ae2c89

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


