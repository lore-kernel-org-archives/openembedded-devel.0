Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66410C47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.31446.1704682024397174453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLh7BCes;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28bc7155755so411244a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682024; x=1705286824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCs95EEC/WhVz1GUIs3iqPWdaBGNB/ajGnvIrZ5hysM=;
        b=HLh7BCesgKMSiZFlinnZkQVOoDbHr6RnOnHTid4qF73/PmD5TudYA9ZrtzOIK+EwAZ
         2uOKUEZ75MQFhF1ePwtd1s2xVGbKWJIq98CRdAv0pLhQVpX1hDTBJrMQz7qnP2awSfh+
         8iNMOY7TzL/5hp7Yco7PNEbWYd0UKw+B6rK3tM6aLVwA0fcU8jMwiADGb3MbAKDnbCN3
         0xhmcM4h+sSQvZCn/UndXlQvkFpLL+xDPimFU/q3h9gaC3jtpCDFI4/lpwUJ5RqCzDYx
         QU4g9C5vqQAcYjdX23deWjYMN8gfYNyrWabNcz5uxmRInEuAEMHr+xMjFgpZiJpQgWCU
         RW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682024; x=1705286824;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCs95EEC/WhVz1GUIs3iqPWdaBGNB/ajGnvIrZ5hysM=;
        b=xNzutSHxeq9Va4+Oa0KxRSGHX8jacobPhhsKNsiWwHp+95nvRrlTwAXX01DVhgFea3
         K+mCrxHI+Kjvp+DWJuf7ZW6cvUdeoFgBcVQt7Er5+/ziLi4air8VTfEWYWerTDkZDk+b
         4Ma4Z5t9BFhx6affGWIkrw2s/ardZVRfmGboSFPlGUcRIT7nnAGZDKq+fhEarGjhSZEC
         nntB6mF72kruU/i9sImfq8XhxDiRue9AKXEG14zDLa5b69yGmaufKMtnhEfGs5LR87zh
         HqsJR5d8kvbBclNGMqX/3lOi/WU5WWkbjiOCVxrxfSFhV+bHrFkXC1U7PRDItf0VhFqp
         ZwmA==
X-Gm-Message-State: AOJu0YzfXMwRiMU3OSiFdeyV0xd8kRaY5c/crp0l7BJPqgEKRNGlt5Lz
	qB3J2buhIwSQ5UmAMgqMT1D0reY4e1w=
X-Google-Smtp-Source: AGHT+IH+H/BSk/JUqTW2fp5buoLy1b2AhGh1Hp+iqwUaPETI29fgSzJD+msWbS9hoUMb2qYydNavIg==
X-Received: by 2002:a17:903:2309:b0:1d4:ca58:8495 with SMTP id d9-20020a170903230900b001d4ca588495mr930947plh.108.1704682023852;
        Sun, 07 Jan 2024 18:47:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jordan Crouse <jorcrous@amazon.com>
In-Reply-To: <20240102165823.12306-1-jorcrous@amazon.com>
References: <20240102165823.12306-1-jorcrous@amazon.com>
Subject: Re: [meta-oe][PATCH] collectd: Remove rrdtool from DEPENDS
Message-Id: <170468202324.912276.1403225307653298614.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108109


On Tue, 02 Jan 2024 16:58:23 +0000, Jordan Crouse wrote:
> The core collectd tool does not require rrdtool to build. There are some
> configurable options that do need rrdtool but they are already properly
> adding the dependency in PACKAGECONFIG. This saves building half a dozen
> other libraries that wouldn't otherwise be present on a headless or server
> style target.
> 
> 
> [...]

Applied, thanks!

[1/1] collectd: Remove rrdtool from DEPENDS
      commit: efa0a0af252ac78c4acc06b500beca872ef99e74

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


