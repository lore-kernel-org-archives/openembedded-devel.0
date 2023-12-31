Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3104EC47077
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.198981.1703983109091133716
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X36r4nMo;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3e84fded7so38174715ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983108; x=1704587908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK8wCOCzhuJVKj1Vhob5DKGNPA27kbm3zoqu8BdaqZY=;
        b=X36r4nMo7t2y0dYAALRX5T39r9VymvbnjcBjp24FGnQFcpjONxs9WVeWYgSosPLeEF
         SnTSiFVpUKES+yfG0atytH0J8RxX/iCSi/RXH20Xfmf++HIyXdKP+O/fgGisWJNJ7lPM
         UA4TzUQmKcqhRnqGId30CltlMT0tMx+TmIlaL3b1ZYmZbehE17rX0lUKOm8qXElc4hg4
         FbGJXRgJzCgXdA4Y5Bw1DucH5tgHWkI9DqEWxv4t15eeFdoYLmwf3dPNXPup+/a6tdol
         MqLGbguxNIZUO0ITLFgH5P+evX57awfkkmLh7J4ae6musOcjioUx6DnzF34gxQGraU5Q
         pbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983108; x=1704587908;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK8wCOCzhuJVKj1Vhob5DKGNPA27kbm3zoqu8BdaqZY=;
        b=xMdHatw3eaLtoJBD9X9R7rmL4bxr9pCuwpEgmXppODwkHDG4H0QA3bO0epMOWBwT1S
         ZbcYPgAqtPOzeKkCiXZWchn6rH5z0GlzNzjcOUJuACKhCimTc4SEI1YE98QI23LB4WJh
         h5PE4LwuNbsuYufoDs7yGvx/fdIDTG6WTDAi+R/Py+vsdOiWmyIQ/719f6c2vRMtE7co
         Ut7x6UGH+2RAB/DjX+tQAhRKmegwcOER9sgddilMvwQPkjVU/NN+JfdHdUbBDswKSxYq
         hHSbnd3h2yfivC7RBOp0qLJlFmz1+SqywBjGqVYbFX0zDvQAHPO7Dy7pzCBxVbv29skR
         D+Bg==
X-Gm-Message-State: AOJu0YwESvcPC1qpojNUFq/SHh2SvLoRKl4m1w6Q+dGxjywOByg23ZXH
	qQWzm3K0ZE/P6ZTShzO0MVK7gXqytqo=
X-Google-Smtp-Source: AGHT+IHNpx8bl4Ah5t12TN4zqiDY2nc1ycQjuC8U1cm4WXCcMtPBtVS2oJ4fpqjtvVd6Z9PY3gzVYg==
X-Received: by 2002:a17:90a:55cf:b0:28b:e9ed:2a9d with SMTP id o15-20020a17090a55cf00b0028be9ed2a9dmr4338173pjm.50.1703983108316;
        Sat, 30 Dec 2023 16:38:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574067-12806-1-git-send-email-wangmy@fujitsu.com>
References: <1703574067-12806-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] jq: upgrade 1.7 -> 1.7.1
Message-Id: <170398310744.873206.8207938058521896713.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107923


On Tue, 26 Dec 2023 15:01:07 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> - CVE-2023-50246: Fix heap buffer overflow in jvp\_literal\_number\_literal
> - CVE-2023-50268: fix stack-buffer-overflow if comparing nan with payload
> 
> 

Applied, thanks!

[1/1] jq: upgrade 1.7 -> 1.7.1
      commit: bef4681e41882684022a4d95036aab8f2632ed15

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


