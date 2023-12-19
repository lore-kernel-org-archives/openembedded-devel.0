Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256A5C4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6817.1702967236552475268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCqjZbQL;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d32c5ce32eso35860245ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967236; x=1703572036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoLvIiNiWeFlgktoqGPODRKoEN++f1Uik5bI6ABdJ78=;
        b=jCqjZbQLs+5LzyTCiPh713LjeA4JNv/PB8WmSrPUX087DXaqyIYyo9jwUT+xf2chJ3
         jkwhUXNpVRB+hO07uJhKo1flsmNCHlohXitRePi2cqAhDA3mG3YXIX1hPf+wblpVZGwH
         VBgPVcL6H71XHXXZZFDTOyL4+1rnPrLTj0l2wz/b8HNU62qkLScYOxa8MGb+vVyFSJMx
         UlvQAaVaNLPvctGfctDM5rjvGOrDyQt5Uk/MRyYsBfkvSP1GQG/wPDUUlvj/j8BFZa8c
         W0BA3S2Z0i+M9K3u9F/fMEGc3zkrI2BBFULpLEVVJNvKi+Z4pOnIDORXBsybYzKV4K4K
         YXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967236; x=1703572036;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoLvIiNiWeFlgktoqGPODRKoEN++f1Uik5bI6ABdJ78=;
        b=QQiPdA8KJcK+kX9Hvn2ivnusB+kavL4cQZWZxQB+ltT1u4lyfrFVyZybDv6SNRzaLS
         KCoGUC8+E3bfn9qYTFJl7PPseOFN95KcgCupCY6J05u6Ki0hux8fmggWPbvuCxSOhwJk
         DdDHi8wSoXuwa7Mf+iYTFiSvYyWoG0qu/Eeia5MxNinC8G2D8hmjZ/2EhhiHltF7mV69
         sNbRpzmCcW+eGCH9w51+ivdrNw/fnHFiGxOrIK8mnORK+O8+5m+KfjV9Lu7Nzstg0deo
         3bLiAz97hc8DiGRgtUXZN2o61enRaCIvCK+1j0ayQuwkRSOxJbAwscJdwTTBjzQwEnzU
         SaRg==
X-Gm-Message-State: AOJu0YyFxkKHqlRffPxBKN3NTTx94NTfbyPio0czRyH4AXydyLpj9F0r
	a58iUUnHYDn0KXIOvKR3bA8=
X-Google-Smtp-Source: AGHT+IECq88nEAvRDXUZ8RPAAvgA9RWVz4aaj49+zLtV/tFerumfjOj321ZShyx8aEQ6w5WwhXmGhQ==
X-Received: by 2002:a17:903:2352:b0:1d3:ac9e:3086 with SMTP id c18-20020a170903235200b001d3ac9e3086mr885316plh.28.1702967235937;
        Mon, 18 Dec 2023 22:27:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214052750.1212151-1-derek@asterius.io>
References: <20231214052750.1212151-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-prompt-toolkit: update to version
 3.0.43
Message-Id: <170296723533.1627685.14347463059081891864.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107572


On Thu, 14 Dec 2023 05:27:50 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-prompt-toolkit: update to version 3.0.43
      commit: b809d4dd2161c9bf6fe30d31722d1f2a719d30a2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


