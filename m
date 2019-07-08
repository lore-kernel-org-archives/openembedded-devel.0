Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDA87D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:10:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id k18so14742701ljc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2019 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=JWmT+QKGfjXYLw9VIfGKIAXtHLV7IAWwwFpzyJ48eio=;
	b=ZCBy45HRhiNsy4VkDHCm9rNyIh67Nm07MhIyRf4cTsN9grIogzNfY51M6bsY8Cezi8
	WN3+RTzDrR1uzWYnGA3VywCbtjQfCWVveEvBRjW06pDCwD9hLNbCQZSI5Kyk74kmiYs/
	PJKzi2S4Fcf3l/IruwRp86SCiZS+62mP0M5xzxYTXOm6hzHm0Fzi9zb48Po2wpg2DW9+
	Mnj996H+cIbxfttCp0Km5vBzipbhz23X1emnhFvQ084wV/yt7oP+DXKzGpj/QjHVTJGi
	/CwilZfbIKH9J5V1gKuQuOs8eOhsbQYoeA3B4U5UkpKv+6JutjIY5V1G3n/TxdNQbvuy
	mB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=JWmT+QKGfjXYLw9VIfGKIAXtHLV7IAWwwFpzyJ48eio=;
	b=LoTtw2yS674+cURov+m7pf5XuHBGRwM0eebSD1XaC5rDiDIkg4V08vrf1Dz1XwR0y5
	GIpi1rpAf1Xgw5drPL+ZXO81jIBpcm3thdGQl5iPsLKO6RmUIOWBEyTRdfKLw42QixpI
	qzUvZqx83w6oDUJm4VksdmqfPivRLSeRZwcGlLC1FDUZ+Yx7hpp7U1rUc1MnFj05FOUa
	7UO2+DHTqcwCezDyS1XLkiq6/2iXl77LK/OFaXeatDOTKL1c5cD71cC/DhCBvDhymZ+n
	3WY4DHo02BuzFvjDeVGf+Qqq0k+2AKHmJqWXGcUm53gWyX53kPyLh0auCceiUEPW0PR1
	pM6Q==
X-Gm-Message-State: APjAAAVLbMEhstSVCKxkCOIT5zELU6SvjqBnApGsYiOdk3zUyZsNeyWs
	z1f4+455mnZdD3OFJJBDw6G+1cI/hUXuPkEJ0qgnow6ebfc=
X-Google-Smtp-Source: APXvYqxImLLQHLNxjjUEwKJ2H4nAQGE2D7kRwqxZaIKmabEMjYtnMOHawXM4bwetycACJK+rnYnT0qeFw0EoYQ6XNfM=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr2598lja.94.1562569852375;
	Mon, 08 Jul 2019 00:10:52 -0700 (PDT)
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 8 Jul 2019 09:10:36 +0200
Message-ID: <CAPybu_0wQV+iwkbUTYm1hF3SQDa9pqke8z4u1oSwDX75eJyKug@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: WARNING: on wrong $PACKAGE_ARCH
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
X-List-Received-Date: Mon, 08 Jul 2019 07:10:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hello

On our organisation ( qtec.com ) we support a distribution on multiple
architectures and machines. Since the introduction of multiconfig we
have a single builder and a single package repository, what we really
appreciate.

Unfortunately, there is one single frustration, and is "wrong"
PACKAGE_ARCH. For example:

- -native packages that DEPEND on non-native recipes
- tune-arch that have some  variable dependency on MACHINE

Some of this errors result the same workdir used twice and invalid
packages.  Debugging such errors is not trivial, involves horrible
error messages, bitbake-diffsigs and non deterministic errors (the
build order can hide such errors),

So I was thinking that perhaps I could implement some tests such as:
- all and native can only depend on -native
- tunearch cannot depend on machine

I HAVE NO IDEA how difficult could it be, but before implementing I
would like to know if that is something that upstream would be
interested in, because if it is not upstream I will have hard time
convincing my management for getting the hours required.

What is your opinion?


Regards!




-- 
Ricardo Ribalda

