Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8D0C4725D
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.31456.1704682032996566671
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=asmN9Oce;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d427518d52so8648705ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682032; x=1705286832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gCnWp5iFtU/4IcAjKVRkh9dT9zmWQrdUDd3E9Cx/OY=;
        b=asmN9OceQ39X16j2SfCBapwVdLL6bWKM24WdMCr/z3avf0NnJCPmzYbbgtySOSQSW0
         NjLnnfNfeLq1jmzklbuPPCyl2bhijx1smsmh6sXf8aMc4cN9FFZIvwKDguh0pPwPDBma
         sRKAd/uH6y8QvAQGuB+i+YVmtQtFiK25hV6racdwVOfkhwCfiAUVbR+IcsKA4o40igL9
         lJlYSlBgixZGH1PQUjmG9VxBl737wAwwORHjEz9vbrN5QyqLDHjxl1+E5AIVKfP3ilU6
         Pdf4vsNOH7SoQAM6juHs7seZax51whsfW4fr8n9tEEwa5LUwVv3tDzNS858p3aPhise9
         X/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682032; x=1705286832;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gCnWp5iFtU/4IcAjKVRkh9dT9zmWQrdUDd3E9Cx/OY=;
        b=K9R4m4sxInMG7MXwzuyBbnUazSd6qtjx07EuGtPU67DIadeIQvekr0q7f6B/EpsDfs
         y3d9AHiX0495ox4ZfESs/g6d3gYV/3wL51RKHX3apu1B6y+lOt9gfRQ2fcgC0rwckk8x
         96B7t6oql+NkMThHIsToJqauJErJCgjL3Vo729nKShlemvuC3AcONj1fl39YDRYr53k/
         ViTZcG4G+SJckmy87B/NyQouDpENavsbYyJ4r98iG+ukUg3deEjOfWHydrvHc9uTlafI
         gq9XVnuGowng1K5wmYWFq/mNtXA2BkNobCZEtoDSpJ9Em2xDo1S3h5KRY+qiGzwl8kwY
         Qp8Q==
X-Gm-Message-State: AOJu0YxTQIm5tkmryFslTWoqqUhBiJyoh/zgkQQZu2B5f+406EMCZe2B
	1mAg/rDuASGXyJx37ZWiAFwHnT0BI9U=
X-Google-Smtp-Source: AGHT+IE7Jm7/ZDK+tMGijQ4b/CFXyCgU9eqrpz8DYc+h/6jwJeWIOvE1QoMPcX/M2KNOBiKhElhgZg==
X-Received: by 2002:a17:902:ecd2:b0:1cc:5671:8d9 with SMTP id a18-20020a170902ecd200b001cc567108d9mr8098168plh.27.1704682032142;
        Sun, 07 Jan 2024 18:47:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20240103114112.445488-1-enrico.scholz@sigma-chemnitz.de>
References: <20240103114112.445488-1-enrico.scholz@sigma-chemnitz.de>
Subject: Re: [meta-oe][PATCH] krb5: use PACKAGE_BEFORE_PN
Message-Id: <170468203152.912276.10284640916702384720.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108116


On Wed, 03 Jan 2024 12:41:12 +0100, Enrico Scholz wrote:
> The 'krb5-config' tool should be in ${PN}-dev (as intented by
> binconfig class).
> 
> Use PACKAGE_BEFORE_PN for extra packages so that -dev is handled
> before -user.
> 
> 
> [...]

Applied, thanks!

[1/1] krb5: use PACKAGE_BEFORE_PN
      commit: 34a20e8b8aab93baca3cf0c84da4efa3140583fb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


