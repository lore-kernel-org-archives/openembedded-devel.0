Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AF8C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:30:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9413.1705397427178722097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SmqDKI2P;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e78f1f41fso10144999e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705397425; x=1706002225; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkkXswt0Wb/0pOvChIpJVhpMW2bMIuAaU4RJoDAvV5s=;
        b=SmqDKI2Pc8DpZeqtoxWqh/P2hVvt1BLQazPkdTppBUHqj6Dr+EoLNBjiy9TUlgh2/d
         ojc1FDwGlOFkR67RtzglwnGpArdynhl1giUDSvPCEQtmKttIkaF1O6qJ43olLHm5SCNG
         6UObyrfFUGe2UuVFEfmqTaz3MmQbDPXTV0Vb+ev4uD5cpmSoNPgOUM4NWjPKl0uXarwv
         78uUTtIO3w4quBghxW34CnUDFQvcNAri93e9N77OOlI0AA3fc9370RC47tR224AicutO
         ceK3h2qb+qNebTtln+E6pn+9oPDk9w4XOr3YShZddTsVXZocuYIXhGmFqkuFthicnEKv
         njyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705397425; x=1706002225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkkXswt0Wb/0pOvChIpJVhpMW2bMIuAaU4RJoDAvV5s=;
        b=bCFLl25GB1G9Y3kx5uwlN2c5GgvFv/vCjQ12f25V11xjfhZAUKAlKw8x/ZeIPJQo8A
         vUN7dVgSCZUN0Im82v4WJoKWJ9KTFbY39miKgFXq7WD+fR+VS8U6ssmk9IHrmWdYq87r
         QO0D579m3+Bfpgp8YVxifQOzKXdUuwx0lyjONIVEAkyZX2ZANBKnn//8Tm4RQ4E38WYF
         CbZ7XjLk+BcAcSMbxw1url87SX4F1Rfjg4rUvEW7/veBJ2IS9eu6SxG+GUqM0ClVv2ED
         ZRFWQLvbV+2WnAe3LZICmwL0hSxIUMac2HaZcGdF5OJC0XYpbML0RasZ+CQfTQLtgv1J
         7JtA==
X-Gm-Message-State: AOJu0Yxu2psbUlJdkgZjTOfvP/Kqb8GtdvRPS5VHPcVGDLJeez9aUnGG
	iPbRJAXQQC7nWhM70V04iiD6nzu0Gn0rCRbBN9o=
X-Google-Smtp-Source: AGHT+IGFfR6+HwJpvODNIEA4TyPPxmM9UZ8ZkL6ySu1jy8HAdNxnJUUOMVxFZiUqcbaFjqZV2wYM/nQwlPdzYuqFCdY=
X-Received: by 2002:a05:6512:224f:b0:50e:f73b:fe68 with SMTP id
 i15-20020a056512224f00b0050ef73bfe68mr1616370lfu.107.1705397425245; Tue, 16
 Jan 2024 01:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20231231122329.405225-1-alex@linutronix.de> <20231231122329.405225-18-alex@linutronix.de>
 <e056ee1f-78b3-4f94-947a-c8b159717097@bootlin.com>
In-Reply-To: <e056ee1f-78b3-4f94-947a-c8b159717097@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 10:30:13 +0100
Message-ID: <CANNYZj-Q+GSw7VWkOu=mMCNCFZ4vO18Q9cztOtv8qowT0rQE-g@mail.gmail.com>
Subject: Re: [PATCH 18/23] mongodb: skip until python 3.12 fixes are available.
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108300

On Tue, 16 Jan 2024 at 10:24, Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
> Would you have any updates on this porting?

I wouldn't and I don't plan to fix it. Mongodb is under a proprietary
license that OSI rejected and thus in my opinion doesn't belong in
meta-oe at all.

If it's important to you, then you need to do the work.

Alex

