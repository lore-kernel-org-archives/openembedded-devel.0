Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09A0C0755A
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3221.1699900436978218966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aU5Q3TiW;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso3164852b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900436; x=1700505236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij5AZtyKb3j/GxvkC8nzHfo64KjExQZiK44vPV/BgCU=;
        b=aU5Q3TiWrbtfysPMo7s3tz11HF26uXnj6ISceihABXkYOVm50Gt4qcIC+VJqJtfXdi
         Gom86O0zi1fXfBseLuiQfhC/CtlRJTHHsqtaxj6qiu1z5ThyH/u4iux8pd6wQCggOV4r
         A7vzfKjLCuO37UBFqZ0hDrRAwWMJmuklCni/USPgktFRiBL8F+uPZ1HGoHoJel/kSDTr
         Vihd2DwdVPoJBEsjTLT7cMegI2U+FsaBkNAXw7C4ex1BliV76yOIWWAfHAUA2nu4SJOj
         dYF1z6xisP3xhcl9cgCUCvWZ4iQzKKN+kC0JX/TIg12mQ4h7BFjmeUP7uQQkVtzqNL0o
         2Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900436; x=1700505236;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ij5AZtyKb3j/GxvkC8nzHfo64KjExQZiK44vPV/BgCU=;
        b=PDMJBUcczQ+ksFwwQCfMNv2re3rENXlwz+KQyXXkXqGN9yidEFcuofZnQ5p7Am7Pj6
         yrV7PHLOCkIE6R6s4Et0dL7qKj1u1Zc+COxPssyC/w/QhuP8o5xX6s/dP5/CutRbQff4
         1VlzQ/jipdQDXTaKrfxXl8DvOII8e2FXL2F3irZ5KQAQAIh7yOVx9BNVJNuV5TwbAVoh
         oHLMXbePns1GCXD0wsCBq8GyU74HQDlfowq073A8guHW5hlUy6WflaZA4+LbYAr96dep
         t8aAnjCMxr7zzUNlznWWRpFb/R11g9k9CbtcPaCCcGD3UMDjdT7TxsWGN4I4UX1/Onk/
         jVNQ==
X-Gm-Message-State: AOJu0YzyUjuC8RYE0DRxZO65J20eDWYwmTTYD4dQIRO17il7e3WsmMKa
	7TPrx3tRehqw2Q/KmiRvf5Zw/NggW64PNg==
X-Google-Smtp-Source: AGHT+IG6wb/Eham2jjKeGZ3GfSXZoEONv6xlcOEvTXWS/B/dgDEi1vbawOg6HbiM8a4bNE1WABOokQ==
X-Received: by 2002:a05:6a20:748d:b0:181:bc16:48de with SMTP id p13-20020a056a20748d00b00181bc1648demr9553742pzd.31.1699900436141;
        Mon, 13 Nov 2023 10:33:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231112125734.3852645-1-f_l_k@t-online.de>
References: <20231112125734.3852645-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gnome-terminal: Remove recommendation on
 vte-prompt
Message-Id: <169990043523.4418.4518813965516142567.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106659


On Sun, 12 Nov 2023 13:57:34 +0100, Markus Volk wrote:
> vte9 does not contain a separate package for vte-prompt. Remove the
> recommendation to avoid ${libexecdir}/vte-urlencode-cwd being pulled in by
> another vte version
> 
> 

Applied, thanks!

[1/1] gnome-terminal: Remove recommendation on vte-prompt
      commit: f3d3bc7620427dc1d47daab52a81593509cf2737

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


