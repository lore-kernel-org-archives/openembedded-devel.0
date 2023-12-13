Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB9BC4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.30692.1702451237249569674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2PGne2o;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b771176f80so63850939f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451236; x=1703056036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRT3Woejz6JtkFkGmjNqEPpPZP5L/UZRtvMjVccOtNg=;
        b=c2PGne2o3HzGBVBEm228+ieLEgpBvmyKsMfKR2irE+jkcqPHCSCTjkXqm+MZ90SS+e
         e0vc1gWSXFiyAXeLPd2ojLV95QQayKdUHkKy1o+GSl4W2ZAEVkBnpCr77QvMxGskcXtB
         kpNovjAWTzH7kTUjIrnudgvFpqZJB8FLGwZoxtJKalAMRAUapjAiYOtwg1prGR3Dv3tw
         sSK+6eiaQpSgmSPEx8D7y3W/e7C50WGEC05guMcOd8EUPaOEhOAjyskf4soglK7CDG1/
         8LxrLJg40nEYXavCtS71DESpYYgVgk8eo8MgdIXr6iiaAEsViR1z1DFV947bKA5jHRgQ
         i7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451236; x=1703056036;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRT3Woejz6JtkFkGmjNqEPpPZP5L/UZRtvMjVccOtNg=;
        b=IwLqePrKEQrHoM+y2UU+A2KG2ifskwueZ48OBiWxNvYLL9JDNpR/ZX361bPDuZJGgb
         yNtCXkG6BriGqqeKr102g2gdaaaVXb9AuzqxexzAcKKBfUPrlGVVLG29gsP6UyLcVMtE
         ELvXTrIKOMnRsWLxl7zWdcAxBtvHaO3JO8JtKtBtTD68LihffaQ71e5FPgxnsjF7RO8n
         5/ewC2LRQLNcmSeohJgaR7vqnVTcg++/AS8MA4XuUDR/L0uwbyjA4Rpnuuzn5UOXUlse
         Q8sdX8/iiflkX4mjHZPMpl/QbIslkOCmHCuAtnw04mtPemE+O+zS1rIMDgGU5bW9hiVf
         SieA==
X-Gm-Message-State: AOJu0Yy4UvM/oKm8xNpk2luoiU9BLCxVCr0w80ONwjTa0WgCNRjlDrWI
	pVi3GikyZmnZVaTSzTE+0n4PryTYgTI=
X-Google-Smtp-Source: AGHT+IEBIgPD+Q0hpmy09cmMnrN2hPCsDXSndFn2LF+XOa7qqncEAPiPqEOiZuRAgWEjPqPzt4raGA==
X-Received: by 2002:a05:6e02:180a:b0:35d:59a2:2a8 with SMTP id a10-20020a056e02180a00b0035d59a202a8mr13344779ilv.72.1702451236027;
        Tue, 12 Dec 2023 23:07:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: yoann.congal@smile.fr, kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
In-Reply-To: <20231206022446.3725327-1-kai.kang@windriver.com>
References: <20231206022446.3725327-1-kai.kang@windriver.com>
Subject: Re: [PATCH v2] lvm2: 2.03.16 -> 2.03.22
Message-Id: <170245123512.133993.6994077508055149805.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107352


On Wed, 06 Dec 2023 10:24:46 +0800, kai.kang@windriver.com wrote:
> Update lvm2 from 2.03.16 to 2.03.22.
> 
> * remove 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch which has done
>   in upstream already
> * add patch to check egrep & grep
> * rebase patches
> * add package config 'dbus' and fix errors about it
> 
> [...]

Applied, thanks!

[1/1] lvm2: 2.03.16 -> 2.03.22
      commit: 02f460c5e379b3b0980374b3f89d55bc195d03d3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


