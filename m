Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 24822607A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:09:08 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id x190so11605001qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Nov 2016 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iZV8mylvSsuTHj3nvILcBc2WBD4xaOmx2fwDSFr86NI=;
	b=LwA3hJ7xMMoHD5pPfUUhZDNZEjElhslNt806QxVvtwG5gbmwoSQVTFozduPK7kLAHD
	ZV6NXIwP/x7QZuC1ZN0KWunVvCvTkrC4Pi9aGCiAznh9VGlmoBi8MOdCrPHhzyYse/n/
	OmNy+jePa2wHQmAb34k2avHEh0+buX0UkUA2bt+ZLfwJlNKDF0PScKpCcSnqqBXMepvG
	OPsr1Qh/QYMmYU+i0gy9JEOekEPrnxZP9EXyB0hsIWcZv1is2+4ks1hW9z+exLJHKBvO
	B9i7j/TM4MxVPeZg+PxJ49n4acKr5UkgttYVgxtQLeP4gklR8dd14F2FkL7DWg09Fexr
	pMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iZV8mylvSsuTHj3nvILcBc2WBD4xaOmx2fwDSFr86NI=;
	b=eZvYB45YUbjFwW9FU1fPvXAbQJtNVwHR/ebCH8Ec9habwaH4K/FxxD2NxRwm5z1ERi
	BT4QKhiu9p6jizf/vhzVxU/Tw8zPVPgZrzLrfSjb25PbS1A+tykB7f9ffjo4OIijR0FU
	eaSA1FY42UnnDTvSa6MdMiGr0794/zjjModzT16Ail976qwkVnr+3kTmo2Yg4pOgoDZ8
	W7u/1WumR0TUW2ukYkqb6ZGvtWxSfBp1f8hvrz+MWlqoXzyqQH+h+3C4tQqDxN55LcMk
	DjCtKOS/GiVZQqGFawaJJcs6Sz3TOz+ri77v6qCgSTjX22BMIba1BeJZKfhK6UhIavku
	Qs9A==
X-Gm-Message-State: ABUngve/l4R8v9y3MHi5bqIray/pNhjMcHB2ai0FSc5tLQSdi9EaloOxuezJf9zAityqOB2eWhleQvhkrBmA6+sq
X-Received: by 10.55.130.7 with SMTP id e7mr2795459qkd.121.1478084949482; Wed,
	02 Nov 2016 04:09:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 04:08:49 -0700 (PDT)
In-Reply-To: <1852679.faEG3Nt9xx@peggleto-mobl.ger.corp.intel.com>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
	<CAEHkU3U4wbOuPLCy-Ndj+ScuH2QnyBHd76FhOiTyQJzG1Kxqqg@mail.gmail.com>
	<8af647f4-b068-fba9-a508-ea1fd82ecdac@topic.nl>
	<1852679.faEG3Nt9xx@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 11:08:49 +0000
Message-ID: <CAJTo0LY_nQfg5czXfOauC=eNG1fy0MDrreEvyuLx5NfyBny-Dw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Wed, 02 Nov 2016 11:09:09 -0000
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 03:01, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> I have merged both of the patches to master and taken the liberty of
> merging
> them to morty as well, just so it isn't horribly broken. I appreciate it's
> still slightly broken from some perspectives.
>
> I suspect the reason this was done was to remove the tslib dependency by
> default so that meta-oe wasn't pulled in. Whether or not that's a good
> idea is
> another question, personally I wouldn't have done it this way. It seems to
> me
> if you have a touchscreen arguably you need tslib here.
>

AFAIK tslib is only required for some touchscreens, for example the one I
have somewhere in the attic works with standard kernel input drivers.  The
LSB builds on the autobuilder pull in meta-qt4 so doesn't this mean that
meta-oe is now a build dependency for the AB runs?

Ross

