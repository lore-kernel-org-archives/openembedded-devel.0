Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F023DC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.43615.1700452279596870635
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLUT1ncR;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5bf58914bacso42236427b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452279; x=1701057079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfWDnK9ZotC+rjtsGOdWAEXR1hbn7xvXy8TYd7+dyTA=;
        b=cLUT1ncRM5V0F3uF9yhvnoVrk9qDZw4a0B88gkifVR9w9R9jPaYN/EZwHyAwEcBj+Z
         2us0uOVMcoa7tLOF8f5SkK6GAk2UO149RvfYha0jpFgOdLWT5Oenn/I8As/6dHOU0gmI
         dcVXeiTYOy7NF5x1Q9AlDgXzA8MyKSIDvRZVg82qk4eCukDTldn1ntAF2h0CVeBBnr9e
         v74orAAyaf8WUAnD7DC/pGfXlzOsayZBAZNJBI73Eu0FaM6wLmYavJAt64S3kXvxWNwy
         hBmX1L6Khcmbgz+yF31npo8M7AO1HBMLEp5lZY01Gf3lL1GPaDWgj5yS4orSViVrT+Qc
         eE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452279; x=1701057079;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfWDnK9ZotC+rjtsGOdWAEXR1hbn7xvXy8TYd7+dyTA=;
        b=f9F10nafbyJy3CFGlwkuMtiiVuqtQ+CDC5gpvirh9trvnL6Z7yu2Rkwt0DfuA5C2yU
         rfwKn/vyKWK54O66ESqPocEGzKkkK5yHRDqsWCy6RmowhYVwX0jNtdiw1A94oAaaJerZ
         wnnfDdEWVClvRnueSGe/XNuId2y/Px0C7UbJ0Ftvqp8Cbc7hGVdFmX2I/VJUWe7o0/tk
         L7nocpptoa4T/iqTB0aGC+ST8ePvA1IxSvNOMqWED6Lim258B9Pz6rOl6nlEljYS1G2F
         SXGqkxEXzH4jiBqlxcPVMAA01Nn3gJqp3oP6R6tO70yJuq26vvgcj9c5syNQRwjBl+ha
         waPQ==
X-Gm-Message-State: AOJu0YwfmwV+tmpF+NCh2meaZldnf2NGQFFlLLs2eLoDT5Y9nhWmgZB8
	/ZnRM4wUQmSv6f9F0cHinN96fM61pvyGSA==
X-Google-Smtp-Source: AGHT+IH1pblEUFiUNU/Awnf6wbGmTWue6ylHzfWaElmRphKBodVNPeLgammFLJvRr2YJtjTD1VgvWA==
X-Received: by 2002:a0d:dfc6:0:b0:5ad:cd52:d6f0 with SMTP id i189-20020a0ddfc6000000b005adcd52d6f0mr6079332ywe.45.1700452278732;
        Sun, 19 Nov 2023 19:51:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116114643.959704-1-alperyasinak1@gmail.com>
References: <20231116114643.959704-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] ocl-icd: upgrade 2.3.1 -> 2.3.2
Message-Id: <170045227775.1416826.7128493563518341387.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106934


On Thu, 16 Nov 2023 14:46:43 +0300, alperak wrote:
> Changelog:
> 
> - Add support for system layers
> - Implement published clGetICDLoaderInfoOCLICD extension
> - Define CL_NO_NON_DISPATCH_EXTENSION_PROTOTYPES for compatibility with recent headers
> - Updated OpenCL Headers ot 2023.04.17
> - Remove use of __builtin_expect in layer dispatch
> - Updated pkg-config to depend on OpenCL-Headers.pc
> - Add cllayerinfo tool
> 
> [...]

Applied, thanks!

[1/1] ocl-icd: upgrade 2.3.1 -> 2.3.2
      commit: a0beb827293b266964d8af0c48628cd5e5490461

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


