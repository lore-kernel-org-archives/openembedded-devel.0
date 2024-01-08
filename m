Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36466C47DA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.31426.1704682010317203478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4dR7yWC;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b7fdde8b56so155603639f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682009; x=1705286809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNaTCYo6rmKSm3Zp5zoRMJQFzY7+hwsJ96O9r83gBV4=;
        b=f4dR7yWCYh8DUQ/P2dQD7t6TTd2ppnMMH4Kdk937I4y82R5CvbuelDiYJpZ8uJ+Wk3
         3wDBvzY6blvRus7ZQrzbvqx6CDm9PcRiCAhQdEuNJacx3qpkqnkWd6pjxA/dFwrd16Br
         gkjL61u3hVRGgVRpcACFnMP4qJyrKZrNiZp59bPZWFhfsZRPjchJkOGlCU16PUt4rchs
         ABXPbAFgF/ZauJ86x9fWJb97QKnx7ubvGwUk/ChM+pVSzaNDlA9Wn8NZKCP0T/+NKnMd
         bMBy5aOJP7X1/Mrrc9J9S2jCMuxVHbdFuxZyLC0EES04mzL/Bd4cNqqfHChIK8tm+zsr
         yM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682009; x=1705286809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNaTCYo6rmKSm3Zp5zoRMJQFzY7+hwsJ96O9r83gBV4=;
        b=WbF1Tg69/JJ9PYgz8Z560iFNYCBwpwwqf3j06SR3xlwGZtL6u/qDZLBKUwex3XiBMs
         MqlyOYYzZC+qTyHonRjSTe4+y8zg+f+4nGX3n3U3z8IDdWk3o8qULN34thZnoPtOQ1hN
         kYq5ogZpykwueJTlInGDbgqL4Wht2CyFuTlmgPI0H293cBBxOAVfPWiujTZPymTbXKDj
         O8vT69bRuRnwrRQ6NI+E7eaMeWaGxx3dA7hpBeSnRcSEYlEoyoju60XNpbh5ubHMbhSE
         sPRX5CA8aklBjqNKM8bbYQxe6swbb/MuVdTi2VX9LoZrgOu2lKn230/QD8sla4iWYc0U
         ysbQ==
X-Gm-Message-State: AOJu0Ywy3G/uGqUBJT30RJ4gaAqBEMJ7VDCwPVLFyG8ZGVt/OYWxeoe4
	hdJgIZ9qqZ/aTRqRlH0q+2pvyRktWyE=
X-Google-Smtp-Source: AGHT+IGWkPV9W14UvVICTMHF/ANyYYWowzY4RhK2sj+nombvu39WgNO4EFW1DVxFwfPSPjgce7aC4g==
X-Received: by 2002:a05:6e02:198e:b0:360:17a7:d882 with SMTP id g14-20020a056e02198e00b0036017a7d882mr6421003ilf.121.1704682009548;
        Sun, 07 Jan 2024 18:46:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704178911-7769-1-git-send-email-wangmy@fujitsu.com>
References: <1704178911-7769-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] feh: upgrade 3.10.1 -> 3.10.2
Message-Id: <170468200898.912276.239707709020614123.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108091


On Tue, 02 Jan 2024 15:01:51 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> * Fix crash in right-click / menu rendering code on some distributions
> 
> 

Applied, thanks!

[1/1] feh: upgrade 3.10.1 -> 3.10.2
      commit: 23c397a7f40f9db8f96e08a5ed24c903886cb322

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


