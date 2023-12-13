Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED20C46CC6
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.31074.1702451257346699030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byUKYb5/;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b9d2b8c3c6so4982117b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451256; x=1703056056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFUuF1dRmNcODqi2r6o2jRrDbPbEbdMya6MjlNCPDzg=;
        b=byUKYb5/g2muK3zc+EJ8lNCzMPW81pe9THRs6gwOmHNXBpdHNKKla0tRNTEjlcjtuz
         Q2OH/rXXuv9SLSmesvD8iqaGD2G5DgHRpwhET59atTpOUjZAXL/FwQb66Cf1xYmD8SIe
         z0X9ig5Ofpg1eOOGlCfnIoFDQbSTu0auIR7+sJopYc2XYMOyfwBezWp0bi7QTTuxGPBb
         XHG1RKKCNck1UGwcc4TrZWWuXNJQM47QDWKCXcgoqEZFq0yjofOBSXomQ+RxDlvAY3ZI
         HkJnLChn7IxMFioBiVrkRFJ3eLqEbER4vNyFGq8GVAONIeICQ7ycQY/Z8Pr+SFUpU10l
         pWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451256; x=1703056056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFUuF1dRmNcODqi2r6o2jRrDbPbEbdMya6MjlNCPDzg=;
        b=HOkuZMM44xh+Vx4Q3yIUtMrqSP6IEqaLisxZgG8SVfSM4ofMPjFS0mIyB/cT8KQv3Y
         dbs5K/w9xPmC8wlPvSU6O9R5w45OPZWtOs49cRnfE5nACIhq7nBmxrNq3GVRo944eBAQ
         KHdw1/w/A8LCpCRcEDzGkBVdmG5rghSPqF0mcDHozKr0513j6zIXVy8mC8thWqtzmpGZ
         1kwnQwiIn68iD43GlH9BX4f6sr4Zu9stnurWqsqRQOCXUMOfO9bS75uXMX/sfb4Lqyz8
         2mDQTYCRf9EFXkomddzDHz03SFc9fNLrN+BxjevxKfVkvlwYTbOD9T+P7JsRXhW3cRXy
         1WsQ==
X-Gm-Message-State: AOJu0YytC+plmlGTsfoJcpJSjc5wxiOIjVatHiQcb/xIULV254Uzl5X4
	5Ks20+X1ewxGhOe/KYsaO8MvZMEcCRM=
X-Google-Smtp-Source: AGHT+IFvApzrvJvS+5u+AsILfTCHYattiQIbFV46GqysXSibnm68Ndl+x6hZOozqXHG0iCNnUZv5PA==
X-Received: by 2002:a05:6808:1928:b0:3b8:b063:8247 with SMTP id bf40-20020a056808192800b003b8b0638247mr8996430oib.73.1702451256525;
        Tue, 12 Dec 2023 23:07:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207183254.1753575-1-alperyasinak1@gmail.com>
References: <20231207183254.1753575-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
Message-Id: <170245125572.133993.9257570349207544957.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107375


On Thu, 07 Dec 2023 21:32:54 +0300, alperak wrote:
> * checkfile.patch removed because fixed in the new version -> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971
> * License-Update: Fixed the typo in a word. "MERCHANTIBILITY" -> "MERCHANTABILITY"
> 
> Changelog:
> 
> * Fix uninitialized read in MGAEnableSecondOutPut
> * gitlab CI: add a basic build test
> * Fix spelling/wording issues
> * Build xz tarballs instead of bzip2
> * configure.ac: fix cross-compilation
> 
> [...]

Applied, thanks!

[1/1] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
      commit: f3c7c83bf40cd59ba9ba954ebceaaa68dd7f7bd7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


