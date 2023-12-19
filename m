Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163EFC4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.6775.1702967272493014880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GlIhoqOt;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso30582a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967272; x=1703572072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D80KQfWNL8Az7MADKwI8VYLubDjI/NuwGr/48fC8cdw=;
        b=GlIhoqOtloJV7z9DHpafcLDJk6xNAey8NzFbkb8matvIQ2Z3Fwa6cJpQcyeMSpkdDm
         Qq/OW8QHr4r2iN3hWrhA1QGW/JEF4omXi37gnlaQmZHDWduUuHYhuF+OFogyM6PPBbam
         fqDsLtzRAMszDx9Dhm/4ux0X9lweoa8iH9Rz/cO2zMwHOhxoZ2Wf9rh5/Laon4QlP8qs
         V8osiTUgHg4UT3mtBgcmRPwRHrJEFyc7fxobrCu5OZJyBYWuW18ggPb1MpPhmKoulIkq
         suG+KAKkxWE/wiAkiqDb0ju3Xjp2/0LnWkZBrL5cGWMTB3d3FWlmCkYXEwhEywuGb63E
         zVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967272; x=1703572072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D80KQfWNL8Az7MADKwI8VYLubDjI/NuwGr/48fC8cdw=;
        b=VOwPR0/aCb1Vp1M4xKWFYMAKtwnI7RROGYVJZtbupKCBODyrs1Rc+sWwVHXbUGX3oT
         l35S3DWQBHpJ0lu8MiOhpHw5fOLJtIerlCkUPwVd2H+9RzpXbNN5jh0MCUUEWMtew4jv
         d2y8DXRazyR3PFmEibrE0zV7Zb7kI7J2B5wc4hF9JOBIo+fZMrQai1GGfSbHIRj05yZj
         sWFbiWtMX+qJzVkBQzhLn3tswK00eqsaSCzfTc96RzCxTuVTMkkx1SgAdU5gILoRTgU/
         D8AGXCe5cZ5tVVz115Og03GhpJVrr2fEJnrcGB9EOdufTyREd0EoOmZU6v+7fQpgMait
         ZbaA==
X-Gm-Message-State: AOJu0YzCcaulQ9hMOoUjQAglyUkElRfWB/1Yp74U/wB2833cG1ImfYNM
	xe1IDfiLslRALIO37WDyfhBCPE5XEE0=
X-Google-Smtp-Source: AGHT+IFZ1BV/+PSnh8IBFAnS9XhTEHSudDJVuyc/3pP+jW8rMVP2upgD/0fQe1Gewdevz/zY2jWMIA==
X-Received: by 2002:a17:902:e84c:b0:1d3:a9e2:ba4 with SMTP id t12-20020a170902e84c00b001d3a9e20ba4mr1695879plg.55.1702967271864;
        Mon, 18 Dec 2023 22:27:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702612602-3416-1-git-send-email-wangmy@fujitsu.com>
References: <1702612602-3416-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] ifenslave: upgrade 2.13 -> 2.14
Message-Id: <170296727130.1627685.5471973948948705047.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107613


On Fri, 15 Dec 2023 11:56:42 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ifenslave: upgrade 2.13 -> 2.14
      commit: cc82567770726a96fa24e76d5cb67f33eac472ac

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


