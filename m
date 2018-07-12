Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 83F16754CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:46:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8BAA22086B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1531377979;
	bh=tTbrHMwSu9z+eFrKktWn2UxofcO6Xz1pOi9T70NIjZ0=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=GXvqmljYkOtlVzSplswrjq/BveVcnRYLxOIV0tQATCVDYQA3HubAbOf32mH0uuMYA
	sG0oG+wmxD7AmLAT5EjdvD/T53SUPqbfOxs0YczMoqqwzFKdo93wOtigIHIUPT1c9z
	6YQGzd/hM074ZePqwkPdWZBGvy/B7EItFDjaz0V4=
Received: by mail-wr1-f45.google.com with SMTP id h9-v6so20460908wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 23:46:19 -0700 (PDT)
X-Gm-Message-State: AOUpUlEhUjhN+yGjiz1ZxclDNL1e0w5qUpCCvNw9OEoBpwkMkBtStxLC
	ViBB715mZEnwHQkjvaJ0oSw66IbxC33xPkRjyMk=
X-Google-Smtp-Source: AAOMgpdnRME9Fc0dbDyWBBefmwwxCfP2Zd4opjst11g6tY+zfPnvyD24u8JUFj4TQLMcLQ36OYIdDsqfTwcSIBK5vxw=
X-Received: by 2002:adf:f390:: with SMTP id
	m16-v6mr632600wro.279.1531377978090; 
	Wed, 11 Jul 2018 23:46:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9141:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 23:46:17
	-0700 (PDT)
In-Reply-To: <CAMKF1sq2a_uN6s_P=RXes3PYFx=j+zGSzuruK0Kjbga3ct++AQ@mail.gmail.com>
References: <20180710155532.6127-1-krzk@kernel.org>
	<CAMKF1sq2a_uN6s_P=RXes3PYFx=j+zGSzuruK0Kjbga3ct++AQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 12 Jul 2018 08:46:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc0gD+x3yCppb9x9wsUwXUubhFoGEwXb=LEKM--9GRFhw@mail.gmail.com>
Message-ID: <CAJKOXPc0gD+x3yCppb9x9wsUwXUubhFoGEwXb=LEKM--9GRFhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libkcapi: Add new recipe for v1.1.1
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
X-List-Received-Date: Thu, 12 Jul 2018 06:46:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 July 2018 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
> This fails for mips/musl builds
>
> | ../git/lib/kcapi-kernel-if.c: In function '__kcapi_common_getinfo.isra.2':
> | ../git/lib/kcapi-kernel-if.c:632:3: error: 'strncpy' output
> truncated before terminating nul copying as many bytes from a string
> as its length [-Werror=stringop-truncation]
> |    strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
> |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../git/lib/kcapi-kernel-if.c:629:3: error: 'strncpy' output
> truncated before terminating nul copying as many bytes from a string
> as its length [-Werror=stringop-truncation]
> |    strncpy(req.cru.cru_driver_name, ciphername,
> |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |     strlen(ciphername));
> |     ~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> | make: *** [lib/libkcapi_la-kcapi-kernel-if.lo] Error 1

Thanks for letting me know. I'll take a look and fix it.

Best regards,
Krzysztof

