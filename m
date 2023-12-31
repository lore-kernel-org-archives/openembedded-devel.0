Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28F1C46CD2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.198907.1703983108200112655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHExf17W;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d408d0bb87so56329745ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983107; x=1704587907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrstr05uqMtN8RVoV5iCekHSbld+TihMzvx33baHWao=;
        b=CHExf17WuTX9ArcgsUQqghREprmU5Ch7Y2I2ifs+H/QwXtUvc+13kUhrPURxxRxH/6
         0M23uuks0ODp1DvMesPE0ujOyaBVF1XBrchV1y3pui0933PuVJmxGGQr5kdzZ/JLA8F3
         hA8Sz0qfLBDsisbgn+yz4HLNBXuCsvyhjgfKqOsIT12n7oPIkbHuouZukYfDHVAx2s8d
         SyKuHLvndLcyF8HFvnGdyZfFFqm5c6BbTG1uda/Ax0mMmvefwV8VQlobtOL1ETDwa/Dm
         ZynuQGIDSYZzTD288gTbND8qRISu96EQgzIBxPX8OXkWGMM6pWiMFLQI5ZaZ2TS86K+J
         8bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983107; x=1704587907;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrstr05uqMtN8RVoV5iCekHSbld+TihMzvx33baHWao=;
        b=kKX47rS9Tq5vqKF/CvnSoObpQa1EIgfkITyJv456pRr4rLEQsVpZE5XwaRUdMqhdh3
         /5L00yQFiAXVgcXmXfB4bGKtZ7p4ddixhlkEh8z9O5IYOa5eA/8X3VZTP/AoqS7a+2+R
         1oC39pXShAlhhX8MAgVoRbmsOJBZ3EwI5ixiacXv6Ohe6ezK0qjNYyFTkVaHVWdHfQFo
         i6VDMuMepjeNIXRnqWQOLceUELo6XBc6WhejqaBCCt8l+Mz9EJtW/wMo8oOFFoT0QneS
         r/u72Cu/jJNsdWZOioLTTrvKxupyh/M2o5Ieozg/e66DOpa7bsxcQdcfaYaoKUwkcCBg
         wiBA==
X-Gm-Message-State: AOJu0YwpxX1RIjRzOKWIbhUxP5/aNXsXdkuQOxkizKIuwj8Ur+3puYqU
	WYoA+VYJITTlB9RxTc01EshvMUIgAlc=
X-Google-Smtp-Source: AGHT+IHP9jhdqFKrPl3J+BPs0M5gGq80lBXVyr9monmzdQqHB47omT3AMNoACbCf+choP62xV3PUcg==
X-Received: by 2002:a17:903:41d2:b0:1d4:4c8c:b138 with SMTP id u18-20020a17090341d200b001d44c8cb138mr12368944ple.59.1703983107317;
        Sat, 30 Dec 2023 16:38:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574033-12738-1-git-send-email-wangmy@fujitsu.com>
References: <1703574033-12738-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] jasper: Fix install conflict when
 enable multilib.
Message-Id: <170398310651.873206.3681161617396452296.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107922


On Tue, 26 Dec 2023 15:00:33 +0800, wangmy@fujitsu.com wrote:
> Error: Transaction test error:
>   file /usr/include/jasper/jas_config.h conflicts between attempted installs of lib32-jasper-dev-4.1.1-r0.armv7ahf_neon and jasper-dev-4.1.1-r0.cortexa57
> 
> The differences between the two files are as follows:
> @@ -44,10 +44,10 @@
>  /* #undef JAS_HAVE_INT128_T */
> 
> [...]

Applied, thanks!

[1/1] jasper: Fix install conflict when enable multilib.
      commit: 85360acc4d93e135a647bf4819b9ba524df3cdf0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


