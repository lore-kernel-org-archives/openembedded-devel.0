Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8912C47258
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.198992.1703983123835745731
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faDJkqm+;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-59446cd46e9so3769646eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983123; x=1704587923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE/jligqe95CgGxFNhO4EnQcO+NYCfgPHJXEfYLQF7E=;
        b=faDJkqm+PI5/k1XDC3mdWBFsnHfyv4LkVY9EhXJy/qQTQNtPHXJ79KNbjzVNQNmPyx
         fTxY/B8DXINSxJAHUyCQOx/ikg2RqmSUC9GiSKQoy1c/WB32s1RR30SHphNMbWcyP+nt
         InMkstZ8i7AmbWjyM016j7KkeKaPCo36sCUWGvVCGJMV0qOucrttDBoSqg97oFCaLUJW
         hNErrpQg2qZ/t4IU23uzy2rBR9awn56K0iaHJ4xRVanhJ/qZbURh7N1duG9bDSA0KjQU
         AdQ3zOg8cx+/1qvBF2HVcVhEO8nLjreThiAv1V5e/I6/G6J7IH7ZSemC9ISuw7wyyKAh
         0u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983123; x=1704587923;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE/jligqe95CgGxFNhO4EnQcO+NYCfgPHJXEfYLQF7E=;
        b=My6LywsEpDREoFygOUBYshL28EeUswg4whcrCSUM9mRnm2i2HAahU2Sqegnbf8YLE7
         edOWjqwDeGT7lCi+y5DBK/6bJnuA+6UNUUoYZX+CYMsC4na5L6USzijveqgmqyPgtF4e
         S/Z4xlapvLsl1oqc2sHJG9hrCGS2Lcq5oOYVtAI94+iD0XsRRd5S7mhpk7BiSVjemkZC
         mqPxd9Q91l397hwS2XZWpc49kHO/v7mECOR1VkIEzgwpt8QlQgWb2VF/eaGfh34Eyy2U
         9NUUkyk2x9uYWrNrXafFbElF1dQ56lwGYOC3T1P/aPtSI1+S15++dWx+KUkoFGUX+9tn
         r72g==
X-Gm-Message-State: AOJu0Yysyvgfd2FiecHz6rMHDs7uQ2mS7tf1QU3xd4wY6tGOghdyYlWB
	/UvZsH1lNY08m/cRn65LNnJndw550Ag=
X-Google-Smtp-Source: AGHT+IFe2GW1p7oakppXKh8NTTvnnVPctaYjz6CBIDdT+G1KQLvSAVuc/BnHZh7MgwJ18TMYq3mx/Q==
X-Received: by 2002:a05:6870:c094:b0:204:18a9:6730 with SMTP id c20-20020a056870c09400b0020418a96730mr15445840oad.104.1703983122994;
        Sat, 30 Dec 2023 16:38:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, changqing.li@windriver.com
In-Reply-To: <20231227025434.2855577-1-changqing.li@windriver.com>
References: <20231227025434.2855577-1-changqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe] postgresql: upgrade 15.4 -> 15.5
Message-Id: <170398312193.873206.9366508183193788631.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107939


On Wed, 27 Dec 2023 10:54:34 +0800, changqing.li@windriver.com wrote:
> Refer https://www.postgresql.org/docs/release/15.5/
> 
> 

Applied, thanks!

[1/1] postgresql: upgrade 15.4 -> 15.5
      commit: bcedf9f99ca683764ef19ab008e042c82da616ff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


