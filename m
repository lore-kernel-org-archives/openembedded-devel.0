Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C257C4725D
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.98044.1703665280822598176
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PJjYL+sW;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d099d316a8so4690447b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665280; x=1704270080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz3IFsEiN6NAFmz3O1CQTyyF9oSpuQJ+3ozYFRaFY+I=;
        b=PJjYL+sWEOATVjKKa+Ttz+vW/d17HOTjG3U1mjLc916Xt6t3yVSpjqpfLlZaHuH3AN
         F8p596tJLKLkZ9y0ndPaab8+RegPSfh1LUibfaBd+fjOEOxkFlU5Id+WI4nHXwrQTZwz
         WQ6I8fPRoNYWB8IkifubJZixoGaHa6vWcxlxkxP0izBJzdkY3chQ7mtBUNhmhZawOlBd
         99njRd0FJ9CjLjT19zmXxtBh5JqSmbF/hl4XapOIVZeg4dSsyEx4XXzyPUaMmgX04Z21
         8D9UWI9iI5mnTdHpr0QT22w403GWfsHje3ufR5JzODyzQK+hk1F4VezvACxDaWXmXDV+
         R/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665280; x=1704270080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz3IFsEiN6NAFmz3O1CQTyyF9oSpuQJ+3ozYFRaFY+I=;
        b=qUQpJrZzU8cTo+9dyar1R3TUQlj2/acCXXL3ajfGTpNR0RBgoL1ZcGHIlJk+/+Bupc
         g9N8XPbnVwu65cXIkJke8fD5sVDCMmqvQJ2SOVNZb/BO+Mg6r/BcfIeUShRa2k1oGixA
         E+EJ05DfUftVS6gp3+Nvh+ddoytYKwSgZFJYCxOO3kcvhnRxYA0NntmQogxb1LAkxSHm
         jFV6/c3JRA5nKdBuTRx14GgiiM6F/qxbfj94VMak4+4Qq1+nW/IX530epw2o6sAs4u02
         JLj5dgwRbOYCsLSkky+ujvuj27iLicXexrqKuPBV86ZL3dUansqFCcROfr31b/RQjTZN
         Yz+A==
X-Gm-Message-State: AOJu0YwhVNG+id6LXVspWukIA070SZBMGZI3VDPK4P0QPBzxgI897fNX
	Lfthh0/qanyHvM6K0zuxHHho/mK+VhQ=
X-Google-Smtp-Source: AGHT+IHRa7BHVSxW34R5rQFHMhkLqyIiVJGeYOdOYTZbKc8FSw6kyt2LJi0tQY1xLn6o3tj+r9jH+w==
X-Received: by 2002:a05:6a20:8791:b0:18c:b133:dea4 with SMTP id g17-20020a056a20879100b0018cb133dea4mr7258706pzf.42.1703665280228;
        Wed, 27 Dec 2023 00:21:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220221623.3788352-1-derek@asterius.io>
References: <20231220221623.3788352-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-coverage: update to version 7.3.4
Message-Id: <170366527941.1947762.11188341125767517173.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107824


On Wed, 20 Dec 2023 22:16:23 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-coverage: update to version 7.3.4
      commit: fd35de7c55c5efa076a6a387cfa1acdb7f0bdcfa

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


