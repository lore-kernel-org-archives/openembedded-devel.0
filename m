Return-Path: <tom@harbortronics.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC867758E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:59:50 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u108so61263441wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hnx/7/CdIWaGGzJRzyEK4cfsoeiYl0K9O08A5W+X9ys=;
	b=Mjc4wRAZsxg5hZsVlP/+39OEZULIR9Sh/fSKy6WMktgZISz+XG+nYKcGwoFiWE0HDB
	mIGEwUL3ABodFEp1l7l17AtxdBL22sopMqI3IJJSOUKCruePqk8b0aCZFYQMbCgdOUcz
	/GiqsaLDli15ifUnk6baJ34Xmjj9ahH8DzjS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hnx/7/CdIWaGGzJRzyEK4cfsoeiYl0K9O08A5W+X9ys=;
	b=KGhQwU4sADmCOKd6YiyfMXrFFaajKw3IspVTJSDvYq1pRjAkDeaIkENeHjFV/G5vOC
	aQs6q3vRfRqYBzuW9IAoRhPEL6lFoleZlVLSz/pg5wyqI3ikO+rx77RUQsIIbycsGxx8
	75vnnNO5RbwL5/307j5MrZ7XhRzbNvfPVbCBHX38j1g426tcQOgpwP2fuwDRBFKMYSSC
	zKynYVbJnf3/yjX09UMY1kGLpzU78Is0AGIDDL4p9eeFjNjS/22SA+7bEnhk5HEtPus9
	nDdhq9KvmS/dszgN8T1i9KHCTC7QNpBsf4lVLxpzBokxn89/xh5dcUphcLM1z3QP7JMY
	HnGw==
X-Gm-Message-State: AMke39kK3uX6neB/2KYnArtVJiDxQwKaKyuxs7ShBmX3ZM4/7vDrwK4/qMtRnFL4JVlYMZ955BIpxu8iYuBWzA==
X-Received: by 10.223.176.217 with SMTP id j25mr15258309wra.8.1488488391804;
	Thu, 02 Mar 2017 12:59:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.196.74 with HTTP; Thu, 2 Mar 2017 12:59:21 -0800 (PST)
X-Originating-IP: [174.21.50.42]
In-Reply-To: <CA+chaQcRFVzE_WEpC6SMvEoEr1DSztM_whCUB5-2qZYJU9jJXg@mail.gmail.com>
References: <1488415667-57394-1-git-send-email-tom@harbortronics.com>
	<CA+chaQcRFVzE_WEpC6SMvEoEr1DSztM_whCUB5-2qZYJU9jJXg@mail.gmail.com>
From: Tom Hayward <tom@harbortronics.com>
Date: Thu, 2 Mar 2017 12:59:21 -0800
Message-ID: <CAGJSJk+ZuBh8Hcp4tdTUNbxtLDVjOOkbv7_R-ce5DB8-bcYBug@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse-exfat: fix mount detection of mount.exfat
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
X-List-Received-Date: Thu, 02 Mar 2017 20:59:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 2, 2017 at 12:43 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Can we pass correct installation path in configure instead of changing the variable itself?

Yes,

EXTRA_OECONF += "sbindir=${base_sbindir}"

accomplishes the same thing. I'll resubmit this with my sign-off.

Tom

