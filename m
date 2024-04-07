Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3DFCD129E
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.82095.1712504587055541701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6xPP1q4;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed32341906so43892b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504586; x=1713109386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVy6jvXRWtNMtrpN79qMcM4jNG580/VNMbvs8XYDt90=;
        b=j6xPP1q4iGJ18pdhZZgDOEftnVHkdcXNmsYMtHCdrbMkYipyUxCAB/d5VHrmAHN3w6
         2G/057b7jD5aSFVJ2R6lIfNEix93tJHifUf3dW+GbiM3SrqlnC0bGwKZI3/bIkbQlGEx
         /C+ldCVa7nIaAw78pbX2uMYFU4Lz4wJjZS+IImEZbUGiClWEhUvsFMMsd1bJWcHgZ/zu
         CPsot61fU7CdTlobU4Z5DBRBuzuJZoRLV/abJb9QKaB1autBSPujH59ZfQxmYA/UVEN5
         VQsV0E1JggbcZurf31WTzfr+ay+uYHz+RZsLVv0f1ypRqWGqs1Z+8Iv1gPgWNk+N0ZUT
         TzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504586; x=1713109386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVy6jvXRWtNMtrpN79qMcM4jNG580/VNMbvs8XYDt90=;
        b=dNug7CFpYFOGyPES0AABh44U7J38vZM4U0/fQwB1zq92df/Yu1OfEc5XiZlcdhDye7
         TgQbwsqKg36Icm8G3AqMAwie0eBOW5vbDLiZsP7N3BDJ8yd/y/SBq5Qip4s6jd48FTeB
         7CTODv8zArlD1ttIDWgbJ6MuJVe5FilkNJXxnodQBjXTO05H0siWmU6N0MDnH5x+8T5c
         RUnAOCW782Y605gT+Sc7d5YzcApk9FYFCm9FBIw2nj8sHDmeMoAx4ixogBtLiyNWBNMv
         WabP+cGMgdMZk5jbjLMQvgVUX+ljTID++al35XwT6OLN5olzXoYJMM+7fN8rDFn+TX5y
         +cew==
X-Gm-Message-State: AOJu0YwrXf9rGkCfCeo6xBn5LTajF/ulZsIGMRe5DeC4HMUSlihYdNUr
	qXQeQET58CvnnllS2o1MR2rvIzn5L/62L3MSmpOip2m1aAD16D2QqTqqQx0c
X-Google-Smtp-Source: AGHT+IEmH6Zm7IohfwXiY2ALRheJ1SwKwRg8VYhGMmLaPQ9FLd3hUcA88Va+1byg2GLa9UcG+mqWLg==
X-Received: by 2002:a05:6a00:1951:b0:6ea:df65:ff7d with SMTP id s17-20020a056a00195100b006eadf65ff7dmr7478271pfk.10.1712504586145;
        Sun, 07 Apr 2024 08:43:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	alperak <alperyasinak1@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-python][PATCH] python3-pillow: Upgrade 10.1.0 -> 10.3.0 and fix ptest
Date: Sun,  7 Apr 2024 08:42:52 -0700
Message-ID: <171250415789.900727.1637898526642841909.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240406183004.663753-1-alperyasinak1@gmail.com>
References: <20240406183004.663753-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109843


On Sat, 06 Apr 2024 21:30:04 +0300, alperak wrote:
> License-Update: Updated copyright year and clean up authors, contributors
> 
> * 0001-explicitly-set-compile-options.patch dropped because setup.cfg moved to pyproject.toml -> (https://github.com/python-pillow/Pillow/pull/7484)
> 
>         Also, we can give the build option parameters as described in the documentation -> https://pillow.readthedocs.io/en/stable/installation/building-from-source.html#build-options
> 		Added build options to pass to build with using the variable PEP517_BUILD_OPTS so no need to create patch again.
> 
> [...]

Applied, thanks!

[1/1] python3-pillow: Upgrade 10.1.0 -> 10.3.0 and fix ptest
      commit: 5a02b76b82d1f48986212c33dddf7986385c79ef

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

