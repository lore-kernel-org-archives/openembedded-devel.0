Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433EEC10DCE
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.31070.1702451251620274207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXwGUW/B;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b72d574399so286284539f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451250; x=1703056050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw5oOQwXvYPXt14P78V1AdGTn3QYxcnPCdMYtQG1QE0=;
        b=jXwGUW/BqZkqip+gaGKKyMJRkDhb0dUc49KkbnxLlIGrKwe+8K39nwoNh811GQkYbF
         cl9/JeN+oZIO2ykrUv4mdDbaxx0lFzspQ2cyQoRJucfXoKSTqrNzUe4FaRV0JjJGQhej
         zDreHxEXbcBzucFEzHW3vE4RLfeCNsH+fyCn2htTYmNFOa29D8sV0bkp2DEOF4aF1hGz
         sYWXmg+6NW7XTJo1C5gyr9yrecQQ6vIHRuLp+apkWOVxEcocQ+sXuIBQAsB3vJtiIoVf
         TX3DNrWcQLOlqrXMARQfBzaXEBcJXe3Bqs7Ay+T0V9XN7AiXU2y/TiGtcladobONFAyb
         w0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451250; x=1703056050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw5oOQwXvYPXt14P78V1AdGTn3QYxcnPCdMYtQG1QE0=;
        b=CtaansjjTHIPBMVEM+fc8VXz17dstuFL9OuVkKE5nayi2nGkby0AfxMYlKr5qAydJ1
         G/U/esTZva9PXxJuAGuDTcJzLgcJ3vD6oRpsQHyQ7zs4PSKWxxPmS2WAro3fUcmN3X8p
         vyE+yPJVUQUbO/zg63er+ePocrD38HQcxqEqcJk15ERSbFkqG+3EamIyFjdWizQXJivM
         GK/nJxAlyNXtBuNg1pRV7B0UNduzmJy+bMPZfuYQRdN8F5oLiZD8+5fXtTMjVUcXmwFl
         Qj8rDgQwlTd5unewReSMaUxgmVMaaRHHRmkcXrkhMShJsqHwOTmTkw7EujVByRnvjaH6
         KR1w==
X-Gm-Message-State: AOJu0YyfFRNhKlaBDoiPCBtjR3/MeytejUY6PxCwTUrZLnw28IlGgHLd
	RcnM2uUrvN9ZEDhCwx2QTyfsIBsYbPM=
X-Google-Smtp-Source: AGHT+IGPu7eEEIDMjfINib2EBK2KdMDP0NIXY+q1BGZih7OTU99rfHTWSkHCTKYFAoeDQIP2HPeLmQ==
X-Received: by 2002:a05:6e02:1526:b0:35d:59a2:2bb with SMTP id i6-20020a056e02152600b0035d59a202bbmr11553827ilu.91.1702451250596;
        Tue, 12 Dec 2023 23:07:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207120810.1342464-1-alperyasinak1@gmail.com>
References: <20231207120810.1342464-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xf86-video-ati: upgrade 19.1.0 -> 22.0.0
Message-Id: <170245124986.133993.13799531420519325421.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107369


On Thu, 07 Dec 2023 15:08:10 +0300, alperak wrote:
> * SRC_URI && features_check removed because already defined in xorg-driver-common.inc
> 
> Changelog:
> 
> * Don't set SourceValidate pointer to NULL
> * radeon_glamor_wrappers.c: Convert from ISO-8859-1 to UTF-8
> * gitlab CI: enable gitlab's builtin static analysis
> * gitlab CI: enable commit & merge request checks
> * Fix spelling/wording issues
> * Build xz tarballs instead of bzip2
> * Only include dri.h with older versions of xserver
> * Add GitLab CI pipeline
> * Guard local variable info only used with glamor
> * ati: cleanup terminology to use primary/secondary
> * Fix return value check of drmIoctl()
> * Don't crash X server if GPU acceleration is not available
> * Handle NULL fb_ptr in pixmap_get_fb
> * Fix link failure with gcc 10
> 
> [...]

Applied, thanks!

[1/1] xf86-video-ati: upgrade 19.1.0 -> 22.0.0
      commit: 689d87cd1fda0d7b6ab5f0bb7eac5fe49c1622ea

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


