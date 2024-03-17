Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B2DC54E68
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.27100.1710706708175660841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Se/weRwO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e00d1e13a2so2546575ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706707; x=1711311507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19n4FL6Aj8OJcDCffdb9REOOXVqTEQREl/d6vWFhN0o=;
        b=Se/weRwOkduWrE0lB/DVVjIjO2lQ1bwK9KIDjbiv4Mps77DK+4bxfCsfia8QvzT8wn
         npLA9pyvskW42SorMxFOIrNCEeHoJiidteIrVrugl1TJCUL2M01FFLSF3MuI56bF4nzZ
         9ChuLhUaCb63A3fiDH+duZFe5Yorj80lfCGFV7+IS/qt41gqwgit2bixoJ2nLn1zUSFd
         ZC5TogjMo7c29hhbUCErmUgnQVQPQMK2Z1xOaIlju+6hfdu3V99PPPaYO5Xk0DXHpjlb
         fm+cHG04fGUxlr9+8KNZyyrA7slERa9Dup5B+kHoJJHdhrHWYW9q9ZBlVeRP0WwEbjGo
         zRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706707; x=1711311507;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19n4FL6Aj8OJcDCffdb9REOOXVqTEQREl/d6vWFhN0o=;
        b=ZIB8MiXoJh4bwxez+KGuJRrsEHVVuQ+XT406RWi70+WPswFaMyqdHspc6M4wP2x2B4
         R/7+vVNdkTi4lmhLwEwX7qawsGGNuvvMNicKAbY3kzecmlT+bL9B1YLi1WX0W7VAQ8N7
         DByNQ3Bp+r2QLRf4sD7FDvGEJTWZUZbCMHyKnouKPU7puCfDWF3TNHYeEDsQDRTdDPVX
         eUtKh112LnKc4rx1QxXLi8QL5LEfN9wugH0IXgu1YgOBXeekUYGvVdbNtE5EH9oP7tn9
         484EdIT76OKc1k1ABsZmu8WmJQisSA7rgV53rZ72XZzDkwKpDBK0n8uLWQ2h3GAZcRtV
         puIQ==
X-Gm-Message-State: AOJu0Yx82X+swjWb+qv9CeYcWun0hqIK6FG4udfRgEzPuXppBWtK6enR
	sXLFpeC7JDCllDHENnS1geTL0m5B0GDC1PkFEFu5BGgqZg6LA3JENtdimdim
X-Google-Smtp-Source: AGHT+IExxARCoC1d7EwUHiG4KHEG9yFvu7d6jmCXH6T2qu6IaA1Q2uRZLhWG/vVwXIkUf8+Vjwu82A==
X-Received: by 2002:a17:902:f544:b0:1de:fbc3:8e4a with SMTP id h4-20020a170902f54400b001defbc38e4amr7091571plf.52.1710706707337;
        Sun, 17 Mar 2024 13:18:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
In-Reply-To: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
References: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
Subject: Re: [meta-multimedia][PATCH v2] spandsp: new telephony DSP library
Message-Id: <171070670648.939783.2740565730085400999.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109385


On Thu, 14 Mar 2024 20:43:17 +0100, joerg.sommer@navimatix.de wrote:
> 


Applied, thanks!

[1/1] spandsp: new telephony DSP library
      commit: 6a2b29e98d77de46a2885eff15bc8e4bc42e9396

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


