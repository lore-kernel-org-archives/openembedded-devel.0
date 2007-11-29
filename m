Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1IxpfA-0007IN-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 21:07:11 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2617762waf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 12:03:59 -0800 (PST)
Received: by 10.114.150.1 with SMTP id x1mr503281wad.1196366639103;
	Thu, 29 Nov 2007 12:03:59 -0800 (PST)
Received: by 10.114.152.5 with HTTP; Thu, 29 Nov 2007 12:03:59 -0800 (PST)
Message-ID: <bdb0025f0711291203o27cca7edsb2c823984c461c71@mail.gmail.com>
Date: Thu, 29 Nov 2007 17:03:59 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1196300745.8098.41.camel@localhost.localdomain>
MIME-Version: 1.0
References: <474CF3AF.5010407@trolltech.com>
	<1196248199.8098.13.camel@localhost.localdomain>
	<474DCBD4.6060605@trolltech.com>
	<1196300745.8098.41.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: CROSS_DIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2007 20:07:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi RP,

I've noticed that meta-toolchain is so dependent on ipgk.
Is there any other good (right) way to build a relocatable toolchain?

Regards,
vivijim

On Nov 28, 2007 10:45 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Thu, 2007-11-29 at 06:13 +1000, Lorn Potter wrote:
> > Richard Purdie wrote:
> > > On Wed, 2007-11-28 at 14:50 +1000, Lorn Potter wrote:
> > >> Was CROSS_DIR changed somewhat recently (last 2 months or so) to link
> > >> the includes and lib dirs to staging?
> > >>
> > >> If so, why? This means I cannot distribute this toolchain to other
> > >> machines, and makes the entries in the pkgconfig files wrong.
> > >
> > > It was changed, yes. The reason was to remove duplication of files
> > > between staging and cross. There are various reasons for doing that
> > > including faster builds, less error prone builds (file duplication
> means
> > > both copies have to be kept the same) and that cleaning this up
> assists
> > > some future planned developments (e.g. sysroot and packaged staging).
> > >
> > > The symlink is intended as a transition fix and ultimately we can
> switch
> > > to the sysroot option of the toolchain for everything but gcc 3.3 and
> > > earlier. Poky already has done so and it is *much* cleaner.
> > >
> > > I have seen the pkgconfig problem and its unfortunate, I didn't
> realise
> > > until it was too late. Its not more wrong than pointing at staging
> > > really though. The good news is that it goes away entirely when we
> > > switch to using sysroot options for pkgconfig.
> >
> > If CROSS_DIR is simply a symlink to staging, whats the point?
>
> I'm confused, where above do I suggest "CROSS_DIR is simply a symlink to
> staging"?
>
> I don't since as you say that would be pointless.
>
> > >> CROSS_DIR should mean just that - this is where I want the toolchain
> to
> > >> be - like it used to do.
> > >
> > > Well, the cross toolchain components are still there. The target
> system
> > > header/libraries (glibc and libc-headers-linux) only get installed to
> > > the target system staging directory now though.
> > >
> > > CROSS_DIR is not meant to be a toolchain you can transfer between
> > > machines, its meant to be the cross components of the builds. If you
> > > want a toolchain to transfer between machines you can build one with
> > > meta-toolchain.
> >
> > You guys must like doing things the hard way. As per the old method,
> > CROSS_DIR can be used as a distributable toolchain. Now, _everything_
> > and their sister are there, which is not what a toolchain should be.
>
> No, now only the cross tools are there and the target libraries/headers
> are in staging instead of both staging and cross. Currently there is a
> symlink between the two. This symlink will be disappearing soon.
>
> > What is the path to whatever meta-toolchain creates? is it CROSS_DIR? or
> > somewhere in the build directory? which could very easily be in
> > someone's home directory, and not redistributable. Is there an good way
> > to set the path to it?
>
> The path to the toolchain is whatever you define it to be with
> SDK_PREFIX. As you say, people build in their homedirs which is a good
> reason to support meta-toolchain over moving CROSS_DIR around.
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net

