Return-Path: <eduardo@monkey.io>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0F44B705A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 21:15:00 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so5643386wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 14:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=OHDj4ZDy8pnWURzQ9jhEt5nKgpTSv8dqa/Jx0G9YSe4=;
	b=AlMNp3lrhIxX8bMsXyV2/sstNnsVWy8YvZDJ2sULcNCmv016Bta9hw6oh5ZfeUVz+C
	YU5bSwxR7EtU5AXXBEeOWAtEm9Le3Kk3e5lAdpNSRGuRvsjflbwNtiHchG1UT6Tmat5L
	ePX05FHNb997C7qkBB+tA2A48krkHkLXCKrMN+JyifIYCEJS78EB06ABvguRR0xzBD3P
	IMuvsfj5kC68Ae5ryhV3wOyBB1fJ9eBJhj/woA0cJBGfdJajW6Zpwa+3d0YUjO4VghLK
	zIrIu+cUVSMF6yUbeg+R0EqLcO2bbnluE1SXVZtfaRrGZNOEHkGgv4d0gvN73nQirq3Y
	p1UQ==
X-Gm-Message-State: ALoCoQmUSMaWRy+aQZHwGmEEfnRDpsFF3430giZ7zID9Ek1tBUHjSo9xyTYvZrRUuM1Fy59+2n/6
MIME-Version: 1.0
X-Received: by 10.194.133.1 with SMTP id oy1mr16478305wjb.87.1405890900908;
	Sun, 20 Jul 2014 14:15:00 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Sun, 20 Jul 2014 14:15:00 -0700 (PDT)
In-Reply-To: <20140718182742.GR2433@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
Date: Sun, 20 Jul 2014 15:15:00 -0600
Message-ID: <CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jul 2014 21:15:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I was trying to reproduce the problem that you faced but here it worked
fine. My local.conf looks like this:

--
BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
MACHINE ??= "qemux86"
DISTRO ?= "poky"
PACKAGE_CLASSES ?= "package_rpm"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
USER_CLASSES ?= "buildstats image-mklibs image-prelink"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K"
PACKAGECONFIG_pn-qemu-native = "sdl"
ASSUME_PROVIDED += "libsdl-native"
CONF_VERSION = "1"

INHERIT += ""

IMAGE_INSTALL_append = " monkey dropbear"
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscripts = ""
--

a fresh build of 'bitbake -k core-image-sato' worked with the following .bb:

    b40e6ecaed2b10ba9c9aba4f128b029a  monkey_1.5.1.bb

before the test i make sure to clean the monkey stuff with 'bitbake -c
cleanall monkey'.  Do you see any difference between your system and mine
?, i am very interested into reproduce the problem you detected.

best






On Fri, Jul 18, 2014 at 12:27 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Jul 18, 2014 at 12:19:29PM -0600, Eduardo Silva wrote:
> > >
> > > Now it failed with:
> > >
> > > | NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
> > > | *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ which
> does
> > > not exist
> > > |
> > > | opkg-build: Please fix the above errors and try again.
> > >
> > > I guess it's because sysvinit script was removed by
> update-rc.d.bbclass and
> > > then nothing was left in /etc/monkey
> > >
> > >
> > thanks for the report. Which specific build options did you use (and
> image)
> > ?, i would like to be able to reproduce that problem locally, not sure
> why
> > my tests passed.
>
> world builds as described on
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> probably the most important difference is:
> # use systemd
> DISTRO_FEATURES_append = " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> VIRTUAL-RUNTIME_initscripts = ""
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Eduardo Silva
Monkey Software

