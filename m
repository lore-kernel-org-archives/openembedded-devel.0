Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05AEC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:55 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.31428.1704682014285563702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5guQwVe;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-204fdd685fdso1567673fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682013; x=1705286813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IKP4Vl6tl8F6ZlEVqTendwoZd/VI309BZ3ZDMoGGzU=;
        b=F5guQwVeiaCn9IhlXT7efP7UcGIDMSVASEjvqk0hK6b62VngJIcj+r1vDGUDlO9hA8
         vivSCPr3NYOE9L3pxIVO4u+9ybhfpYtIDRSykeuzZWL6JFEqdaS0GHNJ3uXxCkhECukB
         cEO4A4tZ27j0Vc/mXxk6OsvYV6JTV7JlWkcJdZ87HdWVjnRDotrotyS6UzX+LpYEs4mb
         Yqw8JJykUqauknGbMHJPPiL8Sr+QotimiCh/EZNzTmBoI4ATJsSE1eAmz4i8QKxDIohW
         cXAAeZxuqxOeBicMtL8xU2x/MguFDL2f6Z82+RzIx7ZH9KVHs4Uu0J6z/D1bD1OZnAwH
         bwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682013; x=1705286813;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IKP4Vl6tl8F6ZlEVqTendwoZd/VI309BZ3ZDMoGGzU=;
        b=iNX1+XDPzli0RVfUcNSKtik2N2SCPQzWzaPz4O0adRHuAms9HuWHiFBC4vzItoTEkj
         icYZMsmTKu6GAeImX3zIRgwMi1w2eCgqzXc2ihfIRHNchoyvPls6NzkR6u/N1Uv1ZK4w
         UyyVw/gof36aNZ4YwuOo6NkZdpDzOE0WAxi5vc8A+qTmMvYl+n4FJcvhNNeOWu9ahF7x
         SwMWRoEQcWdqmy4AUPBXho44W403GG/x0V43eRHoGdDfj4lLsKpzphMK1czbDQD4vCHr
         bpMpDNVg9MllCBU3Xf71ENbKzcFJfM+0LxHjUlLWcLp0Dblg2ubVgXmFS6MZEed9Nwmx
         6ugw==
X-Gm-Message-State: AOJu0Ywttj5KZJRoApvVl0PaGLYtzHIEUgHSiDYMKPDu/r64A6iwcqxy
	QCsAF0H0mDi2ZmV2okJQa0IcOQo4GDA=
X-Google-Smtp-Source: AGHT+IFx6jEw9R8zckcQZga2r86LnK2FmSZt9zeCtEOgj1INPenSPXRuB2yL4I08ltRHn76AS6js8g==
X-Received: by 2002:a05:6870:c08e:b0:1fb:75c:400a with SMTP id c14-20020a056870c08e00b001fb075c400amr4697513oad.106.1704682013405;
        Sun, 07 Jan 2024 18:46:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179124-7972-1-git-send-email-wangmy@fujitsu.com>
References: <1704179124-7972-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-netaddr: upgrade 0.9.0 ->
 0.10.0
Message-Id: <170468201258.912276.9401647089767843824.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108096


On Tue, 02 Jan 2024 15:05:24 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://netaddr.readthedocs.io/en/latest/changes.html#release-0-10-0
> 
> 

Applied, thanks!

[1/1] python3-netaddr: upgrade 0.9.0 -> 0.10.0
      commit: 36f7320193beb9028f083474ec82a694afb783ef

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


