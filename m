Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5390C7BE39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 15:12:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b3so11061703ede.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=obAG19fXeBjayiwDmAyer+JZBfF4P1abtj9Vtya2WJg=;
	b=XHNA/OuOHj3I8sq7cFpcyl7I1aj2O/GDNCYxu3b1+G06AtD3LRbvdZ/31MeTalbmg0
	L57n0n+Gdp5L9A7izX7/qJ615x7bLvQBVGVZwGP+GgNXJ3f4+9sBhkSH7AX6jJlkv7O+
	TzF2z1usSWARJnNmOeVMCl2C0tDobKHbIDXHeHnJvn9ST8W6R5sWsN8IDJjSnic45h6N
	18f1D5wP23v8otqqO3nX/OePU+e630ftkIYhNtS5uQBqQauzz0+CeCc0mQ5kme4rBpSA
	A37ZGXvzgmakiuGMc8NizbhykQWFyiBqp8AW2bkhI1WjMQyYfc3zMzj7o+VQ8jh3Ehmx
	xGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=obAG19fXeBjayiwDmAyer+JZBfF4P1abtj9Vtya2WJg=;
	b=fhDxyJCCH4ONY9QsC3hJVb+Bm2mYiUfGaDmxGECdCihfJsxCXQqnmhnxZ+kt+4k+UO
	ZWJWJUHMNpfy7daXNSfxfP5qOzFPdLxV2o+fjuvHlN1u2AFaZ4oOtbxoc9fOQPzFHGQf
	BbSiIpZQFDh6L76bI1CDZKMU4toQbEyxJ8hArkJ1YSwyJr1zZshSGjdhuXM6zPJake12
	WVlhY69WbR0/0+pOu6K55YdZV0O6oT9RikGIsJWAXQ83G8Vx3y8t5C0dlT41u/ar9Few
	gu/bsZEut/cwq6OD4/TmUJYTBUSs6dyJXd+OC0bkBdaagNhyFrxoHlfpyQiKdIO07NLB
	o9vA==
X-Gm-Message-State: AA+aEWbaFAdIyI42oIw92U5qRo5n+JREmCHPSZmjbtQTpEvlOE7za8YS
	hmxirqUvvu5M2PtGOjTpKhuziEECfyAv/o+O/84rng==
X-Google-Smtp-Source: AFSGD/V0Lq1xK+r+Pkgr9vshOxtKrSTAMd7KH2kRyPfcUHEgJvAH6w+/tUOiW7g+hlUphGPdN5Qj8arvqAYI4JjgAOY=
X-Received: by 2002:a50:98a6:: with SMTP id j35mr13064076edb.141.1545059570907;
	Mon, 17 Dec 2018 07:12:50 -0800 (PST)
MIME-Version: 1.0
References: <CAAsqSTcN2Bkk_k_MLEWSTesEFEJURrXvHdyY2TzuA_fEh4iJUw@mail.gmail.com>
	<6c8e0af4-bb46-ba48-eafb-a91a60bc837d@skidata.com>
	<CAAsqSTdT-+0y=m_Oo2+8JEAmcGfVWLktUgXLG5LZ5qSmkHfVSw@mail.gmail.com>
	<ae008457-e85f-59b8-07cd-fbe13eb55cdf@skidata.com>
In-Reply-To: <ae008457-e85f-59b8-07cd-fbe13eb55cdf@skidata.com>
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Mon, 17 Dec 2018 15:12:40 +0000
Message-ID: <CAAsqSTcUVka9cWOueYVEKQj=tzx0Xuge3oED3dVdp9M-CXZPzw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: better interface invocations
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
X-List-Received-Date: Mon, 17 Dec 2018 15:12:50 -0000
Content-Type: text/plain; charset="UTF-8"

> No problem, please just put [sumo] in the subject then.

Sure, thanks for letting me know

> Ok. Just fyi: We will likely update to 8u181b13 soon
> (see https://patchwork.openembedded.org/patch/156314/)

Great - I'll keep a lookout!

There is further information about my issue on jdk-dev.
The thread starts here:

  http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002246.html

Attie

