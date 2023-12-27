Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C06C4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.98061.1703665302701143557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewivP/zl;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28bc870c540so3814619a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665302; x=1704270102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHjew0fWDPuGZ6DqcTp6V9cXAkfvLQW2Mrpeb6oYI1U=;
        b=ewivP/zlW5cY5Ymsxj5P6TExmdF+4TC6l9ChL8iVWKjIpMFHQlGxUjdyZLEUdeNY6Z
         kuPf3z9hVvE5uXHjUjcsgcoHelwJ3b5JwiVJegggYnw00L4t61WdAUQMW2ORv7t/KrR3
         oynJQ1fHN/irimL4Lml4N8K0VItS7UOLpNQ9AX1vp9OfUXrpkvis7Yymyzp+up0YnQC5
         tsiyGae5GnICrqLpOZAo+co9RNtpfjMHQ7vnvHq4AMPie5wYST8oAn31Z7OIDnfQ31IZ
         ymXLR+koUzy6MhOUYj3fwxrfFglXPZXNIaYCTtpiPE5nWxx2KWrrcHQzIOGdx9R+ExBZ
         cxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665302; x=1704270102;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHjew0fWDPuGZ6DqcTp6V9cXAkfvLQW2Mrpeb6oYI1U=;
        b=PQBjcoKmULogzzyAEXvA+DBR8eKoiLtEag8eUJmPgwIVSLPm+GlrP+6oMb/ZBcVm5S
         G4KPa32E0gdpYmpGFzugjvyso5ZWuWxOp1HZllCWlN/5oKe1da3JMH2ZaMDw5OCZQuPv
         EtwZQg4FZ3YEKxNRpmo/2/cmLJlZdUxwWdGkl+PRkAQs9GxxKj+agysk/zFUuxoNyloe
         2sf/D148GLIM8H1ttw3mm9J3Fxhk3P27i54q38ScoYXvGCh/F2rZehwqdWLHHmfIVdy7
         eUBoJwz+fnfyFGoRrs0CZ/iwNHQ3M4y1JU5adW0S2cPzOVvG5P5AxjgfI9vrBoDLwmc1
         QMow==
X-Gm-Message-State: AOJu0Yz9o0/JJ576ZDumK6gDxtCwKpD15wRA1MKZ7wL+LoYQRTkoZj2p
	JZHsC9yE2dB8Sc5YYlKWdE4zRxxAc9Q=
X-Google-Smtp-Source: AGHT+IEC0S+2K0aquPJfJ93yiTxYbAvU1fWx45vDuP2Ie3PcrpaDE+gINs+PXfQVR76u3DZcUCYnqw==
X-Received: by 2002:a17:90a:8a0b:b0:28b:b96e:77fd with SMTP id w11-20020a17090a8a0b00b0028bb96e77fdmr4115713pjn.96.1703665302186;
        Wed, 27 Dec 2023 00:21:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221174822.3900911-1-derek@asterius.io>
References: <20231221174822.3900911-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-wtforms: fix upstream uri and
 version check
Message-Id: <170366530103.1947762.17005553476882516894.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107848


On Thu, 21 Dec 2023 17:48:22 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-wtforms: fix upstream uri and version check
      commit: c600141d649c2b1099624384708a03c497ae5be1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


