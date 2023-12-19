Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDCDC46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6812.1702967222574682084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtWgPlV6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3536cd414so33064725ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967222; x=1703572022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxxNmDTRMUDXhy3ym+FNCfm86Qg8W7HMATDPRT8iCfU=;
        b=HtWgPlV6azdGcGVJpLfS+U17hqo8UAWSqAq4bhHS/Vf+M0HfLmmtDKn7TSrORZ7Y/B
         r/RSXOrKNA5SzgBOzunnu71XvPnEIk+ag4CqaKFcZGOqDXuvlTz4r5ooCZi0PEuz9kGK
         9s4ubisB3SdJSt8QPh1jGSBrTjI2YAvS/Td0kYSN+dfm1HF2HKv0dzoV9RvTPXdNSUZQ
         1QFYe0sXcWbV3TU/Kc2LqJmtJa8bxxnwotpf6k3Rj7FSbQL69osbg59rrZrlqB0hgDgF
         CBcY/2F7hLfE/StlJRoqMXBBzJijgXdo3uDztI9ogFJJhyVa+oZSxp+QTkJ+Or/iwkPb
         oFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967222; x=1703572022;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxxNmDTRMUDXhy3ym+FNCfm86Qg8W7HMATDPRT8iCfU=;
        b=UzjD3kllkkow1kaSe4T2l1n1EP6czhReEOUgIUqgaCoR+4jsQFdu4RIUtCotn95XQK
         B44lqdGz8RRZyGGIGWNRVWqHSxRyAOHo+hImgPWUOkds7fSWV19kWw0bOzN8GTprlY5Q
         Bxvj07MWpOXcvlyyRhfFGzIGOldzuHGRrbWDdhQlM/E1JudqW73j2zwU4s92qWWF4G+x
         aHdurO0fcvqD+kyqsO2aBmSETpjwOr6AK6wvqA6sY4D4G40puGuVZ0HFkiWDRc/bH7Qu
         e+VIXsOr/9coPSJiqSRPmDytCqhQgpiEd+z0NaSfEzbUzeYDz/dA53F+q8nMyv2TW5Dn
         gqEg==
X-Gm-Message-State: AOJu0YyAxNy98d4gAvxE5V6oKOWEygovcL4/GuW24kYRmQ5ukIayKM5r
	hcWkQfYWXqcpb+qnl/wM55HO3ZSKznY=
X-Google-Smtp-Source: AGHT+IG57y5xX95BmDz0c7Fmgz6hzlHEjl1MwZJRa6YoI7Tm4RYZNBkZqQoXwVf1Eh51rrIkPtjhiw==
X-Received: by 2002:a17:902:da82:b0:1d0:5218:a7e9 with SMTP id j2-20020a170902da8200b001d05218a7e9mr20067853plx.53.1702967221882;
        Mon, 18 Dec 2023 22:27:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231213195741.1107961-1-derek@asterius.io>
References: <20231213195741.1107961-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-greenlet: update to version 3.0.2
Message-Id: <170296722097.1627685.4726880046957045972.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107556


On Wed, 13 Dec 2023 19:57:41 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-greenlet: update to version 3.0.2
      commit: 26795b690a450f4c210a5e26377099b1c8a3a05e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


