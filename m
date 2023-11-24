Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAA0C636F2
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.120993.1700784070843791666
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aHCBBhyd;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5bd099e3d3cso857491a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784070; x=1701388870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YPTgJEz/n/VKbwVDwvi5jfR056mktKcH2dZOKwWI3E=;
        b=aHCBBhyda0tHrhVlGM/qIfMDEBrT1StqIjeNR2ULJeTVPKAP+zyoCUWljdcQ7upLeF
         Wqxp1YB7u1Uypz57zJ+9zZFnjyrNmfJIpoSZ/W8ybJgqG2XdIcRRhNXGmrV9Ar7kQqxt
         PLhE9Ul5Newt0XUvI7lB2JKKk4CWcuWDHzLVV7dQ54s5q6CVoLpiZdyQmVg9fEUNYY7X
         xWa9FTrNUnejev+yShdUZlUQvZbJsTSaZkk1djFSQJ4pFSYlMMbMgNFQIMSEQmmq+DD3
         Ybz20rxtDvisQXMCr44rVh5flzfFjulr9WH5mb1clY05jgF5AdWXwH89yzHneuVAHZzO
         r59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784070; x=1701388870;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YPTgJEz/n/VKbwVDwvi5jfR056mktKcH2dZOKwWI3E=;
        b=D/NS520rfbJ/5i+KhVZtRNd+Wn2yTsjGekpVvmDQCiQ1sxZZ3gAjT5Ah9BSVEZTXDV
         Re4xL+5w6K8xcJ+YLFY/RW3MZBat9pZLDAEfnyVrMTeU/XBBY+wHGmMDfXQbIqOOeNp4
         OUYqK+9bb2QooTDvtzA0ber+ae498lTW+BtLOQrOZc/EivdSqhlrtgsDxQdHgnIOvdkL
         E26xeOS+dCqZdCpGrjbAbu3Q2d7llsXokMSjXKXnP8e5rxjyVmF0MtPdaU5PxuZDLeqf
         7aRkUgDK2L6PDsfIWtmtubvYxeBQsaLDyHtzqNzQCoTo2BM7i1RV+IzaQuGMlG6zIvPm
         NgrA==
X-Gm-Message-State: AOJu0YzbgmNJmY3+UmFED/a54+ryRLgQxF1fLCq8I0k1fyIXGADNvrst
	0HurYbhBGbyXRYwoqa5QgvUMl4vUI3Zh5Q==
X-Google-Smtp-Source: AGHT+IGzpVqTzq1HfmYkrcOBAJWKUOssuJVmCfxX4Ae/ePWXLOTAWvUiOYVaLpDVHaHrKm3EUYjCzg==
X-Received: by 2002:a17:902:ee82:b0:1c6:2ae1:dc28 with SMTP id a2-20020a170902ee8200b001c62ae1dc28mr1241907pld.36.1700784070006;
        Thu, 23 Nov 2023 16:01:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700635105-8294-1-git-send-email-wangmy@fujitsu.com>
References: <1700635105-8294-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.6.0 ->
 13.7.0
Message-Id: <170078406921.3118595.7093522335104945551.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107040


On Wed, 22 Nov 2023 14:38:25 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Adds missing parameters to Panel.fit
> -Some text goes missing during wrapping when it contains double width characters
> -Ensure font is correctly inherited in exported HTML
> -Fixed typing for FloatPrompt.
> 
> [...]

Applied, thanks!

[1/1] python3-rich: upgrade 13.6.0 -> 13.7.0
      commit: 2aa6327a2234f0023b0c3a136f585317125dcb3d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


