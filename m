Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBCFC41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.30691.1702451236088423279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXESKNYt;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-20316647099so541978fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451235; x=1703056035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqDk462bnED2biFlzXlGHpD+uTctIgBQBRMlYVrBFfs=;
        b=PXESKNYtgE/zJJME1k6TKoZZzG2OvaSX3rU6tCdKiz1FVwxlFs0ljfrAPr7H7q9d9j
         d1Ej8TyGzIZ7LZ+88+PIdRD0Sredq99PuIf0vTl1aE7autdAC4FAzXkV2+c5PWjtnU/g
         hcBO585xYO2wfol5zTVfb1VOea5Nv7G3c98hcUkGv4C4VHOqn/HDFKAaiLKcpBKrRxwA
         kjD0ggwaiwIh4ilrenlodForpG2IAvQbm08IKXgl0zRCmmKgGbEfvMnVgubqxdHM12w8
         7K1PMlf9h+9j6Pi02YMZLaUH8YQEZLqYhwaAtwjw9GBIlk9peYSZqrJKF0oKhtVbjCdg
         bk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451235; x=1703056035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqDk462bnED2biFlzXlGHpD+uTctIgBQBRMlYVrBFfs=;
        b=jRwYOgbPPzb6fb4z0nQke9xTiwSZ8okkZzCOKasnkVZumuNzPsJKrq+MOKmfuYFM13
         D5b8rjumPEAhfB0OR6G1fHdq8HrN200jaPQQSIqxPN9JwSfLj3PdANTANDvMwrv4mFrf
         NNVFM66uFFJAgJ4sbZK5p7KQ/Nt4BiDamuxUxuj2Idg5sOcoitQ1yFSJjx/Koth2BOYx
         NJ1Sfn6NSaglY1x+qBy3CrxOiBjN+R7UbTY6leLaUIt6cWiBW05wVmI33gpeP73LVhbi
         c/3W+RywaDLi02feEUuXpYc5tOtMaAcoEhz6r2mIQiGqrfSTmBKChH0RFCcxbv2ePPlB
         s4Hg==
X-Gm-Message-State: AOJu0Yx+F4I8HrARYZ3sm/WEx5i6F+GnXd6bnccwSEpOQuZ0sG7ILHx9
	7C7fUi+zpnzGrU5ewjENaKAnCkWR4A0=
X-Google-Smtp-Source: AGHT+IHXIeQOlUlUtbFl44HQzoZmBZtvQCzyPVjPiiUuTvuI35dbw/T/u4T7gE/AIcYokLLe3bSrvA==
X-Received: by 2002:a05:6870:9f14:b0:1fb:75a:de6f with SMTP id xl20-20020a0568709f1400b001fb075ade6fmr9708532oab.93.1702451234919;
        Tue, 12 Dec 2023 23:07:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, kai.kang@windriver.com
In-Reply-To: <20231205145032.1116030-1-kai.kang@windriver.com>
References: <20231205145032.1116030-1-kai.kang@windriver.com>
Subject: Re: [meta-python][PATCH 1/2] python3-pyudev: provide native
Message-Id: <170245123409.133993.13195774594233702101.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107351


On Tue, 05 Dec 2023 22:50:31 +0800, kai.kang@windriver.com wrote:
> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which is
> required by lvm2 when package config 'dbus' is enabled.
> 
> 

Applied, thanks!

[1/2] python3-pyudev: provide native
      (no commit info)
[2/2] lvm2: 2.03.16 -> 2.03.22
      commit: 02f460c5e379b3b0980374b3f89d55bc195d03d3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


