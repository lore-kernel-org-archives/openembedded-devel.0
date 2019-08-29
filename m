Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BA32A7F2F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 16:01:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t12so4215129qtp.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EL74jnADS3rEctjfOa256O5O+rIiNw7UDo5DOgmi73g=;
	b=ju4JVwhjHcoAHQddjZ7EzjHT+ishO+HZQEHQrlvcNN4Xd5wIfNr1ECeXYWBSvu1hP5
	92X30ArnfcoePqcfCq3jGDJKG7BrkpwdoUpyIYnNHwJsL8akk6dpk1A03oLx2r6/+60v
	kHr4VaNA1aBeF8lxVt1Ilci2/8wdtcFt7UhNHv5k6jUG84+V8Uzqe/uB/+UfbQqjV14S
	+ZwnBfKNwTCVvm6Oi32p9TP8tRqywbv2DR850dtKI65LkSKTbaLBuPIzSfZjOp+RWT24
	ZB1Pv3ZHoR6sB/HlpqckZlZ2UvvZLmq68JsXf40FIvJq9xdCVOGdw53AQsyUFg7vh/9k
	ll8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EL74jnADS3rEctjfOa256O5O+rIiNw7UDo5DOgmi73g=;
	b=VZ7iQ0FenFc5fcD+BOO2oAoJa9sILMMif7Jm5f31wXnisGfjGSbgB9nbHTMVLYABmu
	nJIslzY5nR2zkos1bOvcTUAxYvoYv40jfPXtF9vwwcHhrxgfANW9yCqjXKydGp04PCZk
	9s4+OmYHxF+l51NEnwBNu2+k0GcTqmaiLP+UxyYfXs0Q8W7BtnIYnzYBSU0//0f2ipDL
	MhUdOQ5M5dRFYGhLR+NShefq+DYPm1BJlcHEiDPM0quJjgfnvLecjmfiJLTMFbJnsdO5
	AXmvXffX2BY4PDfrYi7tuGR6AReqTJug++tS6UfYcaujAy0NnT0R33ZNTA4PXa2MQeev
	j8SA==
X-Gm-Message-State: APjAAAXHu3/DNWfOAGkrLUZV2aakm0s0BNRDmVprKpqfYM5cRSh0jbHE
	1tIuOJ1CBrDoJCAt4B/Fh4s2lyTDPKdUuUro4Wh2GsaZ
X-Google-Smtp-Source: APXvYqy6qU600yeG9ZB4RdJWHC7TJ4rv3b8t0cTXbMoD1V7t1SGiicLL0X4BzfvLi32OHZuy1dlEcRMLk5pTDyO1PDs=
X-Received: by 2002:a0c:c548:: with SMTP id y8mr7107374qvi.68.1567094480195;
	Thu, 29 Aug 2019 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190828171538.16160-1-bunk@stusta.de>
	<20190829095514.GA32705@localhost>
In-Reply-To: <20190829095514.GA32705@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 09:00:54 -0700
Message-ID: <CAMKF1sqjEuq-A-crLhRO7fmqDLg57K3O876EjfjGuw4+AskMnQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Replace EXCLUDE_FROM_WORLD_libc-musl = "1" with COMPATIBLE_HOST_libc-musl = 'null'
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
X-List-Received-Date: Thu, 29 Aug 2019 16:01:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 2:55 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Sorry for the confusing submission, but these were two different patches
> doing a similar change in different layers that should both be applied.
>

such changes are fine across layers

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

