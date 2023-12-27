Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE592C47073
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.97645.1703665270342425698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiBzKEU/;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso1259161a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665269; x=1704270069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX0XkIyqKONPNUpQbp8IAFYRhqTVYJnuOla1Z3LO250=;
        b=iiBzKEU/nmbfjjwrsLrtaFyrzaddUh2b1y+ukPjG/hwO1+8Z6s/36PMd3HTDw7jvjz
         sThuY+lCeokmqLog+evSJPEkzF5pY1QxQV1QN/nybvrxrhgeJFRhkVRCd28c+euxRnYy
         WsxNaJtUbDn9Yax32xVhmllGx5oYLt1WrSS11ic/INAGyh0OteYewQA5v8XbUQTuAbsS
         KlpIk/dU35Q6OK0CC4DxbXeM2blM8r6OH78urNBjutYDqLZ5j25RnvQbgP7dYF8ntLxc
         W1f+9RFTgiUHFgzjNLM0H+JS7wsUqFSiY14FeoRIPzhgrunT/4FHjkToC+Ddh8bzdGDE
         Hj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665269; x=1704270069;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX0XkIyqKONPNUpQbp8IAFYRhqTVYJnuOla1Z3LO250=;
        b=xT0oX2uTohpriD9PV0kN4G5MqPxrd7gojM3eI5i41B1xPB+clKJwi+9SXB7r0bARiH
         O428cD3mfZscLgS795Yh1esinjLCk3an/oIPUCJW1BY9ZXzpRq4cmjwW7lmP0ypgdFP6
         OVs4HPRQAlWjz8f10dWeFNOYNLn3X8eepDTc8+fudqqy2luYv9IDuvnXKMfVDsSG0C3O
         +vOYw6jzUBWm92L8NvqJ1e8NS0pBOfZg9NIOipc4ELuDCJzCjYi9dI2nEMskAoZGbS9n
         mhkPVcidMS7QDk+3p4qjyvTGc8a45T7WCfxrNGtQ9XxXE1Nv2D0f7ugVYIKAz67h2WDY
         AndQ==
X-Gm-Message-State: AOJu0Yzg0rfLE7pE+nDiJU94UZALAmZNojjYU68Qv/wBiptknbDsjhUX
	ULnB2KIhmTzdChFQs2HhTrnc87vQGqg=
X-Google-Smtp-Source: AGHT+IGG01giXHRglzbsUJoGdtNQJkYl6kGPrsK5t4VVyt4HqDVqX0NJr9mbZEDXGygLfknKiBbysg==
X-Received: by 2002:a17:90a:6c06:b0:28b:eb30:edf2 with SMTP id x6-20020a17090a6c0600b0028beb30edf2mr2434510pjj.81.1703665269454;
        Wed, 27 Dec 2023 00:21:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231220064012.30571-1-alperyasinak1@gmail.com>
References: <20231220064012.30571-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] qpdf: upgrade 11.6.3 -> 11.6.4
Message-Id: <170366526850.1947762.2579643856168928859.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107813


On Wed, 20 Dec 2023 09:40:12 +0300, alperak wrote:
> Changelog:
> 
> * When running ``cmake --install --component dev``, install cmake files, which were previously omitted from the ``dev`` component
> * Fix the Linux binary build to use older libraries so it continues to work in AWS Lambda and other older execution environments.
> 
> 

Applied, thanks!

[1/1] qpdf: upgrade 11.6.3 -> 11.6.4
      commit: decf7095704a947fff76769421cb91a4aa99a58b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


