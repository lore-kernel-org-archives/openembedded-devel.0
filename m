Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F50C47073
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.98050.1703665289622331695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clr3ZA7C;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28c0d8dd88bso1493331a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665289; x=1704270089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4ZDY1V3sw2+VgKtF0/QO2rgJrxAY9yb9trBO13wSZ4=;
        b=clr3ZA7CNZ1A1/ljGoCgMvnOtcGPhfJZ8jtxmxc5idFUZxym9Vspr206IdHFIqFtUU
         mlQHH0P+N/eicdF1qMKKvkDOzGljFG8rzYEE2xzGvegJUzvJ/BRu3hajZia2na78zl/F
         cooOsmwBoaHehcOcYhs3AWL+HFNHgmeMOo77gSfsrqehviuGz0P4m4fPr4YdOA1k0ewS
         aMtVRtf6uX6S5KpcnscHghTc21D1TN4+IMM4yvp0DXfFmIQsE+HQDhxuZY8K59Iy5Ztr
         /IiQSffE9fSapTXz94KVDtfMn9lQwaEhKA64tYXce9EZaEox9bLIES/Vo7m1NUeejRRy
         ZqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665289; x=1704270089;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4ZDY1V3sw2+VgKtF0/QO2rgJrxAY9yb9trBO13wSZ4=;
        b=JPh3JiqCRwxeHHug5K9DDcGNgJ8LVNX6O77AMM3ETfsIN9aYLxmc7HQ/uIXouQYMGh
         9ysZwi7OaKmSAK3z9HHXlMi/AoINUCXFuX+MfAC1TJIGRxnutTOcca3D/n8HF7yf4LBB
         X4Xu9o9GpRAzm9xjSxqO7vXyAkgGoQdtuOHMNCmvRjwXg6WwYITYjjTAGDiBBFqvN8Rt
         BrHWb7/10HjGhXfHpinok3yiDF5jzoJx+1uE2ZkW2HWZZoYf0cy6eDCHgIFMlYr5W8W0
         KzPtEQX5M+K6RWM33dJLy74/THHgWOzJLkf2IliwUWaj+g/1OdEf390q3pE0OCbnLXS7
         zzZg==
X-Gm-Message-State: AOJu0YzA2mLQdCnXQJGOr7HQw7EAXbbRq8V8StC7nWgyYhvomq2hsxHA
	dDAib34XunaAuG3Bzv8bmJgr9mQXOcs=
X-Google-Smtp-Source: AGHT+IGbmMdggYcZBZqJSwo0iSvN4Tfkzw4tGmyM38UfkZ/EEc1sC4gzmNhd4TwfjPpyTO5+mJH+0w==
X-Received: by 2002:a17:90a:fb42:b0:28c:35c7:938e with SMTP id iq2-20020a17090afb4200b0028c35c7938emr1181383pjb.48.1703665289044;
        Wed, 27 Dec 2023 00:21:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220231044.3836750-1-derek@asterius.io>
References: <20231220231044.3836750-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-xmlschema: update to version
 2.5.1
Message-Id: <170366528819.1947762.17422955424796971468.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107834


On Wed, 20 Dec 2023 23:10:44 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-xmlschema: update to version 2.5.1
      commit: 8d34688fad9d301c5ee1c731788b82152e2ef5aa

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


