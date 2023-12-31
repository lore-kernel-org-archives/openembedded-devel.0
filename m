Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9712C46CD2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:59 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.198926.1703983130236971702
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dqo1bWd0;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2044d093b3fso5051386fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983129; x=1704587929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djy3kzAPOCbNIOMAqwDGDfQ/YSaP47vjO4o1UH8J6pg=;
        b=dqo1bWd04vM5HxbZUqmq8yQlyFCmu238xuHeEoxDhDfYl9/mPrdgHja8+v5w3OzokK
         qlAvUbUc1/gPk6srWsJJUfmrthhfXhhZsiqNUSyTls/fiHXMOLj4uXowNfEbmy1G0Lq8
         grIXrKhjB9SNmQE69s9lN0uAYY4ly0Lvn9xxEc/Gzfl+sly9HDCjKEcg5Bb7dwPxTfYI
         ARqPgGJ2WTePDDRGuFa6DS6hQXH+O63jGBdVRBQkf6zrb6of9vWDLVNm37DayHQ8R031
         ZlVQcgsul6WZiMhUaXymKbsxeAyLW1aIr3iyMYobZ3lDsFh4FHqdtIvWbuFdrjnjNF2e
         JeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983129; x=1704587929;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djy3kzAPOCbNIOMAqwDGDfQ/YSaP47vjO4o1UH8J6pg=;
        b=EvAsZ4lqaTjkjNlCAxxlYZ181ZzjF1Ce+in7OLCBGNH5ol+Ce5fu64olouTxHE/4d8
         uq0tL9AYXRxVEGPZMK/85DnDtrTaNBhrWdaJTsv+iEGquT3/MeaXsBsgutS3vNmkvhTb
         DZL21F0S1dCvS/wy1oos0A7lWAiSKeRTHYouSTs7vLQoNNoEiX3D4AzkOl8CtVPYfTC3
         sd5YrqIYQ0TdhCDrgZ9Fpg9Fz1e/JcM30Ou5kh5PpecjTAJuKy/cLtAnkGAy95/poEji
         nG5/+HUeCm1IEMOcJ/Hbdtoit4gZ0fQrla8iF8P+tTJzPGsR2VIGe/CsmInaJD09a9eX
         o0GA==
X-Gm-Message-State: AOJu0YwUO1e9Jm7/1GhtHHHfj4YUM/QTwt6Hy4ZNhpRdd5DohZntDws8
	fog6TvJ0YUe43yQjoCNo64Wa5vKeKeQ=
X-Google-Smtp-Source: AGHT+IGX0KzHAZDnph8NN9faKZwWUwfU4/A2WDLL4lrv/R2wmCzpDYbiMTNeWf+Nzom4bAnBjmkctw==
X-Received: by 2002:a05:6871:724:b0:204:302f:74cb with SMTP id f36-20020a056871072400b00204302f74cbmr17559712oap.24.1703983129397;
        Sat, 30 Dec 2023 16:38:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231229171454.2651032-1-derek@asterius.io>
References: <20231229171454.2651032-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-argh: update to version 0.30.5
Message-Id: <170398312864.873206.16734940782337071624.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107946


On Fri, 29 Dec 2023 17:14:54 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-argh: update to version 0.30.5
      commit: ebea0db450872e38450b259b949aabdbc2c9c491

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


