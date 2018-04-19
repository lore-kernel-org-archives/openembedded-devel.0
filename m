Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 37BC074601
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 16:45:34 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id v64-v6so6543618otb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9/4HJMTWWHXTf8h+1wXAsCL3SGd6fl1Eo7V57y3HQXo=;
	b=K68fLZUPxZseMp9/XqIhRoR4xMUCCaIoGmAVVCGvJcp0LtsBGMP64psQpVvA8JLDNH
	+2fQCe4j84oSWFlAf/da0vckHGTuWYqGtuKzU3/Vy2S+h9uGJ1+sEh1flOQzznirDTSe
	x7kdNs5IwJj7+xPj3TfV/Wwgyf1UXsJDaGqlASfcCpulx9mJ1dCBQRtQzGs6lLY1PGGB
	WQgzG8/jCmBMVjlW0yQOWEWX55x7RdgaNWodoIjWW1Zoe1eJcblPJ2rRigwQk9sA2vhB
	jZYbDUMYpd7ZmD2Wo5sr8H3ERsIcRlDmNeqvV5rJaogq5t+gIx5Kv1m0noaACqVCkGio
	ehpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9/4HJMTWWHXTf8h+1wXAsCL3SGd6fl1Eo7V57y3HQXo=;
	b=T8AWbq1kMcNwj+UPR2yQ1iW3uAm0mBoWsOyHf6t8FhmH+0uFFgD7u1KMdB/ITFMi1U
	yI5Eq1dCY5VKzRHAG3vHrIJGWtUOp97JYDwHxulJvl1k8F+b1Dm6iBqdmgYmxxn08EE4
	m4b+xvqed23n9BN5zEgNl9y3Sv/VNy077WAi2rHg3V4cPv59Zoc4PREmi7zaIuJupTi0
	RaGlcjP/M/BbIV9PS4MZvL2lU1wo6jBMNoj7xxE8rOgVojZ9cI8018cOtBKH/rLaBqiE
	W/ijua3Bvi2Z5iPe/BCryW8wkg4hzC4J6YAgwdt12aE0ZlFxD/I4Yv2rVct/v0Ka75f2
	iiXQ==
X-Gm-Message-State: ALQs6tDOgPspktyTW9EPJJ2bCpv7Jli5AP1zCxlvfg1QrPweRPNr9QfQ
	K6by7fBQMoCmP6IckqdLUerqkMvo42KG0qkPTt8=
X-Google-Smtp-Source: AIpwx499To+D2NU3QPB08g0feyKMGrJj/hvm+XvCL0IdKMQ4eJWAIh/TlFrAQetZWvsrHOkurfx2D6y0WH70slE0tjo=
X-Received: by 2002:a9d:1066:: with SMTP id
	o35-v6mr4127686oto.299.1524156335938; 
	Thu, 19 Apr 2018 09:45:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 19 Apr 2018 09:45:35 -0700 (PDT)
In-Reply-To: <CAATN8PXQ5ftKQCF8ZmWxdb92sst0AAZ3QMK7HMS4WRtqP9gv8w@mail.gmail.com>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
	<20180419141737.21053-2-costamagnagianfranco@yahoo.it>
	<CALbNGRT17R_aw7NGTGo7_n6dY5ULsppkoE=OKfTJxC+vDESweg@mail.gmail.com>
	<CAATN8PXQ5ftKQCF8ZmWxdb92sst0AAZ3QMK7HMS4WRtqP9gv8w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 19 Apr 2018 18:45:35 +0200
Message-ID: <CALbNGRTnEb=D9X+Fc8i4m5AC6xW-uKEQD1Q6aDLY8X_4PfAMQA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 16:45:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 19, 2018 at 5:44 PM, Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
> Hello,
>
> I prefer whenever possible to fix upstream defaults instead of downstream
> patching.
> My goal is to drop this patch on next upstream release, rather than
> hardcoding a path in the bb file.
>
> https://github.com/Microsoft/cpprestsdk/pull/737
Agreed - did not know that. The best place for this would be in
Upstream-Status - that is missing.

Andreas

