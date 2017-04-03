Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7209477D11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:04:34 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id k6so175335566wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IW4Oq3SQOPhfsQwmomrcilQQO3h3xBe4xbcQxzcsd3k=;
	b=T85NweexcTpefsMZ4NsxyPhhBzFzmw56Cs2foTv9+SZDOhQN1QzecTKdl1FV1ptjtC
	BZIXt5DIGsA76FSusAcZehzbfzQQn9hWhj6fEbrWj2N+cE2cRWWaeKLPrcP/GGFLx2Ji
	QnxW0zEAQSxaSuCfukNe3A0L8glaDJdKpm8L5kVgbENgTPjnvUL2sqE+BX2zs158eAsj
	14P5mChw4akuDpCXneTG8Y4+D8691JCWu94PGAblBVM3pCuowfbCFaDG75Y+a9Ymdh4t
	NzglwlLNSsDgc9P+lVAGGE5IFCpxsrPEbpU4ULOM8JDPevwjQzDqMU4//lf1mZg9hKWX
	egpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IW4Oq3SQOPhfsQwmomrcilQQO3h3xBe4xbcQxzcsd3k=;
	b=AFmwdo9d5UAvayYcTFRABi4KRiVA9Wki1HUkEukGfI6IvtfHS4nPA17VvlfFs6FUJb
	K5uu2uCP6lFJTTiChbD8gLi3oNMiVUmbf5xU3BUipuzzMlv3fUHrtBx48iWXxCowSYMT
	C7A0LUtECC6d3kkdPtP+q2i0ofd4Qm51hTRVxbLzuUyY8g3PIfLOIycTIK2ENh2M+CwN
	HDLRUOcQ+CtjDYwDWIRd7Dehh3MKvg3ojGYpmo3E4v/nM9sOJcV/+muvK5DNmAPB/K6D
	esOSxZA8MW+9ryqEeZUTRlkdUExT0EN6FehzFb7t74TuzZbCvtBzm5ttQbnq1Z3z04ao
	wkoA==
X-Gm-Message-State: AFeK/H0c57V9IcI+PNoCqkYveG0sAoPGip2cIgskVAiTxgjt5b5chvjqIcNVP82wV3cn0zE8XbhtNOn4dgOnTA==
X-Received: by 10.28.19.207 with SMTP id 198mr10256241wmt.49.1491242675082;
	Mon, 03 Apr 2017 11:04:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 3 Apr 2017 11:04:34 -0700 (PDT)
In-Reply-To: <20170403170132.19588-1-zboszor@pr.hu>
References: <20170403170132.19588-1-zboszor@pr.hu>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 3 Apr 2017 20:04:34 +0200
Message-ID: <CA+chaQeh0DU630Bp2sd+Mzk+Fq-1=h1oJveKSeSOrsGU0+8Wfg@mail.gmail.com>
To: Zoltan Boszormenyi <zboszor@pr.hu>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Extend to kernel-module-split.bbclass
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
X-List-Received-Date: Mon, 03 Apr 2017 18:04:35 -0000
Content-Type: text/plain; charset=UTF-8

This needs to go to openembedded-core ML.

On Mon, Apr 3, 2017 at 7:01 PM, Zoltan Boszormenyi <zboszor@pr.hu> wrote:

>
> The changes are in two topics:
>
> Support kernel module compression, both gz and xz. It needs
> the kmod package to be built with zlib and/or lzma support.
> The space saving is substantial.
>
> The kernel-modules meta-package should refer to module subpackages
> with versions, so if someone upgrades only a limited number of
> packages at once instead of everything, the kernel upgrade can be
> done by typing the kernel and kernel-modules package.
>
> Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu>
>
>  meta/classes/kernel-module-split.bbclass | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

