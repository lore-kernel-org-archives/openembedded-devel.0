Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTbN-0005dh-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:19:06 +0200
Received: by pvg3 with SMTP id 3so633810pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9lSzUK1d8VKKUcXP5Fab7/NAIB5htGlS7Sv0zjnANgU=;
	b=qypa3259Iy0/y9ukeuz/j1Z5BAVortZA6hRu012MKookIGyXuzm6ILrdTA9zUeiKMe
	E6gTeQhz9EIU2DpGYjD5zqN5VbzIXjFX1KVa6RjMzLrzAjYN8GN2FN5uxKoxkAJicb+y
	fIAj+T8DZ152BBtwnP9v5EbW1V9u4Rnmpj5Rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xCjm8H1pOejjZprJ5etayeUGHu77UqsPQeQklu8nMpp0Z52brLuW3JykTv7WjDppw3
	eZeT3+iDL7RNIEU0hqQUfxeH4CL0SmKhgRGCL2KmBwfKs8v3DWkx93MhHnjvGTdcMAEw
	tx6CmeYS3l5W38dfIhVNUyVTPGoePVU1NINu8=
Received: by 10.115.81.33 with SMTP id i33mr7954205wal.46.1277313267827;
	Wed, 23 Jun 2010 10:14:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g14sm6021480rvb.13.2010.06.23.10.14.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:14:25 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:15:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623171524.GA5535@gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jun 2010 17:19:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/06/10 11:54), Frans Meulenbroeks wrote:
> 2010/6/23 Graeme Gregory <dp@xora.org.uk>:
> >> >> Also I don't feel empowered to make changes in distribution
> >> >> specific files.
> >
> > Why not, chances are Angstrom maintainers would be quite happy for you
> > to patch angstrom*.conf if you ask us.
> >
> > Graeme
> 
> distribution != angstrom
> There are more distributions out there.
> 
> The root cause of the problem is that a distro can specify a version
> of a tool (let's take gcc as an example) that is not supported by a
> specific hardware architecture.
> I'd say what we really need is a way to allow a processor architecture
> to specify which versions of binutls and gcc and friends are supported
> for that hw architecture.
> Mind you I talk about processor architectures, not boards.
> (actually I guess this extends to every package that contains assembly
> files or inline assembly)
> 
> The problem became more visible with nios2 as this is an architecture
> that is not (yet) supported by gcc. Patches for now exist only for
> 4.1.2.
> 

some architectures may not support particular version of say gcc but
still if that architecture is supported by a given distro then it should
define the required version of say gcc in distro.conf with override

for instance check conf/distro/include/sane-toolchain.inc which is serving
a few distributions overrides default compiler versions for AVR32
you need to do something same for nios2

Thanks
-Khem

> Frans.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


