Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id DAB836FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:27:34 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t74so2560193wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=/CcQp2xY6Ipt+BuVVlvmqtMBSQgCRANuvcMZXKGXC2o=;
	b=hx2ibKAupyw62Amn+mtFq2ec5A1YHChuzn1demBoz6et37S89fyL+hQBEiiwJHCEUS
	ripjq5gKv7oZyqw0f+yQJNsE/BECspNIv0Byoh+9kl2Zz8HqdyjEtX5YAP/9cwKS48vQ
	IaUBgyOhCIOU1QT/Siy0vAsO6w9uXpGcVMVlr3ayjPi7H1B+3TQL9HdeIn0vOYHbIhlN
	WenJ6DKzcVxftyTKKWq2IaaZWHJIVGU70GKtQU+zTHMHsm8Hp/g4SaO9vdkP9I7EOx3I
	5hSSsrbVD2B3dO7ZxRIPZpcAU3bBGog1w8ZyCk5bUFjcYrzWcmP4uYqsfifczcU6kUhv
	EZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=/CcQp2xY6Ipt+BuVVlvmqtMBSQgCRANuvcMZXKGXC2o=;
	b=Hiz5l/13Psf8VJNz/Mik5XTvTl9MWYmphzEigjDOALo5F10Rtsbr1urt1mb0QKfDjT
	2/RTq9y82lqcRjcst8XTFo5GcjC/5GVi1zLnk3h0w0FraxbUeCQFL8ZDbgFFDucEG7K4
	w5piX8wVRqsfCVsVeYdkhIfUSIM5Lmv/lMC1FGAXmdOsYfz40lU3Tscbk89iJkmbLah4
	XbJeh4nDt1u1XTjTKXXqL+qKaz5pUYaRQ/qJZL9eaudXTADHaTbfHu1THnnp3aBGSKR7
	C60ADeBm4CDywYIFWMYqZKHhqC8a/c4XZtjgw0BZ9pfRZShJ6ooVnrrqM8yTnxpkjQ5I
	PP/Q==
X-Gm-Message-State: APf1xPBuZeTe+REjg1nQHwsVesK0vmkqOKEsU3h7TCIopPffV4NOm67c
	tnZ1liq9WiyoeKLKdLGddd1C
X-Google-Smtp-Source: AH8x2248cgzoY/yFgl/kLddf6WUpT90hwTJQYOPSZZYT1CAzBe/bFkwf7RIz/NKRHKY3ipJNGWEe1g==
X-Received: by 10.28.215.200 with SMTP id o191mr4449295wmg.84.1519291655442;
	Thu, 22 Feb 2018 01:27:35 -0800 (PST)
Received: from pohly-mobl1 (p548497B7.dip0.t-ipconnect.de. [84.132.151.183])
	by smtp.gmail.com with ESMTPSA id
	s125sm9518282wmf.4.2018.02.22.01.27.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 01:27:34 -0800 (PST)
Message-ID: <1519291653.6698.13.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonas Bonn <jonas.bonn@gmail.com>, Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
	<mnhu@prevas.dk>
Date: Thu, 22 Feb 2018 10:27:33 +0100
In-Reply-To: <CACM3HyG=gT1anu6qh1jbm0+J=Tf15KNUUSN-pYLy_L1nJa7kEQ@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
	<766040fa-b622-5610-4ba3-87d416c7ee4f@prevas.dk>
	<CACM3HyG=gT1anu6qh1jbm0+J=Tf15KNUUSN-pYLy_L1nJa7kEQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 22 Feb 2018 09:27:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-22 at 07:53 +0100, Jonas Bonn wrote:
> On 21 February 2018 at 15:09, Martin Hundebøll <mnhu@prevas.dk>
> wrote:
> 
> > Now that the discussion branched out a bit...
> > 
> > We would like better support for this too. Our setup uses a
> > "manifest"
> > repository with git submodules to setup the layers:
> > 
> > > yocto/
> > >       meta-poky/
> > >       meta-qt5/
> > >       meta-foo/
> > >       meta-bar/
> > >       conf/
> > >            bblayers.conf
> > >            local.conf
> > >       .gitmodules
> > 
> > With this setup, customers simply need to clone our yocto repo
> > recursively, run `yocto/meta-poky/oe-init-build-env yocto` and then
> > `bitbake image-recipe`.
> > 
> > But this is rather inflexible, as it requires the "yocto" folder to
> > be the
> > build folder to activate the config files...
> > 
> > We looked into putting the configs in "meta-foo/conf/*.conf.sample" 
> > and
> > using TEMPLATECONF, but the "oe-init-build-env" script is rather
> > picky
> > about poky being the "top" directory.
> > 
> > I guess the oe-init-build-env script can be changed to look for
> > .templateconf in any parent folder?
> 
> 
> Putting together a deliverable setup that's easy for the customer to
> get
> started with is a bit tricky.  Here's the approach that's worked well
> for
> me:
> 
> /myproject
>     /env        <-- script
>     /build
>     /meta-myproject
>     /bitbake
>     /oe-core
>     /meta-layer1
>     /meta-layer2
> 
> env, build, meta-myproject are part of the myproject repo, everything
> else is a submodule.

refkit used the same approach. One thing that I would prefer to do
differently is the location of the submodule: having them in their own
directory would make it more transparent which code is "external" and
which is "internal".

> "env" is a script containing just the following:
> . ./oe-core/oe-init-build-env build/ bitbake/

We ended up with a top-level "oe-init-build-env" wrapper script around
the actual oe-core/oe-init-build-env. That way the repo could be used
the same way as poky. The script sets TEMPLATECONF, so the usual local
build setup happens based on refkit sample files.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



