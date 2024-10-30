Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A7AD6B6BE
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:48:30 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.21844.1730311259597462828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ed29Qjxv;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e30d517c82fso72483276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 11:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730311259; x=1730916059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEWRTIvdHaK7is2dyJhk+EwJyuvdHvtZrG/AvEyrMmU=;
        b=Ed29QjxveSuKuOf2RmnValUHWKYoQ+PbIMI3B4ImmnJLfHnkhSNHEtrxGj9jdetBms
         n6gzqcw4dSlSXBcd9ACcQA/NbbnWi4gh5EesAglEAhnrBxumQEIQM3rhiX5AQviKmzNN
         DntGT+WjJvR3abS3dYtGfxmeehvVEkkyIJCwUNz08bewDXwmQm8rX9zXPtLUyKXbi9Xq
         5tRzh+qqSkcvQU3b/zB0pOkld+0OYO4CR+uwYHmqWhTCtPOp0O39PnRI2aM/UGBcveE0
         RqNwxm6GA4gweoxXLh19hfyJa0+LmJveIn1de3DE81hXhwdi+BIGNBc5ylpCNyewuROf
         0bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730311259; x=1730916059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEWRTIvdHaK7is2dyJhk+EwJyuvdHvtZrG/AvEyrMmU=;
        b=xAiOyX2Xzr1FG4BH70JWyyKew4odZi3wxIjZIoJ6q3TFmGtjYwl1kirLm4GbwbseeV
         S7GxGaqUMfz1PfvcISJb/jCN0q05a5HJppI/SJBKt4BR04EqiGIvtYbvoxujpnwW23OV
         v9do5XLB8yKoTCuiEhKjDq66zq+ES+vJYV3dr9FeLRfz/ZNbVGZZ5Y7UicZ748BBodSc
         7l/isxrF/CndpzmzoBodVTmX9CBgJoLNtV+gtluvNuWdb4NHxa23HsBkybTVBauCuKTZ
         6fh+tB+qz1FViXqX6wXHjtQsx4wc5yJHvr5NMuUdyDCdSbg2HDsqSD5QJp+xk9fvp9iM
         bo5Q==
X-Gm-Message-State: AOJu0YxsjZDYOQ+eMtW5wE3qK7b86bfQQWgtvUEHvcpbiJtpSuGF5g5+
	mDou69YWzFrPxoXS2X0R82YeO1rDmO7CMP78qQakdykIHjQFA+JQ
X-Google-Smtp-Source: AGHT+IFHEgh6eyeUhJaLH0rxrdSgoyS+Q2Cq11DYInTN+6WNvJ+2i4bGjM42nrcAP80fjZ61Ht3+1A==
X-Received: by 2002:a05:6902:1009:b0:e2e:1940:44ec with SMTP id 3f1490d57ef6-e30cf3e5c0dmr4451429276.1.1730311258106;
        Wed, 30 Oct 2024 11:00:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30cd90dae0sm533275276.17.2024.10.30.11.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:00:57 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: archana.polampalli@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] nodejs: upgrade 20.12.2 -> 20.15.1
Date: Wed, 30 Oct 2024 14:00:55 -0400
Message-ID: <20241030180055.21030-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030071608.1496074-1-archana.polampalli@windriver.com>
References: <20241030071608.1496074-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 18:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113351

If you want to upgrade the version of nodejs in Scarthgap perhaps consider cherry-picking patches from the master branch instead?

This first one upgrades from the 20.12 version you are currently using.

commit a1e16928bbdc63342f17094f96aabd2024f78129
         nodejs: Upgrade to 20.13.0 release

commit fe440f16829ad6642f852e5468f5bf53d3daeec8
         nodejs: upgrade 20.13.0 -> 20.16.0

commit 32da6bfb0e8870cdb87acc428e2dccc2a1962731
         nodejs: support cross compile without qemu user conditionally

commit c8f4a786402063d160fa16284c16c8fca8165a5a
         nodejs: upgrade 20.16.0 -> 20.17.0

commit 8937be5718b5bc398d3f4ce0111635c700af636f
         nodejs: Fix build with libc++ 19

commit 410a442f89ea394710d20d337b9da397b537cc25
         nodejs: upgrade 20.17.0 -> 20.18.0

commit 2698039ac432d861465b84fc650fcaa8526c8a3c
         nodejs: cleanup


Cheers,
Jason Schobnerg

