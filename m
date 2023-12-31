Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8AFC46CD2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.198916.1703983118240404343
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0rdDmMB;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d98f6e8de1so2366205b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983117; x=1704587917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcBYS4Mql28J1OTUp5yLmwN2ey/ptmyk3TBO6x/PnPg=;
        b=L0rdDmMBA9D5wbDYf716rvzktYk37nFtsqjM9JP6nhMuE9+Y6UsC/Q5PLCbYV+TkhS
         WRLv0x8enaEEfMfMNi8WJKaBKvoKa3THZBnjfYzbW3eA0+0v2RK3G2DJw41NyNmFsIz8
         ulGfS2OvR6SWXfXTHwukDERx4ZwYrR0WpA7NOeVoQQQgvbW64yIyGWmcSiRTvxgVzHBG
         RvHM6/0iIsfU7Sz1eDoskvKelj6GWI6DfjIiUF6JoM8sHsVBgzIiKa4nvDUxNRuyEm8L
         B8qKNGUvH2r8N4nszDMMbqIy7eVCqVJ71AibB0T5nyvy+OSPsIIVAcBFI8ar08WPKWpP
         xGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983117; x=1704587917;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcBYS4Mql28J1OTUp5yLmwN2ey/ptmyk3TBO6x/PnPg=;
        b=ZpCq+/p1HsTD93r1/OFSm0YA6e+cGOZ4ZgYrK7ywoUbeiry6/fkVopZDsVn/9oN09D
         6qrkTV8LzQlBKmWUh8uJXzVTp6oURunWUfr3kYqkbpdUx1u+sG9p4/A81xFPNuS1YSR0
         +5bJYlvy6Kp0YsTCImflJc5ERlGGDNU5QrmC3XllR0myzhRH/ipbt1m5qTv4M0+7xK9o
         kBzQERmYdpMitYl0ILTMvZ/ti/0ZR25bb54RwcNzP2zFQAuOOWmGofXMAjOATrZGNJJu
         5Kt5DtTZsxgOW9MpQeiu1qvhzi9rtTPUufhv0+Beh2bOehrPWuuaHVT3uI43+ER8timA
         yjNQ==
X-Gm-Message-State: AOJu0YxZl/zBdNs4cyGvmR20PSDX5clJXvOJLK49psVcfF1iE7i+MkPz
	nfxiwk5pF8JGDj7PpmcnizxYmuyHexk=
X-Google-Smtp-Source: AGHT+IHM5ITLOm1rdK4UAgrlXA2s2d71nHZR2DkhE1YadPSxe8G6pXUEBlqDXZxN+vYa1g9FAY3DZQ==
X-Received: by 2002:a17:90b:1086:b0:28b:99e4:81d7 with SMTP id gj6-20020a17090b108600b0028b99e481d7mr4723985pjb.23.1703983117476;
        Sat, 30 Dec 2023 16:38:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703576209-13449-1-git-send-email-wangmy@fujitsu.com>
References: <1703576209-13449-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.2 ->
 2.5.3
Message-Id: <170398311672.873206.13363360496739002741.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107933


On Tue, 26 Dec 2023 15:36:49 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -uprev pydantic-core to 2.14.6
> -Fix memory leak with recursive definitions creating reference cycles
> 
> 

Applied, thanks!

[1/1] python3-pydantic: upgrade 2.5.2 -> 2.5.3
      commit: d9ace19a213517aa3fbf4153837e8c89d53cf747

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


