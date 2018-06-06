Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id EB2C276027
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:10:12 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E70132077B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1528269014;
	bh=kKkr1+8iU2+q6YA3szdkMkYDyStDi0YAnM2kTg85ppA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=B2LGykEnZBMZEaaFnSVQkRVvUKLZ0IDiMtsiz2HzjTZWPe6SHOrGL6S5gOfgveQ4q
	E09QXPhxRyN463hYP+2YD2yXf7qkBL/j3M7Q10eN0SEufUzgcoaB/3C83Z74rDOAgG
	d4sfQFASoXqvB5lHUAFJ3H8R/3s1MOcASKrR34o0=
Received: by mail-wr0-f173.google.com with SMTP id o12-v6so4994252wrm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 00:10:13 -0700 (PDT)
X-Gm-Message-State: APt69E2EGEWfpcXGSeY2TbdsXaLapkhuF8x6vTGDCJOvWd7e9ysVHM82
	3aY+yHRxdunasfDeBFISjls1zlcUUK7hGq9LlcA=
X-Google-Smtp-Source: ADUXVKJ6WxFhaSHMCTbpcrLlEte2jVXeVgtSRfnRilAhrUc8IKEwF+JjMoSq7JN0EhxbdZVfO1HgJJls3OKZ+vF7oyo=
X-Received: by 2002:adf:f391:: with SMTP id
	m17-v6mr1215201wro.279.1528269012481; 
	Wed, 06 Jun 2018 00:10:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9166:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 00:10:11 -0700 (PDT)
In-Reply-To: <CAMKF1spWoahwg8+kiEdYQ086q651=+67DCb9Cwx7gkjuwjcBug@mail.gmail.com>
References: <1528107496-14737-1-git-send-email-krzk@kernel.org>
	<CAMKF1spWoahwg8+kiEdYQ086q651=+67DCb9Cwx7gkjuwjcBug@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 6 Jun 2018 09:10:11 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdiH7PhJc=PdOC+ryGExFc=P0dHyY3XLPHFK+Fh1Jh+MA@mail.gmail.com>
Message-ID: <CAJKOXPdiH7PhJc=PdOC+ryGExFc=P0dHyY3XLPHFK+Fh1Jh+MA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] lshw: Add new recipe with B.02.18 version
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
X-List-Received-Date: Wed, 06 Jun 2018 07:10:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 3:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Krzysztof
>
> This fails on musl due to basename() API not being available
> you might want to fix it on the same lines as
>
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/poppler/poppler/basename-include.patch

Thanks for hint. How did you build it (how can I reproduce it)?

Best regards,
Krzysztof

