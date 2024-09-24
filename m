Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06850CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 07:58:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8663.1727164708915349468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 00:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ca5uCTmx;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5367ae52a01so6237211e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727164707; x=1727769507; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtPhW4rziXE7hhBPrgrfdlBqdSje0hwXm7rghuXPFjk=;
        b=Ca5uCTmxXzCL7n9We6ZQNmGFBTWRRGecOOy7IJcWKm+uHoUNnmjqZERddRq98/Zfck
         h5Oew9riRZS0vY0+OLFf5ZiWcB4TQkzfG7ybFG7cCxjAR7qpxouIwXWB80wwbf2ExRaB
         cIjcm/L+7D8QI+KSOmX9G6rubtrEWKx7KE0aCnH6chQfCKXeOFjPRlGDlFjOoO6pzdjG
         nwmkFdm+DCz/3KpGaGj5mkAuIBAGZeJCcy9nydXn6kyc27FxKfy2uhkYeN/1w9FgYe74
         KSiGkLp4fF9WddLOXDyI1lQx0na/QQfvSGLonUY58Py5Lfy7y2yjIKy8IEayIeupWtvz
         3hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727164707; x=1727769507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtPhW4rziXE7hhBPrgrfdlBqdSje0hwXm7rghuXPFjk=;
        b=jJQMeTU+TMwquaAXXQo7o4M6YPsD5uk/XzdulKydACXISKR0mTHCvfqKxbgLATfvKb
         HRh1XZV6frR8wtopERoo4vaoM6K34kF7WciibsVxZLtNyqenONFEqJfDn+vM0vL7jAyV
         8XCG33wVre69eFodz6anl5aA+0RSX+tLRTV1crJvf3pukBH3Avo5i+RDpQSPfGvNA2ra
         tdCLULI2T2uyBXZ8tGchi5c+bachdO6rXXfWJWF6R8NBpBJ4speZZGdmCu8hhvfoCYRa
         t0L0l1VpdRON7x/yUvtpIwKncLPbNzbJUXcaHjzUDgm9WQBiZtFSwtsOUTNEjqG4HBcg
         KvlQ==
X-Gm-Message-State: AOJu0YxnJRjgzKlt6AnfUaR5b+b/vgZO0O4Tc7eUJiyYQPKZ2iNpFK04
	F6iMJaQILfrErsmkowtfvuLkkn6UwCNcY4Ib+tqusf2xTeftNRqI6Yj3a7ml+EM=
X-Google-Smtp-Source: AGHT+IEshNh8ubzSwXENxGH1BEyLGKPzkky0OEeYTbjo9NoSDOADva02rrEkT67auhpGlM2P8E8LxA==
X-Received: by 2002:a05:6512:1589:b0:52c:e393:6634 with SMTP id 2adb3069b0e04-536ac2f2a5fmr7007168e87.33.1727164706976;
        Tue, 24 Sep 2024 00:58:26 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640b13sm120399e87.167.2024.09.24.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 00:58:25 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:58:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: quic_raghuvar@quicinc.com
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [oe] [PATCH 1/3] android-tools-adbd.service: Update
 ConditionPathExists to /etc
Message-ID: <ZvJxHskDsWRlz7S6@nuoska>
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 07:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112475

Hi,

On Fri, Sep 20, 2024 at 03:07:48PM +0530, Raghuvarya S via lists.openembedded.org wrote:
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled

I know this is a backport but I think change from /var to /etc is wrong.

/var and /run should be writable also with read-only rootfs. /etc is not writable.
This change requires read-only rootfs users to symlink /etc/usb-debugging-enabled
to some other location like /run which isn't nice.

Cheers,

-Mikko

