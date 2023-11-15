Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D8C47077
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:47 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.8068.1700032779384581555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ny09AblV;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35941ccaa85so26457125ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032778; x=1700637578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGXa0Whp9ylCUNA2v1JvWw8bX1RQupFfEQlUffT323w=;
        b=Ny09AblVSvWpWAPfYXxFc4ft/g64p+5lUpsj+vN43wAVIUhweGvukDsEClAckgWJvE
         i3uQmrV7vhmspbKCznpb+8Qs92qjYbesuy1znw1Yiim3twz6CtM4ScsPDGHrgHhbHm+n
         boPQrwCV6IayfKZwlHLmy0+jwoErkH0/mu0Gu0y+eHvx4VXErIenDtkA1idfk52JdoYl
         0V72SY+wRcS0PMDy0w/2PtUN6OWnqDmX1iHcedL8rdS2Nv7r2mtRM08ap3MpnL/Q/H9g
         qyCvSljKwVZOGTn4pBrWqMRvr6g6v5hBzm5vQOnJYx1/JXaBRRAmEVjRh2NfgpEPoKow
         jlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032778; x=1700637578;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGXa0Whp9ylCUNA2v1JvWw8bX1RQupFfEQlUffT323w=;
        b=rLr9fhi4o981TRmcwi02Qu7F2UyHTuubpWRV4S74xFCpw/vq1p7ue5l4w6rw1HsKUF
         1TvutPnibCwzZCC9csUbIQrRZHJWX5oQ71dlrGRgjgTlgw2l7tm9PZVMM/QhBByivgDt
         DKYF6ob+/RbXrpaxUY+DPaANXCPWwk4vkEiZHw3TK3i7/fMsH0MGxGmUO1sAqloJ3gTs
         MBN8YT2kbw5WuMoGVElfkNI33Z5dpXBIgCNwRoAImtrTT1pTiCw254UDoF9GlpyY82jW
         hXQjMU5+iMPuGxrl+Y7TuqPFyUN/u6xX/EiqK4gRel25+zXEsaFrHHi8nTGVBtqlwAS9
         Cr+A==
X-Gm-Message-State: AOJu0Yx8pQ7pojbe6VRyxqu5Wp8PtZwnzkxlNDaV7gkc+QYGzAzviJAV
	AmuJaG8lQkq7i6xQe+htlfzypiDG/+Yaow==
X-Google-Smtp-Source: AGHT+IHXX6xQrQTHwBIyvLR6Nmp2sGlZewxPp0U9Xfj1QlFsKiLWTVI93IXEI8vfq8NNLp6A/N8VdA==
X-Received: by 2002:a05:6e02:1aa9:b0:359:5389:c0ea with SMTP id l9-20020a056e021aa900b003595389c0eamr16649108ilv.1.1700032778083;
        Tue, 14 Nov 2023 23:19:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20231114103512.3279180-1-yoann.congal@smile.fr>
References: <20231114103512.3279180-1-yoann.congal@smile.fr>
Subject: Re: [meta-oe][PATCH] emlog: ignore CVE-2022-3968 & CVE-2023-43291
Message-Id: <170003277709.3928366.7808254748174913247.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106739


On Tue, 14 Nov 2023 11:35:12 +0100, Yoann Congal wrote:
> CVE-2022-3968 & CVE-2023-43291 apply to the other "emlog" and can be
> safely ignored.
> 
> 

Applied, thanks!

[1/1] emlog: ignore CVE-2022-3968 & CVE-2023-43291
      commit: 3bd22863ce8de903a550cfd8461a4ac1954e5fab

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


