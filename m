Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D0FC46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.6735.1702967224439955778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAj5nMOY;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d38bedd799so32632645ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967224; x=1703572024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diEF9AFhazal0qlIYq5v3d23gOWVcGTWn0RPZlUB9Uo=;
        b=SAj5nMOYaZ/0T2o3pjXXHE8iBo2QSCCFdykXpRXLC4bO1DuPDf+ycLrmS+fqg8pE3H
         Ragg7StKy+BFv9VRdayu83p5oDGd0SixHQUIx+wruEsZMj18YOX23xm+mpHBYomYlw0M
         9lddi+y6xad15klclZG8MgADoRQRPKyngeZG22PHVwhI2P8oqJ8WleVtL59kNtx1mVMV
         cKdif5IKHwtBRNAYd7WuUDMk71M9RveZd+j4ioUCoY0UwBS8i3SVAe5VgyXr0aLoBLdd
         qA2yLKE+KODJ6JJWU46j8iW/KeHcV1FPuPm71X62K57cX0YpmHiDmiWhK4CuAms+Hm85
         WDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967224; x=1703572024;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diEF9AFhazal0qlIYq5v3d23gOWVcGTWn0RPZlUB9Uo=;
        b=deG0uwQaJzZyjUOv/b+9U/pXz0RLonGOSbPoa1Wl1OtOYAXZEbxiIviYfcCFlyl/IP
         OVJqAHHY1DrkYN/2LAHWClWetd+1iGIVeF51TvdgOJ8x/Ml0DuoUi4rX1CNkimX4/y20
         5YAH4hpCjo93ZMW0D2mxBiJDO+RuLYETq8ndX9xO+iUFT7UH6RvFBoCFABpTE3wArdPo
         509DVbNXvYAPiXU6px3g949Fj5vvAP4tReIIbwJbSZ9iU0XtF70PPunExQryDmg5Jxbh
         Dl0MZcF1A5/t1dSYOIUWEufsUYMKofttuZm3EENXHafmgHY6Ow37Uv7XSJCJCGd4DyyT
         Tr7A==
X-Gm-Message-State: AOJu0YyHUI86zLMwEA4XiuDRJVteKLzFdO433EvW6hWRGuyXnj2yvdcS
	HNQHNas2GMt57PtH87rUnK31KFdrE/8=
X-Google-Smtp-Source: AGHT+IGC25Y2r1r0MMwzWhteF/xH4sDjR8RRuakPRR6fpMN4YqFwBpwbJlp2DXLBGYx1iwEnj8Gfww==
X-Received: by 2002:a17:902:e741:b0:1d3:c1d2:47a3 with SMTP id p1-20020a170902e74100b001d3c1d247a3mr3040637plf.33.1702967223866;
        Mon, 18 Dec 2023 22:27:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231213222516.1124207-1-derek@asterius.io>
References: <20231213222516.1124207-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-termcolor: update to version
 2.4.0
Message-Id: <170296722301.1627685.12729133029409668547.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107558


On Wed, 13 Dec 2023 22:25:16 +0000, Derek Straka wrote:
> Changelog:
> 
> Added
>   - Document terminal colour detection overrides (#60) @hugovk
>   - Add support for Python 3.13 (#55) @hugovk
> Changed
>   - Improve isatty check (#56) @XiaoliChan
>   - Improve typing (#44) @marcin-serwin
>   - Drop support for EOL Python 3.7 (#47) @hugovk
> 
> [...]

Applied, thanks!

[1/1] python3-termcolor: update to version 2.4.0
      commit: 2840fcf18dd6a416c2924040adf664a87da9ee66

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


