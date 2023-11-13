Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8D3C072A2
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3155.1699900439612787580
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gxkoIBql;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b709048d8eso4128644b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900439; x=1700505239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgQ6Gb105Wo+P/hmViI102L3ktsaVnH78zOhgt/MkpM=;
        b=gxkoIBqlko5rXSv7i0ryBk8HocttdiPHuzaPrjYXY/58RSytBngAoCPSrj0YkxGEau
         aseSCGo66VDVI7PPqJHYN2LBydI1wEcB3ioRXvRq6UkLxNNqgdy2LeYdVGq+CCK47Peh
         rXf+o+edxQhr0KoZBc25pKx/cW6NS0rzXpeoCSzHdf6FChHhOMw91fDIbM0I/5UPdgpJ
         yG+cFp7Ru42BMT3ljMHOJcPU2qtrTk1JyN1VfdU0p1G4bmc0DSO9RocG/jBavlZSNgOw
         pX54OP1fhvcnnt/TmqXzU4q7kd9CBCRb4qUzrkuogaxOIKELdzSrZuLrfxSRVJB6ovwd
         xi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900439; x=1700505239;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgQ6Gb105Wo+P/hmViI102L3ktsaVnH78zOhgt/MkpM=;
        b=GWFljaKGMXy7TLl4Kq4AwBsCZ7ToAsmtWlqjfj3+uoZYcKuiBK2f9nh55sm/NgtktN
         FgPMWUcuMvSuZqU90ybKSEKZ6wfkueHccvfDJU3bE5BJaiUb5P545y+CbOwv/kgMm5tb
         K8oO3d7uyfgRCH7QtlGwihm2N4lEe/jvu8KEwxOgPMXaPdQdeOeQsw8zG4YcqScEuZe0
         R8tKXfaeaiXp3i3eUMvwmulGXQNxbphTM3VQgMUxIdfvPrMxZOagomXkflWBRCHDHO81
         r7Hyhc51u+2ho2pnxt+K4+kDL1npna82goYi/zA9vuoLPbE8viaBldxJhm/pxwqtd+sU
         o2NQ==
X-Gm-Message-State: AOJu0YzYxcrIydvkkZBh/Bp/ftgHblYA5ux8UVpNsdMYf97p9kgEQl7N
	JJ9Y0vNF7zVU9yrQ/XFCw2L4KGJgm4O03g==
X-Google-Smtp-Source: AGHT+IHY9f76FPWAoSrchYcT/ifowzkJamRIic0NruTCEEsXpdqXxd3pC+7dU/z7YJJ5BBzFCtFfZg==
X-Received: by 2002:a05:6a20:918a:b0:159:c24f:5fa4 with SMTP id v10-20020a056a20918a00b00159c24f5fa4mr6385999pzd.1.1699900438782;
        Mon, 13 Nov 2023 10:33:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112145254.314910-1-alperyasinak1@gmail.com>
References: <20231112145254.314910-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] libde265: upgrade 1.0.5 -> 1.0.12
Message-Id: <169990043814.4418.727934739934118317.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106662


On Sun, 12 Nov 2023 17:52:54 +0300, alperak wrote:
> Changelog:
> 
> - security fixes
> - fixed generation of pkgconfig file with autotools
> - fixed crashes recently detected by fuzzing
> - read HDR parameters from VUI header
> - fix reading matrix_coeffs from VUI header
> - build fixes for vcpkg
> - add API to read VUI color information from bitstream
> - fix race in static mutex initialization
> - fix missing headers to install in CMakeLists.txt
> 
> [...]

Applied, thanks!

[1/1] libde265: upgrade 1.0.5 -> 1.0.12
      commit: 02fe94b0ff1835b3d8200eebd8a90ce27a8a7df1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


