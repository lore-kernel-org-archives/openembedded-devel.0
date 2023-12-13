Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F15AC46CA3
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.30707.1702451260069329673
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HONJq2VY;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35d3b220b64so25763375ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451259; x=1703056059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJM3Xb66Wl1tWN1KaKpXIs5WNk3umTK4t2vYHdVBsIk=;
        b=HONJq2VYxuwlAEvGzsminM3uj34Vm59RQl08WrTWTJ82rFVjWPumY5BeeRk+BBI4Oa
         3GUvZp6ZKw91FY9ztjsUQOLgZtgJOAABkIv3a2uFM/KXE5vWXlTLnkN7sHQfZqFkhsBv
         ezvcith5xh0jYB+EfiGJl+2rnO4GV3l59UWapmjkBpFjoO+oHkZpDwPB43zZ4+pagLIi
         dJyknNXgD3Sd94f48sy+xWuC+zA/wzzs9EzXa8757npJx1kuRYg9mB+lzGFjYcJMBPbt
         86E+KTzu110zKpxNvuZyo1/mMzQJ4QrQmrLAxxU9Y6fNtbMUG+DEcVjVban2y70t9Kqt
         RpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451259; x=1703056059;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJM3Xb66Wl1tWN1KaKpXIs5WNk3umTK4t2vYHdVBsIk=;
        b=WtNddYND2xLSoaUrFPyDI1EDqXnq6Hh9LNv8+6P4oz89cAKiaUS6FdM7hwfr5oKJHs
         I++hZND+0CtncA80+XbMvEQaWz0bV6CEFkoxEiQqpzO593vX5iSaAiW/YV3YHMK70Lfa
         hBAa4FqaDZpQd9EMMb0oBUtw6sxP4znf4uhyIDQesHEbnSnaRLYTE0FwG90Tcdp9wnq5
         je1FCCLk95QqkDd2AzFwylPGYxHgi6r6f2sf0JcfOKoJe27AzR3xAxVbEbhnRN4irZjL
         9v+esS+dN3ddWsn2DFtHBRyIGHQcQvmN130+nekgbIW0BhcLGtdv+/lnHuuCOjhVc27/
         UAIA==
X-Gm-Message-State: AOJu0YyWH8AibaKQ6axU8yLh7ks4gAoPa07RlbMN1jHnk56aXsiKXdyV
	5JqF+ZqD/G2TibBTkxWuidXAIx77h1I=
X-Google-Smtp-Source: AGHT+IGYJLsE7k3Ei/8w23veYFu1/Q7Sz2OZyvwRmuhi1XjigYw+YyD1+yr8W2+GnTmcDUfrKFs02A==
X-Received: by 2002:a05:6e02:188d:b0:35f:6818:3039 with SMTP id o13-20020a056e02188d00b0035f68183039mr2037429ilu.42.1702451258997;
        Tue, 12 Dec 2023 23:07:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Cc: =?utf-8?q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <20231208095009.319210-1-zboszor@gmail.com>
References: <20231208095009.319210-1-zboszor@gmail.com>
Subject: Re: [meta-gnome][PATCH] zenity: Upgrade to 4.0.0
Message-Id: <170245125829.133993.12188266569146684689.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107378


On Fri, 08 Dec 2023 10:50:09 +0100, Zoltán Böszörményi wrote:
> zenity 4.x now uses GTK4 and GTK4-based webkitgtk.
> 
> The perl based gdialog is no more, its subpackage would be empty.
> Don't try to generate this subpackage.
> 
> 

Applied, thanks!

[1/1] zenity: Upgrade to 4.0.0
      commit: 0f9e5d1f9b62af785a65c1d5e6ab3b5d11befbff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


