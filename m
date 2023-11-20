Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC00C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.43627.1700452294562559704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FOIBzHG8;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-586beb5e6a7so2343793eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452294; x=1701057094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyAOQGQLEx0SPaFN83qATHkagEB/BZ2XEHSkwgHoxNs=;
        b=FOIBzHG8bU4rFOHUnXht7syi8IKynwkcje/qTMQkkdzgc0OtiPhFMx444zqGLEMrvp
         5lxLb0Pvm7ubrbyMrYxUGs4eXLX+BkgGzqcg4MjaSBLMmLFErz8Yqr+7SGytv3XOQDdK
         VecrtWwUIfbJEKnsnZTcYNHP0ZZUXcqtPppTgIBRTcnp6iut7UgIN+n8TArUtz6LslHz
         zxwBPlRXpu93PVY0Fm9dTkq2OqlXUFoOFPZffoZjWN75a5k7WBq78eM0zIwZOaUosdgO
         yrPoeUEEsTI6CIow4nBF5H5RhOyXCmq9mT+XJN68jU2PR2zO4EiEHu9MmJY7O/OeQzyX
         IJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452294; x=1701057094;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyAOQGQLEx0SPaFN83qATHkagEB/BZ2XEHSkwgHoxNs=;
        b=eSy/tMhUDaSGEB+RKoaLsRQ6Mq/cuZ3j5Z9+LQnfiYCB89A1VPUX06V3Tyh2HBJAR4
         FJ+1QGdofb1fsN0f/5Fy41t82GUWDhPT1o5sal1V11/sHGoshWWfmflZbDWv3FMF/+PY
         HZHhc93WrikywQiGhR3VYpGpDkLW+IIuUSjzfHpFZkh64DJwLMvIWr87owQr/37SFalU
         gJuAWDmnFzE18DwVA8JqbGL6A3ngL3n0Xi6k8x+d1ZK+s0/EUIoEe34vN8iMgqoJdI4c
         /xziyVo1l1wNL3pixyWG5eqKZ/OAIm0QaElrCb+IEzYhVMXjx1c8d5yCLjhv9AXpQfr/
         w/Sw==
X-Gm-Message-State: AOJu0YwcR4592sd/YsXxc7T7w7qRO81fwRRETvg9814DVZW8c6xNDQYi
	jBPeWqRMAAfPF1s7DfKuZojwJxB0CC1pzw==
X-Google-Smtp-Source: AGHT+IEjImJSx9fIl81Zw23KilhIygrzMWu1s9RImIEj5cJb1fx6J/Ohv1i2dPvnFY1c84CUVXB6HQ==
X-Received: by 2002:a05:6871:a011:b0:1f0:d96:8d9f with SMTP id vp17-20020a056871a01100b001f00d968d9fmr7293586oab.57.1700452293858;
        Sun, 19 Nov 2023 19:51:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joe.slater@windriver.com
Cc: randy.macleod@windriver.com
In-Reply-To: <20231116214335.2431020-1-joe.slater@windriver.com>
References: <20231116214335.2431020-1-joe.slater@windriver.com>
Subject: Re: [meta-python][PATCH 1/1] python3-django: move to version 4.2.5
Message-Id: <170045229285.1416826.3909388022110619683.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106949


On Thu, 16 Nov 2023 13:43:35 -0800, joe.slater@windriver.com wrote:
> Fixes CVE-2023-36053 and CVE-2023-41164
> 
> 

Applied, thanks!

[1/1] python3-django: move to version 4.2.5
      commit: 13057d943a517e2ed12184150ad4dc8ad1fb5c4c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


