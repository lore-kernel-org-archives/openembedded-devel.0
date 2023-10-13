Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671FAC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 13:21:00 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.38169.1697203256646827131
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 06:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nfVhWfhf;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c50906f941so7990791fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697203255; x=1697808055; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxUlFvBDMxcEYbMyIpC7P6LM8IiRpAEAEXVLeYxtwtI=;
        b=nfVhWfhf3jyz5+jxnJe3cxnXyQrZCF7DGYqo2gfY26GeX6ot7x/z9zxDIcN7EEnb7s
         gnHpMQwIOjgG0XUtaOBIE7ODfbnqHkYW/zm0eNIA8maSVUwEdydKXbQ2Nqaus7BH6jss
         UGz2Pfv8+Px/l6gaEwLA1UJwoWqUjvhZH1hyrDTz2lzvAKxptLm8enOTIsIy/Om08zoR
         SF8svCrcQ5YyWZ7yRxZJhtRB3S5a1jxnxSYO2VTr6zxmqAIU25e//It8NVAYv8K7gD+f
         DXXlI8BQaXW2hLwLDSjNPpUo92shSv3Y9ib3VaRPmwVEQE77RL0FEMhVJMlYfcmINhsc
         oLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697203255; x=1697808055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUlFvBDMxcEYbMyIpC7P6LM8IiRpAEAEXVLeYxtwtI=;
        b=RAU9ZCpn4rpcB/Ijqh2UIbeUOa61IQvIJPAIHg5123dbpSOYxH7FJxjnXqIKmZ3AN0
         Hidu8CzAqQfZez2v2fhCjfnkKXz6gaTHXeMrXoA5f9TqKk1uDKGXdY5NwFvdJklWJru4
         EsEdAUEKZaybDEFTYxcyG0WoDOFhoLJg01xUmCeDh8SDDHM69e4gA+v46ge+JJc5SX+U
         bA0qR6YOcrhMmCak+dmrjkmwWBW2y67Zv5gaO926HoM7MTuRObNjKKefZqh4bHrvGSuZ
         oS0xFmIvAl7wsftfB2RpN3F2+/VnzyucrtoqCF6UgIC5sJ1mOWRAZI7/jw88BgLNLXq+
         3ihg==
X-Gm-Message-State: AOJu0Yxnu03ad7ldQmDRgdmXSWmzlg0QEltpTz6gAcfO+3SR2WPYuV2l
	SZaaZ3QIOvEtztYLwrzR7dbXVQ==
X-Google-Smtp-Source: AGHT+IE+Zj/wNAHGkQeTEoEJsVbOHlbPZnVMiJ6Z/DsyLT1OdqjThGkbXo399CgcJyS/8zKIR8iH3Q==
X-Received: by 2002:a2e:bc19:0:b0:2c5:9e4:3fdd with SMTP id b25-20020a2ebc19000000b002c509e43fddmr1530817ljf.27.1697203254276;
        Fri, 13 Oct 2023 06:20:54 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhpt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::199])
        by smtp.gmail.com with ESMTPSA id a14-20020a05651c030e00b002bcbc62dc22sm407718ljp.86.2023.10.13.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 06:20:53 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:20:50 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: upgrade 3.4.1 -> 3.5.0
Message-ID: <ZSlEMt2vRc-57r-t@nuoska>
References: <20231013125705.322898-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013125705.322898-1-beniaminsandu@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105467

Hi,

Adding CVE-2023-43615 to the commit message would be nice. Maybe
upstream omitted that on purpose if the issue was not public
when preparing the release.

https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2023-10-1/
mentions that TLS with null cipher and RC4 are affected but I hope those
are not used in any real products.

Cheers,

-Mikko

