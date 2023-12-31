Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B54C47DA2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.198911.1703983110356078224
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2GZbRVd;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2045bedb806so5303629fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983109; x=1704587909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6tNtyzfiBZXuDzFEpvl4vCG8ZFJzTqH8JUFsqULk9M=;
        b=E2GZbRVdzIfQ3EN9KNcFiULiHMP0+MoNMmQCyDSCGIqpJTSa+J6SZohCdzcre+g6K4
         X+PkfZRKDLX0qZOYwDjHcsrfJ2/HdXByGI5Z3IKRYtPVdwmGDi9dlbCJV3ECZb5EcDEO
         YvrLzNF8/vl6HriPNzogvqUkgPHcEBqT+PQmCPrKR/MdZV0XfR5OBHKXoMl4QKn1YmO5
         f8ZDh+3y0LG4ckF+j2NoDK9JhK5j9QZJ6yVdmjae5vfa8qe8NEhK2ljoJxFe+x3rEFcv
         dyV/+7mzp8AVV0ZyUUookvam5X1E01D4lozJRn21dN7eR/GCJjPGBEXUGc0N+YOpGyKJ
         OEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983109; x=1704587909;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6tNtyzfiBZXuDzFEpvl4vCG8ZFJzTqH8JUFsqULk9M=;
        b=IiHIiYbkZ3qJS4gfzsunFY7mLtnMS6NG/bNLpElUhaqenvlZ0ZmhAi181WlyvA7HPO
         nuXhdcUij5owQSDfas4+xTAS9v27rgVUqtX0drM7rohI5EpyUVv8rRFq2hLjG8QDlo+K
         Uwy2hwqppK9tljxpm013rGMz3UYlqR8f42V/bLD8ekwiDrbnYQoHKM5W6NXlc2Y+gXgQ
         ncsti1DwmAMUxl3DMiUa5S1en63doNdLIxGM2BwKLCX/KA29Y+QnaWlX7Gtyh+9sbm/3
         vi4jGi1ygs/1A1kYnLXPdm+mWpZZ15LVuvy+mBXd9IqLFstCdeorx6RE1kGmvy5W875L
         WLOQ==
X-Gm-Message-State: AOJu0Yy2MtEDFDi+fs0sMtJ2vNmln7TwWiNpsWIfze6kqmjcbfuqKoLm
	oUkhu+Mec8jtwEGPONSWXaEzlXp2vcw=
X-Google-Smtp-Source: AGHT+IHOFhFmM1COQTKHI1ptE4Q3wwNbt3Ln7VlD3hndJgo4Ow0uNTEf2lcRmq839qa+Kak+4X5AsQ==
X-Received: by 2002:a05:6870:32c9:b0:204:316:5eeb with SMTP id r9-20020a05687032c900b0020403165eebmr17894645oac.62.1703983109400;
        Sat, 30 Dec 2023 16:38:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574219-12847-1-git-send-email-wangmy@fujitsu.com>
References: <1703574219-12847-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.31.1 -> 1.31.2
Message-Id: <170398310843.873206.17355380076813841289.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107924


On Tue, 26 Dec 2023 15:03:39 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] libmbim: upgrade 1.31.1 -> 1.31.2
      commit: dd093656b9cc2def64307387ba45da61451d5397

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


