Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D5BC5B562
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.43622.1700452288639523178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQ2QyTTI;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cb4d366248so1002344b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452288; x=1701057088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYOUqZW/iilJ3l+9B9DdrwX1/7a/PQbtguS60991Hfc=;
        b=LQ2QyTTI5wyiRcPZC1d8FF+BvNQv2WRSdw0BY64rms5JUN+9mWdhQPoD8DBmvAdNnz
         abo7tBp3bnB56imEUvBvfdh29xBTGz8wkpjQ1q9OXUMRJbUjgUjrOQ3Q9Nt4f/9r2UZp
         gxhQR6XXwM580h7lpE2KVpCTj3e91yd2sWweUsAznxLaSms8m57dk5udmsF0Og01OaV0
         TmykGDuVe9BQpMds+FYF07sqO12Yqi8o+I1Z9bUkfvnFzO1889T5hUOG8iBuwNvrTKmi
         VmbYi4DUH1Y/+gVg+pY8EDbrODKj8pA9xwHQCg7bYNg6R/LGIULxtTUnl8jjs7bXt2Rx
         vUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452288; x=1701057088;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYOUqZW/iilJ3l+9B9DdrwX1/7a/PQbtguS60991Hfc=;
        b=WuUR03/bflmv7IKBoA7JHoQhhs76QqHDUbon8jxQflPBa6aBkPJm83JJtWhaZkicuP
         lXaIg0VA2oQ3jndKzym2B1bAyGyRqPc5BzuE4Vq4KktrstyCh409CmcfCcz+lUt33Qil
         i6SDqq5xnIMdjVhogvd+yxkUI+Fu6l75kGPk6Qn7XJTR1IYx587Xn+aXmONyInVDEKO9
         pLbpqPBEYeGSn4p7S+64t25jJqMY9OST+ECfcsYbJ76OwvJfiz0qiU61gfSAgseloxW7
         YBShk4HZB+JgtixrUa1FvVK985GfOY6MS9w+xsRSoER6+Ri5nVZtvNBWJ7KH6c5N7Ev5
         ulHw==
X-Gm-Message-State: AOJu0Yxkv0XV9OnO05OPoiMLX/yKBNBqQnJKLEuPcnZsJKYii8cRLuOa
	3ZJOaPeFy4L4XNPtKRBdMB5pgeoHmHZ/xQ==
X-Google-Smtp-Source: AGHT+IGJDpfSxH52UtrXVMpjrlaCKyMEWVcuCGlDZ5BtJq8wIAHigdj5+TH1KAEqnq6NYkZ62TMIng==
X-Received: by 2002:a05:6a00:24ca:b0:6cb:88c2:83b3 with SMTP id d10-20020a056a0024ca00b006cb88c283b3mr2045007pfv.0.1700452287803;
        Sun, 19 Nov 2023 19:51:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jan Vermaete <jan.vermaete@gmail.com>
In-Reply-To: <20231116175306.3902-1-jan.vermaete@gmail.com>
References: <20231116175306.3902-1-jan.vermaete@gmail.com>
Subject: Re: [meta-webserver][PATCH] netdata: chown in systemd service with
 ':' iso '.'
Message-Id: <170045228709.1416826.9608730050578986052.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106943


On Thu, 16 Nov 2023 18:53:06 +0100, Jan Vermaete wrote:
> There was a warning in the systemd journaling about it.
> 
> 

Applied, thanks!

[1/1] netdata: chown in systemd service with ':' iso '.'
      commit: 3d3bbc2ac329b9aef969bfac1aa7460ad04d867d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


