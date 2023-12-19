Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD67C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.6781.1702967279592828216
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lSoFS/ZE;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso30633a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967279; x=1703572079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO31YUmmszZ0KLiWI/Nal0UEszpV8vL4rMKmGyowjwk=;
        b=lSoFS/ZExNxmq+aUOgxSPU9iwA1a1uE20ekseDRznXtYcdFwcQ8kpT1mk5fdQJ/vpq
         0S8zu1vXHoDhi9EnS6bOrlyPQExSeoY5Yt4BCzIinNJqX1CSBl1pLXZhAnzl2rtgjSZ7
         SdNVVmHQe1dkd3nA8ukCkG3zXQD0uHA2fNzo2ZZ3zL9P/KhNIosxvgDeGBVp78qMEUl4
         IWeMt3R6AN1FhwDBA/bS8uKi5f9QB+5F95D1+dKDjdenPzqiR6PfubU3cyqRccuE51wP
         +4UlfSuOBnFt+7op6YLHe0bRmpReCoA28obP3iho84p//IMaQBjOexGi231Gwzxs/Zfb
         2OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967279; x=1703572079;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO31YUmmszZ0KLiWI/Nal0UEszpV8vL4rMKmGyowjwk=;
        b=okzW4KcAZUTMpa37j4YO8hW3tuL59XoK/nImRG0mObNwhcRjIyIuD51nZktKpNyXRm
         j01KvVifaQW89vhtb6taKs+rpCf/mjcdWGF+sDUsGAhisFs0Eij/+gp5Fz/6BaIP8acK
         X6aKK6GSR/Gc0dPz/UhVncDPv40tum6DxrylS3pBzzYV2ftmkC3ti9r3hPp1og6latwM
         VdjanQBIA3UY++iqFnloDAwRRs8RNt8US2D2w9v8FAzxZMjcCb/UbF/VRsSYRsWL2neV
         Y+6G8lV9ZtmtIRmK2roSGfUics5KqSNYQeJiz+/n2eSyQuCpN0shZ4ZKQyWbrxS+LsfE
         vvNA==
X-Gm-Message-State: AOJu0YyLydRb7N6+Ank1MM3VqT2i3Qw9LE/tpUKcn+SR+n8Y3kQDj5Tu
	hPLmffS1XsToi0GGjwVdyKI=
X-Google-Smtp-Source: AGHT+IFDKa/ga/FYW3s1gGC/ZSM6OCKShErlkuyIaDO4SnL2EFpn3AlZCF3EcbpEMfJKld6Lqs5ASg==
X-Received: by 2002:a17:903:248:b0:1d0:6ffd:8358 with SMTP id j8-20020a170903024800b001d06ffd8358mr8668641plh.99.1702967278957;
        Mon, 18 Dec 2023 22:27:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702619789-4239-1-git-send-email-wangmy@fujitsu.com>
References: <1702619789-4239-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] sip: upgrade 6.8.0 -> 6.8.1
Message-Id: <170296727837.1627685.4462624524232109174.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107622


On Fri, 15 Dec 2023 13:56:29 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] sip: upgrade 6.8.0 -> 6.8.1
      commit: fa9122a2b8a2924ad3939db12082d74763c59034

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


