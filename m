Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B10CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:12:05 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.5273.1759399921663661759
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EkNRipTX;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so1698795a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759399920; x=1760004720; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bi3hpGECQtXpCexDQDg9qUd0KL84Y37faZBbpes5k0A=;
        b=EkNRipTXmVoI7xOsLo0MwIcgUKHZkfTDfBXm8445a9L1yADoFUSd90UPH2QACRtxVD
         mLNsLeN5EXxL2GRamEjV4guaryyZ4q9Wu5isb1JXylMONQIuyThzcHpsS77Z6LEZeZMf
         C96pMsh1yE6DWB2laR3+13eySiUO0djCkn47JDpN5Ju4KLxh/oeWk5z2rfxwKCM4tGzy
         4wPUIMhqF0dYcsY4gh8USd6iRiGnPSqUN4ZLKSeOJWaYw0zvFbNWwvprkeH7lIJ29rV9
         ywtauPQFbUMJHUfFsYpbFmIWrDUrpZtF9z+HVVT2LaeG+17ZsMLyibck/w2CeVkKkwS8
         0T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399920; x=1760004720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi3hpGECQtXpCexDQDg9qUd0KL84Y37faZBbpes5k0A=;
        b=EFb+br6VlvPMncfbDLTY8ccqC6ETar9oTN2u33ssGaqAAmMU2eDcTntHsFEnlDqKV7
         Uoem2UEk6+n9LvUaIEk9K7+xXLN5r8jatc0wjXgCMIc/3/nggYwAuevVlnrMwwnKMT6m
         c8Bpg257xsyHfhrYVtjR7yi0W1j5G3l+dCHmxIKs6yfsjOvcaAQ7f122ibO+U1RRNClc
         IAnqOgM8pPM90OEPGs8mAFC61fUUXDtJvdOB9mCu4mqV8KZ1Y1HEuotq1k+AYEPonvRP
         UGkb62XcDE3WbXrCuN/ebUQXK5dGVbcY/r47rXym+lo+t1lMAGCQWjlQ6FcpdCxs1EcF
         dksA==
X-Gm-Message-State: AOJu0YwxHtQ+sSFCk8xd01fNsI0gRB/itGb/y31H0IOpKi05qdu4HijA
	cODs0MEIDLN2DCRPMprUcesw0SDR6sp3eoX5beQC5NZRS5jHpzPecImPCdhQaA==
X-Gm-Gg: ASbGncto2OuMXGAje1XNtXcv0BvJO4Rz2vWwLtItM46K1E2xmCluYuX9I7hGSvufXLF
	POWErhfrGKrnugXgtFfWQRHAZWuKqfPhncD/gHKT0K1g+q7p3hOCfTnjvJTEAlgumV8U/EQ6a38
	981MXJQMF8WfbxoL+wIGOOgmGMj8CZjTh7+UzchfELYBRyV1ad1peGNyOXS1a79v12GD4knVcdD
	Fw3UGKsFw6Ecc+2njGMAifAyX+1XdtQRXtfqCW45OwRO0llGioCVyubIeekrErmCppDrLSyU4ds
	BAtUhjqb9HPZXVmUxcgbAa88ok2LRmEt2j9rNhg15mwwQYMPH6JwxdfBequeVL8xdNQoe2XSSwx
	6i0j5Qse8rwzoKrLHoQVJBbBL074alMLRTrh+YKNvLQA6a5OGm/S2VC5w1KMG9mIWtw==
X-Google-Smtp-Source: AGHT+IFMzJTQUD8JDbHgtvd4AENcyK83lJFD9lYZCXnDX4RCs+Ajiznnb+r/3ErMbexnPWFhjO72+g==
X-Received: by 2002:a05:6402:13cf:b0:637:f07d:e80f with SMTP id 4fb4d7f45d1cf-637f07e1ebbmr254082a12.0.1759399919817;
        Thu, 02 Oct 2025 03:11:59 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3ad614sm1548613a12.1.2025.10.02.03.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:11:59 -0700 (PDT)
Message-ID: <274a4a40-ab7a-44b7-9436-1dcfef9e62c7@gmail.com>
Date: Thu, 2 Oct 2025 12:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251001081804.422541-1-zboszor@gmail.com>
 <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
 <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com>
 <CAMKF1so5GUbhtjKgfWT-6no8_CDbjBhFjYbj32YcRsbaRndhcQ@mail.gmail.com>
 <186A93DF4E955769.24709@lists.openembedded.org>
 <186A95EDCFB98451.24709@lists.openembedded.org>
 <156bb49b-05d3-41f4-8a56-dbd2fb9875e9@gmail.com>
 <48877003-e1ff-4d68-9aaa-f41ce73eaabf@gmail.com>
 <0c4df866-f872-4bcd-bf25-83950fb5414d@gmail.com>
 <874da9f5-1114-492d-b144-cce44053ec47@gmail.com>
 <b7bd6616-9669-49f8-a5bd-b45e29841093@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <b7bd6616-9669-49f8-a5bd-b45e29841093@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120165

> Do you mean to mention these in the commit message,
> or in the patch, or both? Just so I would have to resend it once.

I would mention at least in the commit message part
of 0001-Remove-x86-specific-loop-in-my_convert.patch (but I think it's
impossible to mention it at too many places).

> FWIW, Fedora 42 has a GCC 15.2.1 snapshot with a date 20250808
> (a lot of commits were merged after tagging the 15.2 release that day)
> but the commit ID in the specfile does not exist upstream.
> MariaDB 10.11.11-6.fc42.x86_64 work where the same manual optimization
> is present.
>


