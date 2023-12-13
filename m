Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC13C3DA79
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:30 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.30697.1702451243706148734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltQAmIof;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b8b8372e30so4933180b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451243; x=1703056043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh+vbtNaaEfxnzdrzXRlJkJNl4fg1RZLfRCQ275haMg=;
        b=ltQAmIofoJXmxoEtEzJGaAMBLpWB85Ptb1yQkTv8retna3JuzJFhQ6NmvlcWs2IqZG
         aEpXf/ERd+Q1+iOGWD612JavnxJ3/9Cf3xlmdTUHI8FZ779wF5yiBIjOA5YNHPtlbYVf
         Pr9FsZygNHnumqFTVWdHyAuRxjvsbbimTPVNR4D+K4kU0jf41qDA/QkL6sP8XdWG/e2b
         5cpbE0w5hMBIXzrrTErm9ltmGJ9yWU5OuXHWdC3teXniGL6o6WaFqvw1V5RcTnBJkEW8
         Hqc0iOImuCq+XgkWvc8zpyC2NJz6ZiXk0bsDbz6nLLDqC41Xfixp1rGEnXYcZqrFRox2
         HNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451243; x=1703056043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh+vbtNaaEfxnzdrzXRlJkJNl4fg1RZLfRCQ275haMg=;
        b=ppFfnI5VRJWkrFgquPb8HAB0auoEGM89F0KVVN6rr7J3Hyj9HZUepVS79eMe+zG1Um
         jpupQFXVek6oPdODXrlNSI+Y7Hg8de9QvNWJg1Xh98rC3SBlPF8wf8kC6hRhFxC3Qw9k
         pqWXKPZxuoYdHH6DsGXQj2BsTCvljW2zyKVRn4NnNSYagN0T8SQVxUDVCtEGCObGaWKE
         U7nEj8tV5F6ttC3WYRaKSNExqya2/1VOn5RlnJ0GGXuJx2PKnhbrOhWtmV9LlMgY+n/M
         lzJd6gNxXNBty/2jlYx6jnZPqojPvHMU9SCAoTqzimF0LH1rMoRwL0kmyx4aZ1na4qm8
         PMdg==
X-Gm-Message-State: AOJu0Yx6nbBb/l2oiYgtEVzmMFpEChbkst0m+WHweuSZl3qJA6yvP0dv
	ri5Gic7hsRHrY5pECSm7Ilwd2DVee+M=
X-Google-Smtp-Source: AGHT+IHJZhuFk5/qKZhWZvk/QgJlWJ3YzDYKvFZmBh+k0kM/ARHjXbmGKOrTVX7ffNshhXyIM6lbCg==
X-Received: by 2002:a05:6808:211a:b0:3b8:9614:22a with SMTP id r26-20020a056808211a00b003b89614022amr9405101oiw.11.1702451242800;
        Tue, 12 Dec 2023 23:07:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206134916.327864-1-alperyasinak1@gmail.com>
References: <20231206134916.327864-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xgamma: upgrade 1.0.6 -> 1.0.7
Message-Id: <170245124219.133993.2547889660776881127.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107360


On Wed, 06 Dec 2023 16:49:16 +0300, alperak wrote:
> Changelog:
> 
> * Use strtof() if available, instead of casting atof() to float
> * Refactor to reduce code duplication
> * Resolve -Wdouble-promotion warnings from clang
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> * autogen: add default patch prefix
> * autogen.sh: use quoted string variables
> * autogen.sh: use exec instead of waiting for configure to finish
> 
> [...]

Applied, thanks!

[1/1] xgamma: upgrade 1.0.6 -> 1.0.7
      commit: b86d42b95120917f0d7388c8521fb3559666d0b4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


