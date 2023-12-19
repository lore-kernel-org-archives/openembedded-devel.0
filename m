Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C72CC4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6764.1702967250802229560
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgGg1q0l;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3ab37d0d1so10763745ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967250; x=1703572050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH5ouPWn53cLmCLkI7D31DkeuudksMjee1EKuWQHmxk=;
        b=DgGg1q0l5H/giIbIYehRDOVa2oQdqjn5dscqALi6RF69t3u8TAUaDzdBWIh5HvFYHm
         w9InqUwsd2OOnYL6mpJaU+LspZ8r7cv/48v989wLci9lAgdUuPmuvfRIAETJr1hZYCrN
         ewPaiNvHHqeaTNfLVhljlSdPQttVu/j6xzbyoh0R1mDlNhJc2bVpfxUPGTjUMwscnqjO
         eR9bthRMXvYVIbM9HE6LUTUbKmF5xDDDJvemtf8hcq70wvPtwJE8E+w/UWd0hIcWlbix
         fsTcnRm2vhRB1m6qjTwcvhoonv3s9DjkdvIs2q06i238Kx85UN39qvMLXj1FTxORUc7J
         8znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967250; x=1703572050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH5ouPWn53cLmCLkI7D31DkeuudksMjee1EKuWQHmxk=;
        b=ie5C1wYVzf/JOBIAF84BmTaylWqh+ttEZceIoDoXOESjksdHObC3slqVUlMwguR1hC
         eOXSkraFNrvk8M7FeHk0VFLGwJKv/5Go9yYQ7DIsYrgpUitelOw97ugiaDRPftvMFrd1
         Yd8JaJ4S41lIIWquANCcidHqlEHDp1w6C1VsD7tev3A0hbWHw+0I88GNED4AQnFBpIIG
         r6nvjhLIv3Gpjj07VlABtsNrcXjoj0UQIBqUZ1FPq79nR9u6Hs/wFFK1xg46LQq9AsAr
         xRS72V+UtMegM7whGG8Y6OkmkPcV1I4l6raENVxjBfCHViN/aECT2tV0P+cNiAXeVh8e
         LypQ==
X-Gm-Message-State: AOJu0YyvWVNSWlI0VQEmFZk6SsM9JugXuNO0d+OHdq7PB+DJTX2EeRjq
	pWBO49Vv8DUV2vElYOuQPli/et5Dn+4=
X-Google-Smtp-Source: AGHT+IEy/nxpelV01ak98zwthx09w3RKLB/iW2iqgCNY3W8r2DETqlqmVlxaRKBhJ5VwIYCmybZXqA==
X-Received: by 2002:a17:902:b594:b0:1d3:ac23:b50d with SMTP id a20-20020a170902b59400b001d3ac23b50dmr1349804pls.112.1702967250200;
        Mon, 18 Dec 2023 22:27:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544434-28230-1-git-send-email-wangmy@fujitsu.com>
References: <1702544434-28230-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 4.0.0
 -> 4.1.0
Message-Id: <170296724946.1627685.2884434661577315796.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107589


On Thu, 14 Dec 2023 17:00:34 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Update changelog for 4.0.0
> -docs: fix Linux user_log_dir example in README
> -Drop support for EOL Python 3.7
> 
> 
> [...]

Applied, thanks!

[1/1] python3-platformdirs: upgrade 4.0.0 -> 4.1.0
      commit: de364d91e4adc9d6aec667be3ed70a236c4c1383

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


