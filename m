Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FAAC07CB1
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:02 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3218.1699900433903248161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMv+jxbc;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5bddf66ed63so3449362a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900433; x=1700505233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZM11ZZCRg+4hzJsiYJUymEUkh+LVHJyugU+MTmU3eU=;
        b=NMv+jxbcuqmiwpB0bPS8mlnRENAXb5SAp7WZhtGc24PtaFAWRaiH4R54nPH32T7Jb7
         4GOpOemR64CIEtXC5pGpGKgj/aHTW/6qKX/WyfF8Fcfv4e45kSVkpy2aJeih0/Kk1Oys
         2pE9yWBAuLR0zbZKBggMoRWCGxOFIejD1ApYWlhpv4hg3dbERo+/VWG5+4MAQ5weIQRe
         wQorTtxssWi11NPX6UnlijXztRyphIWGiEvdUo4TgUsxbONjEZ23rxs3camuU6on8gyT
         rWfAnoK+sP/uD8EKdRZiNeVJL2kxk1eArKjoR4XQhnRvyQXeAfGlImhvR5tlnKSKacQy
         Pzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900433; x=1700505233;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZM11ZZCRg+4hzJsiYJUymEUkh+LVHJyugU+MTmU3eU=;
        b=KrFVmA6MmLwzybcAGTLQpkZElikUAFaNTN/JpjQ3JBnMByEsdZJBg3VSFCSf5F6Box
         Kifzf0tfsanyTL6kaMsgwklGsvj3s/0NAkJw1qs9qpk/CNyuQuNMHCUOYtX57QByB90s
         LdwPit+nTaUqYXLbnF23VkDnhv79sVCCYmUJq3bXadfhzOuuos+iejKnkqXM42pLR9AD
         rjCREBlFWMwl+hBccQ53CUH6txNCkJeBi9fCbIPx7sYmSXXFd/T2SuPa9BEtUVK8SP9w
         M8nYRMOMOJA0AZdbsDE8y5RlFWSexmXS7Vd7PVhXqndPr3a0wQ5p9iHyHtcDX2o2LX38
         QZmQ==
X-Gm-Message-State: AOJu0YzbU6j0TBiHOGXe/zV/b2Wee7jaCmIXPuspvAiNJcnkLVVPlD05
	19vRF6AKU5c8uf0F6zeuk33LhSR6eOvADw==
X-Google-Smtp-Source: AGHT+IH9CW7gDMWJMTb6o8naDCLt46K2Fc4nW3HT+xQ6gn56yqK/aM93JDMrFUGVzdfFhZP0ftIokQ==
X-Received: by 2002:a05:6a20:7da0:b0:185:9de4:fd31 with SMTP id v32-20020a056a207da000b001859de4fd31mr423366pzj.18.1699900433043;
        Mon, 13 Nov 2023 10:33:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112095452.118629-1-alperyasinak1@gmail.com>
References: <20231112095452.118629-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][PATCH] fuse-exfat: upgrade 1.3.0 -> 1.4.0
Message-Id: <169990043191.4418.5906234252517769300.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106656


On Sun, 12 Nov 2023 12:54:52 +0300, alperak wrote:
> Changelog:
> 
> * Added exfatattrib utility which prints or changes file attributes [Will
> Thompson].
> * Added FUSE 3 support. FUSE 2 continues to be supported.
> * Added support for timezone offsets [Nathan Hunsperger].
> * Fixed device opening error being reported as FS error.
> * Fixed possible data leakage when uninitialized clusters were allocated using
> NtSetInformationFile() call under Windows and FS was not unmounted correctly.
> * Improved compatibility with autoconf 2.70.
> * Fixed disk size reading on NetBSD [Dave Vasilevsky].
> * Fixed "automounted" option handling on FreeBSD [Iouri V. Ivliev].
> * Allowed to specify the "nonempty" mount option.
> * Fixed file data contiguity handling bug which could cause performance
> degradation [noctis].
> * Fixed possible crashes on invalid UTF-8 sequences.
> * Fixed a situation when FS could be erroneously marked as dirty (not cleanly
> unmounted).
> 
> [...]

Applied, thanks!

[1/1] fuse-exfat: upgrade 1.3.0 -> 1.4.0
      commit: 12bd7824d245db95f7d8c9f815549884496b15ec

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


