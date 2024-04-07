Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A6DCD129A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:15 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.82170.1712504593069907190
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SdOwCkMa;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecd957f949so3557411b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504592; x=1713109392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEN0WrADc3uVfERatRpzC70tI1vapJShBQmotfTqP4A=;
        b=SdOwCkMaWMUjM8CrSmuyzi+7USD/UAgBnO0mJWH8ihQvIXvqv0EEUSkVGq4gDPMtdO
         yaoJirTFsT+y/Ag42xD9MCQfdHzD5Ij4bLJ0WUQKg/2aM4QJu0k67RATwiq4TZAXoAsh
         hHe7Iyhekww2dJ5Q0+rspVJWs8Qu6OG/HKFuUzN0/5W+qQkRgWOnwQOnXI7H8XGzKL/7
         9V8ld8OzcX3fMfiez8vM3EVs7SNjWAFwA3Hfmjk2eRobz8dO+4BBOLkv0fx3CMzoUeIo
         PJyTJQ041p3tranlQpIOpMwVZ90xlqwLTmIuX4Iat2nrrARwS0wFD+kUYzoeGirS08OP
         0sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504592; x=1713109392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEN0WrADc3uVfERatRpzC70tI1vapJShBQmotfTqP4A=;
        b=faAITVn+blSGC1xTrR2pFlIbBP/ZTSM3WdV8a6pipo6I3ttWTjg32mldDKuWj8tOWG
         1uvWSWivEuyUPZTiJQ5FkW8rxIK+QcFKCxgPy4eVYnlihQ1MH207TcCTaY9vX+0da6/O
         y8MgxuwEKxlMRV+kbT/ZGmJ9UbnNsoz00ns5EB5yO7O3NTw8HIfkRxlfdfjuG2hnu6xn
         IKKdmXQILbIShPwGVH5S6DtqGyASYI6EVBdinn0gNtttTFmzfaTutMc455jHN1nNpqlD
         Ws4+u/P4eWo+WPEWGFhV/VyCJ4/sKZ8kKros5GkEhVEctEJTJ9wtJAjdQX6au73R81Fn
         vkQw==
X-Gm-Message-State: AOJu0YxwSF8OgFCHXM6AV2k4NlaiGARw3NNW40efJ0MhlLznRJG+B6TS
	Qmc3A8WOcLAkEkp00Ikhl+IVyyUaQy9Na1/SbNPbSGqRNr5OfPR7q8yHcMXO
X-Google-Smtp-Source: AGHT+IG/wpq6TYwqXtt2/DMqX4vu5QM/8ord8igJqCbyAH5qB8ZuOUSHG8pu9oQ06HBrgh4AoIdzgg==
X-Received: by 2002:a05:6a00:10c1:b0:6ea:f369:f20f with SMTP id d1-20020a056a0010c100b006eaf369f20fmr7473300pfu.1.1712504592251;
        Sun, 07 Apr 2024 08:43:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Dan McGregor <danismostlikely@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [meta-oe][PATCH] libfido2: new recipe
Date: Sun,  7 Apr 2024 08:42:58 -0700
Message-ID: <171250415789.900727.12118818342710918886.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405170032.3299945-1-danismostlikely@gmail.com>
References: <20240405170032.3299945-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109849


On Fri, 05 Apr 2024 11:00:32 -0600, Dan McGregor wrote:
> libfido2 adds support for FIDO2 authenticators. It's required for
> OpenSSH to support FIDO backed keys, which I intend to add optional
> support for in oe-core.
> 
> 

Applied, thanks!

[1/1] libfido2: new recipe
      commit: 96c7e7d6834a62d215caaa9fa2ac531aca7649a3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

