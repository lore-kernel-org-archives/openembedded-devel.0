Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7340AC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.14514.1701215719984786838
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWZ+Jxhm;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cdd28aa7f8so13835b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215719; x=1701820519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMAQwv8xYXAbCtS+9EEiUGr2B11sgnke1sRrRKsT1dU=;
        b=gWZ+Jxhmbq4VjGb3xteuh+7n2MzOFxPZyA8qCShitVKVdGYa3JjqePA1b8fgVsgnOH
         ecaSYUGa/tFzKS5TzINmWb8OrFsH1c83wA0yM5FNpAnI6eID1xGa/JVlZdQX392An6Mg
         KquDxiAat+l6qmAIhZzb2236FnkfsJi6mQDQLuXuYxvI6E1zK0L0WYBIXAZrM/BKxad7
         vMJNthOjtaRRJ/Iu0sfpbfoZCaQEBIkExE3QK6CrYuj63PXC2ZTcAzGYy3IBLIUtiZQI
         tKRMEFo+lWlGaxDNckkx9+5Y+/wSeBRZCLVul+eOgPAFYnXRkCWj6G9/WvM29qvmM8T1
         J0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215719; x=1701820519;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMAQwv8xYXAbCtS+9EEiUGr2B11sgnke1sRrRKsT1dU=;
        b=tVLdKCK+16zcgQzKC0LVpQRf6QY7r6AuTjr0GlbDjPdwO1ewkVi5g2gLYirY+X6sQn
         6tJepp6XyVxqbedlCEEMvPy3g5LqbexD2UyHXODEBBNOwH0hX4vzSXQZS9aZTScvq3HD
         CMaJCcQXdpinkLOeDROejakIjbWK4IH3l/NtGjR2WeVUvpaZHnEzr8a6UfI5uchs9nkj
         oRVoNl4m+HP4oWqgxuRngZ4ZQ1oLDLyHfLKcN1HrG9l8kzBsmIZai6f+CrACo3pD9Ybv
         BiEROzlQ9yrzAuK5t7seNL8h0efgcQxbOsP0IxYn8NOr1DI7+f+7vY7wTgFDAdLWDg7e
         unJQ==
X-Gm-Message-State: AOJu0Yzwq8nDY/leL9QdgaK/tw3EMW1YnCwMGxQ5XmhijOnwS/Uf2SkL
	/XEDiEph0451mLuqtNt0ytL1Io0wVt3euA==
X-Google-Smtp-Source: AGHT+IE2eFzsux27JHoNryefrp3+ndufmkCBINcT9NzWG99TII+Fvs0KhSRY4wtCR3j8qScY4U069A==
X-Received: by 2002:a05:6a20:8403:b0:18b:a011:f955 with SMTP id c3-20020a056a20840300b0018ba011f955mr18828706pzd.60.1701215719144;
        Tue, 28 Nov 2023 15:55:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159813-27956-1-git-send-email-wangmy@fujitsu.com>
References: <1701159813-27956-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] tomoyo-tools: upgrade 2.5.0 -> 2.6.1
Message-Id: <170121571817.1187527.10923440576267462093.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107108


On Tue, 28 Nov 2023 16:23:33 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] tomoyo-tools: upgrade 2.5.0 -> 2.6.1
      commit: 8fd762ae34d76912f42b6187dd2196ca7044b72d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


