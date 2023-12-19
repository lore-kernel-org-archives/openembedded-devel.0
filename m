Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB98C4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.6838.1702967267866189779
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VU6AFdA5;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d075392ff6so28487395ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967267; x=1703572067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptLMtdU6r5s7WgRMZkiB+sH6uH6X7neE8M1mYK1dHJ8=;
        b=VU6AFdA5xaz0nsqhToK+lgZP+lmpAO5rX2MnPVirsAKVLRkFfKlxZT06oRSL/SpZJm
         Nz3GRejKKx01AQFqUwwaGMhHSmEuAvOLnCBaeSsgYX4AAkiY19GiSJbEhXkID2Z4smGU
         dkgHjHUkEK519X4aHYbolFrE3BTuOGOx8F6n8Mh6VMVFz1/+FV4xf25mkMAut/VzLGxa
         nloPgkMC+FQ3NvqsTKgi+EvPeNMs6lTTRTdTgtznqfX6zB3b7IMQVf8gKa+JIaSHaHBX
         JQWOyItJsrH9j18mpoLe6RcTf/0Ln2lt+i6PbCnJXDVc5IF6PnPczbYnl9QR4t5j3uqL
         K7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967267; x=1703572067;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptLMtdU6r5s7WgRMZkiB+sH6uH6X7neE8M1mYK1dHJ8=;
        b=VzWUPNhsMik7yPt+NpZ/D9tGctWd24O8RMb9dur5PWJwaIuzjp6ytcJ5VHzrlfNtCC
         IRJoj3cg+yT6lt4L1Ke5pFYsh0lRdd8QFMhiFMKoJFuPxngnnln4PqVaojFWiX35wZT0
         XCjLtjAQFB7WllurIYaPA2CeYd+Z73iDUaUQBCIqSTVUwexJLZGsjEWL+mFKmXIca4La
         QTo89leBj2eNrt4VGqcLw5cyTzSvJw7K5FqZLFXrtmg0KHElz2ffGdFGJo+7CNSZKGDC
         tNPEYcjgztbWnJecvRRgFCFb9KldWbnekzXSLCjVY9fDZFDnNA6NA0tNbVIzEw4x8vrb
         l/ig==
X-Gm-Message-State: AOJu0YxSHU3TRJgeTa/4LHhuQk42/DyogPqYmR6dfHe7L2GsC+3C9Th5
	mK2rvLKKetZ/CRmBsgvwplo=
X-Google-Smtp-Source: AGHT+IHWlKxOo7WvJECChWWoai+RxuCD+jl1tsRgWFxSZy9f8lTPvgPlyUN6KvTub3Qs/Fmg5uVG9A==
X-Received: by 2002:a17:903:4346:b0:1d3:c405:e827 with SMTP id lo6-20020a170903434600b001d3c405e827mr642257plb.9.1702967267242;
        Mon, 18 Dec 2023 22:27:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702600279-1939-1-git-send-email-wangmy@fujitsu.com>
References: <1702600279-1939-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.127.0
 -> 0.128.4
Message-Id: <170296726661.1627685.1549763869620303387.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107607


On Fri, 15 Dec 2023 08:31:19 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Re-expose ServiceInfo._set_properties for backwards compat
> -Correct nsec record writing
> -Timestamps missing double precision
> -Match cython version for dev deps to build deps
> -Correct handling of IPv6 addresses with scope_id in ServiceInfo
> -Speed up unpacking TXT record data in ServiceInfo
> 
> [...]

Applied, thanks!

[1/1] python3-zeroconf: upgrade 0.127.0 -> 0.128.4
      commit: 0fa5e4dfabc91fcc15095060d069fb6d908b8d25

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


