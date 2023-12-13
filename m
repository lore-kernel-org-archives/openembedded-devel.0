Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DD5C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.31071.1702451253960887074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=df/MoIBK;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ce72730548so5849540b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451253; x=1703056053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTyCY9RRd0kAsGi6F9Yeq11IuOoM1FN9mHbCJ7D5iA0=;
        b=df/MoIBK8UI6k/+S6g6fxZMsxwkFD96kZlhUIQOlXoAHnnKKLGmztGEX7of4MCp2Ba
         bkoKIOJF3WujXv+nRR6fS/b0+A3e9NvLL6g/yotzPxdeWvVTWUUQvirTsjU1tTVYuXZL
         XVnKw0I9IUdmaG7SHfVI1dTOTaNrgRRzwBNb4zjYRZyCKAhLSBaCK1ZBu+L1uVDx6Cke
         lo7hx3y5SFR1hcz7Vz+Gp2eCS+4rAAaPs05OR06BXqCNOb7pW4k6bY8ZQNat4i5srXlE
         ZiBSfHRVg2U0HEtpF/6KkjnDDN1tmwXIMELX9JjY1Snjo8RNlPCXJznP7Dm1Sz8yfMPn
         p0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451253; x=1703056053;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTyCY9RRd0kAsGi6F9Yeq11IuOoM1FN9mHbCJ7D5iA0=;
        b=jXN1o6pfrReecFra8Wr3roAHp4/wo+FlfUYTOgY3mj+tW5r+IdBP/sCqLOufG14oRv
         jwfyJtnDnjhKJfgXhAS1+U/dOX9cPCfOAAY2Y3W9ywT7CzPW+BKCAb2oITupbu26K4y+
         QWuBPcK3hWGojwieX7avUC8t5b40lDPEfAoHbJPzhvUOYCEhYTv5X+O0u77Icv4xoK5J
         4coJn6iQ4ua90/FiipatcC7Go4FAjINsFxdRu5fV09pp/Er//P73vjBs+lss7AzcBsy/
         q2aj6TUiybtagSu2vRs9C7+LggrYDvq9Zg6c/dUCnexWGYPQXH/CqZ7E7Nqo02EfyE/u
         6vwQ==
X-Gm-Message-State: AOJu0YzlqrJTx6DGeMJR1j/a+0q2c29BMH3+Lb6CpjfxiFKk5LSSBkjM
	Rf5ce7+HLyirUN/PrBN9RrcMjgtpYfU=
X-Google-Smtp-Source: AGHT+IGNoxpQO/4Ur0b5NMwdBDCCb8Cv1lfLVgtSzN6vGuhqd3je6cWT3C0ZYT1RLw+B9ZLSyeHXJA==
X-Received: by 2002:a05:6a00:1d26:b0:6ce:2731:e86d with SMTP id a38-20020a056a001d2600b006ce2731e86dmr7990379pfx.52.1702451252981;
        Tue, 12 Dec 2023 23:07:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Cc: =?utf-8?q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <20231207153354.273551-1-zboszor@gmail.com>
References: <20231207153354.273551-1-zboszor@gmail.com>
Subject: Re: [meta-gnome][PATCH v2] mutter: Make gnome-desktop and
 libcanberra dependencies optional
Message-Id: <170245125227.133993.8736013149609048848.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107372


On Thu, 07 Dec 2023 16:33:54 +0100, Zoltán Böszörményi wrote:
> mutter may be used as a standalone compositor and even an X11 WM
> without the complete GNOME desktop environment. Make this optional
> and add the new control knob to PACKAGECONFIG by default.
> 
> The built-in sound player functionality depends on libcanberra
> which is considered outdated. Make this optional.
> 
> [...]

Applied, thanks!

[1/1] mutter: Make gnome-desktop and libcanberra dependencies optional
      commit: d6f689da36fe88110d0fb7cad9a1bd84524d9e8c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


