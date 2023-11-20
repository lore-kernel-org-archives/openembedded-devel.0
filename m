Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C078C5B564
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:26 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.43643.1700452277371604631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gqKBKBMS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c4cf0aea06so3840876b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452277; x=1701057077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZSu/nqti70mjxDgoKRPYOxxO90eMcsOI8R6UY2k1Ms=;
        b=gqKBKBMSbGgCfCIrm79Ge3TiMRPwk3O9N9tGcGC1h43rxHyn0RrieTgyufuH85qP/D
         K7IuOuGE+UUxK8AcgSi3LK64YOyoeFow3sWETPK40KIVWXzn51QZ3/18aJK4eem54pLR
         Q8DHRlftwkhN8+o23N+yk3iHdcc3Hfe46lsYrWaEXLKLA4m8rVUHlsIWiFuS4yfu//bf
         fzxze3buq8POlBu0OOhP1mvtemnXs8iG3fN+zCAAfzpgSeuCzaivXM45WAUKepBXO/Jy
         1qmrkTGPP103c9+qikIGdUdB6X0mWrrpgFb2R6TGl3RXkZNqNAIGOQIEnwdTussX7Y9S
         1GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452277; x=1701057077;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZSu/nqti70mjxDgoKRPYOxxO90eMcsOI8R6UY2k1Ms=;
        b=pJtkE9KP+5HQVgwUX4cKWxQQ6LRstO4Z8TcUaue5EXvP5zMQj4HyNV7OwXNkVRfgH+
         DHk1l6teiZ6wRquGQT6Nu4qr72wP1xNHPfgOlgXGc7jFPDo2SFjWpN7sH0lp+UHf9AqV
         jIN/L6187h6H2KG9xjzh6kQ9E6oIuVcgFL9z3fP89chRM8VEPyMgztBwkaZBmj7vlgoQ
         TIgQKpHcq62jA2YfvvlKAmBTVXanskU6jpKu/7fCpENfvxBPqkafcvUGuVyHLPmn4ub1
         wZWObWmspgkSSrNyiWvt2C262rTEJhZa8sVmf89jEqdkHu9eac3kMP9kMTZ6r/bDlHvV
         1QtQ==
X-Gm-Message-State: AOJu0YzkfDZf5zAvdtS3zlvGIlHD4ZQi2O+l+1/zLYVuNkmQiR66YOPM
	Fqlcek0/q6h+OyRVX4jr8+hFuWdi0HP64g==
X-Google-Smtp-Source: AGHT+IGqqjtrkTwIkmxMN6t6HKZ5sPmMUvAbqMs8CWWdc3psXxYJO2xUDiwX2skollygGQc97mBCOA==
X-Received: by 2002:aa7:9e9e:0:b0:6be:e54e:a540 with SMTP id p30-20020aa79e9e000000b006bee54ea540mr7431300pfq.30.1700452276822;
        Sun, 19 Nov 2023 19:51:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116105402.650329-1-alperyasinak1@gmail.com>
References: <20231116105402.650329-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libsigc++-2.0: upgrade 2.10.7 -> 2.12.1
Message-Id: <170045227608.1416826.13476675557406647712.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106932


On Thu, 16 Nov 2023 13:54:02 +0300, alperak wrote:
> Changelog:
> 
> https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/2.10/libsigc++-2.10.8.changes
> https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/2.12/libsigc++-2.12.0.changes
> https://ftp.fau.de/gnome/sources/libsigc++/2.12/libsigc++-2.12.1.changes
> 
> 
> [...]

Applied, thanks!

[1/1] libsigc++-2.0: upgrade 2.10.7 -> 2.12.1
      commit: 60f76754d9230fdb09659dfc44ff6c948c1a736e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


