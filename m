Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21281C4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6840.1702967271707796296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JReehY3/;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3dee5f534so1517965ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967271; x=1703572071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTXXdUPKhnyWc8CcxGGL7+zhEaq3/GQqecEQY70JdD0=;
        b=JReehY3/jIXKP0mPrtsRbRtMXjI1xqHM8F34oYY760U508h8QIVEMPiBbqCzes22Sf
         zg/ydExIeLrm/Yft5GtIc7gsyFO7bmxNrt5kCGTzwR5PB0EPwl5Y0nUqfKVE6TccIklr
         1YcCtceddNjq6rgn4BbADiSH/hd0AqaXnJjzedqRlY4eWA6JuhB5TdLAszp5YiM+hC6X
         ESXlgWxuxbMSA9RqWgUx0CoBQ1daufCdo2txfgZbc0HMz8IhLB6ExEnEaeOzGPy8pe62
         5PLWui+9xThOMjCcHOnANNkLYeMV0vClQ0HCjaVnEOzI9TgztMxwUz00eAF8SRmHDv3m
         mJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967271; x=1703572071;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTXXdUPKhnyWc8CcxGGL7+zhEaq3/GQqecEQY70JdD0=;
        b=Lz9Sny11icbl0FFsbui/Zqkp3Zv0I+Qz+EfvBooo6u8jM2ugrzlHRG1q+zlsoxpIEY
         dUTpMFwmEW9XIQcc9puatD5q4IxIM/i5AM7V4vsiocd2Ihurfde8PqW5JrZJSakOMTjj
         l0iZJ8KbMuH1AzYDrNdQ1C12CXiGU0J2D1Uu468Mg1ETgM6M4yQhLHfyTqEA9R2zI4iq
         ziUf1fEheSLbZmezgcyhA7hnJUzC+GteicVUgIsWV7SMX9jLBpe4E4HvJWIHjAbxbFF7
         9U1x4SJcV3cDPIko39bbZW2m1d7xaWDDvmxP5mbqE4s1kcsM+KuXgh8cvV58Xy4tsO4y
         jAVw==
X-Gm-Message-State: AOJu0YzVcs71hc8c+cEt3twgK6Kb4SEOSGjR+QSZactx8qkLNh770Yqe
	bwQ5PHDCWjepC9nIi08XPAMbgEJ1YTY=
X-Google-Smtp-Source: AGHT+IGftP67xBuJiZfDWA/MFimF8QN8hc7627l0ZBMbUWJGHLUov3GILmMj6qPeZ6G9Ce88X7GX4w==
X-Received: by 2002:a17:903:234e:b0:1d3:415f:ae9a with SMTP id c14-20020a170903234e00b001d3415fae9amr909119plh.6.1702967271182;
        Mon, 18 Dec 2023 22:27:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702612550-3378-1-git-send-email-wangmy@fujitsu.com>
References: <1702612550-3378-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.78.0 -> 1.78.1
Message-Id: <170296727049.1627685.2028023099645791720.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107612


On Fri, 15 Dec 2023 11:55:50 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> * Gtk template signals cause a reference cycle that is not detected
> * Modules from resources may get loaded twice
> * docs: add examples for creating cairo image surfaces
> * Deadlocks between GJS GC and dconf gsettings when a setting value is changed
> * Gtk3: Fix leak in GtkBuilder template signal connections
> 
> [...]

Applied, thanks!

[1/1] gjs: upgrade 1.78.0 -> 1.78.1
      commit: 7b5fe50d04cc9176822f91fe683049fd1db79ceb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


