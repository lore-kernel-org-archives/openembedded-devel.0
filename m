Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EC4E661617
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:05:01 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so1285288pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qN5ld9+kEa7VFYkagzx0/Rg22vZcFuQga4sVyHYiGfE=;
	b=SPLIYTH9WzhZES6oUrOXtGO8OJhKTE6P9wUfblApEdonod/LFOKA4QZoI/uPaoVs3j
	F4hlkHE+yLr7KJuilgdQEhoTBveAMfhkBRW5kmhKBqURdcrKac3HB+3aKEyPu4RIktZa
	7bec32XJZDcNzqZjdcNXeJp93s3qVA5ucdW4TNni4hAUB5AwIYtQthJKlN49+YDv5RCO
	JP+nNCFLkdkwxKQnox+CEDTbECndxoqD+ilcOfxTXGkmqwcQ7zYi89Pwp/JndJ6oTpXi
	5U1UZwln3iaNKv91l2JF8fTygWferJoote8NwF1WYkotYICZOx/u51JYhnFyc7WilzWX
	NBRA==
X-Gm-Message-State: ALoCoQkPPZoQ35iSPHX0idXK5VxK8aWdm6yoZ36dbR+Xa++S+RTzJ/EWsEynWuMyl6g0XdaCgM69
MIME-Version: 1.0
X-Received: by 10.68.237.3 with SMTP id uy3mr7105264pbc.155.1378357503743;
	Wed, 04 Sep 2013 22:05:03 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 4 Sep 2013 22:05:03 -0700 (PDT)
In-Reply-To: <20130904211411.GR3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
Date: Thu, 5 Sep 2013 06:05:03 +0100
X-Google-Sender-Auth: H6MOt9lbWm_P1Yl3HSHMHTHwBgc
Message-ID: <CAOMwXhMB5zfgFbVuaAfjg_h2nS=GEkcmEoZ+3g1b-o1JauJ44A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Joe MacDonald <joe@deserted.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Thu, 05 Sep 2013 05:05:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

As I wrote, I have not uploaded the newest revision, so please do not
review the old.

Anyway, Bruce managed to demotivate me to contribute. I am currently not in
a mood after all this for sending the update.


On Wed, Sep 4, 2013 at 10:14 PM, Joe MacDonald <joe@deserted.net> wrote:

> Actually, after all of that, I do have a couple of additional requests
> (beyond just the tweak to the commit log).
>
>    Explicitly cc:ing Bruce here since I'm intentionally not adding
>    meta-virt@.  I've gotten bounced from it in the past as I'm not a
>    subscriber and it's subscriber-only.
>
> [[oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.02
> (Mon 09:20) Laszlo Papp wrote:
>
> > 1) The version in meta-virtualization is quite old. It is basically from
> 2009,
> > and a lot of things has changed since then.
> >
> > 2) More importantly, this software is more like for networking rather
> than
> > virtualization, so I think it was misplaced.
>
> SOB please?
>
> > ---
> >  .../recipes-support/openflow/openflow_1.0.bb       | 32
> ++++++++++++++++++++++
>
> Is this actually based on an OpenFlow 1.0 release, or has it always been
> 1.0+git?  I don't have a copy of meta-virt around to check myself.  If
> there was a real 1.0 recipe around, can we keep it as is and make this
> openflow_git.bb, more in line with the other +git... recipes?
>
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/openflow/
> openflow_1.0.bb
> >
> > diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bbb/meta-networking/recipes-support/openflow/
> openflow_1.0.bb
> > new file mode 100644
> > index 0000000..eb7770e
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY = "OpenFlow"
> > +DESCRIPTION = "Open standard that enables researchers to run
> experimental protocols in the campus networks"
> > +HOMEPAGE = "http://www.openflow.org"
> > +SECTION = "networking"
> > +LICENSE = "GPLv2"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
> > +
> > +SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> > +PV = "1.0+git${SRCPV}"
> > +SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
> > +
> > +DEPENDS = "virtual/libc"
> > +
> > +EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
> > +
> > +PACKAGECONFIG ??= "libssl"
> > +PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools
> > +
> > +do_configure() {
> > +    ./boot.sh
> > +    oe_runconf
> > +}
> > +
> > +do_install_append() {
> > +     # Remove /var/run as it is created on startup
> > +    rm -rf ${D}${localstatedir}/run
> > +}
>
> And while we're in the neighbourhood, can we also clean up the
> inconsistent spacing?
>
> Thanks.
>
> --
> -Joe MacDonald.
> :wq
>

