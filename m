Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D02C4707B
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.198995.1703983126338671205
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqfco/od;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso2062197a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983126; x=1704587926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4I2XE3BhN8GN5LUhZ9aQyJC69lZdqnz9VOIPayh4jM=;
        b=cqfco/od30sH5ZVugaIu3Jl8epoZi2uQk1q2kbXWewizYoqCBWTFa02dCGYXSDOnkt
         W/CpO2Puhbd7kDS/15Vkzz2u3wwmI07h1qLNQ2jGlN0oQp1LaUV2BcGGZTR21DmlbIbK
         7voxKsXOb/QhPWPNn8OqJbLiFrHQ5ZzcEEnTZUzdUp1EDtRzGaVhWBo8qXn7Q4xGC/e6
         6IH9tB2tKaijPK7ulQcm4e10yRwAdvKH9mvHuPtxcYDkXllc5xcfSX2MX+M+BB7xzgzQ
         +hbq6gDKkHccFcY5NXQoxML2gVfNUOsYVdd+ZDFm36DX6MM3PSG7MJbrWYCiPWNHdB+H
         cAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983126; x=1704587926;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4I2XE3BhN8GN5LUhZ9aQyJC69lZdqnz9VOIPayh4jM=;
        b=JH86zYxR+msmdHi8cKkrn9xARIXwhvVpZ+3rwLg0bTiAo8rRzzS5PUhOJQG1Z0tTCl
         KixTzhFdm4Qn5BuaLp/ZdSKOstj+w3OYenMOkaq0HaN8NSTW1+JDx+/25Kmds5Sgtv5/
         EjtXvz6alxTZG54mtIkmKuqdiA17td40NSsQwkirLm2fiVGjrcl2grIRauoP8I6UMNkv
         w1Gpvyk3jiO7YiSjykVVFFfH7d65bFiiiStWRcXktHpYdv6jJ9vFpm5R/O7UroGCa7go
         IVY7Im2N4x3I5D4+/MQwdyl1AysB5+cD261P+YGmpHJk9CSX9f/wx+Agol49mYhsLXd2
         0KHg==
X-Gm-Message-State: AOJu0YxWw4QsWW7abTtc3WxAkxQjJxxKGOLsFMoz3/1mq6DXRVwDRtIO
	JvaO9BapWiaclY+LaWJh3+1chDQG434=
X-Google-Smtp-Source: AGHT+IHFA0yU9pncepDX6PkTtteF/shiNBjDg1zcLAKw8yHUEXr5wa+dqI56Q0uo5+6GjbMyfSKo0Q==
X-Received: by 2002:a17:90a:7147:b0:28c:15dc:c13f with SMTP id g7-20020a17090a714700b0028c15dcc13fmr3994208pjs.10.1703983125742;
        Sat, 30 Dec 2023 16:38:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20231227153938.3880648-1-yi.zhao@windriver.com>
References: <20231227153938.3880648-1-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH] samba: upgrade 4.18.8 -> 4.18.9
Message-Id: <170398312508.873206.13749670209101836927.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107942


On Wed, 27 Dec 2023 23:39:38 +0800, Yi Zhao wrote:
> This is the latest stable release of the Samba 4.18 release series.
> It contains the security-relevant bugfix CVE-2018-14628:
> 
>     Wrong ntSecurityDescriptor values for "CN=Deleted Objects"
>     allow read of object tombstones over LDAP
>     (Administrator action required!)
>     https://www.samba.org/samba/security/CVE-2018-14628.html
> 
> [...]

Applied, thanks!

[1/1] samba: upgrade 4.18.8 -> 4.18.9
      commit: f4c3c747d6df6015eb1231f2867ffe43ddb9620e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


