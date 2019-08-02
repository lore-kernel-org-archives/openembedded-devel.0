Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBD260291
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 01:16:12 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t8so53585668qkt.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2019 18:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xUzWVbZMoozd1rns6Qg5I2Kd4hRAHa+6r+yh+R2RVBs=;
	b=SbugZC0pQVz2B3NwJ7QqOrr4/IjHuG8xyTZlAmBZAWa6av9iSdjNq0XwFXvFFTm62Z
	M6lnfgQ4h2+Ad48qK+EqJw0hMcGi+mg7r7QcjqbAWI5L6tK0lsBo5HuEHVqNXwUGSOUI
	lZtNmSYmR0p07Ud69nFOcx58KHzFLP+wFoOu2FlGLMKbEQBN1k6THsWkMAiJX1hPhBW+
	ySOQLDD07nrAUz6FGk42oTzEPfEqPTuM4sN4ahaI92Oj0m+D+jCIHRUchlN/GXp3MAGK
	yPPABuvWa3mGLh2tfiAgYagvhJfzIrIAq2MAnEnb0uwSHY8dZbl5j3Sue7B6BYvlE7Da
	vIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xUzWVbZMoozd1rns6Qg5I2Kd4hRAHa+6r+yh+R2RVBs=;
	b=XE5zQvRapxPNL1Sh/ZW9nrHkooLaKqit8wCBHZlpDJ1lD69AMxjVyPHeidnu91Jx/w
	NDTtXYE0SNnymqTox/domoYeCWDaVjfLOjECnJ1+FyppWRuJ3ghMDBvucMKXlJ7SfSZr
	4bPcEgeS0ShYm3NCZQrLnaNNkyrJgKJoluIz1XFcwQJPAoWlj4mHK8MCBty5Rm0QxJCm
	ulL7cnjtvuKHSCDGtoyoLzNPtKKEO7gd/dkfWcZUI2LyeFCQI7NCf9VpPt3yIFB79tDS
	qy6YhCoz/9ev4Du304UBc/qBMCTpA/M8A0CBf7qWQR4PQiTdUu5C6K+vJNk3FAv4+xU7
	I+ag==
X-Gm-Message-State: APjAAAXsrEm65Fu4tZFHnI2Mm5VBUVdVVDbxYVdA0O0eijDnLCM1x3vZ
	TwaMtsSZRB2zk5E3UCcgvE32gld57qGveD2LIlfW2xwP
X-Google-Smtp-Source: APXvYqwBDmDbaTGTiw6Rw4sGHqd5CeKzdMvj4lpu33VZiP7vj92JNDwp9byy/UfGt26ciIiqbCF1zL0vvtirwIirOXg=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr55195764qkg.337.1564708572834; 
	Thu, 01 Aug 2019 18:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <CADiSOrHSURivdpcASjc5FSNVySwazwApQkv8E=1n-W+UJ_-Dpg@mail.gmail.com>
In-Reply-To: <CADiSOrHSURivdpcASjc5FSNVySwazwApQkv8E=1n-W+UJ_-Dpg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Aug 2019 18:15:46 -0700
Message-ID: <CAMKF1sod39MhtC7ppfr=+Wet22Px0ds+fQ2p4Lf=sHQ+2RRE8w@mail.gmail.com>
To: Luca Palano <contact@lpzone.it>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] Netdata upgrade: 1.8.0 -> 1.16.0
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
X-List-Received-Date: Fri, 02 Aug 2019 01:16:12 -0000
Content-Type: text/plain; charset="UTF-8"

Can you send the patch inline, maybe use git send-email so that
patchwork can catch it

On Thu, Aug 1, 2019 at 8:26 AM Luca Palano <contact@lpzone.it> wrote:
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

