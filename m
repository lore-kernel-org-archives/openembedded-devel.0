Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A70867ED3B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 19:07:28 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s22so16842244qkj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 12:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xdHCfJukw/dI8JiQ0/kmqT4WXbctWh9WeckjpqqgWy8=;
	b=pjA9vP0bZ/kHD/gQzI7uSnpXFBHMy8q1SMnSeqQOu9tu9JeV18zTT0ANKJlxnJOQMT
	jxUscejX3PNtrvCIU0XM8k5YCT/kwOmNXCiCyRCQKy3cIW8bL++sn6xHfbQjsAsL/U8Z
	vuPQdRHai1bCmvJU4iV/1KCX/WTYoIxf/7/xsARN49g74ICl3fFvjU8aJKU1xgRPDCSs
	LOJWHKAdGDdAtkDSGRF+7FnwB/TGDQJ35yHeJn+V2ff05lDjCv5cBubGfwIdnw7ILhBd
	cp0wQ8j78NQMCrItEWGsbNqA0uJALn2wTiEWU1Ujzqvj5H6tg+nGOZU2CMYrOFNw8vpM
	hBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xdHCfJukw/dI8JiQ0/kmqT4WXbctWh9WeckjpqqgWy8=;
	b=lRYcaQ8xGbZFSy/N1VDL1JOrn9MdnZpY2uhV3fTYiu5Mh0E+/TjB/INtPCCdsmwl2d
	2RetMnwZzpB3TRQHeUEzSYEoR3lpN2TfUBaEcBWM0wLRew/M772lNhvze5wp/8ua8MLB
	ddP+kiL38d7moDSQubkj6eNlDBgEG+7pxgllJdoqregumIfnAC0Uyyqy2JAYC9BoWo2L
	u3CGh1pBm6Nd/2hq0UudwEwRdPH83+ZkkUwcu4GsOVuNTH+BShg84n0aAQ+RwKI3i4NG
	1Tz7BShE/ZKeRFvmiwM9/TKyMg2nEJR8r6C/LNgWCf+CBRwjq9M5gu6JbMGI0U0QWjYL
	U98g==
X-Gm-Message-State: APjAAAVVAASpnGVe4xk4LUlDNisznPDQ6jTUZKbOc6IC5qPVzbKMICHG
	Z5ML2IqFOlqKqjoClGZS7KGxcOqVVlzoXj5/NT4=
X-Google-Smtp-Source: APXvYqw7rRp/NE+PQF4HkvKTcOG0ltcEGFZPCLMXAebeQQ1+6A9KPrn+lleVG7QEFuRafZhs/wv/e8lXq4CbIqnz6r0=
X-Received: by 2002:a37:7083:: with SMTP id l125mr19518965qkc.71.1562699249334;
	Tue, 09 Jul 2019 12:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
	<1562032691-128301-3-git-send-email-changqing.li@windriver.com>
	<CAMKF1sosi=qQyKEk6uHJKAWibFwpF7G2eTCwPrVEEe2zLubjzg@mail.gmail.com>
	<20190709185241.GB15450@localhost>
In-Reply-To: <20190709185241.GB15450@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 12:07:14 -0700
Message-ID: <CAMKF1sqHxMLVpDygd6Ad=XYtQcoSqEyotPeEmnhoR1Hf6C2hGw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6 V2] libldb: upgrade 1.4.1 -> 1.5.4
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
X-List-Received-Date: Tue, 09 Jul 2019 19:07:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 11:52 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Jul 09, 2019 at 11:16:04AM -0700, Khem Raj wrote:
> > there is another patch to upgrade to 1.6.3 I will take that
>
> Please don't, see [1] for the rationale.
>
> cu
> Adrian
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-June/200359.html
>

thanks for updating me.

> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

