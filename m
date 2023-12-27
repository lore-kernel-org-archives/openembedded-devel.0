Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B38EC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.97649.1703665278438221481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FO3WlgJo;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59446cd46e9so2051018eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665277; x=1704270077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6goivcGzJMKBOc+yZqA4gjCn64wHQ73YcDhn77Fu6Dc=;
        b=FO3WlgJoO//79/8aQ3GgBTBchpw5uHMmngLnEQLcfADZwdcpT8Jq6Q+WNH/bjKhX6g
         KuyYrulALxbd6EOM/O69TUzmffcPXGQRWtRf+nGoiluBkv17yp1Rht4v7a3BNkyAG0dp
         HgSa3SJzpudiXgZDiiye93/AKRy6A3MrdTmgGzvbrKMdJd6liAqqAN0pAgFj9kDtOfqT
         1i1bPDiPF39FwmK0+cwrpIB/Hz9bS8Z4EMBLygo3hXnyfuHPyIhPa7dyIEL4vbfojAja
         4uBCMSiZ660KEje9R1AWTt33pRxTBqmEnNRNbS/dptJxJe31zoF9T2sDSgzw0SILCb65
         4n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665277; x=1704270077;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6goivcGzJMKBOc+yZqA4gjCn64wHQ73YcDhn77Fu6Dc=;
        b=SfScwDzIPQMnKrQXKmb8AJKZP5LDB+23YDUzjx5csjQY5epVkd2YohyPFK14OwE54+
         fWU15eWFIYvwDXqi9gpbBdMonFLgIrdHNXn0+lFSwCawkibXXJLa33yilcZWUBby2DmS
         vDvoy4RIlThbUDp+3q2f2a1Wc85c3dCO0qlIU7+7VwAQXZi8we9ASnxiC1vv7ROyVmM9
         WbxCrpMinvn+0LkOuhjG1cd2pfMEWwqH1dSYDUluMkKUJSj5nfNaO641CcndY8DA4HzJ
         Q7HZDdszLfzGTqJLAgbjV97P/gw9suZuU5gABVcXDnYPzhIUp1+nAftRU0ra37SQcmVK
         9xgw==
X-Gm-Message-State: AOJu0Yx23McGGyfUgXS/pkMWCsH8fkMrTAD92e/NzbTShdmyqmGwzw79
	m1Rcx8f0AfmoKt37aoTMrSYYHItGgT4=
X-Google-Smtp-Source: AGHT+IHWqUFUnTt5mXCpd0Wq8iyEH8jSqWyUTENGBP4z1xZonPzn1Mylc12CBZkgRCrSXrBQsCH2qw==
X-Received: by 2002:a05:6358:3a02:b0:172:ea55:1ae2 with SMTP id g2-20020a0563583a0200b00172ea551ae2mr10465427rwe.37.1703665277528;
        Wed, 27 Dec 2023 00:21:17 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220215618.3782492-1-derek@asterius.io>
References: <20231220215618.3782492-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pymisp: update to verion 2.4.182
Message-Id: <170366527665.1947762.12479858077477407396.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107821


On Wed, 20 Dec 2023 21:56:18 +0000, Derek Straka wrote:
> Leverage pypi rather than git for the source download
> 
> 

Applied, thanks!

[1/1] python3-pymisp: update to verion 2.4.182
      commit: 85139abedd78bd6ecf48b516a5c0e3235ae0c31e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


