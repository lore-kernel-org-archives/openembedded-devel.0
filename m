Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05344C54E74
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.27096.1710706703241893906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CsA4YP2+;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dcab44747bso21067795ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706703; x=1711311503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIwZK0q4jenPN6m1xfvEHtmBZAOpwYvk7S4nlrnjgig=;
        b=CsA4YP2+TxTZyfJsueFE+eZdTQ3c4Z9U9rsqWuDSjO5L2HAou8oOUbjHzM2h63lOmP
         apb30uXrxFxOowbVAg/1kOFRZeWi/XW5QvPyj3dMsnDvm6zNSaGC6r9fxpc6nTd5fxpG
         +QiW4zdR9DV7JPJliQAW7OYlTmAVPB3QPZ8kmpcW9QH2i9h9oOisUacmnAFcpuYshroF
         FA02UthJq1SBu8l+RBlLOy0pKeotMl88myyM2nLNHHmA43Sni8Aagols9lGd3ifpVLpa
         nS8IpO2aVESSo8o/mh+14NMk88yLo3cWEWP3Kun9Jg3D/6vP6qFO7aYgSy5q2imUhhDR
         RYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706703; x=1711311503;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIwZK0q4jenPN6m1xfvEHtmBZAOpwYvk7S4nlrnjgig=;
        b=DXcUAjFGL9aDaoHYtOuh8R2XtUXjQ5aRjtWzEsD0ar9FUCDG347142w2DVZ4Pp+JE2
         UdWlCP6ULrV/v/D16GoXy/c9iLBE4UfImxEhhKlXnK+t5hfn57vemuMxpIrOCPqXvHuj
         aa8ip7Ekjx92fB8JtwQ91HBaM2gwZwM/F8nIOJ5dtr4o+SRz4oyabm2RC+lAPsRrmZmd
         R4spaHtNFVmOH+hDc/djvsF4radAbBheBgrO1gYdFzrbU7PasgzDURu1+TcOyU1O7HVi
         pGrYI8ZDQ3vq/osb/wafU6xcjm6l+w/DCEQ1Q3dOLKsmkTDuxsXGeZZId8TzN0hZkHW3
         Z1Fg==
X-Gm-Message-State: AOJu0YwyW3N2preG01OSZWPWW8DyuxiF1QjAxb+uscbozDj/qYzjzdXh
	TSIYJjfzwD5Wy3GTKr8NyijFsJLshOl3iVfKKGKfe/o1XbvaWgB2
X-Google-Smtp-Source: AGHT+IEnJ+wVEKNd0JXERjW8RMHwcy0xXItEHv845puIrOho3RRuRfQ0X4ZF/cMBbGaAkUsWbiEYxA==
X-Received: by 2002:a17:903:32cd:b0:1de:e3d5:cdde with SMTP id i13-20020a17090332cd00b001dee3d5cddemr11156901plr.5.1710706702658;
        Sun, 17 Mar 2024 13:18:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20240314025504.44148-1-marex@denx.de>
References: <20240314025504.44148-1-marex@denx.de>
Subject: Re: [meta-oe][PATCH] lvgl: Generate proper shared libraries with
 version suffix
Message-Id: <171070670187.939783.10628836383459871802.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109381


On Thu, 14 Mar 2024 03:54:44 +0100, Marek Vasut wrote:
> Add missing version suffix to shared libraries. Currently the filename of
> generated shared libraries is only liblvgl.so, which prevents coexistence
> of different versions of LVGL on the same system. Set VERSION and SOVERSION
> to make cmake add the version suffix to generated shared libraries. That
> changes the filename to liblvgl.so.9.0.0 and includes symlink with major
> ABI version, i.e. liblvgl.so.9 .
> 
> [...]

Applied, thanks!

[1/1] lvgl: Generate proper shared libraries with version suffix
      commit: 4b09b8f12fb62e806968a1805bc1b4418b77f0ef

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


