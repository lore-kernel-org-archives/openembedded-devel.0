Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBD97EF58
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 17:47:54 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so4324299qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G+lP2Hlplz0ywKblw2fwkOKPsp4+mxMSXB2P7YKifRc=;
	b=ivpOTaSlfgIna/jm7XagAx9myHV7cstC72nAdx38spOVwMcb8yr1bWzfZJLMwhwLCe
	x4+W4fJajoXxaH07IvLMmYMr6YU2v5BxXk18YwJ1pnm0Jn+TRGHlzJabI/CnX8p8merB
	T09cnr7MrLwHUh2jihSKtdu5166O7AnNeBavZonvC+EmUU/d5n3JYpRrYHQm1bpkk7EU
	xUimKdBwaonCw2iHFxl8vLEoi03Ip2CPAygIc8Ek/a2gBN7e1qIF+Tjk3Kfr5fmPJJPV
	tESF9LhAmo/shALjXrt+kkAg1QKG6xeHL/JZeA1h16L4R8dBkGFyRiaMKMC5uywav6No
	ernA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G+lP2Hlplz0ywKblw2fwkOKPsp4+mxMSXB2P7YKifRc=;
	b=FwaKInrH3YFWzAmAloiiHcDaea6TXDAzuWW5KCbvcw99G0PhH/rT3dz2A61i59uy8I
	xQQEHcavKYTx/iqUnnl2oTRztB4WgofovObhXNr5DQEduQCtn+qow6Xui74ByNi3FMmP
	TsX6INEgKKzKQ26tErIxxMfY59y6FBFttNKM/3Hp0BVyfYZ1VvxAa8Bgz6/W61G5o5IT
	xzoCqW+8UlvibZRCQyEyK8Bjl8NIxmXRzkXpd5TZ6T8+9W49eBUaUaanbOiVuZ+cBBqi
	Ek3RnnsWZxBkJy+e6Ql3GIxKW8yo5mUq767wSBj2/YAIBxNYjs+Y/erditwCjDU2CVbI
	YZqg==
X-Gm-Message-State: APjAAAU54b3ao1XK48H1fGt4zGoodSLgn5ozHVAd4ozPfs9CBcSW0NIb
	UoN+X+Pg8LbDVlfkybwFiz9aHwBZZS2aSH+FB7A=
X-Google-Smtp-Source: APXvYqxXIEPDYV3K+ySwNpdxIBHrSiEUClRF/N8bIpdqrXOzCE7dVXEAib7i3w/Z5Xkti+iTK+0SmZHeFpSi3KDBZTY=
X-Received: by 2002:a37:7083:: with SMTP id l125mr2759392qkc.71.1562867275810; 
	Thu, 11 Jul 2019 10:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190710235657.97551-1-joe.slater@windriver.com>
	<CAMKF1sqf=s9QFozJc0tsUZOt=aAAG_R7jiiaVyuyb22YiXgWjg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84FA81B350@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA81B350@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 10:47:45 -0700
Message-ID: <CAMKF1sq+BMac-f5VGhiUyagy3VUCM082EEXA_Mt1X3QxaZO4kQ@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] drbd-utils: enable reproducible_build awareness
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
X-List-Received-Date: Thu, 11 Jul 2019 17:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Thu, Jul 11, 2019 at 10:14 AM Slater, Joseph <joe.slater@windriver.com>
wrote:

>
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Thursday, July 11, 2019 12:33 AM
> > To: Slater, Joseph
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-networking][PATCH 1/1] drbd-utils: enable
> > reproducible_build awareness
> >
> > On Wed, Jul 10, 2019 at 4:57 PM Joe Slater <joe.slater@windriver.com>
> > wrote:
> > >
> > > Enable use of SOURCE_DATE_EPOCH from the reproducible_build bbclass.
> > >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> > b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> > > index 70e04b9..7fd3090 100644
> > > --- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> > > +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> > > @@ -35,6 +35,9 @@ EXTRA_OECONF = " \
> > >                  --without-manual \
> > >                 "
> > >
> > > +# If we have inherited reproducible_build, we want to use it.
> > > +export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"
> >
> > should this be set after checking for inherit
>
> [Joe Slater] This variable is always queried and the code checks for a
> reproducible_build environment, so we don't need to test here.
>
> > > +
> > >  do_configure_prepend() {
> > >      # move the the file under folder /lib/drbd/ to /usr/lib/drbd when
> > usrmerge enabled
> > >      if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true',
> 'false', d)};
> > then
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

