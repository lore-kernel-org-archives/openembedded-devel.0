Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3846C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 17:49:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2846.1750441769260572193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 10:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TAXaORLO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so15770285e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750441768; x=1751046568; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s0fYK0/otCOzFR6K/lxjwNLtE+7Ql3YGBM2WsLv3BYs=;
        b=TAXaORLO2GIYAN1ZEuyBOFyf+8a3Mh48cSYHN3pc3lqaE2iC7XCeCuJprQjZFukbUE
         TaCRSgykcXdoDNpbyIN5xwFPSGFtfh8B6gi35MIgVwrPkETrTvr8UdSTBGi35S15lQ81
         NDnzFMSMjkaM/WdMmCNQvocAvpJbjfEyud3/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750441768; x=1751046568;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0fYK0/otCOzFR6K/lxjwNLtE+7Ql3YGBM2WsLv3BYs=;
        b=uYOl8D4T+2h0RHkaLZ893vfNASoYm2m+fETwTFAwpPBxdlT+Wn1fR2AVx2plC9OI6d
         DMphPfwG4AQ5IepVW7xYeBOVm2XJuc6gIo8IPlln5onT70M48th2Fp48kWm/1tVG8PzF
         KxcpPwWoxFmBSwN6pJSAYhW5H5l+OI8GL/7IQj22fPPAbqVZZE97rMUEysFk2rkgTwZ3
         beelTcJZ823R/Eisdsgo9K/m6dcPaDWbwoVGKYvMIk2KbbczRbPu5u/xi2ZuASXyLghN
         Z30XtCGjE74ncSd38RuM0RfUsS6NDIieLrzISnOAwuxmegLT+HPYVCMFPdK5OfoEEUw2
         yVag==
X-Gm-Message-State: AOJu0YxMKaDhli5S2EWdbmn+V+jEgv0xGvUEkORjrw0RnjiKWQws+WMh
	2ZwDoRBZCVizOP9qnfGLjSQOkywMUqD3KPOSx68C9CM3QNSEHkMRsoLMYL4jBPc7Nt1bFQ7WE52
	NTf0qAE8=
X-Gm-Gg: ASbGncvaQAZ6k932hjNKhl4cS283C+toDbt8WS1nZ6YBl6YKi8sHsZ1jsN8fWL+GWLR
	I4tIC2yEgTRDgD+Ozbuvqvalfy1+BC/46qxFUadoulBLrHTUGD3gy4wf0SdIkYwamyXBSDDsPvE
	t3GjJtpjJDZPsxH4hTpuQytmx+vR0cT806AAl3VGP+hrQnm10sam3MraPVdb4boX9/42rfEw4nP
	ox18lA58Kki9oOi5O91Cdgo1601s/H+IswGkFKaiXOPX+OM+fEJflv98c/zUJ8nSWkTzP0hUtd4
	Atbt0NcWKTrLqt70RFaCH/vPA7k8t9Ur5zIaklVYcJb7O7MPKXH6yTH3Xg74ibOlDA/qqPodGYk
	KasIbGQ==
X-Google-Smtp-Source: AGHT+IGg1mirkQLb6aiUvp+aKLKxVlG/buOr37bZvR3rO21N8KGem3oLGwhz/iT4R1HmWHpiEWKp4w==
X-Received: by 2002:a05:600d:10:b0:453:483b:6272 with SMTP id 5b1f17b1804b1-453662c5af2mr25810365e9.7.1750441767736;
        Fri, 20 Jun 2025 10:49:27 -0700 (PDT)
Received: from max.broadband ([84.69.248.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e983a4bsm66660335e9.13.2025.06.20.10.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:49:27 -0700 (PDT)
Message-ID: <129c0dd0a015e07194ddc629f4b116fc99b68a4b.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-openembedded] [PATCH] suitesparse: Update after
 toolchain selection changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jun 2025 18:49:25 +0100
In-Reply-To: <CAMKF1soTE4VvLTHRcAVDkby4UnM2v18hojkie3RQY_zuwgZTPg@mail.gmail.com>
References: <20250620101405.2455812-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soTE4VvLTHRcAVDkby4UnM2v18hojkie3RQY_zuwgZTPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 17:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117985

On Fri, 2025-06-20 at 10:38 -0700, Khem Raj wrote:
> This one looks better than other proposals for this recipe so far,
> but I am not able to apply it, would be good to rebase it on master-
> next
> and resend

I've resent a version where you can drop the patch in master-next and
then apply that one.

Cheers,

Richard

