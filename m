Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF90CC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.43642.1700452276741918365
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVowtr+U;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b6d88dbaa3so2703943b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452276; x=1701057076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QJEodH+jYR9RwHHYUBIa6TcxAN18ota4zxFQyPn/C8=;
        b=WVowtr+UG+dn7l+vKLkm0fqpQqqE8byP/jQ/nZ0oOmDGByyZVxNi3A+geo4m3uQfuw
         YnCLHwx2xrgkDR3l4/U33B+r1ukeBUWL3PG7yeuUT6N12+5X/L0k1CaX3MfSlMpED9yu
         xisoGvIlwFEqpIuy0HvygQFXVOKnGk2RpNUrJQTGK+yk9/Cjt3rKltSwNMxwiQMzDHI3
         Ivb+mZcsL2zi3ugJloQGmQ8gGcBh0a3CkS7JCE5lEZBhC2r2kp2RthjXQiRSPUPqxch7
         yzG9mpdmdMoWy0Z/HUKDcjQXvo5xTpaBzMDPBQhzlMM1SO6Su8Wzk+DTL0sBN1cC9fHk
         Xy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452276; x=1701057076;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QJEodH+jYR9RwHHYUBIa6TcxAN18ota4zxFQyPn/C8=;
        b=bnRu6wMzmARK/oGOedUNmQM4DGubdHFmzaR1KO/z6kzdw5/M9/JkUHwDk+/IvgIEHs
         db3LEGpKuEh3ZoX0BVF39iyu2RmHfpATR5WILLeXkrVF9f3FOgfgTc7lGGtuql/thkDp
         iI8MBcG65TKrQarNadG0kqfLnCyOReKtOohinjxIRreW27Wkj1jwco5k3x/J9AHFgbkF
         HZwqbdSxrFy8jfqFG7XpkP6jOPoA4pUG8JmJa9G5qazWmuSFf/p2Liub2cO+LY2ByGke
         bXnIKMbalDwP/aRMqfivRIJiWrBeyx6e3jLZQhNMS8XFWUW4Un9IMyt/dSKudOoMO2n7
         4anQ==
X-Gm-Message-State: AOJu0YysSP520fqLpIlpAIKnHdZ+EA+UW9bmLX0vl4mnFmUvU/wUs9Pi
	PneGADIZsYNVLvZsV9MznapmW1rn1rRCgA==
X-Google-Smtp-Source: AGHT+IEWuEIPn1oBfprVbUR4xBmF4nevvqXPZHm0DuSZGotI6q/JfGmnjG5NxeNvbQP7qHOtNlfckQ==
X-Received: by 2002:a05:6808:1206:b0:3b5:9966:c1be with SMTP id a6-20020a056808120600b003b59966c1bemr9081422oil.19.1700452275945;
        Sun, 19 Nov 2023 19:51:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116095716.181552-1-alperyasinak1@gmail.com>
References: <20231116095716.181552-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libmtp: upgrade 1.1.20 -> 1.1.21
Message-Id: <170045227477.1416826.10389180982080731845.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106931


On Thu, 16 Nov 2023 12:57:16 +0300, alperak wrote:
> Changelog:
> 
> Bugs fixed:
> 
> - Fix LIBMTP_STORAGE_SORTBY_MAXSPACE not working (copy-paste mistake)
> - fix warnings regarding mismatched parameter docs
> - fix comment above sort_storage_bysort_storage_by
> - Revert "ptp_pack_string: check string length for no iconv situation"
> - remove dependency on ptp.h
> - fixed paste error vendor/product id
> - libusb-glue: check return value of ptp_init_send_memory_handler
> - ptp_pack_string: check string length for no iconv situation
> - ptp-pack: fix ucs2str overflow
> 
> [...]

Applied, thanks!

[1/1] libmtp: upgrade 1.1.20 -> 1.1.21
      commit: 2584d79f802dad3ffb19360942bc26a4c12ae72a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


