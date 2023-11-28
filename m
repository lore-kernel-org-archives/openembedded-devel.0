Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05670C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 05:22:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.26230.1701148946609523024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 21:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iV+eiiKt;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cfb4d28c43so22219545ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 21:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701148946; x=1701753746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sI3CoJFSYFT+NG1AGMnTeevTwYn8qJLhZtmBDfe9Es=;
        b=iV+eiiKtTRGnHq1V9jU9k9NOYUdgCP4TeJWNUUy1O+zfcAa41HYSwSxglSYZfFhUFk
         H/edJ5cXfsuiGkXkjg3SS07yUklncE8W6l/3i/0A5ptprM9ZXqY+e4TZ6TzHOoVy718C
         T8Ie4fPOvnh5yQA2KbjBlt5hke6fIYwZq5tMv6gsyON5NNrPVMzqXZGJZiC+7Rz0l7hU
         IaHTbOO4grwnfVtJW9i5zYy4MzeKr31QhjxSN/Ki9cRVxZ1Hwphxa1DkAcMmj7xH6ZgS
         2/0LEqkNUxuA9iunsxYpWrGuh4+eB2PxWiFC6ztgUitrUrt+i4juwLK+H0ZZSiIufLAs
         k0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701148946; x=1701753746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sI3CoJFSYFT+NG1AGMnTeevTwYn8qJLhZtmBDfe9Es=;
        b=RF/WU23uaVwvZqNJ0PNZSObZNcBhWjwNgGxApbvTrNgbp9cWs270dipY85PgvoVsRp
         jhusEK3XBABAICEZORj+yNQFqfSmLXc+wpKKQqvLjuXSwoLlRG3xqNF9fbXa78rFqkdp
         9iIRMlArkVbgJH7zPVfpFQc6mKatvSgKiJCh9ynmqgbvNIwOJsxn5xdE++NT+f8UEGpS
         toOaw9vPUbDOr4HtNeHg5i/ara1zv6NUUTukniaZ2dsfCCqh3/tl7yjkF07FLHfv8Nom
         SjNayl4EcIaBPuTAmpseJQ0B7nNjbWMlH98VyZ6zr2yI34RxBhNcgZYR8/dPDAGtjwgE
         L2nQ==
X-Gm-Message-State: AOJu0YxVMKWxx0PqWKgO+6v3y/hJJasSLfcc5+yWLJjn3jTRdphMxJFZ
	WjB8Zv0Y+UtD7Y39ReScfA7rMqRYrqa+yg==
X-Google-Smtp-Source: AGHT+IFEgC0umuSfZhVEF2EPR25U9sDElkNP/a+6gWM4mmkJjKxq9zD9Xt+wp7ZNm5E03MfFuyWBQA==
X-Received: by 2002:a17:902:d590:b0:1cf:b43d:6b39 with SMTP id k16-20020a170902d59000b001cfb43d6b39mr11780343plh.52.1701148945729;
        Mon, 27 Nov 2023 21:22:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001cfde4c84bcsm1608485plf.141.2023.11.27.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:22:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231126202333.890649-1-f_l_k@t-online.de>
References: <20231126202333.890649-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] pipewire: upgrade 0.3.85 > 1.0.0
Message-Id: <170114894470.164097.1667302531723164304.b4-ty@gmail.com>
Date: Mon, 27 Nov 2023 21:22:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 05:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107065


On Sun, 26 Nov 2023 21:23:33 +0100, Markus Volk wrote:
> The PipeWire project is immensely proud to announce the 1.0 release
> of PipeWire.
> 
> It is API and ABI compatible with previous 0.3.x releases.
> 
>  "PipeWire represents the next evolution of audio handling for Linux, taking
>  the best of both pro-audio (JACK) and desktop audio servers (PulseAudio) and
>  linking them into a single, seamless, powerful new system."
>     - Paul Davis, JACK and Ardour author
> 
> [...]

Applied, thanks!

[1/1] pipewire: upgrade 0.3.85 > 1.0.0
      commit: 20c083b15b6c7ae96be6f9507a58056d49a3e81c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


