Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id EAD3A78661
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:53:36 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id l24so18549264uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IHBP/vf3ui54RmIce6XDSGgXP68IPEhAQAONqFwrMUc=;
	b=BNa1Z/a6c6/pAtJezfR3yXanrYyOmvKX2Mvj/3cPM+z/c3yQpRKE0rnaNe+/+2Jxhu
	cJ/Aag75wymCdZvFnq5N63dQzu9T1w+qPDQ4dfw75TjF7vyVqYeFd0yTJ3iqeO3V6uET
	uxoS0pO2Nehyiivrz4WSxgszsxph1IofiGnGdgVlflyhktp+Q87q9KIBNZB1WGL+Ltyg
	Aq7ClRPH4N7qXoDm+nq47Gz0ufS1bokLBDzci0ulBoe/7n2jyYuO4kaXtY9EWWC34PPn
	BQr4wUqBZs+LUnxfij04d6jIxIFxzmLx+yEcsDfzi1AZ85DXniPvjRwr0WIgaRzjZlaY
	i6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IHBP/vf3ui54RmIce6XDSGgXP68IPEhAQAONqFwrMUc=;
	b=uKlCqrdiqMvyB5h0Dk7pDreKdRa/tuiNDJ6wbMTpt/q0o1qeT1awp4ZQFcImVHV+aJ
	EpAqQKhqaa1pH1L0hLS1JBG84p13hobOl2CpcwiT3/HulTag3J/+V7ypyBYAzzFMBWpQ
	Yga+mnja/6nsiwoS6fjEDjUPJtWV/Ik31V2/eXA5HtS5SEMm5HAkCe996UKXWcc9Ae0c
	L1+RsbVvW1Sk5pufQxwfg6Trr43b0jriMANVuaqZyVu1vasUMRvNQXlAntPYdCvuTdWq
	x8l9HpDDUB6y3ykA8y1RJSHD/Y0GCmbGsaZhUNGJYalkgOIx88osE765w9uQmtkChpb+
	B75g==
X-Gm-Message-State: AHPjjUi2VeLOdG++DrrV3BVxZc2/yAD8pSMRsE3PW3VPTSiRL8R0YqYP
	4ZQ/yJiKqu9mVaAmojApGlwjSEaLG44lnAOWSjg=
X-Google-Smtp-Source: AOwi7QBFqMPiVNZMbbX2bK19uBOFSDPxNEV8vuX7tZxKM6dVbo7KhTZ02CCy+LEfkZQ72jRKXwn3mSln+vTvkpVMkqI=
X-Received: by 10.176.77.76 with SMTP id k12mr14941249uag.141.1505303618050;
	Wed, 13 Sep 2017 04:53:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 04:53:37 -0700 (PDT)
In-Reply-To: <CAMRc=Mdg8BwYvbuJ8rqzXH-5dBmBP0HBgerZCXS-ap7YP=VXGA@mail.gmail.com>
References: <20170913110447.18816-1-brgl@bgdev.pl>
	<CA+chaQeKGd0Q57a+4hax24Tmcv=XtWAzNazC47OBzdf4djX7fA@mail.gmail.com>
	<CAMRc=Mdg8BwYvbuJ8rqzXH-5dBmBP0HBgerZCXS-ap7YP=VXGA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 13:53:37 +0200
Message-ID: <CA+chaQe5UOetfk44y9HqphdssMCv+jbRxsvD3dM4YKEQH8R5UA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ceres-solver: add new recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 11:53:37 -0000
Content-Type: text/plain; charset="UTF-8"

git fetcher doesn't use SRC_URI checksums, just SRCREV

On Wed, Sep 13, 2017 at 1:48 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> 2017-09-13 13:39 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> > Don't use github archives as they might get regenerated from time to
> time.
> >
>
> What do I calculate the checksums from when not using tarballs?
>
> Best regards,
> Bartosz Golaszewski
>

