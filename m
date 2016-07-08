Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF0A660589
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 16:11:30 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g190so9163618qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=PXhnEoQQ3Kr6QNIByECY3ORZQr3TSg3sryk9z1DXqa4=;
	b=omQp9cexoIOO1t+pnxxADJD9Z4MPC06Rg22d8WZWfqE54rtsrR7nCo0Ap0cOiLHzTD
	btW2algJ1TFrSIlcx6YkR77F0+8oQb4YPl7khexNr+2lDM2Mq4TswvrooYsE43ZtAzoj
	bHW7KQgcamqGAOQytYg9e2hj+omWxrvQDIx++HL7pqdPcEcybUaeJE2zNigjbljzG6vO
	soylTdD6mvz41CCIeEwAQAXPDQ5PZJAe31E8DW1Xniw+KrejIe07796cg7N6UDcyHYYM
	rduVkHrHYB/KInbOZpaj4LLVmKnAPOk0VtfXUEtdMt1SomcwQKqXQExJSowLZlgNKez/
	unXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=PXhnEoQQ3Kr6QNIByECY3ORZQr3TSg3sryk9z1DXqa4=;
	b=bVizR4R92eBg4SeeKmVeg0UQ37vZr4fPGVC2EY2S/l5PZgggzic4a3RgjO27l2W8TM
	GyGgLPaSazXMYDZ0NknY6hskm1xv7qHHMw+cWf0eBBVf1oYAl4vNRiqG2C8BIrkHfgLg
	09UMNtHFjG7Br86CejzfBTWMm6FxxRDPCkLu05PXvIgIGJoeWsAN5XHTNRAM9wHM5wQL
	RMBpnGpNntLD1nueEfaIKbz12s8T9r9IHfpKd1KsVlaoLVG2tCj4Tl1BptVQ3cBNyPfH
	RB6PjvSQm6Q516U5jS2XhzGASLA/5DKi1VAUhmEdZi1TbFSem97qPxFvKVE5pOacWnei
	ngVg==
X-Gm-Message-State: ALyK8tKJ4a4Vby6BuEW8PBGLCOxXKH5gBWNuuQs964a4OLDaS9c00k/Q6ZBO3B3iLK7XpbFrejEiMAC6zVWAmQ==
MIME-Version: 1.0
X-Received: by 10.55.97.18 with SMTP id v18mr8188363qkb.102.1467994290835;
	Fri, 08 Jul 2016 09:11:30 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 09:11:30 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 09:11:30 -0700 (PDT)
In-Reply-To: <CANx9H-C3h3ehH9pCy2EZgwUgZ5J_i9W8pV3amyxrVZEeio0gAQ@mail.gmail.com>
References: <20160708102904.10675-1-andrei@resin.io>
	<CANx9H-C3h3ehH9pCy2EZgwUgZ5J_i9W8pV3amyxrVZEeio0gAQ@mail.gmail.com>
Date: Fri, 8 Jul 2016 09:11:30 -0700
Message-ID: <CAMKF1srcBiKCMvAeAd_qFp52riFyeyM5ee1BHV1ji_uDX_p7_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Andrei Gherzan <andrei@resin.io>
Subject: Re: [meta-python][PATCH 1/1] python-imaging: Add patch to fix host sysroot fails
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
X-List-Received-Date: Fri, 08 Jul 2016 16:11:30 -0000
Content-Type: text/plain; charset=UTF-8

On Jul 8, 2016 8:44 AM, "Tim Orling" <ticotimo@gmail.com> wrote:
>
> I built for beaglebone and saw the same error. I did not run-time test.
>
> Since this recipe does not include -native support, this patch seems ok.

Native should work fine too. We do capture prefix in environment for all
classes of recipes

> I have a tingling "not quite the right fix" feeling about it, but...it
does
> fix the error. I assume you have run-time tested?
>
> PIL is really old, any chance pillow would work for your use case?
>
> Acked-by: Tim Orling <ticotimo@gmail.com>
>
> On Fri, Jul 8, 2016 at 3:29 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
> > Signed-off-by: Andrei Gherzan <andrei@resin.io>
> > ---
> >  .../python/python-imaging/remove-host-libdir.patch | 25
> > ++++++++++++++++++++++
> >  .../python/python-imaging_1.1.7.bb                 |  3 ++-
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >  create mode 100644
> >
meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> >
> > diff --git
> >
a/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> >
b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> > new file mode 100644
> > index 0000000..028a51a
> > --- /dev/null
> > +++
> >
b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> > @@ -0,0 +1,25 @@
> > +Avoid getting host sysroot paths in the library paths to fix issue
like:
> > +
> > +|
> >
/home/andrei/work/yocto/build-rpi-master/tmp/sysroots/x86_64-linux/usr/lib/libz.so:
> > file not recognized: File format not recognized
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > +
> > +
> > +Index: Imaging-1.1.7/setup.py
> > +===================================================================
> > +--- Imaging-1.1.7.orig/setup.py
> > ++++ Imaging-1.1.7/setup.py
> > +@@ -155,11 +155,6 @@ class pil_build_ext(build_ext):
> > +
> > +         # FIXME: check /opt/stuff directories here?
> > +
> > +-        prefix = sysconfig.get_config_var("prefix")
> > +-        if prefix:
> > +-            add_directory(library_dirs, os.path.join(prefix, "lib"))
> > +-            add_directory(include_dirs, os.path.join(prefix,
"include"))
> > +-
> > +         #
> > +         # locate tkinter libraries
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> > b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> > index a678328..d2f1a8c 100644
> > --- a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> > +++ b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> > @@ -9,7 +9,8 @@ PR = "r5"
> >  SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
> >
> > file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
> >             file://allow.to.disable.some.features.patch \
> > -           file://fix-freetype-includes.patch"
> > +           file://fix-freetype-includes.patch \
> > +           file://remove-host-libdir.patch"
> >
> >  SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
> >  SRC_URI[sha256sum] =
> > "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
> > --
> > 2.9.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

