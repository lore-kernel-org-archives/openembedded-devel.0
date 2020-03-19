Return-Path: <SRS0=nN3C=5E=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E4FFE60F31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:32:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jv9j56B3z4H;
	Thu, 19 Mar 2020 18:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584639145;
	bh=eLlU+8qeeZ55DewnNByl5Chk69iDpCsMbobsv1fcE0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFpWvWgi6jCS75B5wAquVITaeL+Ft+IhHMfEzXAUiWa7WD1im8m09jevZGRSdgPLl
	45eYOzJ+1KBAI1RdhiSmYiv/HWb4Pw6qRgEETdE93kJYTofz1TyGe9NZAC5DDS0D7s
	YCmEgR7wN4qQhIRzv4W/a6/ze2rV013s/Rh0rQxTUdW8+jFDFx7eYt9xv4jocHjtp6
	azXHIVuEbkwd8CR3Xb0x5O+rOYtW+Cuyp/RRlYzbwPfez7JivIiNGWkMhAnu1Hob+I
	ivZ4K2JaxzHiWa5K6qcWicmjNgKeTUne+XS+C+AkZotqiLdu+Ua1EODsuFkGcI62L5
	fTSe6Re3XhL0WBSBIVtTb+lRBZogUn+VM2I6hRC3Eem8788f2sr0RnV9l2JgGkehRw
	GTAmQwyMPY7ZZcMoXea9gTXjwlwMaZln7BpSQRf3Iz5M5Q7/4jnYSgDc0//Fiu8Lyx
	TYxet02UswJ9eG4WSZkB/nV/JsXhz06YI6k2ZwXYNnAGUkD1dDXFwJmaMhPqm4ll5z
	Xp3PXwvWCUaHkYBQDxJz8GDihf/ptcG8F4HsF/DugTKgZw+pjPOwRTzi35O7AGl+wO
	rfmyQkncK780BQuBn3r9LZKFx2zjdhtE9NbncYzuH9B+G2hoszDQKeJwi8zbYW+bFK
	cW6xw4VgKUA6z2ju9Cl5evrw=
Date: Thu, 19 Mar 2020 19:32:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200319173223.GC29515@localhost>
References: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
	<20200319134213.GA29515@localhost>
	<alpine.LFD.2.21.2003191302490.458222@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003191302490.458222@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: proper way to report(?) conflicting files being installed?
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
X-List-Received-Date: Thu, 19 Mar 2020 17:32:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 19, 2020 at 01:09:13PM -0400, Robert P. J. Day wrote:
> On Thu, 19 Mar 2020, Adrian Bunk wrote:
> 
> > On Thu, Mar 19, 2020 at 09:22:54AM -0400, Robert P. J. Day wrote:
> > >...
> > > +# ax_code_coverage.m4 and ax_check_enable_debug.m4 are in gnome-common only
> > > +# because older versions of autoconf-archive didn't have them yet. Now they
> > > +# are in autoconf-archive from OE-core. We depend on that below to ensure
> > > +# that recipes which only depend on gnome-common still get them.
> > > +do_install_append () {
> > > +    rm -f ${D}${datadir}/aclocal/ax_code_coverage.m4
> > > +    rm -f ${D}${datadir}/aclocal/ax_check_enable_debug.m4
> > > +}
> > > +RDEPENDS_${PN} += "autoconf-archive"
> > > +DEPENDS_append_class-native = " autoconf-archive-native"
> > > +
> > >
> > >   it *appears* that solved the problem, which raises the question --
> > > should this patch be applied to the current gnome-common recipe? that
> > > patchwork entry dates back to 2017 ... should it have been applied at
> > > some point?
> >
> > The currently implemented solution is:
> > # Default to enable autoconf-archive to avoid conflicts
> > PACKAGECONFIG ??= "autoconf-archive"
> > PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive, --without-autoconf-archive, autoconf-archive"
> >
> > It is not clear to me why this gives the user to disable it
> > instead of unconditionally enabling it.
> 
>   this does seem backwards ... if both gnome-common and
> autoconf-archive currently try to install those two m4-related files,
> doing the above pretty much *assures* an installation conflict,
>...

No, --with-autoconf-archive makes gnome-common not install the 
conflicting files.

> rday

cu
Adrian

